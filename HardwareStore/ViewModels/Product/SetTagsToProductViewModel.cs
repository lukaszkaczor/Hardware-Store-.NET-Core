using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HardwareStore.Models.DbModels;
using HardwareStore.Models.TransferModels;

namespace HardwareStore.ViewModels.Product
{
    public class SetTagsToProductViewModel
    {
        public List<TagTransferModel> TagTransferModels { get; set; }

        public int ProductId { get; set; }
        public bool IsNew { get; set; }
    }
}
