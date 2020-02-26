using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HardwareStore.Models.DbModels
{
    public class PayingMethod
    {
        public int PayingMethodId { get; set; }
        public string Name { get; set; }
        public double Cost { get; set; }
        public string Icon { get; set; }

        public virtual ICollection<PayingShippingMethods> PayingShippingMethods { get; set; }
    }
}
