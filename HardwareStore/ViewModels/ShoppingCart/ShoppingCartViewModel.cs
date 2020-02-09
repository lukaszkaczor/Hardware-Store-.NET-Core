using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HardwareStore.Models.DbModels;
using HardwareStore.ViewModels.Product;

namespace HardwareStore.ViewModels.ShoppingCart
{
    public class ShoppingCartViewModel : ProductDetailsViewModel
    {
        public Image Image { get; set; }
        public int Quantity { get; set; }
        public string UserID { get; set; }
        public string Error { get; set; }
    }
}
