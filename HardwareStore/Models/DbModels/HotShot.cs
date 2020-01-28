using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace HardwareStore.Models.DbModels
{
    public class HotShot
    {
        public int HotShotId { get; set; }
        public Product Product { get; set; }
        public int ProductId { get; set; }

        [DataType(DataType.Currency)]
        public double NewPrice { get; set; }

        public int Quantity { get; set; }
        public int ItemsSold { get; set; }
        public DateTime StartDate { get; set; }
        public int DurationInHours { get; set; }
        public bool Finished { get; set; }
    }
}
