using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HardwareStore.Models.DbModels;

namespace HardwareStore.UnitOfWorkRepository.Interfaces
{
    public interface IProductRepository : IRepository<Product>
    {
        Product GetProduct(int id);
    }
}
