using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HardwareStore.Models.ModelsConfig
{
    public class AppErrorMessage
    {
        public const string SaleHasEnded = "Zakup nieudany - promocja została zakończona.";
        public const string HotShotAlreadyBought = "Na promocji można kupić maksymalnie jedną sztukę";
        public const string ProductsDeletedFormCart = "Niektóre przedmioty nie są już dostępne w sprzedaży i zostały z niego usunięte";
    }
}
