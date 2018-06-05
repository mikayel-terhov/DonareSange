using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DonareSange.Models.AdditionalModelViewsA
{
    public class SolveRequestModel
    {
        public IEnumerable<Donation> Donations { get; set; }
        public BloodRequest BloodRequest { get; set; }
        public IEnumerable<DonorPersonalDetail> Donors { get; set; }
    }
}