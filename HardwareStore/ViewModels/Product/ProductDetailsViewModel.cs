
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


        //public int ProductId { get; set; }
        //public string ProductName { get; set; }
        //public double Price { get; set; }
        //public Brand Brand { get; set; }
        //public Category Category { get; set; }
        //public Section Section { get; set; }
        //public List<TagValue> TagValuesList { get; set; }
        //public List<Image> Images { get; set; }
    }
}
