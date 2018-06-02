using System;
using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(DonareSange.Startup))]
namespace DonareSange
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
            
        }


    }
}
