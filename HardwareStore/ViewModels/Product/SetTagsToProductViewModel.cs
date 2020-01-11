using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HardwareStore.Models.DbModels;

namespace HardwareStore.ViewModels.Product
{
    public class SetTagsToProductViewModel
    {
        //public List<Tag> Tags { get; set; }
        //public List<TagValue> TagValues { get; set; }
        public int TagId { get; set; }
        public string TagName { get; set; }
        public string Value { get; set; }
        public int TagValueId { get; set; }
    }
}
