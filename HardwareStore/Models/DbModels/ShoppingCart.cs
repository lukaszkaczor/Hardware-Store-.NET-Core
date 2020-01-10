using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;

namespace HardwareStore.Models.DbModels
{
    public class ShoppingCart
    {
        public int ShoppingCartId { get; set; }

        //[NotMapped]
        //[ForeignKey("ApplicationUserId")]
        public virtual IdentityUser ApplicationUser { get; set; }
        public string ApplicationUserId { get; set; }
        //public Userid NAME { get; set; }



        public virtual Product Product { get; set; }
        public int ProductId { get; set; }

        [Range(1, int.MaxValue)]
        public int Count { get; set; }
    }
}
