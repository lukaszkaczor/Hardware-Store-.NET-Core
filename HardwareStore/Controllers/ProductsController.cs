using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using HardwareStore.Data;
using HardwareStore.Models.DbModels;
using HardwareStore.ViewModels.Product;
using Microsoft.AspNetCore.Mvc.Formatters;
using Microsoft.Extensions.Primitives;

namespace HardwareStore.Controllers
{
    
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
            return View(await applicationDbContext.ToListAsync());
        }

        // GET: Products/Details/5
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

            return View(product);
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
            if (ModelState.IsValid)
            {
                _context.Add(product);
                await _context.SaveChangesAsync();
                //return RedirectToAction(nameof(Index));
                return RedirectToAction("SetTags", new { id = product.ProductId, isNew = true });
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
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
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

        public async Task<IActionResult> SetTags(int id, bool isNew)
        {
            if (!_context.Products.Any(d=>d.ProductId == id))
            {
                return NotFound();
            }

            var model = new List<SetTagsToProductViewModel>();
            var tags = _context.Tags.Include(d => d.TagValues).ToList();
            var tagValues = _context.TagValues.Where(d => d.ProductId == id).ToList();
            
            foreach (var tag in tags)
            {
                model.Add(new SetTagsToProductViewModel()
                {
                    TagId = tag.TagId,
                    TagName = tag.Name,
                    Value = tagValues.SingleOrDefault(d => d.TagId == tag.TagId)?.Value ?? String.Empty,
                    TagValueId = tagValues.SingleOrDefault(d => d.TagId == tag.TagId)?.TagValueId ?? 0,
                });
            }

            model = model.OrderBy(d => d.TagName).ToList();
            ViewBag.IsNew = isNew;

            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> SetTags(List<SetTagsToProductViewModel> tags, int id)
        {
            var productTags = _context.ProductTags.ToList();
            var tagValues = _context.TagValues.Where(d => d.ProductId == id);

            foreach (var tag in tags)
            {
                var tagValue = new TagValue()
                {
                    ProductId = id,
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
                else if (value !=null)
                {
                    value.Value = tagValue.Value;
                }

                await _context.SaveChangesAsync();
            }

            return RedirectToAction(nameof(SetTags));
        }

        private bool ProductExists(int id)
        {
            return _context.Products.Any(e => e.ProductId == id);
        }
    }
}
