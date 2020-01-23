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
            var images = new List<Image>();

            foreach (var product in products)
            {
                images.Add(await ImageManager.GetFirstImageForProduct(_context, product.ProductId));
            }

            var model = new HomeIndexViewModel()
            {
                Brands = await _context.Brands.Include(d=>d.Image).ToListAsync(),
                RecommendedProducts =  products,
                RecommendedImages = images
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

