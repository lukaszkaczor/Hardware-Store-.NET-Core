using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using HardwareStore.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace HardwareStore.Controllers
{
    public class ProfileController : Controller
    {
        private ApplicationDbContext _context;
        private string _userId;
        public ProfileController(ApplicationDbContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            return RedirectToAction("Address");
            //return View();
        }

        public async Task<IActionResult> Address()
        {
            _userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

            var model = await _context.Addresses.FirstOrDefaultAsync(d => d.IdentityUserId == _userId);

            //return RedirectToAction(nameof(Address));
            return View(model);
        }
    }
}