using System;
using System.Collections.Generic;
using System.Reflection.Metadata.Ecma335;
using System.Text;
using HardwareStore.Models.DbModels;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace HardwareStore.Data
{
    public class ApplicationDbContext : IdentityDbContext
    {
        public DbSet<Section> Sections { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<Brand> Brands { get; set; }
        public DbSet<Image> Images { get; set; }
        public DbSet<ImageGallery> ImageGalleries { get; set; }
        public DbSet<Gallery> Galleries { get; set; }
        public DbSet<Product> Products { get; set; }
        public DbSet<Tag> Tags { get; set; }
        public DbSet<TagValue> TagValues { get; set; }
        public DbSet<ProductTags> ProductTags { get; set; }
        public DbSet<ShoppingCart> ShoppingCarts { get; set; }
        public DbSet<Address> Addresses { get; set; }
        public DbSet<Order> Orders { get; set; }
        public DbSet<OrderDetails> OrderDetails { get; set; }
        public DbSet<OrderDetailsOrder> OrderDetailsOrders { get; set; }
        public DbSet<Post> Posts { get; set; }
        public DbSet<HotShot> HotShots { get; set; }
        public DbSet<AccountHotShot> AccountHotShots { get; set; }
        public DbSet<Rating> Ratings { get; set; }

        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }


        protected override void OnModelCreating(ModelBuilder builder)
        {
            builder.Entity<ImageGallery>()
                .HasKey(c => new {c.GalleryId, c.ImageId});

            builder.Entity<ProductTags>()
                .HasKey(d => new {d.ProductId, d.TagId});

            builder.Entity<OrderDetailsOrder>()
                .HasKey(d => new {d.OrderDetailsId, d.OrderId});

            builder.Entity<AccountHotShot>()
                .HasKey(d => new { d.IdentityUserId, d.HotShotId });

            base.OnModelCreating(builder);
        }
    }
}
