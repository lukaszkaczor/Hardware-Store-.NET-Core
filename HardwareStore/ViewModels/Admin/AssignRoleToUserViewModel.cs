using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;

namespace HardwareStore.ViewModels.Admin
{
    public class AssignRoleToUserViewModel
    {
        public List<IdentityRole> IdentityRoles { get; set; }
        public IdentityRole Role { get; set; }
        public string Email { get; set; }
        public string ConfirmEmail { get; set; }
    }
}
