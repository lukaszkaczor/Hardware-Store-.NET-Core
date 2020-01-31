using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mime;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using HardwareStore.Data;
using HardwareStore.Models;
using HardwareStore.Models.DbModels;
using HardwareStore.Models.ModelsConfig;
using HardwareStore.Models.SearchingAndFiltering;
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
                .Include(p => p.Gallery)
                .FirstOrDefaultAsync(m => m.ProductId == id);

            if (product == null)
            {
                return NotFound();
            }


            var model = new ProductDetailsViewModel()
            {
                Product = product,
                Tags = await TagManager.GetTagNameWithValues(_context, product),
                Images = await ImageManager.GetImagesForProduct(_context, (int)id),
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
        public async Task<IActionResult> Create([Bind("ProductId,Name,Price,IsRecommended,BrandId,GalleryId,CategoryId")] Product product)
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
        public async Task<IActionResult> Edit(int id, [Bind("ProductId,Name,Price,IsRecommended,BrandId,GalleryId,CategoryId")] Product product)
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

                //await _context.SaveChangesAsync();
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
        //public async Task<ActionResult> Search(string text, int filter)
        public async Task<ActionResult> Search(SearchModel searchModel)
        {
            if (string.IsNullOrWhiteSpace(searchModel.SearchText)) return NotFound();


            var products = await _context.Products
                .Include(d => d.Category)
                .Include(d => d.Gallery.ImageGalleries)
                .ThenInclude(d => d.Image)
                .Include(d => d.ProductTags)
                .ThenInclude(d => d.Tag.TagValues)
                .Where(d => d.Name.Contains(searchModel.SearchText.Trim()) ||
                            d.Brand.Name.Contains(searchModel.SearchText.Trim())
                                                                       || d.Category.Name.Contains(searchModel.SearchText.Trim())).ToListAsync();


            if (searchModel.Filter != 0) products = products.Where(d => d.Category.SectionId == searchModel.Filter).ToList();

            products = products.Distinct().ToList();

            var brands = new List<Brand>();
            var brandFilters = new List<BrandFilter>();
            var filteredProducts = new List<Product>();

            if (searchModel.BrandFilters == null)
            {
                foreach (var product in products)
                {
                    brands.Add(await _context.Brands.SingleOrDefaultAsync(d => d.BrandId == product.BrandId));
                }

                brands = brands.Distinct().ToList();
                foreach (var brand in brands)
                {
                    brandFilters.Add(new BrandFilter()
                    {
                        Brand = brand,
                        IsChecked = false
                    });
                }
                searchModel.BrandFilters = brandFilters;
                filteredProducts = products;
            }
            else
            {
                foreach (var filter in searchModel.BrandFilters)
                {
                    if (!searchModel.BrandFilters.Any(d => d.IsChecked))
                    {
                        filteredProducts = products;
                        break;
                    }
                    if (filter.IsChecked)
                    {
                        filteredProducts.AddRange(products.Where(d => d.BrandId == filter.Brand.BrandId).ToList());
                    }
                }
            }

            var categories = new List<Category>();
            var categoryFilters = new List<CategoryFilter>();


            var dd = new List<Product>();

            if (searchModel.CategoryFilters == null)
            {
                foreach (var product in products)
                {
                    categories.Add(await _context.Categories.SingleOrDefaultAsync(d => d.CategoryId == product.CategoryId));
                }

                categories = categories.Distinct().ToList();
                foreach (var category in categories)
                {
                    categoryFilters.Add(new CategoryFilter()
                    {
                        Category = category,
                        IsChecked = false
                    });
                }
                searchModel.CategoryFilters = categoryFilters;
                dd = filteredProducts;
            }
            else
            {
                foreach (var filter in searchModel.CategoryFilters)
                {
                    if (!searchModel.CategoryFilters.Any(d => d.IsChecked))
                    {
                        dd = filteredProducts;
                        break;
                    }
                    if (filter.IsChecked)
                    {
                        dd.AddRange(filteredProducts.Where(d => d.CategoryId == filter.Category.CategoryId).ToList());
                    }
                }
            }



            var model = new ProductListViewModel()
            {
                Products = dd,
                SearchModel = searchModel,
            };

            return View(model);
        }

        private bool ProductExists(int id)
        {
            return _context.Products.Any(e => e.ProductId == id);
        }
    }
}
