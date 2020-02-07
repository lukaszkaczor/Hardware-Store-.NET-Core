
using System.Collections.Generic;
using System.Security.Principal;
using HardwareStore.Models;
using HardwareStore.Models.DbModels;

//using HardwareStore.Models.;

namespace HardwareStore.ViewModels.Product
{
    public class ProductDetailsViewModel
    {
        public Models.DbModels.Product Product { get; set; }
        public List<TagNameWithValue> Tags { get; set; }
        public List<Image> Images { get; set; }
        public bool IsHotShot { get; set; }
        public HotShot HotShot { get; set; }
        public string FormattedDate { get; set; }
    }
}
