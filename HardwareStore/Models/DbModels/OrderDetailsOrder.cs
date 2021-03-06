﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace HardwareStore.Models.DbModels
{
    public class OrderDetailsOrder
    {
        [Key]
        [Column(Order = 1)]
        public int OrderId { get; set; }

        [Key]
        [Column(Order = 2)]
        public int OrderDetailsId { get; set; }

        public virtual Order Order { get; set; }
        public virtual OrderDetails OrderDetails { get; set; }
    }
}
