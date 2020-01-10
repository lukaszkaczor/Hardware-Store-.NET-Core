using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using HardwareStore.Models.ConfigModels;

namespace HardwareStore.Models.DbModels
{
    public class Section
    {
        public int SectionId { get; set; }
        
        [Required(ErrorMessage = DatabaseErrorMessage.FieldRequired)]
        [StringLength(30, MinimumLength = 3, ErrorMessage = DatabaseErrorMessage.MinimumStringLength)]
        public string Name { get; set; }

        public string Icon { get; set; }

        public ICollection<Category> Categories { get; set; }
    }
}
