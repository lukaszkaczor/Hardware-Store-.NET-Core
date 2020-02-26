using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using HardwareStore.Data;
using HardwareStore.Models;
using HardwareStore.Models.DbModels;
using HardwareStore.Models.ModelsConfig;
using HardwareStore.ViewModels.ShoppingCart;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace HardwareStore.Controllers
{
    [Authorize]
    public class ShoppingCartController : Controller
    {
        private ApplicationDbContext _context;
        private string _userId;
        public ShoppingCartController(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<ActionResult> Index(string error)
        {
            _userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

            var currentHotShot = await _context.HotShots.Include(d => d.Product.Gallery.ImageGalleries)
                .ThenInclude(d => d.Image)
                .FirstOrDefaultAsync(d => d.StartDate < DateTime.Now && d.EndDate > DateTime.Now);

            if (currentHotShot == null)
            {
                _context.ShoppingCarts.RemoveRange(_context.ShoppingCarts
                    .Where(d => d.IdentityUserId == _userId).Where(d => d.HotShotId != null));
                _context.SaveChanges();
            }

            var shoppingCarts = _context.ShoppingCarts.Include(d => d.Product)
                .Where(d => d.IdentityUserId == _userId).ToList();
            var model = new List<ShoppingCartViewModel>();

            if (shoppingCarts.Any(d => d.Product.IsActive == false))
            {
                _context.ShoppingCarts.RemoveRange(shoppingCarts.Where(d => d.Product.IsActive == false));
                await _context.SaveChangesAsync();
                return RedirectToAction("Index", "ShoppingCart",
                    new { error = AppErrorMessage.ProductsDeletedFormCart });
            }

            foreach (var item in shoppingCarts)
            {
                model.Add(new ShoppingCartViewModel()
                {
                    Product = item.Product,
                    Quantity = item.Quantity,
                    UserID = _userId,
                    Image = await ImageManager.GetFirstImageForProduct(_context, item.ProductId),
                    IsHotShot = item.HotShotId != null,
                    HotShot = currentHotShot
                });
            }

            ViewBag.Error = error ?? String.Empty;
            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> AddToCart(Product product, bool isHotShot, int quantity = 1)
        {
            var productIsExcludedFromSale = await _context.Products
                .AnyAsync(d => d.ProductId == product.ProductId && d.IsActive == false);
            if (quantity < 0 || productIsExcludedFromSale || (isHotShot && quantity > 1))
                return NotFound();

            var carts = _context.ShoppingCarts;
            _userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            var hotShotAlreadyBought = false;

            HotShot hotShot = null;
            if (isHotShot)
            {
                hotShot = await _context.HotShots.Include(d => d.Product
                        .Gallery.ImageGalleries).ThenInclude(d => d.Image)
                    .FirstOrDefaultAsync(d => d.StartDate < DateTime.Now && d.EndDate > DateTime.Now);

                hotShotAlreadyBought = _context.AccountHotShots.Where(d => d.IdentityUserId == _userId)
                    .Any(d => d.HotShotId == hotShot.HotShotId.ToString());
            }

            if (isHotShot || !carts.Where(d => d.IdentityUserId == _userId)
                    .Where(d => d.HotShotId == null).Any(d => d.ProductId == product.ProductId))
            {
                if ((isHotShot && carts.Any(d => d.HotShotId != null)) || hotShotAlreadyBought)
                    return RedirectToAction("Index", new { error = AppErrorMessage.HotShotAlreadyBought });

                if (hotShot != null && hotShot.Quantity <= hotShot.ItemsSold)
                    return RedirectToAction("Index", new { error = AppErrorMessage.SaleHasEnded });

                carts.Add(new ShoppingCart()
                {
                    Quantity = quantity,
                    ProductId = product.ProductId,
                    IdentityUserId = _userId,
                    HotShotId = hotShot?.HotShotId
                });
            }
            else
            {
                var cart = carts.Where(d => d.IdentityUserId == _userId)
                    .FirstOrDefault(d => d.ProductId == product.ProductId && d.HotShotId == null);
                if (cart != null) cart.Quantity += quantity;
            }
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult RemoveFromCart(int? id, bool isHotShot)
        {
            _userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

            var products = _context.ShoppingCarts
                .Where(d => d.IdentityUserId == _userId);

            var productToDelete = products
                .FirstOrDefault(d => d.ProductId == id && d.HotShotId == null);

            if (isHotShot) productToDelete = products
                .FirstOrDefault(d => d.HotShotId != null);


            if (productToDelete == null) return NotFound();

            _context.ShoppingCarts.Remove(productToDelete);

            _context.SaveChanges();

            return RedirectToAction("Index");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AdjustQuantity(int productId, bool adjustType, bool isHotShot)
        {
            _userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            int action = adjustType ? 1 : -1;

            if (isHotShot) return NotFound();

            var itemToUpdate = _context.ShoppingCarts.Where(d => d.IdentityUserId == _userId)
                .SingleOrDefault(d => d.ProductId == productId && d.HotShotId == null);
            if (itemToUpdate == null) return NotFound();

            itemToUpdate.Quantity += action;
            _context.SaveChanges();

            return RedirectToAction("Index");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult SetQuantity(int productId, int quantity, bool isHotShot)
        {
            _userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

            if (isHotShot) return NotFound();

            var itemToUpdate = _context.ShoppingCarts.Where(d => d.IdentityUserId == _userId)
                .SingleOrDefault(d => d.ProductId == productId && d.HotShotId == null);
            if (itemToUpdate == null) return NotFound();

            itemToUpdate.Quantity = quantity;
            _context.SaveChanges();

            return RedirectToAction("Index");
        }
    }
}

//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Security.Claims;
//using System.Threading.Tasks;
//using HardwareStore.Data;
//using HardwareStore.Models;
//using HardwareStore.Models.DbModels;
//using HardwareStore.ViewModels.ShoppingCart;
//using Microsoft.AspNetCore.Authorization;
//using Microsoft.AspNetCore.Mvc;
//using Microsoft.EntityFrameworkCore;

//namespace HardwareStore.Controllers
//{
//    [Authorize]
//    public class ShoppingCartController : Controller
//    {
//        private ApplicationDbContext _context;
//        private string _userId;
//        public ShoppingCartController(ApplicationDbContext context)
//        {
//            _context = context;
//        }
//        // GET: ShoppingCart
//        public async Task<ActionResult> Index(string error)
//        {
//            _userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
//            var shoppingCarts = _context.ShoppingCarts.Include(d=>d.Product).Where(d => d.IdentityUserId == _userId).ToList();
//            var products = _context.Products.ToList();
//            var model = new List<ShoppingCartViewModel>();

//            if (shoppingCarts.Any(d => d.Product.IsActive == false))
//            {
//                _context.ShoppingCarts.RemoveRange(shoppingCarts.Where(d => d.Product.IsActive == false));
//                await _context.SaveChangesAsync();
//                return RedirectToAction("Index", "ShoppingCart",
//                    new { error = "Niektóre przedmioty nie są już dostępne w sprzedaży i zostały z niego usunięte" });
//            }

//            foreach (var item in shoppingCarts)
//            {
//                var productInCart = products.First(d => d.ProductId == item.ProductId);

//                model.Add(new ShoppingCartViewModel()
//                {
//                    Product = productInCart,
//                    Quantity = item.Quantity,
//                    UserID = _userId,
//                    Image = await ImageManager.GetFirstImageForProduct(_context, productInCart.ProductId),
//                });
//            }

//            //model.FirstOrDefault().Error = error ?? String.Empty;
//            ViewBag.Error = error ?? String.Empty;

//            return View(model);
//        }

//        [HttpPost]
//        [ValidateAntiForgeryToken]
//        public async Task<ActionResult> AddToCart(Product product, int quantity = 1)
//        {
//            if (quantity < 0)
//                return NotFound();


//            var carts = _context.ShoppingCarts;
//            _userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

//            if (!carts.Where(d => d.IdentityUserId == _userId)
//                .Any(d => d.ProductId == product.ProductId))
//            {
//                carts.Add(new ShoppingCart() { Quantity = quantity, 
//                    ProductId = product.ProductId, IdentityUserId = _userId });
//            }

//            else
//            {
//                var cart = carts.Where(d => d.IdentityUserId == _userId)
//                    .FirstOrDefault(d => d.ProductId == product.ProductId);
//                cart.Quantity += quantity;
//            }
//            await _context.SaveChangesAsync();

//            return RedirectToAction("Index");
//        }

//        [HttpPost]
//        [ValidateAntiForgeryToken]
//        public ActionResult RemoveFromCart(int? id)
//        {
//            _userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

//            var productToDelete = _context.ShoppingCarts
//                .Where(d => d.IdentityUserId == _userId)
//                .SingleOrDefault(d => d.ProductId == id);
//            if (productToDelete == null) return NotFound();

//            _context.ShoppingCarts.Remove(productToDelete);

//            _context.SaveChanges();

//            return RedirectToAction("Index");
//        }

//        [HttpPost]
//        [ValidateAntiForgeryToken]
//        public ActionResult AdjustQuantity(int productId, bool adjustType)
//        {
//            _userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
//            int action = adjustType ? 1 : -1;

//            var itemToUpdate = _context.ShoppingCarts.Where(d => d.IdentityUserId == _userId).SingleOrDefault(d => d.ProductId == productId);
//            if (itemToUpdate == null) return NotFound();

//            itemToUpdate.Quantity += action;
//            _context.SaveChanges();

//            return RedirectToAction("Index");
//        }

//        [HttpPost]
//        [ValidateAntiForgeryToken]
//        public ActionResult SetQuantity(int productId, int quantity)
//        {
//            _userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

//            var itemToUpdate = _context.ShoppingCarts.Where(d => d.IdentityUserId == _userId).SingleOrDefault(d => d.ProductId == productId);
//            if (itemToUpdate == null) return NotFound();

//            itemToUpdate.Quantity = quantity;
//            _context.SaveChanges();

//            return RedirectToAction("Index");
//        }
//    }
//}