using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using HardwareStore.Models.DbModels.Enums;
using HardwareStore.Models.ModelsConfig;
using Microsoft.AspNetCore.Identity;

namespace HardwareStore.Models.DbModels
{
    public class Order
    {
        public int OrderId { get; set; }

        [Required(ErrorMessage = DatabaseErrorMessage.FieldRequired)]
        public string IdentityUserId { get; set; }
        public virtual IdentityUser IdentityUser { get; set; }

        [Required(ErrorMessage = DatabaseErrorMessage.FieldRequired)]
        public DateTime OrderDate { get; set; }

        [Required(ErrorMessage = DatabaseErrorMessage.FieldRequired)]
        [DataType(DataType.Currency)]
        public double TotalPrice { get; set; }

        [Required(ErrorMessage = DatabaseErrorMessage.FieldRequired)]
        public OrderStatus OrderStatus { get; set; }

        public string TrackingNumber { get; set; }

        [Required(ErrorMessage = DatabaseErrorMessage.FieldRequired)]
        public int AddressId { get; set; }
        public Address Address { get; set; }

        public string Message { get; set; }

        [Required(ErrorMessage = DatabaseErrorMessage.FieldRequired)]
        public int ShippingMethodId { get; set; }
        public ShippingMethod ShippingMethod { get; set; }

        [Required(ErrorMessage = DatabaseErrorMessage.FieldRequired)]
        public int PayingMethodId { get; set; }
        public PayingMethod PayingMethod { get; set; }

        public virtual IdentityUser Employee { get; set; }
        public string EmployeeId { get; set; }

        public virtual ICollection<OrderDetailsOrder> OrderDetailsOrder { get; set; }
    }
}
