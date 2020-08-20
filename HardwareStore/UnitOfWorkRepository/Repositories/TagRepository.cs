using HardwareStore.Data;
using HardwareStore.Models.DbModels;
using HardwareStore.UnitOfWorkRepository.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HardwareStore.UnitOfWorkRepository.Repositories
{
    public class TagRepository : Repository<Tag>,ITagRepository
    {
        public TagRepository(ApplicationDbContext context) : base(context){}


        public List<Tag> GetTags()
        {
            return DbContext.Tags.ToList();
        }

        public ApplicationDbContext DbContext
        {
            get { return Context as ApplicationDbContext; }
        }
    }
}
