using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HardwareStore.Models.DbModels;

namespace HardwareStore.Models.SearchingAndFiltering
{
    public class CategoryFilter
    {
        public Category Category { get; set; }
        public bool IsChecked { get; set; }
    }
}
