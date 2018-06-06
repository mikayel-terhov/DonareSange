using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DonareSange.Models.AdditionalModelViewsA
{
    public class StaffMemberViewModel
    {
        public IEnumerable<Donation> Donations { get; set; }
        public IEnumerable<BloodRequest> BloodRequests { get; set; }
        public IEnumerable<DonorPersonalDetail> Donors { get; set; }
        public IEnumerable<AspNetUser> users { get; set; }
        public IEnumerable<Clinic> Clinics { get; set; }
        public IEnumerable<Centre> Centres { get; set; }
    }
}