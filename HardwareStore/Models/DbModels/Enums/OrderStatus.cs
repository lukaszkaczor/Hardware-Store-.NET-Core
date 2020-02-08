using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HardwareStore.Models.DbModels.Enums
{
    public enum OrderStatus
    {
        Created = 1,
        Accepted = 2,
        Completed = 3,
        Send = 4,
        Cancelled = 5
    }
}
