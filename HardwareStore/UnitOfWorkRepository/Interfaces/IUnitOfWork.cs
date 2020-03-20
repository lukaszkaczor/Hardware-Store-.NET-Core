using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HardwareStore.UnitOfWorkRepository.Interfaces;

namespace HardwareStore.UnitOfWorkRepository.Interfaces
{
    interface IUnitOfWork : IDisposable
    {
        //ICourseRepository Courses { get; }
        //IAuthorRepository Authors { get; }
        IProductRepository Products { get; }
        int Complete();
    }
}
