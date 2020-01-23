using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HardwareStore.Data;
using HardwareStore.Models.DbModels;
using Microsoft.EntityFrameworkCore;

namespace HardwareStore.Models
{
    public class ImageManager
    {
        public static async Task<List<Image>> GetImagesForProduct(ApplicationDbContext context, int id)
        {
            var products = await context.Products.ToListAsync();
            var imagesList = await context.Images.ToListAsync();
            var galleriesList = await context.Galleries.ToListAsync();
            var imageGalleryList = await context.ImageGalleries.ToListAsync();


            var images =
                from image in imagesList
                join imgGallery in imageGalleryList on image.ImageId equals imgGallery.ImageId
                join galleries in galleriesList on imgGallery.GalleryId equals galleries.GalleryId
                join product in products on galleries.GalleryId equals product.GalleryId
                where product.ProductId == id
                orderby imgGallery.Order
                select image;


            return images.ToList();
        }

        public static async Task<Image> GetFirstImageForProduct(ApplicationDbContext context, int id)
        {
            var images = await GetImagesForProduct(context, id);

            if (!images.Any())
            {
                images.Add(new Image()
                {
                    Url = null
                });
            }

            return images.First();
        }

    }
}
