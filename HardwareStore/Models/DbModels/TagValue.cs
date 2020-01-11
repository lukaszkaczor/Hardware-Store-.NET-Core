using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using HardwareStore.Models.ModelsConfig;

namespace HardwareStore.Models.DbModels
{
    public class TagValue
    {
        public int TagValueId { get; set; }

        [Required(ErrorMessage = DatabaseErrorMessage.FieldRequired)]
        public string Value { get; set; }

        [Required(ErrorMessage = DatabaseErrorMessage.FieldRequired)]
        public int TagId { get; set; }
        public Tag Tag { get; set; }

        [Required]
        public Product Product { get; set; }
        public int ProductId { get; set; }
    }
}
