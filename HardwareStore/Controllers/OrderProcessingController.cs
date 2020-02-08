using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using HardwareStore.Data;
using HardwareStore.Models;
using HardwareStore.Models.DbModels;
using HardwareStore.Models.DbModels.Enums;
using HardwareStore.Models.ModelsConfig;
using HardwareStore.ViewModels.OrderProcessing;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.CodeAnalysis.CSharp.Syntax;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal;
using Microsoft.VisualBasic;

namespace HardwareStore.Controllers
{
    [Authorize(Roles = AppRole.Admin + "," + AppRole.Manager + "," + AppRole.Support)]
    public class OrderProcessingController : Controller
    {
        private readonly ApplicationDbContext _context;
        private string _userId;

        public OrderProcessingController(ApplicationDbContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            _userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

            var model = _context.Orders.Where(d => d.EmployeeId == _userId);

            return View(model.ToList());
        }

        public IActionResult AcceptOrder()
        {
            var model = _context.Orders.Include(d => d.IdentityUser).Where(d => d.EmployeeId == null);
            return View(model.ToList());
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult AcceptOrder(int orderId)
        {
            _userId = User.FindFirstValue(ClaimTypes.NameIdentifier);


            var orderList = _context.Orders
                .Include(d => d.IdentityUser)
                .Where(d => d.EmployeeId == null);


            var model = orderList.FirstOrDefault(d => d.OrderId == orderId);

            if (model == null)
            {
                ModelState.AddModelError("", "Zamówienie zostało już odebrane");
                return View(orderList.ToList());
            }

            model.EmployeeId = _userId;

            _context.SaveChanges();

            return RedirectToAction("");
        }

        public IActionResult ManageOrder(int id)
        {
            _userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

            var order = _context.Orders
                .Include(d=>d.Address)
                .Include(d=>d.IdentityUser)
                .Include(d=>d.OrderDetailsOrder)
                .ThenInclude(d=>d.OrderDetails)
                .ThenInclude(d=>d.Product)
                .ThenInclude(d=>d.Brand)
                .FirstOrDefault(d => d.OrderId == id);

            if (order==null)return NotFound();

            var model = new ManageOrderViewModel()
            {
                Order = order,
                OrderDetails = order.OrderDetailsOrder.Select(d => d.OrderDetails).ToList()
            };

            return View(model);
        }
    }
}