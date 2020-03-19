using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using HardwareStore.Data;
using HardwareStore.Models.DbModels;

namespace HardwareStore.Models
{
    public class TestModel
    {
        private ApplicationDbContext _context;

        public TestModel(ApplicationDbContext context)
        {
            _context = context;
            _context.Sections.Add(new Section() {Name = "testowa"});
            _context.SaveChanges();
            throw new NoNullAllowedException();
        }
    }
}
