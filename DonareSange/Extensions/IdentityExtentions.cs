using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Security.Principal;
using System.Web;

namespace DonareSange.Extentions
{
    public static class IdentityExtensions
    {
        public static string UserType(this IIdentity identity)
        {
            var claim = ((ClaimsIdentity)identity).FindFirst("UserType");
            // Test for null to avoid issues during local testing
            return (claim != null) ? claim.Value : String.Empty;
        }
    }
}