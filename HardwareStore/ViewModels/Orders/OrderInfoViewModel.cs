using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HardwareStore.Models;
using HardwareStore.Models.DbModels;

namespace HardwareStore.ViewModels.Orders
{
    public class OrderInfoViewModel
    {
        public Order Order { get; set; }
        public Address Address { get; set; }
        public List<ShippingMethodWithTheirPayingMethods> ShippingMethods { get; set; }
    }
}
