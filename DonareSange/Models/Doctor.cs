using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DonareSange.Models
{
    public class Doctor
    {
        private int DoctorId { get; set; }
        private string username { get; set; }
        private string password { get; set; }

        public Doctor(int id, string user, string pass)
        {
            DoctorId = id;
            username = user;
            password = pass;
        }

    }
}