using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HardwareStore.Models.DbModels;

namespace HardwareStore.Models
{
    public class ShippingMethodWithTheirPayingMethods
    {
        public ShippingMethod ShippingMethod { get; set; }
        public List<PayingMethod> PayingMethods { get; set; }
    }
}
