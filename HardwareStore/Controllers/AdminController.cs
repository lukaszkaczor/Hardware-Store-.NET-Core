using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading;
using System.Threading.Tasks;
using HardwareStore.Areas.Identity.Pages.Account;
using HardwareStore.Data;
using HardwareStore.Models;
using HardwareStore.Models.DbModels.Enums;
using HardwareStore.Models.ModelsConfig;
using HardwareStore.ViewModels.Admin;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyModel.Resolution;

namespace HardwareStore.Controllers
{
    [Authorize(Roles = AppRole.Admin)]
    public class AdminController : Controller
    {
        private RoleManager<IdentityRole> _roleManager;
        private UserManager<IdentityUser> _userManager;
        private ApplicationDbContext _context;

        public AdminController(RoleManager<IdentityRole> roleManager, ApplicationDbContext context, UserManager<IdentityUser> userManager)
        {
            _roleManager = roleManager;
            _context = context;
            _userManager = userManager;
        }


        public IActionResult Index()
        {
            return View();
        }


        public async Task<IActionResult> StaffList()
        {
            var allRoles = await _context.Roles.ToListAsync();
            var allUsers = await _context.Users.ToListAsync();
            var userRoles = await _context.UserRoles.ToListAsync();
            var model = new List<StaffListViewModel>();

            foreach (var role in allRoles)
            {
                var userList =
                    from user in allUsers
                    join userRole in userRoles on user.Id equals userRole.UserId
                    where userRole.RoleId == role.Id
                    select user;

                var identityUsers = userList.ToList();

                model.Add(new StaffListViewModel()
                {
                    Role = role,
                    Users = identityUsers
                });
            }

            return View(model);
        }

        public async Task<IActionResult> AssignRoleToUser(string id)
        {

            var model = new AssignRoleToUserViewModel()
            {
                IdentityRoles = await _roleManager.Roles.ToListAsync(),
            };

            if (!String.IsNullOrEmpty(id))
            {
                var user = await _context.Users.FirstOrDefaultAsync(d => d.Id == id);
                if (user != null) model.ConfirmEmail = model.Email = user.Email;
            }

            return View(model);
        }


        [HttpPost]
        public async Task<IActionResult> AssignRoleToUser(AssignRoleToUserViewModel model)
        {
            if (!model.Email.Equals(model.ConfirmEmail))
            {
                return View(model);
            }

            var user = await _userManager.FindByEmailAsync(model.Email);
            var role = await _roleManager.FindByIdAsync(model.Role.Id);

            if (role is null || user is null) return NotFound();

            await _userManager.AddToRoleAsync(user, role.NormalizedName);
            //var result = await _userManager.AddToRoleAsync()
            return View(nameof(Index));
        }

        public IActionResult Edit(string id)
        {
            var user = _context.Users.FirstOrDefault(d => d.Id == id);

            var roles =
                from role in _context.Roles
                join userRoles in _context.UserRoles on role.Id equals userRoles.RoleId
                where userRoles.UserId == user.Id
                select role;

            var model = new UserRolesViewModel()
            {
                User = user,
                Roles = roles.ToList()
            };

            return View(model);
        }

        public ActionResult DeleteRoleFromUser(string roleId, string userId)
        {
            var roleToDelete = _context.UserRoles.Where(d => d.UserId == userId)
                .FirstOrDefault(d => d.RoleId == roleId);

            _context.UserRoles.Remove(roleToDelete ?? throw new InvalidOperationException());
            _context.SaveChanges();

            return RedirectToAction("Edit", new {id = userId});
        }

        public async Task<ActionResult> AddRole(string name)
        {
            await _roleManager.CreateAsync(new IdentityRole()
            {
                Name = name,
                NormalizedName = name.ToUpper()
            });

            return RedirectToAction("Index");
        }

        //public async Task<IActionResult> ResetPassword()
        //{
        //    var token = await _userManager.GeneratePasswordResetTokenAsync(_context.Users.SingleOrDefault(d => d.Email == "test@test.pl"));
        //    var user = _context.Users.SingleOrDefault(d => d.Email == "test@test.pl");

        //    //var token = "CfDJ8KR4g8VxvHdMixLRI64IJ3VZUK9XQuFYgzmXKWX/v/ssb07laPYUsR/MIjr1SP2kusg8/sa6CnD9+/J8vjBbD+QxryPSWKz1nr8YLwVzf/Q+bd2t6XY/wtkiQUaQsz6h1pKUP+aVMnoo0x3mOHZLKRhtHpoZWEw4KdqqipWwrYJC8WhP9JOEuumVdoWCtgsMAG30wT5Seztss5jkK/Fg3MMXTU/EReJ5ZASC5CUrOqMQ\r\n";

        //    var ss = new EmailManager();
        //    //ss.SendEmail("lukaszk9396@gmail.com", "t", token);
        //    //_context.UserTokens.Add(new IdentityUserToken<string>()
        //    //{
        //    //});
        //    //await _userManager.ResetPasswordAsync(user, token, "creative2");
        //    //_context.UserTokens.Add(new IdentityUserToken<string>()
        //    //{
        //    //    LoginProvider = token,
        //    //    UserId = user.Id,
        //    //    Value = token,
        //    //    Name = token
        //    //});
        //    _context.SaveChanges();

        //    return RedirectToAction("Index");
        //}



    }
}