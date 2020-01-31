using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;

namespace HardwareStore.Models.DbModels
{
    public class AccountHotShot
    {
        public string IdentityUserId { get; set; }
        public virtual IdentityUser IdentityUser { get; set; }

        public string HotShotId { get; set; }
        public virtual HotShot HotShot { get; set; }
    }
}
