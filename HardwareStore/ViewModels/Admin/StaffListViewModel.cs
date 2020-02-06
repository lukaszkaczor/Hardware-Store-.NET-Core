using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;

namespace HardwareStore.ViewModels.Admin
{
    public class StaffListViewModel
    {
        public IdentityRole Role { get; set; }
        public List<IdentityUser> Users { get; set; }
    }
}
