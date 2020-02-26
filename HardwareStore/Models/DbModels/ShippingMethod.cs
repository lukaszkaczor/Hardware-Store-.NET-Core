using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HardwareStore.Models.DbModels
{
    public class ShippingMethod
    {
        public int ShippingMethodId { get; set; }
        public string Name { get; set; }
        public double Cost { get; set; }
        public string Icon { get; set; }

        public virtual ICollection<PayingShippingMethods> PayingShippingMethods { get; set; }
    }
}
