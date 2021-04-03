using StayGo.Domain.Models;
using Microsoft.EntityFrameworkCore;

namespace StayGo.Database.Context
{
    public class BaseContext: DbContext
    {
        public BaseContext(DbContextOptions<BaseContext> options) : base(options)
        {
            Database.EnsureCreated();
        }
        public DbSet<Bar> Bars { get; set; }
        public DbSet<Customer> Customers { get; set; }
        public BaseContext(){}
        
        protected override void OnModelCreating(ModelBuilder builder)
        {
            builder.Entity<Bar>().ToTable("Bar");
            builder.Entity<Bar>().HasKey(p => p.Id);
            builder.Entity<Bar>().Property(p => p.Id).ValueGeneratedOnAdd();
            builder.Entity<Bar>().Property(p => p.Id).IsRequired();
            builder.Entity<Bar>().Property(p => p.Name).IsRequired();

            builder.Entity<Customer>().ToTable("Customer");
            builder.Entity<Customer>().HasKey(p => p.Id);
            builder.Entity<Customer>().Property(p => p.Id).ValueGeneratedOnAdd();
            builder.Entity<Customer>().Property(p => p.Id).IsRequired();
            builder.Entity<Customer>().Property(p => p.Name).IsRequired();
            
            base.OnModelCreating(builder);
        }
    }
}