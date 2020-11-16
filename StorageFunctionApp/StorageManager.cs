using System;
using System.IO;
using HardwareStore.Data;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Host;
using Microsoft.EntityFrameworkCore.Internal;
using Microsoft.Extensions.Logging;
using System.Linq;
using HardwareStore.Models.DbModels;


namespace StorageFunctionApp
{
    public class StorageManager
    {
        private readonly ApplicationDbContext _context;

        public StorageManager(ApplicationDbContext context)
        {
            _context = context;
        }

        [FunctionName("StorageManager")]
        public void Run([BlobTrigger("kompex/{name}", Connection = "")]Stream myBlob, string name, ILogger log)
        {
            var inFolder = name.Contains("/");

            if (inFolder)
            {
                var directory = name.Substring(0, name.IndexOf("/", StringComparison.Ordinal));
                var file = name.Substring(name.IndexOf("/", StringComparison.Ordinal) + 1);

                var galleryAlreadyExists = _context.Galleries.Any(d=>d.Name == directory);

                if (!galleryAlreadyExists) _context.Galleries.Add(new Gallery() { Name = directory });
                
                var image = new Image() {Name = file,Url = $"https://kompexstorage.blob.core.windows.net/kompiutex/{directory}/{file}" };
                
                _context.Images.Add(image);
                _context.SaveChanges();

                var gallery = _context.Galleries.First(d => d.Name == directory);
                var imageGallery = _context.ImageGalleries.Where(d => d.GalleryId == gallery.GalleryId);

                int order;

                if (imageGallery.Any(d=>d.Order > 0)) order = (int)imageGallery.Max(d => d.Order)+1;
                else order = 1;
               


                _context.ImageGalleries.Add(new ImageGallery()
                {
                    ImageId = image.ImageId,
                    GalleryId = gallery.GalleryId,
                    Order = order
                });
            }
            else
            {
                _context.Images.Add(new Image()
                {
                    Name = name,
                    Url = $"https://kompexstorage.blob.core.windows.net/kompiutex/" +name
                });
            }

            _context.SaveChanges();

            log.LogInformation($"C# Blob trigger function Processed blob\n Name:{name} \n Size: {myBlob.Length} Bytes");
        }
    }
}
