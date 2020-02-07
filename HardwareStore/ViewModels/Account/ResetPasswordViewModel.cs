using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Reflection.PortableExecutable;
using System.Threading.Tasks;

namespace HardwareStore.ViewModels.Account
{
    public class ResetPasswordViewModel
    {
        [DataType(DataType.EmailAddress)]
        public string Email { get; set; }
        public string Token { get; set; }

        [DataType(DataType.Password)]
        public string Password { get; set; }

        [DataType(DataType.Password)]
        public string ConfirmPassword { get; set; }

        public bool WrongEmail { get; set; }        

    }
}
