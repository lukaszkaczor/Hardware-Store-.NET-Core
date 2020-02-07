using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace HardwareStore.ViewModels.OrderProcessing
{
    public class OrderProcessingViewModel
    {
        public bool HasActiveOrder { get; set; }
    }
}
