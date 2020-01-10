using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using HardwareStore.Models.ConfigModels;

namespace HardwareStore.Models.DbModels
{
    public class Gallery
    {
        public int GalleryId { get; set; }

        [Required(ErrorMessage = DatabaseErrorMessage.FieldRequired)]
        [StringLength(100, MinimumLength = 3, ErrorMessage = DatabaseErrorMessage.MinimumStringLength)]
        public string Name { get; set; }

        public virtual ICollection<ImageGallery> ImageGalleries { get; set; }
    }
}
