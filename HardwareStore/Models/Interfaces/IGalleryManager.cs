using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HardwareStore.Models.DbModels;

namespace HardwareStore.Models.Interfaces
{
    public interface IGalleryManager
    {
        List<ImageGallery> SetOrderOfImageGalleries(ImageGallery imageGallery);
        List<ImageGallery> OrderAndSave(List<ImageGallery> imageGalleries);
    }
}
