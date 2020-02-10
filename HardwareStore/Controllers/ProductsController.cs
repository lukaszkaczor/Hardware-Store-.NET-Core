using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mime;
using System.Security.Claims;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using HardwareStore.Data;
using HardwareStore.Models;
using HardwareStore.Models.DbModels;
using HardwareStore.Models.ModelsConfig;
using HardwareStore.Models.SearchingAndFiltering;
using HardwareStore.Models.SearchingAndFiltering.Interfaces;
using HardwareStore.Models.TransferModels;
using HardwareStore.ViewModels.Product;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc.Formatters;
using Microsoft.Extensions.Primitives;

namespace HardwareStore.Controllers
{
    [Authorize(Roles = AppRole.Admin)]
    public class ProductsController : Controller
    {
        private readonly ApplicationDbContext _context;
        private string _userId;

        public ProductsController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: Products
        public async Task<IActionResult> Index()
        {
            var applicationDbContext = _context.Products.Include(p => p.Brand).Include(p => p.Category).Include(p => p.Gallery);

            var model = await applicationDbContext.ToListAsync();
            return View(model);
        }

        // GET: Products/Details/5
        [AllowAnonymous]
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }
            var product = await _context.Products
                .Include(p => p.Brand)
                .Include(p => p.Category)
                .ThenInclude(d => d.Section)
                .Include(p => p.Gallery)
                .FirstOrDefaultAsync(m => m.ProductId == id);

            var isHotShot = _context.HotShots.Any(d => d.StartDate < DateTime.Now && d.EndDate > DateTime.Now
                                                                                && d.Quantity > d.ItemsSold && d.ProductId == product.ProductId);
            HotShot hotShot = null;
            if (isHotShot)
            {
                hotShot = await _context.HotShots.Include(d => d.Product.Gallery.ImageGalleries)
                    .ThenInclude(d => d.Image)
                    .FirstOrDefaultAsync(d => d.StartDate < DateTime.Now && d.EndDate > DateTime.Now);
            }

            if (product == null)
            {
                return NotFound();
            }

            var ratings = _context.Ratings.Where(d => d.ProductId == product.ProductId);
            var sum = await ratings.SumAsync(d=>d.Value);
            var ratingCount = await ratings.CountAsync();
            var avg = 0;
            if (ratingCount > 0) avg = sum / ratingCount;

            var model = new ProductDetailsViewModel()
            {
                Product = product,
                Tags = await TagManager.GetTagNameWithValues(_context, product),
                Images = await ImageManager.GetImagesForProduct(_context, (int)id),
                IsHotShot = isHotShot,
                HotShot = hotShot,
                FormattedDate = hotShot?.EndDate.ToString("yyyy-MM-dd HH:mm:ss"),
                Ratings = avg,
                RatingsCount = ratingCount
            };

            return View(model);
        }

        // GET: Products/Create
        public IActionResult Create()
        {
            ViewData["BrandId"] = new SelectList(_context.Brands, "BrandId", "Name");
            ViewData["CategoryId"] = new SelectList(_context.Categories, "CategoryId", "Name");
            ViewData["GalleryId"] = new SelectList(_context.Galleries, "GalleryId", "Name");
            return View();
        }

        // POST: Products/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("ProductId,Name,Price,QuantityInStock,IsActive,IsRecommended,BrandId,GalleryId,CategoryId")] Product product)
        {
            var hasGallery = false;
            if (ModelState.IsValid)
            {
                _context.Add(product);
                await _context.SaveChangesAsync();

                if (product.GalleryId > 0)
                {
                    hasGallery = true;
                }

                return RedirectToAction("SetTags", new { id = product.ProductId, hasGallery });
            }
            ViewData["BrandId"] = new SelectList(_context.Brands, "BrandId", "Name", product.BrandId);
            ViewData["CategoryId"] = new SelectList(_context.Categories, "CategoryId", "Name", product.CategoryId);
            ViewData["GalleryId"] = new SelectList(_context.Galleries, "GalleryId", "Name", product.GalleryId);
            return View(product);
        }

        // GET: Products/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var product = await _context.Products.FindAsync(id);
            if (product == null)
            {
                return NotFound();
            }
            ViewData["BrandId"] = new SelectList(_context.Brands, "BrandId", "Name", product.BrandId);
            ViewData["CategoryId"] = new SelectList(_context.Categories, "CategoryId", "Name", product.CategoryId);
            ViewData["GalleryId"] = new SelectList(_context.Galleries, "GalleryId", "Name", product.GalleryId);
            return View(product);
        }

        // POST: Products/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("ProductId,Name,Price,QuantityInStock,IsActive,IsRecommended,BrandId,GalleryId,CategoryId")] Product product)
        {
            if (id != product.ProductId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(product);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ProductExists(product.ProductId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["BrandId"] = new SelectList(_context.Brands, "BrandId", "Name", product.BrandId);
            ViewData["CategoryId"] = new SelectList(_context.Categories, "CategoryId", "Name", product.CategoryId);
            ViewData["GalleryId"] = new SelectList(_context.Galleries, "GalleryId", "Name", product.GalleryId);
            return View(product);
        }

        // GET: Products/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var product = await _context.Products
                .Include(p => p.Brand)
                .Include(p => p.Category)
                .Include(p => p.Gallery)
                .FirstOrDefaultAsync(m => m.ProductId == id);
            if (product == null)
            {
                return NotFound();
            }

            return View(product);
        }

        // POST: Products/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var product = await _context.Products.FindAsync(id);
            _context.Products.Remove(product);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        public IActionResult SetTags(int id, bool hasGallery)
        {
            if (!_context.Products.Any(d => d.ProductId == id))
            {
                return NotFound();
            }

            var model = new SetTagsToProductViewModel();
            var tags = _context.Tags.Include(d => d.TagValues).ToList();
            var tagValues = _context.TagValues.Where(d => d.ProductId == id).ToList();

            var list = new List<TagTransferModel>();

            foreach (var tag in tags)
            {
                list.Add(new TagTransferModel()
                {
                    TagId = tag.TagId,
                    TagName = tag.Name,
                    Value = tagValues.SingleOrDefault(d => d.TagId == tag.TagId)?.Value ?? String.Empty,
                    TagValueId = tagValues.SingleOrDefault(d => d.TagId == tag.TagId)?.TagValueId ?? 0,
                });

            }

            model.TagTransferModels = list;
            model.HasGallery = hasGallery;
            model.ProductId = id;

            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> SetTags(SetTagsToProductViewModel model)
        {
            var productTags = _context.ProductTags.ToList();
            var tagValues = _context.TagValues.Where(d => d.ProductId == model.ProductId);

            foreach (var tag in model.TagTransferModels)
            {
                var tagValue = new TagValue()
                {
                    ProductId = model.ProductId,
                    TagId = tag.TagId,
                    Value = tag.Value,
                    TagValueId = tag.TagValueId
                };

                var value = tagValues.Where(d => d.TagId == tagValue.TagId).SingleOrDefault(d => d.ProductId == tagValue.ProductId);

                if (String.IsNullOrWhiteSpace(tag.Value))
                {
                    var tagValueToDelete = tagValues.Where(d => d.TagId == tagValue.TagId).SingleOrDefault(d => d.TagValueId == tagValue.TagValueId);
                    var productTagToDelete = productTags.Where(d => d.TagId == tagValue.TagId).SingleOrDefault(d => d.ProductId == tagValue.ProductId);

                    if (tagValueToDelete != null)
                        _context.TagValues.Remove(tagValueToDelete);

                    if (productTagToDelete != null)
                        _context.ProductTags.Remove(productTagToDelete);

                    await _context.SaveChangesAsync();
                    continue;
                }

                if (!tagValues.Contains(tagValue))
                {
                    _context.TagValues.Add(tagValue);

                    _context.ProductTags.Add(new ProductTags()
                    {
                        ProductId = tagValue.ProductId,
                        TagId = tagValue.TagId
                    });
                }
                else if (value != null)
                {
                    value.Value = tagValue.Value;
                }

                _context.SaveChanges();
            }

            if (!model.HasGallery)
            {
                return RedirectToAction("Create", "Galleries", new { id = model.ProductId });
            }

            return RedirectToAction(nameof(Details), new { id = model.ProductId });
        }


        [HttpGet]
        [AllowAnonymous]
        public async Task<ActionResult> Search(string searchText, int filter, string brands, string categories, double? minPrice, double? maxPrice)
        {
            if (string.IsNullOrWhiteSpace(searchText)) return NotFound();

            var products = await _context.Products
                .Include(d => d.Category.Section)
                .Include(d => d.Gallery.ImageGalleries)
                .ThenInclude(d => d.Image)
                .Include(d => d.ProductTags)
                .ThenInclude(d => d.Tag.TagValues)
                .Where(d => d.Name.Contains(searchText.Trim())
                            || d.Brand.Name.Contains(searchText.Trim())
                            || d.Category.Name.Contains(searchText.Trim())
                            || d.Category.Section.Name.Contains(searchText.Trim())).ToListAsync();

            if (filter != 0) products = products.Where(d => d.Category.SectionId == filter).ToList();
            products = products.Distinct().ToList();

            var brandsFromDb = await _context.Brands.ToListAsync();
            var categoriesFromDb = await _context.Categories.ToListAsync();

            var searchModel = new SearchModel { BrandFilters = new List<BrandFilter>(), CategoryFilters = new List<CategoryFilter>() };

            var brandFilters = new List<IModel>();
            if (brands != null) brandFilters = SearchManager.GetFilters(brands, brandsFromDb);

            var categoryFilters = new List<IModel>();
            if (categories != null) categoryFilters = SearchManager.GetFilters(categories, categoriesFromDb);

            var categoryList = new List<Category>();
            var brandList = new List<Brand>();
            var filteredProducts = new List<Product>();

            foreach (var product in products)
            {
                brandList.Add(brandsFromDb.SingleOrDefault(d => d.BrandId == product.BrandId));
                categoryList.Add(categoriesFromDb.SingleOrDefault(d => d.CategoryId == product.CategoryId));
            }

            brandList = brandList.Distinct().ToList();
            categoryList = categoryList.Distinct().ToList();

            foreach (var brand in brandList)
            {
                searchModel.BrandFilters.Add(new BrandFilter()
                {
                    Brand = brand,
                    IsChecked = brandFilters.Any(d => d.Id == brand.BrandId)
                });
            }

            foreach (var category in categoryList)
            {
                searchModel.CategoryFilters.Add(new CategoryFilter()
                {
                    Category = category,
                    IsChecked = categoryFilters.Any(d => d.Id == category.CategoryId)
                });
            }


            var productList = new List<Product>();

            if (brandFilters.Any()) foreach (var brand in brandFilters) filteredProducts.AddRange(products.Where(d => d.BrandId == brand.Id));
            else filteredProducts = products;

            if (categoryFilters.Any()) foreach (var category in categoryFilters) productList.AddRange(filteredProducts.Where(d => d.CategoryId == category.Id));
            else productList = filteredProducts;

            if (minPrice > 0) productList = productList.Where(d => d.Price >= minPrice).ToList();
            if (maxPrice > 0) productList = productList.Where(d => d.Price <= maxPrice).ToList();

            var model = new ProductListViewModel()
            {
                Products = productList,
                SearchModel = searchModel,
                SearchText = searchText,
                Brands = brands,
                Categories = categories,
                MaxPrice = maxPrice,
                MinPrice = minPrice
            };

            return View(model);
        }

        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> SetRatings(int productId, int rating)
        {
            _userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            var ratingInDb =await _context.Ratings.Where(d => d.IdentityUserId == _userId)
                .FirstOrDefaultAsync(d => d.ProductId == productId);

            if (rating < 1 || rating > 5) throw new ArgumentOutOfRangeException();

            if (ratingInDb == null)
            {
                _context.Ratings.Add(new Rating()
                {
                    IdentityUserId = _userId,
                    ProductId = productId,
                    Value = rating
                });
            }
            else
            {
                ratingInDb.Value = rating;
            }

            _context.SaveChanges();


            return RedirectToAction("Details", new {id = productId});
        }

        private bool ProductExists(int id)
        {
            return _context.Products.Any(e => e.ProductId == id);
        }
    }
}
