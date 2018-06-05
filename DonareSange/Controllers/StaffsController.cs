using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using DonareSange.Models;
using DonareSange.Models.AdditionalModelViewsA;

namespace DonareSange.Controllers
{
    [Authorize]
    public class StaffsController : Controller
    {
        //private ApplicationDbContext db = new ApplicationDbContext();
        private BloodDonationEntities2 db = new BloodDonationEntities2();

        // GET: Staffs
        public ActionResult Index()
        {
            if(Convert.ToString(Session["type"]) != "STAFF")
            {
                return Redirect("/Home");
            }
            var staffview = new StaffMemberViewModel
            {
                Donors = db.DonorPersonalDetails.AsEnumerable(),
                Donations = db.Donations.AsEnumerable(),
                BloodRequests = db.BloodRequests.AsEnumerable(),
                users = db.AspNetUsers.AsEnumerable(),
                Clinics = db.Clinics.AsEnumerable(),
                Centres = db.Centres.AsEnumerable()
            };
            return View(staffview);
        }

        // GET: Staffs/Details/5
       

        // GET: Staffs/Edit/5
        public ActionResult Edit(int id)
        {
            if (id <= 0)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Donation donation = db.Donations.Find(id);
            if (donation == null)
            {
                return HttpNotFound();
            }
            return View(donation);
        }

        // POST: Staffs/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "DonationId,quantity,trombocite,plasma,globule_rosii")] Donation donation)
        {
            if (ModelState.IsValid)
            {
                Donation d = db.Donations.Where(x => x.DonationId == donation.DonationId).Single();
                db.Entry(d).State = EntityState.Modified;
                d.trombocite = donation.trombocite;
                d.globule_rosii = donation.globule_rosii;
                d.plasma = donation.plasma;
                d.quantity = donation.quantity;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(donation);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
