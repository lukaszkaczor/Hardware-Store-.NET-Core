﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using HardwareStore.Models.ModelsConfig;

namespace HardwareStore.Models.DbModels
{
    public class Product
    {
        public int ProductId { get; set; }

        [Required(ErrorMessage = DatabaseErrorMessage.FieldRequired)]
        [StringLength(256, MinimumLength = 3, ErrorMessage = DatabaseErrorMessage.MinimumStringLength)]
        public string Name { get; set; }

        [Required(ErrorMessage = DatabaseErrorMessage.FieldRequired)]
        [DataType(DataType.Currency)]
        public double Price { get; set; }

        [Required(ErrorMessage = DatabaseErrorMessage.FieldRequired)]
        public bool IsRecommended { get; set; }

        [Required(ErrorMessage = DatabaseErrorMessage.FieldRequired)]
        public int BrandId { get; set; }
        public Brand Brand { get; set; }

        public int? GalleryId { get; set; }
        public Gallery Gallery { get; set; }

        [Required(ErrorMessage = DatabaseErrorMessage.FieldRequired)]
        public int CategoryId { get; set; }
        public Category Category { get; set; }

        public bool IsActive { get; set; } = true;

        public int QuantityInStock { get; set; }

        public virtual ICollection<ProductTags> ProductTags { get; set; }
    }
}
