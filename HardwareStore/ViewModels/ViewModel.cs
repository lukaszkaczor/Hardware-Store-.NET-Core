using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Security.Policy;
using System.Threading;
using System.Threading.Tasks;
using HardwareStore.Data;
using HardwareStore.Models.DbModels;
using HardwareStore.ViewModels.Home;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc.ViewEngines;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Migrations.Operations;

namespace HardwareStore.ViewModels
{
    public class ViewModel 
    {

        public ViewModel(ApplicationDbContext context)
        {
            AllSections = context.Sections.ToList();
        }

        public IEnumerable<Section> AllSections { get; set; }
    }
    //public class ViewModel : ApplicationDbContext, IViewModel
    //{
    //    //public IEnumerable<Section> AllSections { get; set; }
    //    //public IEnumerable<Section> SectionsSet { get; set; }

    //    public ViewModel(DbContextOptions<ApplicationDbContext> options) : base(options)
    //    {
    //        AllSections = Sections.ToList();
    //    }


    //    public IEnumerable<Section> AllSections { get; set; }
    //}
    
}
