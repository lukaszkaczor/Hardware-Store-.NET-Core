using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HardwareStore.Models.DbModels;

namespace HardwareStore.Models.SearchingAndFiltering
{
    public class BrandFilter
    {
        public Brand Brand { get; set; }
        public bool IsChecked { get; set; }
    }
}
