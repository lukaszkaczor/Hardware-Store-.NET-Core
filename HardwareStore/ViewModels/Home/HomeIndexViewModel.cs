using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HardwareStore.Data;
using HardwareStore.Models.DbModels;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;

namespace HardwareStore.ViewModels.Home
{
    public class HomeIndexViewModel
    {
        public List<Brand> Brands { get; set; }
        public List<Models.DbModels.Product> RecommendedProducts { get; set; }
        
        public List<Models.DbModels.Product> Bestsellers { get; set; }

        public List<Post> Posts { get; set; }

        public HotShot HotShot { get; set; }
        public string FormattedEndDate { get; set; }
    }
}
