using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HardwareStore.Data;
using HardwareStore.UnitOfWorkRepository;
using Microsoft.AspNetCore.Mvc;

namespace HardwareStore.Controllers
{
    public class TestController : Controller
    {
        //private UnitOfWork.UnitOfWork
        private readonly UnitOfWork _unitOfWork;

        public TestController(ApplicationDbContext context)
        {
            _unitOfWork = new UnitOfWork(context);
        }


        public IActionResult Index()
        {
            var model = _unitOfWork.Products.GetProduct(81);
            return View(model);
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
            _unitOfWork.Dispose();
        }
    }
}