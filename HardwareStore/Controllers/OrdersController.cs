using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using HardwareStore.Data;
using HardwareStore.Data.Migrations;
using HardwareStore.Models;
using HardwareStore.Models.DbModels;
using HardwareStore.Models.DbModels.Enums;
using HardwareStore.Models.ModelsConfig;
using HardwareStore.ViewModels.Orders;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace HardwareStore.Controllers
{
    [Authorize]
    public class OrdersController : Controller
    {
        private readonly ApplicationDbContext _context;
        private string _userId;
        private EmailManager _emailManager;

        public OrdersController(ApplicationDbContext context)
        {
            _context = context;
            _emailManager = new EmailManager();
        }

        public ActionResult Index()
        {
            _userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

            var address = _context.Addresses.Where(d => d.IdentityUserId == _userId);

            var list = new List<ShippingMethodWithTheirPayingMethods>();
            var shippingMethods = _context.ShippingMethods.ToList();
            var payingMethods = _context.PayingMethods.ToList();
            var shippingPaying = _context.PayingShippingMethods.ToList();

            foreach (var shippingMethod in shippingMethods)
            {
                var result =
                    from p in payingMethods
                    join sp in shippingPaying on p.PayingMethodId equals sp.PayingMethodId
                    join s in shippingMethods on sp.ShippingMethodId equals s.ShippingMethodId
                    where s.ShippingMethodId == shippingMethod.ShippingMethodId
                    select p;

                list.Add(new ShippingMethodWithTheirPayingMethods()
                {
                    ShippingMethod = shippingMethod,
                    PayingMethods = result.ToList()
                });
            }

            var model = new OrderInfoViewModel()
            {
                Address = address.FirstOrDefault(),
                ShippingMethods = list
            };

            return View(model);
        }



        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> NewOrder(OrderInfoViewModel model, int shippingId, int payingId)
        {
            _userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            var user = await _context.Users.FirstOrDefaultAsync(d => d.Id == _userId);
            var products = _context.Products.ToList();
            var totalPrice = 0.0;
            var flag = false;
            string error = null;

            if (!await _context.PayingShippingMethods.AnyAsync(d => d.PayingMethodId == payingId && d.ShippingMethodId == shippingId))
            {
                return NotFound();
            }

            var productsInShoppingCart = _context.ShoppingCarts
                .Include(d => d.Product).Include(d => d.HotShot).Where(d => d.IdentityUserId == _userId).ToList();

            var hotShot = await _context.HotShots.Include(d => d.Product.Gallery.ImageGalleries)
                .ThenInclude(d => d.Image)
                .FirstOrDefaultAsync(d => d.StartDate < DateTime.Now && d.EndDate > DateTime.Now);

            if (productsInShoppingCart.Any(d => d.HotShotId != null))
            {
                if (_context.AccountHotShots.Where(d => d.IdentityUserId == _userId).Any(d => d.HotShotId == hotShot.HotShotId.ToString()))
                {
                    flag = true;
                    error = AppErrorMessage.HotShotAlreadyBought;
                }
                if (hotShot.HasEnded || hotShot.Quantity <= hotShot.ItemsSold)
                {
                    _context.ShoppingCarts.RemoveRange(productsInShoppingCart.Where(d => d.HotShotId != null));
                    error = AppErrorMessage.SaleHasEnded;
                    flag = true;
                }
            }

            if (productsInShoppingCart.Any(d => d.Product.IsActive == false))
            {
                _context.ShoppingCarts.RemoveRange(productsInShoppingCart.Where(d => d.Product.IsActive == false));
                error = AppErrorMessage.ProductsDeletedFormCart;
                flag = true;
            }

            if (flag)
            {
                await _context.SaveChangesAsync();
                return RedirectToAction("Index", "ShoppingCart", new { error = error });
            }

            var hasAddress = await _context.Addresses.AnyAsync(d => d.IdentityUserId == _userId);

            if (!hasAddress)
            {
                model.Address.IdentityUserId = _userId;
                await _context.Addresses.AddAsync(model.Address);
                await _context.SaveChangesAsync();
            }

            foreach (var product in productsInShoppingCart)
            {
                var price = product.Product.Price;
                if (product.HotShotId != null)
                {
                    price = hotShot.NewPrice;
                }
                totalPrice += product.Quantity * price;
            }

            await using (_context)
            {
                await using (var transaction = _context.Database.BeginTransaction())
                {
                    var address = await _context.Addresses
                        .FirstOrDefaultAsync(d => d.IdentityUserId == _userId);

                    var order = new Order()
                    {
                        IdentityUserId = _userId,
                        OrderDate = DateTime.Now,
                        TotalPrice = totalPrice,
                        OrderStatus = OrderStatus.Created,
                        AddressId = address.AddressId,
                        ShippingMethod = await _context.ShippingMethods.FirstOrDefaultAsync(d => d.ShippingMethodId == shippingId),
                        PayingMethod = await _context.PayingMethods.FirstOrDefaultAsync(d => d.PayingMethodId == payingId)
                    };

                    await _context.Orders.AddAsync(order);
                    await _context.SaveChangesAsync();
                    var orderDetailsList = new List<OrderDetails>();

                    foreach (var shoppingCart in productsInShoppingCart)
                    {
                        double price = shoppingCart.Product.Price;


                        if (shoppingCart.HotShotId != null)
                        {
                            price = shoppingCart.HotShot.NewPrice;
                        }

                        var orderDetails = new OrderDetails()
                        {
                            OrderId = order.OrderId,
                            ProductId = shoppingCart.ProductId,
                            PricePerItem = price,
                            Quantity = shoppingCart.Quantity
                        };

                        if (shoppingCart.HotShotId != null)
                        {
                            hotShot.ItemsSold += shoppingCart.Quantity;
                            _context.AccountHotShots.Add(new AccountHotShot()
                            {
                                HotShotId = hotShot.HotShotId.ToString(),
                                IdentityUserId = _userId
                            });
                        }

                        var product = products.First(d => d.ProductId == shoppingCart.ProductId);
                        product.QuantityInStock -= shoppingCart.Quantity;
                        orderDetailsList.Add(orderDetails);
                    }

                    await _context.OrderDetails.AddRangeAsync(orderDetailsList);

                    await _context.SaveChangesAsync();

                    foreach (var orderDetails in orderDetailsList)
                    {
                        _context.OrderDetailsOrders.Add(new OrderDetailsOrder()
                        {
                            OrderId = order.OrderId,
                            OrderDetailsId = orderDetails.OrderDetailsId
                        });
                    }

                    await _context.SaveChangesAsync();

                    _context.ShoppingCarts.RemoveRange(productsInShoppingCart);
                    await _context.SaveChangesAsync();
                    await transaction.CommitAsync();
                    _emailManager.SendEmail(user.Email, "Zamówienie zostało złożone", EmailMessage.OrderCreated);
                }
            }
            return RedirectToAction("Index", "Home");
        }

        public ActionResult MyOrders()
        {
            _userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            var model = _context.Orders.Include(d => d.Address).Where(d => d.IdentityUserId == _userId);
            return View(model);
        }
    }
}