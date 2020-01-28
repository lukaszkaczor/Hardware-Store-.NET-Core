using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using HardwareStore.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using HardwareStore.Models;
using HardwareStore.Models.DbModels;
using HardwareStore.ViewModels;
using HardwareStore.ViewModels.Home;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;

namespace HardwareStore.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly ApplicationDbContext _context;
        private IHttpContextAccessor _httpContextAccessor;

        public HomeController(ILogger<HomeController> logger, ApplicationDbContext context, IHttpContextAccessor httpContextAccessor)
        {
            _context = context;
            _logger = logger;
            _httpContextAccessor = httpContextAccessor;
        }

        public async Task<IActionResult> Index()
        {
            var products = await _context.Products.Where(d => d.IsRecommended).ToListAsync();

            var recommendedProducts = products.Where(d => d.IsRecommended).Take(8).ToList();
            var recommendedImages = new List<Image>();

            foreach (var product in recommendedProducts)
            {
                recommendedImages.Add(await ImageManager.GetFirstImageForProduct(_context, product.ProductId));
            }



            /*temp*/
            var bestsellersList = new List<Product>();

            var bestsellers = from items in _context.OrderDetails
                              group items by new { items.ProductId }
                into g
                              select new { g.Key.ProductId, V = g.Sum(items => items.Quantity) };

            bestsellers = bestsellers.OrderByDescending(d => d.V).Take(8);


            foreach (var item in bestsellers)
            {
                bestsellersList.Add(products.SingleOrDefault(d => d.ProductId == item.ProductId));
            }

            var bestsellersImages = new List<Image>();
            foreach (var item in bestsellersList)
            {
                bestsellersImages.Add(await ImageManager.GetFirstImageForProduct(_context, item.ProductId));
            }





            var model = new HomeIndexViewModel()
            {
                Brands = await _context.Brands.Include(d=>d.Image).ToListAsync(),
                RecommendedProducts =  recommendedProducts,
                RecommendedImages = recommendedImages,
                Bestsellers = bestsellersList,
                BestsellersImages = bestsellersImages
            };


            //var userId = User.FindFirstValue(ClaimTypes.NameIdentifier); // will give the user's userId
            //var userName = User.FindFirstValue(ClaimTypes.Name); // will give the user's userName
            //var userEmail = User.FindFirstValue(ClaimTypes.Email); // will give the user's Email




            //return RedirectToAction("Index", "Products");
            return View(model);
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}

