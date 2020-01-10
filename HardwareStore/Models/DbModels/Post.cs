using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using HardwareStore.Models.ModelsConfig;

namespace HardwareStore.Models.DbModels
{
    public class Post
    {
        public int PostId { get; set; }

        [Required(ErrorMessage = DatabaseErrorMessage.FieldRequired)]
        [StringLength(256, MinimumLength = 3, ErrorMessage = DatabaseErrorMessage.MinimumStringLength)]
        public string Title { get; set; }

        [Required(ErrorMessage = DatabaseErrorMessage.FieldRequired)]
        [StringLength(100000, MinimumLength = 3, ErrorMessage = DatabaseErrorMessage.MinimumStringLength)]
        public string Content { get; set; }

        [Required]
        public bool IsActive { get; set; }

        public DateTime? PublicationDate { get; set; }

        public Gallery Gallery { get; set; }
        public int? GalleryId { get; set; }
    }
}
