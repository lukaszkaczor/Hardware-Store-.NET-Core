using System;
using System.Collections.Generic;
using System.Text;
using HardwareStore.Models.DbModels;
using HardwareStore.Models.SearchingAndFiltering;
using NUnit.Framework;

namespace HardwareStoreTests.Models.SearchingAndFiltering
{
    [TestFixture]
    public class SearchManagerTests
    {
        [Test]
        public void GetFilters()
        {
            var list = new List<Brand>();
            list.Add(new Brand()
            {
                BrandId = 1,
                Id = 1,
                ImageId = 33,
                Name = "apple"
            });

            list.Add(new Brand()
            {
                BrandId = 2,
                Id = 2,
                ImageId = 333,
                Name = "microsoft"
            });

            list.Add(new Brand()
            {
                BrandId = 3,
                Id = 3,
                ImageId = 32333,
                Name = "logitech"
            });
            string text = null;

            var result = SearchManager.GetFilters(text, list);

            
            //Assert.Throws(Is.InstanceOf<ArgumentNullException>(), SearchManager.GetFilters(text, list))
        }
    }
}
