using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using HardwareStore.Data;
using HardwareStore.Data.Migrations;
using HardwareStore.Models.DbModels;
using HardwareStore.Models.DbModels.Enums;
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

        public OrdersController(ApplicationDbContext context)
        {
            _context = context;
        }

        public ActionResult Index()
        {
            _userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

            var address = _context.Addresses.Where(d => d.IdentityUserId == _userId);


            var model = new OrderInfoViewModel()
            {
                Address = address.FirstOrDefault()
            };

            return View(model);
        }



        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> NewOrder(OrderInfoViewModel model)
        {
            _userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

            var productsInShoppingCart = _context.ShoppingCarts.Include(d => d.Product).Where(d => d.IdentityUserId == _userId);
            var totalPrice = 0.0;

            var hasAddress = await _context.Addresses.AnyAsync(d => d.IdentityUserId == _userId);

            if (!hasAddress)
            {
                model.Address.IdentityUserId = _userId;
                await _context.Addresses.AddAsync(model.Address);
                await _context.SaveChangesAsync();
            }

            foreach (var product in productsInShoppingCart)
            {
                totalPrice += product.Quantity * product.Product.Price;
            }

            await using (_context)
            {
                await using (var transaction = _context.Database.BeginTransaction())
                {
                    var address = await _context.Addresses.FirstOrDefaultAsync(d=>d.IdentityUserId == _userId);

                    var order = new Order()
                    {
                        IdentityUserId = _userId,
                        OrderDate = DateTime.Now,
                        TotalPrice = totalPrice,
                        OrderStatus = OrderStatus.Created,
                        AddressId = address.AddressId
                    };

                    await _context.Orders.AddAsync(order);
                    await _context.SaveChangesAsync();
                    var orderDetailsList = new List<OrderDetails>();

                    foreach (var shoppingCart in productsInShoppingCart)
                    {
                        var orderDetails = new OrderDetails()
                        {
                            OrderId = order.OrderId,
                            ProductId = shoppingCart.ProductId,
                            PricePerItem = shoppingCart.Product.Price,
                            Quantity = shoppingCart.Quantity
                        };
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