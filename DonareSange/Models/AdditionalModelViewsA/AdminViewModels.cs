using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace DonareSange.Models.AdditionalModelViewsA
{
    public class ClinicViewModelAdmin
    {
        public int ClinicViewModelAdminId { get; set; }
        public int ClinicId { get; set; }
        public string Name { get; set; }
        public string Contact { get; set; }
        public Nullable<int> AddressId { get; set; }
        public string Country { get; set; }
        public string City { get; set; }
        public string StreetName { get; set; }
        public Nullable<int> StrNumber { get; set; }
        public Nullable<double> latitude { get; set; }
        public Nullable<double> longitude { get; set; }

    }
    public class ExtendedUserDTO
    {
        [Key]
        public string Id { get; set; }
        public string Email { get; set; }
        public string PasswordHash { get; set; }
        public string PhoneNumber { get; set; }
        public string UserType { get; set; }
        public string UserName { get; set; }
    }
}