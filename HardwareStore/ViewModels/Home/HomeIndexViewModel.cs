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
    public class HomeIndexViewModel : ViewModel
    {
        public IEnumerable<Brand> Brands { get; set; }

        public HomeIndexViewModel(ApplicationDbContext context) : base(context)
        {
            Brands = context.Brands.ToList();
        }
    }
}
