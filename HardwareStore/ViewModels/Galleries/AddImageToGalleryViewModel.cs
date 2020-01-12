using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HardwareStore.Models.DbModels;

namespace HardwareStore.ViewModels.Galleries
{
    public class AddImageToGalleryViewModel : GalleryViewModel
    {
        public Image Image { get; set; }
        public ImageGallery ImageGallery { get; set; }
    }
}
