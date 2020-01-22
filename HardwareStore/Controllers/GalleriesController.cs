using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using HardwareStore.Data;
using HardwareStore.Models;
using HardwareStore.Models.DbModels;
using HardwareStore.Models.ModelsConfig;
using HardwareStore.ViewModels.Galleries;
using Microsoft.AspNetCore.Authorization;

namespace HardwareStore.Controllers
{
    [Authorize(Roles = AppRole.Admin)]
    public class GalleriesController : Controller
    {
        private readonly ApplicationDbContext _context;

        public GalleriesController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: Galleries
        public async Task<IActionResult> Index()
        {
            return View(await _context.Galleries.ToListAsync());
        }

        // GET: Galleries/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var gallery = await _context.Galleries
                .FirstOrDefaultAsync(m => m.GalleryId == id);
            if (gallery == null)
            {
                return NotFound();
            }

            return View(gallery);
        }

        // GET: Galleries/Create
        public async Task<IActionResult> Create(int? id)
        {
            if (id == null)
            {

                return View();
            }

            var product = await _context.Products.SingleOrDefaultAsync(d => d.ProductId == id);

            var model = new Gallery()
            {
                Name = product.Name + "_gallery"
            };

            return View(model);
        }

        // POST: Galleries/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("GalleryId,Name")] Gallery gallery)
        {
            if (ModelState.IsValid)
            {
                _context.Add(gallery);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Edit), new { id = gallery.GalleryId });
            }
            return View(gallery);
        }

        // GET: Galleries/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var gallery = await _context.Galleries.FindAsync(id);
            if (gallery == null)
            {
                return NotFound();
            }

            var images =
                from image in _context.Images
                join imgGallery in _context.ImageGalleries on image.ImageId equals imgGallery.ImageId
                join galleries in _context.Galleries on imgGallery.GalleryId equals galleries.GalleryId
                where imgGallery.GalleryId == id
                orderby imgGallery.Order
                select image;

            var imgGalleries = _context.ImageGalleries.Where(d => d.GalleryId == id).OrderBy(d => d.Order).ToList();

            var model = new GalleryViewModel()
            {
                Images = images.ToList(),
                Gallery = gallery,
                ImageGalleries = imgGalleries
            };

            return View(model);
        }

        // POST: Galleries/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("GalleryId,Name")] Gallery gallery)
        {
            if (id != gallery.GalleryId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(gallery);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!GalleryExists(gallery.GalleryId))
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
            return View(gallery);
        }

        // GET: Galleries/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var gallery = await _context.Galleries
                .FirstOrDefaultAsync(m => m.GalleryId == id);
            if (gallery == null)
            {
                return NotFound();
            }

            return View(gallery);
        }

        // POST: Galleries/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var gallery = await _context.Galleries.FindAsync(id);
            _context.Galleries.Remove(gallery);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool GalleryExists(int id)
        {
            return _context.Galleries.Any(e => e.GalleryId == id);
        }

        public IActionResult AddImageToGallery(int id)
        {
            var editedGallery = _context.Galleries.Find(id);

            if (editedGallery == null)
                return NotFound();

            //var images =
            //    from image in _context.Images
            //    join imgGallery in _context.ImageGalleries on image.imageId equals imgGallery.imageId
            //    join galleries in _context.Galleries on imgGallery.GalleryId equals galleries.GalleryId
            //    where imgGallery.GalleryId == id
            //    orderby imgGallery.Order
            //    select image;

            //var filteredImages = _context.Images.Where(d => images.All(s => s.imageId != d.imageId)).ToList();

            var orderValue = _context.ImageGalleries.Where(d => d.GalleryId == id).Max(d => d.Order) + 1 ?? 1;

            var model = new AddImageToGalleryViewModel()
            {
                Gallery = editedGallery,
                //Images = filteredImages,
                ImageGallery = new ImageGallery()
                {
                    Order = orderValue
                }
            };

            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> AddImageToGallery(AddImageToGalleryViewModel model, int imageId)
        {
            //True when request comes from ImageList.cshtml
            if (imageId > 0)
            {
                model.Image = await _context.Images.SingleOrDefaultAsync(d => d.ImageId == imageId);
                model.ImageGallery.Order += 1;
            }
            var image = model.Image;


            var imageFromDb = await _context.Images.FirstOrDefaultAsync(d=>d.Url == model.Image.Url);

            if (imageFromDb == null)
            {
                await _context.Images.AddAsync(image);
                await _context.SaveChangesAsync();
                imageFromDb = image;
            }

            var imgGalleryAlreadyExists = _context.ImageGalleries.Where(d => d.GalleryId == model.Gallery.GalleryId).Any(d => d.ImageId == imageFromDb.ImageId);

            if (!imgGalleryAlreadyExists)
            {
                var imgGallery = new ImageGallery()
                {
                    GalleryId = model.Gallery.GalleryId,
                    ImageId = imageFromDb.ImageId,
                    Order = model.ImageGallery.Order
                };
                await _context.ImageGalleries.AddAsync(imgGallery);
                await _context.SaveChangesAsync();


                var orderedGalleries = GalleryManager.SetOrderOfImageGalleries(_context, imgGallery);

                await AddToDbContextAndSaveAsync(orderedGalleries);
            }

            return RedirectToAction("Edit", new { id = model.Gallery.GalleryId });
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> SetPositionOfImageInGallery(int galleryId, int order, int imageId)
        {
            var thisGallery = await _context.ImageGalleries.Where(d => d.GalleryId == galleryId)
                .SingleOrDefaultAsync(d => d.ImageId == imageId);

            if (thisGallery == null) return NotFound();

            thisGallery.Order = order;

            var galleries = GalleryManager.SetOrderOfImageGalleries(_context, thisGallery);
            await AddToDbContextAndSaveAsync(galleries);

            return RedirectToAction("Edit", new { id = galleryId });
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteImageFromGallery(int galleryId, int imageId)
        {
            var galleryToDelete = await _context.ImageGalleries.Where(d => d.GalleryId == galleryId)
                .SingleOrDefaultAsync(d => d.ImageId == imageId);

            if (galleryToDelete == null) return NotFound();

            _context.ImageGalleries.Remove(galleryToDelete);
            await _context.SaveChangesAsync();

            var galleries = GalleryManager.Order(_context, _context.ImageGalleries.ToList());
            await AddToDbContextAndSaveAsync(galleries);


            return RedirectToAction("Edit", new { id = galleryId });
        }

        public async Task<IActionResult> ImageList(int id)
        {
            var images =
                from image in _context.Images
                join imgGallery in _context.ImageGalleries on image.ImageId equals imgGallery.ImageId
                join galleries in _context.Galleries on imgGallery.GalleryId equals galleries.GalleryId
                where imgGallery.GalleryId == id
                orderby imgGallery.Order
                select image;

            var filteredImages = await _context.Images.Where(d => images.All(s => s.ImageId != d.ImageId)).ToListAsync();


            var imgGal = await _context.ImageGalleries.Where(d => d.GalleryId == id).OrderByDescending(d => d.Order)
                .FirstOrDefaultAsync();

            if (imgGal == null)
            {
                imgGal = new ImageGallery()
                {
                    GalleryId = id,
                    Order = 1
                };
            }

            var model = new AddImageToGalleryViewModel()
            {
                Images = filteredImages,
                Gallery = await _context.Galleries.SingleOrDefaultAsync(d => d.GalleryId == id),
                ImageGallery = imgGal
            };

            //return RedirectToAction(nameof(ImageList), filteredImages);
            return View(model);
        }

        public async Task AddToDbContextAndSaveAsync(List<ImageGallery> orderedGalleries)
        {
            foreach (var gallery in orderedGalleries)
            {
                var galleryToOverwrite = await _context.ImageGalleries.Where(d => d.GalleryId == gallery.GalleryId)
                    .SingleOrDefaultAsync(d => d.ImageId == gallery.ImageId);

                galleryToOverwrite = gallery;
            }
            await _context.SaveChangesAsync();
        }
    }
}
