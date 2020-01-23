using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HardwareStore.Models.DbModels;

namespace HardwareStore.ViewModels.Galleries
{
    public class CreateGalleryViewModel
    {
        public Gallery Gallery { get; set; }

        public int? ProductId { get; set; }
        //public Models.DbModels.Product? Product { get; set; }
    }
}
