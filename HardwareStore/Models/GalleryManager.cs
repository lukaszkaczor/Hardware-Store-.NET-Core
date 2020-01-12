using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HardwareStore.Data;
using HardwareStore.Models.DbModels;
using Microsoft.EntityFrameworkCore;

namespace HardwareStore.Models
{
    public class GalleryManager
    {

        public static List<ImageGallery> SetOrderOfImageGalleries(ApplicationDbContext context, ImageGallery imageGallery, int newValue)
        {
            var imageGalleries = context.ImageGalleries.Where(d => d.GalleryId == imageGallery.GalleryId).OrderBy(d => d.Order).ToList();
            var thisGallery = imageGalleries.Where(d=>d.ImageId == imageGallery.ImageId).SingleOrDefault(d => d.Order == imageGallery.Order);
            

            imageGalleries.Remove(thisGallery);
            imageGalleries.Insert(newValue - 1, thisGallery);

            for (var i = 0; i < imageGalleries.Count; i++)
            {
                imageGalleries[i].Order = i + 1;
                context.Entry(imageGalleries[i]).State = EntityState.Modified;
            }

            return imageGalleries;
        }
    }
}
