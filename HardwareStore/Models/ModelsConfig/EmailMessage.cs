using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HardwareStore.Models.ModelsConfig
{
    public class EmailMessage
    {
        public const string OrderCompleted = "Wszystkie produkty z Twojego zamówienia zostały skompletowane.";
        public const string Send = "Zamówione produkty zostały wysłane.";
        public const string Cancelled = "Twoje zamówienie zostało anulowane.";
        public const string OrderCreated = "Zamówienie zostało złożone.\n Możesz sprawdzić jego status w profilu, zakładka zamówienia";
    }
}
