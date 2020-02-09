using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;

namespace HardwareStore.Models.DbModels
{
    public class Rating
    {
        public int RatingId { get; set; }

        public Product Product { get; set; }
        public int ProductId { get; set; }

        public int Value { get; set; }

        public IdentityUser IdentityUser{ get; set; }
        public string IdentityUserId { get; set; }
    }
}
