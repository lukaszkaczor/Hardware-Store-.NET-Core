using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using HardwareStore.Data;
using HardwareStore.Models;
using HardwareStore.Models.DbModels;
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
        // GET: ShoppingCart
        public async Task<ActionResult> Index()
        {
            _userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            var shoppingCarts = _context.ShoppingCarts.Where(d => d.IdentityUserId == _userId).ToList();
            var products = _context.Products.ToList();
            var model = new List<ShoppingCartViewModel>();


            foreach (var item in shoppingCarts)
            {
                var productInCart = products.First(d => d.ProductId == item.ProductId);

                model.Add(new ShoppingCartViewModel()
                {
                    Product = productInCart,
                    Quantity = item.Quantity,
                    UserID = _userId,
                    Image = await ImageManager.GetFirstImageForProduct(_context, productInCart.ProductId)
                });
            }

            return View(model);
            //return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> AddToCart(Product product, int quantity = 1)
        {
            if (quantity < 0)
                return NotFound();


            var carts = _context.ShoppingCarts;
            _userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

            if (!carts.Where(d => d.IdentityUserId == _userId).Any(d => d.ProductId == product.ProductId))
            {
                carts.Add(new ShoppingCart() { Quantity = quantity, ProductId = product.ProductId, IdentityUserId = _userId });
            }

            else
            {
                var cart = carts.Where(d => d.IdentityUserId == _userId).FirstOrDefault(d => d.ProductId == product.ProductId);
                cart.Quantity += quantity;
            }
            await _context.SaveChangesAsync();

            return RedirectToAction("Index");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult RemoveFromCart(int? id)
        {
            _userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

            var productToDelete = _context.ShoppingCarts.Where(d => d.IdentityUserId == _userId).SingleOrDefault(d => d.ProductId == id);
            if (productToDelete == null) return NotFound();

            _context.ShoppingCarts.Remove(productToDelete);

            _context.SaveChanges();

            return RedirectToAction("Index");
        }

        public ActionResult AdjustQuantity(int productId, bool adjustType)
        {
            _userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            int action = adjustType ? 1 : -1;

            var itemToUpdate = _context.ShoppingCarts.Where(d => d.IdentityUserId == _userId).SingleOrDefault(d => d.ProductId == productId);
            if (itemToUpdate == null) return NotFound();

            itemToUpdate.Quantity += action;
            _context.SaveChanges();

            return RedirectToAction("Index");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult SetQuantity(int productId, int quantity)
        {
            _userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

            var itemToUpdate = _context.ShoppingCarts.Where(d => d.IdentityUserId == _userId).SingleOrDefault(d => d.ProductId == productId);
            if (itemToUpdate == null) return NotFound();

            itemToUpdate.Quantity = quantity;
            _context.SaveChanges();

            return RedirectToAction("Index");
        }
    }
}