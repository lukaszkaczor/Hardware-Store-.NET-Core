using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HardwareStore.Models.TransferModels
{
    public class TagTransferModel
    {
        public int TagId { get; set; }
        public string TagName { get; set; }
        public string Value { get; set; }
        public int TagValueId { get; set; }
    }
}
