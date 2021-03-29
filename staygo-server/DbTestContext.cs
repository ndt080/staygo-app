using System;
using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace staygo_server
{
    
    public class DbTestContext : IdentityDbContext<IdentityUser>
    {
        public DbTestContext(DbContextOptions options): base(options){}
        public DbSet<Test> Cafe { get; set; }
        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);
            builder.Entity<Test>().HasData(new Test
            {
                Id = 1,
                Name = "Славянка",
                Address = "г. Фаниполь"
            });
        }
    }
    public class Test
    {
        [Required]
        public int Id { get; set; }
        [Required]
        [Display(Name = "Название заведения")]
        public string Name { get; set; }
        [Display(Name = "Адрес")]
        public string Address { get; set; }
    }
}