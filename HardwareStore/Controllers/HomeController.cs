using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Threading.Tasks.Dataflow;
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
using Microsoft.EntityFrameworkCore.Internal;

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
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

            var products = await _context.Products
                .Include(d => d.Gallery.ImageGalleries).ThenInclude(d => d.Image).ToListAsync();

            var recommendedProducts = products.Where(d => d.IsRecommended).Take(8).ToList();



            var bestsellersList = new List<Product>();
            var bestsellers = from items in _context.OrderDetails
                              group items by new { items.ProductId }
                              into g
                              select new { g.Key.ProductId, totalQuantity = g.Sum(items => items.Quantity) };

            var orderedBestsellers = bestsellers.OrderByDescending(d => d.totalQuantity).Take(8).ToList();

            foreach (var item in orderedBestsellers)
            {
                bestsellersList.Add(products.FirstOrDefault(d => d.ProductId == item.ProductId));
            }

            var posts = await _context.Posts
                .Include(d => d.Gallery.ImageGalleries)
                .ThenInclude(d => d.Image)
                .Where(d => d.PublicationDate < DateTime.Now)
                .Where(d => d.IsActive)
                .Take(5).ToListAsync();

            var hotShot =
                await _context.HotShots.Include(d => d.Product.Gallery.ImageGalleries)
                    .ThenInclude(d => d.Image)
                    .FirstOrDefaultAsync(d => d.StartDate < DateTime.Now && d.EndDate > DateTime.Now);
            var formattedEndDate = string.Empty;
            if (hotShot != null)
            {
                formattedEndDate = hotShot.EndDate.ToString("yyyy-MM-dd HH:mm:ss");
            }
            //.FirstOrDefaultAsync(d => d.HasEnded == false || d.StartDate < DateTime.Now);



            var hotShotAlreadyBought = false;
            if (userId != null)
            {
                 hotShotAlreadyBought = await _context.AccountHotShots.Where(d => d.IdentityUserId == userId)
                    .AnyAsync(d => d.HotShotId == hotShot.HotShotId.ToString());
            }

            var model = new HomeIndexViewModel()
            {
                Brands = await _context.Brands.Include(d => d.Image).ToListAsync(),
                RecommendedProducts = recommendedProducts,
                Bestsellers = bestsellersList,
                Posts = posts,
                HotShot = hotShot,
                AlreadyBought = hotShotAlreadyBought ,
                FormattedEndDate = formattedEndDate
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

