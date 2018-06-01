namespace DonareSange.Migrations
{
    using DonareSange.Models;

    using System;

    using Microsoft.AspNet.Identity;
    using Microsoft.AspNet.Identity.EntityFramework;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;
    using System.Collections.Generic;

    internal sealed class Configuration : DbMigrationsConfiguration<DonareSange.Models.BloodDonationEntities2>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = false;
        }

        protected override void Seed(DonareSange.Models.BloodDonationEntities2 context)
        {
            //  This method will be called after migrating to the latest version.

            //  You can use the DbSet<T>.AddOrUpdate() helper extension method 
            //  to avoid creating duplicate seed data. E.g.
            //
            //    context.People.AddOrUpdate(
            //      p => p.FullName,
            //      new Person { FullName = "Andrew Peters" },
            //      new Person { FullName = "Brice Lambson" },
            //      new Person { FullName = "Rowan Miller" }
            //    );
            //
            //var UserManager = new UserManager<IdentityUser>(new UserStore<IdentityUser>(context));
            //List<string> ids = new List<string>();
            //for (int i = 0; i <= 10; i++)
            //    ids.Add(Guid.NewGuid().ToString());
            //var users = new AspNetUser[]
            //{
            //    new AspNetUser{ Id = ids[0],Email = "test@gmail.com", UserName = "test@gmail.com", PasswordHash =  new PasswordHasher().HashPassword("Test1!"), PhoneNumber = "5555555",userType = UserTypes.ADMIN.ToString() },
            //    new AspNetUser{ Id = ids[1],Email = "diana@gmail.com", UserName = "diana", PasswordHash =  new PasswordHasher().HashPassword("Test1!"),PhoneNumber = "5555555",userType = UserTypes.DONOR.ToString()},
            //    new AspNetUser{ Id = ids[2],Email = "alex@yahoo.com", UserName = "alex", PasswordHash =  new PasswordHasher().HashPassword("Test1!"), PhoneNumber = "5555555",userType = UserTypes.DOCTOR.ToString()},
            //    new AspNetUser{ Id = ids[3],Email = "ioan@gmail.com", UserName = "ioan", PasswordHash =  new PasswordHasher().HashPassword("Test1!"), PhoneNumber = "55555555", userType = UserTypes.DONOR.ToString()},
            //    new AspNetUser{ Id = ids[4],Email = "edward@gmail.com", UserName = "edward@gmail.com", PasswordHash =  new PasswordHasher().HashPassword("Test1!"), PhoneNumber = "5555555",userType = UserTypes.DOCTOR.ToString() },
            //    new AspNetUser{ Id = ids[5],Email = "zagan@gmail.com", UserName = "zagan@gmail.com", PasswordHash =  new PasswordHasher().HashPassword("Test1!"), PhoneNumber = "5555555",userType = UserTypes.STAFF.ToString()},
            //    new AspNetUser{ Id = ids[6],Email = "dragos@gmail.com", UserName = "dragos@gmail.com", PasswordHash =  new PasswordHasher().HashPassword("Test1!"), PhoneNumber = "5555555",userType = UserTypes.STAFF.ToString() },
            //    new AspNetUser{ Id = ids[7],Email = "codrin@gmail.com", UserName = "codrin@gmail.com", PasswordHash =  new PasswordHasher().HashPassword("Test1!"), PhoneNumber = "5555555",userType = UserTypes.DONOR.ToString() },

            //};
            //foreach (var user in users)
            //{
            //    UserManager.Create(user);
            //}

        }
    }
}
