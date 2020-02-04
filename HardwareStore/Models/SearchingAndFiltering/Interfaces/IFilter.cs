using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HardwareStore.Models.SearchingAndFiltering.Interfaces
{
    public interface IFilter
    {
        Object FilterModel { get; set; }
        bool IsChecked { get; set; }
    }
}
