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

        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }


        protected override void OnModelCreating(ModelBuilder builder)
        {
            builder.Entity<ImageGallery>()
                .HasKey(c => new {c.GalleryId, c.ImageId});

            base.OnModelCreating(builder);
        }
    }
}
