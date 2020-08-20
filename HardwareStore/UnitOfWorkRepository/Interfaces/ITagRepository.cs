using HardwareStore.Models.DbModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HardwareStore.UnitOfWorkRepository.Interfaces
{
    public interface ITagRepository : IRepository<Tag>
    {
        List<Tag> GetTags();
    }
}
