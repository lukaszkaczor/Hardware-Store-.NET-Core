using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HardwareStore.Models.DbModels;
using HardwareStore.Models.SearchingAndFiltering.Interfaces;

namespace HardwareStore.Models.SearchingAndFiltering
{
    public class CategoryFilter : IFilter
    {
        public Category Category { get; set; }
        public object FilterModel { get; set; } 
        public bool IsChecked { get; set; }
    }
}
