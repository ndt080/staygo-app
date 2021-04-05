using System;
using System.IO;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;
using Microsoft.Extensions.Configuration;

namespace StayGo.Database.Context
{
    public class DesignTimeBaseContext : IDesignTimeDbContextFactory<BaseContext>
    {
        public BaseContext CreateDbContext(string[] args)
        {
            var settingPath = Path.GetFullPath(
                    Path.Combine(@"../StayGo.Server/web/appsettings.json")
                ); 
            var optionsBuilder = new DbContextOptionsBuilder<BaseContext>();
            IConfigurationRoot configuration = new ConfigurationBuilder()
                /*.SetBasePath(AppDomain.CurrentDomain.BaseDirectory)*/
                .AddJsonFile(settingPath) 
                .Build();
            optionsBuilder.UseSqlServer(configuration.GetConnectionString("AzureSQLConnection"));

            return new BaseContext(optionsBuilder.Options);
        }
        
    }
    
    
}