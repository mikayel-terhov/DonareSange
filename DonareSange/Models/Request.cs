using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DonareSange.Models
{
    public enum State
    {
        LOW, MEDIUM, HIGH
    }
    public class Request
    {
        public int id { get; set; }
        public int idClinica { get; set; }
        public int idCentru { get; set; }
        public State state;
        public float trombocite { get; set; }
        public float globuleRosii { get; set; }
        public float plasma { get; set; }
        public float cantitate { get; set; }
        public int IDPacient { get; set; }
        public Request()
        {

        }
        public Request(int id, int clinica, int centru , State state , float tromb, float globule, float plasma, float cant, int pacient)
        {
            this.id = id;
            this.idClinica = clinica;
            this.idCentru = centru;
            this.state = state;
            this.trombocite = tromb;
            this.globuleRosii = globule;
            this.plasma = plasma;
            this.cantitate = cant;
            this.IDPacient = pacient;
        }
    }
}