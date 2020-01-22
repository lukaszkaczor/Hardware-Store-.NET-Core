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

        public static List<ImageGallery> SetOrderOfImageGalleries(ApplicationDbContext context, ImageGallery imageGallery)
        {
            if (imageGallery == null || context == null) throw new NullReferenceException();


            if (imageGallery.Order < 1)
                imageGallery.Order = 1;


            var imageGalleries = context.ImageGalleries.Where(d => d.GalleryId == imageGallery.GalleryId).OrderBy(d => d.Order).ToList();
            var thisGallery = imageGalleries.Where(d => d.ImageId == imageGallery.ImageId).SingleOrDefault(d => d.Order == imageGallery.Order);

            if (thisGallery == null) throw new NullReferenceException();

            imageGalleries.Remove(thisGallery);

            if (imageGallery.Order > imageGalleries.Max(d => d.Order))
                thisGallery.Order = imageGalleries.Max(d => d.Order) + 1;

            if (imageGalleries.Count > 0)
            {
                imageGalleries.Insert(imageGallery.Order - 1 ?? imageGalleries.Count, thisGallery);
            }
            else
            {
                imageGalleries.Add(imageGallery);
            }

            return Order(context, imageGalleries);
        }

        public static List<ImageGallery> Order(ApplicationDbContext context, List<ImageGallery> imageGalleries)
        {
            if (imageGalleries == null || context == null) throw new NullReferenceException();

            for (var i = 0; i < imageGalleries.Count; i++)
            {
                imageGalleries[i].Order = i + 1;
                context.Entry(imageGalleries[i]).State = EntityState.Modified;
            }
            return imageGalleries;
        }
    }
}
