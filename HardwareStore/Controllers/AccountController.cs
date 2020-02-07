using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HardwareStore.Data;
using HardwareStore.Models;
using HardwareStore.ViewModels.Account;
using HardwareStore.ViewModels.Admin;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

namespace HardwareStore.Controllers
{
    public class AccountController : Controller
    {
        private readonly UserManager<IdentityUser> _userManager;
        private readonly ApplicationDbContext _context;

        public AccountController(UserManager<IdentityUser> userManager, ApplicationDbContext context)
        {
            _userManager = userManager;
            _context = context;
        }

        public IActionResult ForgotPassword()
        {
            return View();
        }

        public async Task<IActionResult> SendVerificationToken(ResetPasswordViewModel model)
        {
            var email = new EmailManager();
            var user = _context.Users.SingleOrDefault(d => d.Email == model.Email);

            if (user == null)
            {
                ModelState.AddModelError("", "Podałeś zły email");
                return View("ForgotPassword");
            }


            var token = await _userManager.GeneratePasswordResetTokenAsync(user);

            ////ZMIENIC JAK BEDZIE NA SERWERZE
            email.SendEmail(model.Email, "Resetowanie hasła", @"
               <a href='https://localhost:44338/Account/ResetPassword?email="+ user.Email +"&token=" + token + @"'>Kliknij w ten link aby kontynuować resetowanie hasła</a>
            ");

            return RedirectToAction("Index", "Home");
        }

        public async Task<IActionResult> ResetPassword(string email, string token)
        {
            var model = new ResetPasswordViewModel()
            {
                Email = email,
                Token = token
            };

            return View();
        }

        [HttpPost]
        public async Task<IActionResult> ResetPassword(ResetPasswordViewModel model)
        {
            if (model.Password != model.ConfirmPassword)
            {
                ModelState.AddModelError("", "Hasła różnią sie od siebie");
                return View();
            }

            var user = _context.Users.SingleOrDefault(d => d.Email == model.Email);

            var result = await _userManager.ResetPasswordAsync(user, model.Token, model.Password);

            if (!result.Succeeded)
            {
                ModelState.AddModelError("", result.Errors.First().Description);
                return View();
            }

            return RedirectToAction("Index", "Home");
        }
    }
}