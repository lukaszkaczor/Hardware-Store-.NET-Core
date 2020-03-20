using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HardwareStore.Controllers;
using HardwareStore.Data;
using HardwareStore.UnitOfWorkRepository.Interfaces;
using HardwareStore.UnitOfWorkRepository.Repositories;

namespace HardwareStore.UnitOfWorkRepository
{
    public class UnitOfWork : IUnitOfWork
    {
        private readonly ApplicationDbContext _context;

        public UnitOfWork(ApplicationDbContext context)
        {
            _context = context;
            Products = new ProductRepository(_context);
        }


        public void Dispose()
        {
            _context.Dispose();
        }


        public IProductRepository Products { get; }

        public int Complete()
        {
            return _context.SaveChanges();
        }
    }
}
