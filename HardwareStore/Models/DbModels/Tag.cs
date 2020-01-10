using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using HardwareStore.Models.ModelsConfig;

namespace HardwareStore.Models.DbModels
{
    public class Tag
    {
        public int TagId { get; set; }

        [Required(ErrorMessage = DatabaseErrorMessage.FieldRequired)]
        [StringLength(100, MinimumLength = 3, ErrorMessage = DatabaseErrorMessage.MinimumStringLength)]
        public string Name { get; set; }

        public ICollection<TagValue> TagValues { get; set; }

        public virtual ICollection<ProductTags> ProductTags { get; set; }
    }
}
