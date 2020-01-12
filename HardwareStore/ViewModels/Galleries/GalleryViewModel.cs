using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HardwareStore.Models.DbModels;

//using HardwareStore.Models.DbModels;

namespace HardwareStore.ViewModels.Galleries
{
    public class GalleryViewModel
    {
        public List<Image> Images { get; set; }
        public Gallery Gallery { get; set; }
        public List<ImageGallery> ImageGalleries { get; set; }
    }
}
