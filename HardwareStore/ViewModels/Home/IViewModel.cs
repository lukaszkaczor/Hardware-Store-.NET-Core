using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HardwareStore.Models.DbModels;

namespace HardwareStore.ViewModels.Home
{
    interface IViewModel
    {
        IEnumerable<Section> AllSections { get; set; }
        //IEnumerable<Section> /*AllSections */{ get; set; }


    }
}
