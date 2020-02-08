using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HardwareStore.Models.DbModels;

namespace HardwareStore.ViewModels.OrderProcessing
{
    public class ManageOrderViewModel
    {
        public Order Order { get; set; }    
        public List<OrderDetails> OrderDetails { get; set; }
    }
}
