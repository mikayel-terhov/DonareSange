using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DonareSange.Models.AdditionalModelViewsA
{
    public class DoctorViewModel
    {
        public IEnumerable<Donation> donations { get; set; }
        public IEnumerable<BloodRequest> requests { get; set; }
        public IEnumerable<Donor> donors { get; set; }
        public IEnumerable<Clinic> clinics { get; set; }
        public IEnumerable<PersonalDetailsDoctor> detailsDoctor { get; set; }

    }
}