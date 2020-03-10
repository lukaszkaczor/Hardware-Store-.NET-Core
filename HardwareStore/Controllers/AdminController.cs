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
        //private UserManager<IdentityUser> _userManager;
        private ApplicationDbContext _context;

        public AdminController(ApplicationDbContext context/*, UserManager<IdentityUser> userManager*/)
        {
            //_roleManager = roleManager;
            _context = context;
            //_userManager = userManager;
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
                IdentityRoles = await _context.Roles.ToListAsync()
                //IdentityRoles = await _roleManager.Roles.ToListAsync(),
            };

            if (!String.IsNullOrEmpty(id))
            {
                var user = await _context.Users.FirstOrDefaultAsync(d => d.Id == id);
                if (user != null) model.ConfirmEmail = model.Email = user.Email;
            }

            return View(model);
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> AssignRoleToUser(AssignRoleToUserViewModel model)
        {
            if (!model.Email.Equals(model.ConfirmEmail))
            {
                return View(model);
            }

            var user = await _context.Users.FirstOrDefaultAsync(d=>d.Email == model.Email);

            //var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            //var role = await _roleManager.FindByIdAsync(model.Role.Id);
            var role = await _context.Roles.FirstOrDefaultAsync(d=>d.Id == model.Role.Id);


            if (role is null || user is null) return NotFound();

            //await _userManager.AddToRoleAsync(user, role.NormalizedName);
            _context.UserRoles.Add(new IdentityUserRole<string>()
            {
                RoleId = role.Id,
                UserId = user.Id
            });

            await _context.SaveChangesAsync();
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

        [HttpPost]
        [ValidateAntiForgeryToken]
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
            _context.Roles.Add(new IdentityRole()
            {
                Name = name,
                NormalizedName = name.ToUpper()
            });
            await _context.SaveChangesAsync();
            //await _roleManager.CreateAsync(new IdentityRole()
            //{
            //    Name = name,
            //    NormalizedName = name.ToUpper()
            //});

            return RedirectToAction("Index");
        }
    }
}