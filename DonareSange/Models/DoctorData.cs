using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DonareSange.Models
{
    public class DoctorData
    {
        public IEnumerable<Request> requests;
        public IEnumerable<Pacient> pacients;
    }
}