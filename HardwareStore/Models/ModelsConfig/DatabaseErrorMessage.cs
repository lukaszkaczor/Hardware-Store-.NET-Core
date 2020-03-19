using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.AccessControl;
using System.Threading.Tasks;

namespace HardwareStore.Models.ModelsConfig
{
    public class DatabaseErrorMessage
    {
        public const string MinimumStringLength = "To pole powinno zawierać minimum 3 znaki.";
        public const string FieldRequired = "To pole jest wymagane.";
        public const string ImageWithThatUrlAlreadyExists = "Zdjęcie z tym Url już istnieje.";
        public const string ProductNotFound = "Produkt nie istnieje.";

    }
}
