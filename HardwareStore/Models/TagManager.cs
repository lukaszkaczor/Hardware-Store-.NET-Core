using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HardwareStore.Data;
using HardwareStore.Models.DbModels;
using Microsoft.EntityFrameworkCore;

namespace HardwareStore.Models
{
    public class TagManager
    {

        public static async Task<List<TagNameWithValue>> GetTagNameWithValues(ApplicationDbContext context, Product product)
        {
            var tags = await GetTagsForProduct(context, product.ProductId);

            var valuesList = await GetValuesForProduct(context, product.ProductId);

            var tagValues = new List<TagNameWithValue>();
            for (int i = 0; i < tags.Count; i++)
            {
                tagValues.Add(new TagNameWithValue()
                {
                    Name = tags.ToList()[i].Name,
                    Value = valuesList.ToList()[i].Value
                });
            }

            return tagValues;
        }

        public static async Task<List<Tag>> GetTagsForProduct(ApplicationDbContext context, int productId)
        {
            var tags =
                from tag in context.Tags
                join values in context.TagValues on tag.TagId equals values.TagId
                join productTags in context.Products on values.ProductId equals productTags.ProductId
                where productTags.ProductId == productId
                orderby tag.TagId
                select tag;

            return await tags.ToListAsync();
        }

        public static async Task<List<TagValue>> GetValuesForProduct(ApplicationDbContext _context, int productId)
        {
            var valuesList = from tag in _context.Tags
                join values in _context.TagValues on tag.TagId equals values.TagId
                join productTags in _context.Products on values.ProductId equals productTags.ProductId
                where productTags.ProductId == productId
                orderby tag.TagId
                select values;

            return await valuesList.ToListAsync();
        }

    }
}
