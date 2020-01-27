using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using HardwareStore.Models.ModelsConfig;
using Microsoft.AspNetCore.Identity;

namespace HardwareStore.Models.DbModels
{
    public class Address
    {
        public int AddressId { get; set; }

        //[RegularExpression(@"^[a-zA-Z''-'\s]{1,50}$")]
        [Required(ErrorMessage = DatabaseErrorMessage.FieldRequired)]
        [Display(Name = "Imię i nazwisko")]
        public string CustomerName { get; set; }

        //[RegularExpression(@"^[a-zA-Z''-'\s]{1,50}$")]
        [Required(ErrorMessage = DatabaseErrorMessage.FieldRequired)]
        [Display(Name = "Miejscowość")]
        public string City { get; set; }

        [Required(ErrorMessage = DatabaseErrorMessage.FieldRequired)]
        [Display(Name = "Adres")]
        public string AddressLine { get; set; }

        //[RegularExpression(@"/\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/")]
        [Required(ErrorMessage = DatabaseErrorMessage.FieldRequired)]
        [Display(Name = "Numer Telefonu")]
        public string PhoneNumber { get; set; }

        //[RegularExpression(@"[0-9]{2}-[0-9]{3}")]
        [Required(ErrorMessage = DatabaseErrorMessage.FieldRequired)]
        [Display(Name = "Kod pocztowy")]
        public string ZipCode { get; set; }

        [Required(ErrorMessage = DatabaseErrorMessage.FieldRequired)]
        public string IdentityUserId { get; set; }
        public virtual IdentityUser IdentityUser { get; set; }

        //public List<Order> Orders { get; set; }
    }
}
