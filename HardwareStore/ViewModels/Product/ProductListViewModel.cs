using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HardwareStore.Models;
using HardwareStore.Models.DbModels;
using HardwareStore.Models.SearchingAndFiltering;
using Microsoft.EntityFrameworkCore;

namespace HardwareStore.ViewModels.Product
{
    public class ProductListViewModel
    {
        public List<Models.DbModels.Product> Products { get; set; }
        public List<List<TagNameWithValue>> TagsValuesList { get; set; }
        public List<Image> Images { get; set; }
        public SearchModel SearchModel { get; set; }
        public string SearchText { get; set; }
        public string Brands { get; set; }
        public string Categories { get; set; }
        public double? MinPrice { get; set; }
        public double? MaxPrice { get; set; }
    }
}
