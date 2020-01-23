using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using HardwareStore.Models.ModelsConfig;

namespace HardwareStore.Models.DbModels
{
    public class Image
    {
        public int ImageId { get; set; }
        public string Name { get; set; }

        [Required(ErrorMessage = DatabaseErrorMessage.FieldRequired)]
        [DataType(DataType.Url)]
        public string Url { get; set; }

        public virtual ICollection<ImageGallery> ImageGalleries { get; set; }
    }
}
