using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HardwareStore.Models.DbModels.Enums
{
    public enum OrderStatus
    {
        Created = 1,
        InProgress = 2,
        Send = 3,
        Canceled = 4
    }
}
