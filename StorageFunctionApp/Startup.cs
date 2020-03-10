using System;
using System.Collections.Generic;
using System.Text;
using HardwareStore.Data;
using Microsoft.Azure.Functions.Extensions.DependencyInjection;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;

[assembly: FunctionsStartup(typeof(StorageFunctionApp.Startup))]

namespace StorageFunctionApp
{
    class Startup : FunctionsStartup
    {
        public override void Configure(IFunctionsHostBuilder builder)
        {
            builder.Services.AddDbContext<ApplicationDbContext>(options =>
                options.UseSqlServer(
                    "Server=tcp:kompex.database.windows.net,1433;Initial Catalog=ProjektInzynierski;Persist Security Info=False;User ID=racecar;Password=Ta7Vy23hDZUwkSLC;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"));
        }
    }
}
