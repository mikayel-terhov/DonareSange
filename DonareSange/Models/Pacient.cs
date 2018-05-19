using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DonareSange.Models
{
    public class Pacient
    {
        private int IDPacient { get; set; }
        private int IDSpital { get; set; }
        private string nume { get; set; }
        private string prenume { get; set; }

        public Pacient(int idP, int idS, string nume, string prenume)
        {
            IDPacient = idP;
            IDSpital = idS;
            this.nume = nume;
            this.prenume = prenume;
        }
    }
}