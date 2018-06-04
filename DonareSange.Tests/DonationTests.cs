using Microsoft.VisualStudio.TestTools.UnitTesting;
using DonareSange.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DonareSange.Models.Tests
{
    [TestClass()]
    public class DonationTests
    {   
        [TestMethod()]
        public void DonationTest()
        {
            var don = new Donation();
            List<Donation> donations=new List<Donation>();
            List<string> ids = new List<string>();
            for (int i = 0; i <= 1000; i++)
               ids.Add(Guid.NewGuid().ToString());
            for (int i=0; i < 1000; i++)
            {
                DateTime date = new DateTime();
                var d = new Donation();
                d.CentreId = i;
                d.date = DateTime.Now;
                d.DonationId = i;
                d.DonorId = ids[i];
                d.is_able_to_donate = true;
                d.passedTests = true;
                d.specific_pacient_cnp = null;
                d.quantity = Convert.ToDouble(i);
                d.CentreId = i;
                
                donations.Add(d);
                
            }
            foreach(Donation d in donations){
                Assert.IsNotNull(d);
            }
        }
    }
}