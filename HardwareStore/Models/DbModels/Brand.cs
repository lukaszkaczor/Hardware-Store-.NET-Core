using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using HardwareStore.Models.ModelsConfig;

namespace HardwareStore.Models.DbModels
{
    public class Brand
    {
        public int BrandId { get; set; }

        [Required(ErrorMessage = DatabaseErrorMessage.FieldRequired)]
        [StringLength(30, MinimumLength = 3, ErrorMessage = DatabaseErrorMessage.MinimumStringLength)] 
        public string Name { get; set; }

        [Required(ErrorMessage = DatabaseErrorMessage.FieldRequired)]
        public int ImageId { get; set; }
        public Image Image { get; set; }
    }
}
