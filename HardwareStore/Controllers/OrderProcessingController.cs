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
using HardwareStore.Models.DbModels.Enums;
using HardwareStore.Models.ModelsConfig;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.CodeAnalysis.CSharp.Syntax;
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
            //NetworkCredential login;
            //SmtpClient client;
            //MailMessage message;

            //login = new NetworkCredential( "kompex.sklep@gmail.com", "4aSgSwGHbcc2WPk");
            //client = new SmtpClient("smtp.gmail.com");
            //client.Port = Convert.ToInt32("587");
            //client.EnableSsl = true;
            //client.Credentials = login;
            //message = new MailMessage()
            //{
            //    From = new MailAddress("kompex.sklep@gmail.com", "kompex.sklep@gmail.com"),
            //    Body = "ebebeb"
            //};

            //message.To.Add(new MailAddress("lukaszk9396@gmail.com"));
            //message.Subject = "ratunku";
            //message.BodyEncoding = Encoding.UTF8;
            //message.IsBodyHtml = true;
            //message.Priority = MailPriority.Normal;
            //message.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure;
            //client.SendCompleted += new SendCompletedEventHandler(SendCompletedCallback);

            //client.Send(message);
            var email = new EmailManager();
            email.SendEmail("lukaszk9396@gmail.com", "Siema", @"dzien dobey panstu kochani moi
                    <h1>elomordo</h1>
                    <br/>
                    <h2>dęczasześć</h2>
            ");


            //_userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

            //var order = _context.Orders.Where(d => d.EmployeeId == _userId)
            //    .FirstOrDefault(d => d.OrderStatus == OrderStatus.InProgress);


            return View();
        }

        private static void SendCompletedCallback(object sender, AsyncCompletedEventArgs args)
        {
            //if
        }

        [Authorize(Roles = AppRole.Admin + "," + AppRole.Manager + "," + AppRole.Support)]
        public IActionResult OrderProcessing()
        {
            var orders = _context.Orders.Where(d => d.OrderStatus == OrderStatus.Created).OrderByDescending(d => d.OrderDate).ToList();

            return View();
        }
    }
}