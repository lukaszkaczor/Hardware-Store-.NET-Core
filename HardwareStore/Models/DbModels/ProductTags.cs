using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace HardwareStore.Models.DbModels
{
    public class ProductTags
    {
        [Key]
        [Column(Order = 1)]
        public int TagId { get; set; }
        [Key]
        [Column(Order = 2)]
        public int ProductId { get; set; }

        public virtual Tag Tag { get; set; }
        public virtual Product Product { get; set; }
    }
}
