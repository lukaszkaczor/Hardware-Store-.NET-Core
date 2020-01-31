using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace HardwareStore.Models.SearchingAndFiltering
{
    public class SearchModel
    {
        public string SearchText { get; set; }
        public int Filter { get; set; }
        public List<BrandFilter> BrandFilters { get; set; }
        public List<CategoryFilter> CategoryFilters { get; set; }
    }
}
