using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;
using HardwareStore.Models.ConfigModels;

namespace HardwareStore.Models.DbModels
{
    public class ImageGallery
    {
        [Key]
        [Column(Order = 1)]
        [Required(ErrorMessage = DatabaseErrorMessage.FieldRequired)]
        public int GalleryId { get; set; }

        [Key]
        [Column(Order = 2)]
        [Required(ErrorMessage = DatabaseErrorMessage.FieldRequired)]
        public int ImageId { get; set; }

        public int? Order { get; set; }

        public virtual Gallery Gallery { get; set; }
        public virtual Image Image { get; set; }
    }
}
