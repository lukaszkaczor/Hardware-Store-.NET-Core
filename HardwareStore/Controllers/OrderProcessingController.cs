using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Runtime.CompilerServices;
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
using HardwareStore.Models.ModelsConfig;

namespace HardwareStore.Controllers
{
    [Authorize(Roles = AppRole.Admin + "," + AppRole.Manager + "," + AppRole.Support)]
    public class OrderProcessingController : Controller
    {
        private readonly ApplicationDbContext _context;
        private string _userId;
        private EmailManager _emailManager;

        public OrderProcessingController(ApplicationDbContext context)
        {
            _context = context;
            _emailManager = new EmailManager();
        }

        public IActionResult Index()
        {
            _userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

            var model = _context.Orders
                .Where(d => d.EmployeeId == _userId)
                .Where(d=>d.OrderStatus != OrderStatus.Send && d.OrderStatus != OrderStatus.Cancelled);

            return View(model.ToList());
        }

        public IActionResult History()
        {
            _userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

            var model = _context.Orders
                .Where(d => d.EmployeeId == _userId)
                .Where(d => d.OrderStatus == OrderStatus.Send || d.OrderStatus == OrderStatus.Cancelled);
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
            model.OrderStatus = OrderStatus.Accepted;

            _context.SaveChanges();

            return RedirectToAction("");
        }

        public IActionResult ManageOrder(int id)
        {
            _userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

            var order = _context.Orders
                .Include(d => d.Address)
                .Include(d => d.IdentityUser)
                .Include(d => d.OrderDetailsOrder)
                .ThenInclude(d => d.OrderDetails)
                .ThenInclude(d => d.Product)
                .ThenInclude(d => d.Brand)
                .FirstOrDefault(d => d.OrderId == id);

            if (order == null) return NotFound();

            var model = new ManageOrderViewModel()
            {
                Order = order,
                OrderDetails = order.OrderDetailsOrder.Select(d => d.OrderDetails).ToList()
            };

            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult ChangeStatus(int orderDetailsId, int orderId)
        {
            var orderDetails = _context.OrderDetails.Where(d => d.OrderId == orderId);

            var detail = orderDetails.FirstOrDefault(d => d.OrderDetailsId == orderDetailsId);
            var order = _context.Orders.Include(d=>d.IdentityUser).FirstOrDefault(d => d.OrderId == orderId);
            if (detail == null || order == null) return NotFound();

            detail.IsCompleted = !detail.IsCompleted;

            _context.SaveChanges();

            if (!orderDetails.Any(d => d.IsCompleted == false))
            {
                order.OrderStatus = OrderStatus.Completed;

                _emailManager.SendEmail(order.IdentityUser.Email,
                    "Zmiana statusu zamówienia", EmailMessage.OrderCompleted);
            }
            else
            {
                order.OrderStatus = OrderStatus.Accepted;
            }

            _context.SaveChanges();

            return RedirectToAction("ManageOrder", new { id = orderId });
        }

        public IActionResult SetStatusToSend(Order order)
        {
            var orderToSet = _context.Orders.Include(d=>d.IdentityUser).FirstOrDefault(d => d.OrderId == order.OrderId);

            if (orderToSet is null)return NotFound();
            

            orderToSet.OrderStatus = OrderStatus.Send;
            _context.SaveChanges();

            _emailManager.SendEmail(orderToSet.IdentityUser.Email,
                "Zamówienie zostało wysłane", EmailMessage.Send);

            return RedirectToAction("Index");
        }

        public IActionResult Cancel(Order order)
        {
            return View(order);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult DeleteConfirmed(Order order)
        {
            var orderToCancel = _context.Orders.Include(d=>d.IdentityUser).FirstOrDefault(d => d.OrderId == order.OrderId);

            if (orderToCancel != null) orderToCancel.OrderStatus = OrderStatus.Cancelled;
            else return NotFound();

            _context.SaveChanges();

            _emailManager.SendEmail(orderToCancel.IdentityUser.Email,
                "Zamówienie zostało anulowane", EmailMessage.Cancelled);

            return RedirectToAction("Index");
        }
    }
}