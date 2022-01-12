using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using StayGo.Domain.Models;

namespace StayGo.Database.Context
{
    public sealed class BaseContext : DbContext
    {
        public BaseContext(IConfiguration configuration)
        {
            _configuration = configuration;
            Database.EnsureCreated();
        }
        
        public DbSet<Bar> Bars { get; set; }
        public DbSet<Customer> Customers { get; set; }

        private readonly IConfiguration _configuration;

        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);
        }

        protected override void OnConfiguring(DbContextOptionsBuilder options)
        {
            options.UseSqlite(_configuration.GetConnectionString("StayGoDB"));
        }
    }
}