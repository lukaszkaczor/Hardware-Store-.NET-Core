using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using HardwareStore.Models.ConfigModels;

namespace HardwareStore.Models.DbModels
{
    public class Image
    {
        public int ImageId { get; set; }
        public string Name { get; set; }

        [Required(ErrorMessage = DatabaseErrorMessage.FieldRequired)]
        public string Url { get; set; }

        public virtual ICollection<ImageGallery> ImageGalleries { get; set; }
    }
}
