//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DonareSange.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class BloodRequest
    {
        public int BloodRequestId { get; set; }
        public int ClinicId { get; set; }
        public int CentreId { get; set; }
        public string state { get; set; }
        public Nullable<double> trombocite { get; set; }
        public Nullable<double> plasma { get; set; }
        public Nullable<double> globule_rosii { get; set; }
        public Nullable<double> quantity { get; set; }
        public int PacientCNP { get; set; }
    
        public virtual Centre Centre { get; set; }
        public virtual Clinic Clinic { get; set; }
    }
}
