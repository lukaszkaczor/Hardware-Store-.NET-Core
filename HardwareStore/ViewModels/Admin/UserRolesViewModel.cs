using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;

namespace HardwareStore.ViewModels.Admin
{
    public class UserRolesViewModel
    {
        public IdentityUser User { get; set; }
        public List<IdentityRole> Roles { get; set; }
    }
}
