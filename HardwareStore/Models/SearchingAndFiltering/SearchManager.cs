using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HardwareStore.Models.DbModels;
using HardwareStore.Models.SearchingAndFiltering.Interfaces;

namespace HardwareStore.Models.SearchingAndFiltering
{
    public class SearchManager
    {
        public static List<IModel> GetFilters<T>(string text, IList<T> modelList) where T : IModel
        {
            if (String.IsNullOrWhiteSpace(text)) throw new ArgumentNullException();
            
            var filteredText = text.Split(',').ToList();
            var fbList = new List<IModel>();

            foreach (var item in filteredText)
            {
                fbList.Add(modelList.FirstOrDefault(d => d.Id.ToString() == item));
            }

            return fbList;
        }
    }
}
