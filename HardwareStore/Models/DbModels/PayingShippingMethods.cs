using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;
using HardwareStore.Models.DbModels.Enums;

namespace HardwareStore.Models.DbModels
{
    public class PayingShippingMethods
    {
        [Key]
        [Column(Order = 1)]
        public int PayingMethodId { get; set; }

        [Key]
        [Column(Order = 2)]
        public int ShippingMethodId { get; set; }

        public virtual PayingMethod PayingMethod { get; set; }
        public virtual ShippingMethod ShippingMethod { get; set; }
    }
}
