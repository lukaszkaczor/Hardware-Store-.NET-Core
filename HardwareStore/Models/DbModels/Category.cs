﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;
using HardwareStore.Models.ModelsConfig;
using HardwareStore.Models.SearchingAndFiltering.Interfaces;

namespace HardwareStore.Models.DbModels
{
    public class Category : IModel
    {
        public int CategoryId { get; set; }

        [Required(ErrorMessage = DatabaseErrorMessage.FieldRequired)]
        [StringLength(30, MinimumLength = 3, ErrorMessage = DatabaseErrorMessage.MinimumStringLength)]
        public string Name { get; set; }

        [Required(ErrorMessage = DatabaseErrorMessage.FieldRequired)]
        public int SectionId { get; set; }
        public Section Section { get; set; }

        [NotMapped]
        public int Id
        {
            get => CategoryId;
            set
            {
                if (value <= 0) throw new ArgumentOutOfRangeException(nameof(value));
                Id = CategoryId;
            }
        }
    }
}
