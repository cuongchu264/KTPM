using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BMS.Footer;
using BMS.News;
using BMS.Service;
using BMS.Order;
using BMS.Chart;

namespace BMS.Models
{
    public class SneakerShopDbContext : DbContext
    {
        public SneakerShopDbContext(DbContextOptions options)
            : base(options)
        { }

        public DbSet<Carousel> Carousels { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<HotProduct> HotProducts { get; set; }
        public DbSet<Product> Products { get; set; }
        public DbSet<Brand> Brands { get; set; }
        public DbSet<New> News { get; set; }
        public DbSet<Founder> Founders { get; set; }
        public DbSet<NewsCategory> NewsCategories { get; set; }
        public DbSet<Cart> Carts { get; set; }
        public DbSet<CartDetail> CartDetails { get; set; }
        public DbSet<Bill> Bills { get; set; }
        public DbSet<ProductReview> ProductReviews { get; set; }
        public DbSet<User> Users { get; set; }
        public DbSet<ChartBill> Charts { get; set; }
        public DbSet<MoneyChart> MoneyCharts { get; set; }
        public DbSet<UserChart> UserCharts { get; set; }
    }
}
