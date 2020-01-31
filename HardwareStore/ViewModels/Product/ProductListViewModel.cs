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
    }
}
