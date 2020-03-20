using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HardwareStore.Data;
using HardwareStore.Models.DbModels;
using HardwareStore.UnitOfWorkRepository.Interfaces;

namespace HardwareStore.UnitOfWorkRepository.Repositories
{
    public class ProductRepository : Repository<Product>, IProductRepository
    {

        public ProductRepository(ApplicationDbContext context) : base(context)
        { }

        public Product GetProduct(int id)
        {
            return DbContext.Products.FirstOrDefault(d => d.ProductId == id);
        }

        public ApplicationDbContext DbContext
        {
            get { return Context as ApplicationDbContext;  }
        }
    }
}
