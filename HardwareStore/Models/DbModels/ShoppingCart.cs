using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using HardwareStore.Models.ModelsConfig;
using Microsoft.AspNetCore.Identity;

namespace HardwareStore.Models.DbModels
{
    public class ShoppingCart
    {
        public int ShoppingCartId { get; set; }

        [Required(ErrorMessage = DatabaseErrorMessage.FieldRequired)]
        public string IdentityUserId { get; set; }
        public virtual IdentityUser IdentityUser { get; set; }

        [Required(ErrorMessage = DatabaseErrorMessage.FieldRequired)]
        public int ProductId { get; set; }
        public virtual Product Product { get; set; }

        [Range(1, int.MaxValue)]
        [Required(ErrorMessage = DatabaseErrorMessage.FieldRequired)]
        public int Quantity { get; set; }
    }
}
