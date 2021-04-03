using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;
using Microsoft.Extensions.Configuration;

namespace StayGo.Database.Context
{
    public class DesignTimeBaseContext : IDesignTimeDbContextFactory<BaseContext>
    {
        public BaseContext CreateDbContext(string[] args)
        {
            var optionsBuilder = new DbContextOptionsBuilder<BaseContext>();
            IConfigurationRoot configuration = new ConfigurationBuilder()
            .SetBasePath(AppDomain.CurrentDomain.BaseDirectory).AddJsonFile("appsettings.json") .Build(); 
            optionsBuilder.UseSqlServer(configuration.GetConnectionString("AzureSQLConnection"));

            return new BaseContext(optionsBuilder.Options);
        }
        
    }
    
    
}