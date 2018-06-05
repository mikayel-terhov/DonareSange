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
            if (Convert.ToString(Session["type"]) != "STAFF")
            {
                return Redirect("/Home");
            }
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
            if (Convert.ToString(Session["type"]) != "STAFF")
            {
                return Redirect("/Home");
            }
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

        [AllowAnonymous]
        public ActionResult SolveRequest(int? id)
        {
            if (Convert.ToString(Session["type"]) != "STAFF")
            {
                return Redirect("/Home");
            }
            if (id != null)
            {
                SolveRequestModel srm = new SolveRequestModel
                {
                    BloodRequest = db.BloodRequests.Find(id),
                    Donations = db.Donations.AsEnumerable(),
                    Donors = db.DonorPersonalDetails.AsEnumerable()
                };
                return View(srm);
            }
            return View("Index");
        }


        [AllowAnonymous]
        public ActionResult Adauga(int? idRequest, int? idDonatie)
        {
            if(Convert.ToString(Session["type"]) != "STAFF")
            {
                return Redirect("/Home");
            }
            if(idRequest == null || idDonatie == null)
            {
                return View("Index");
            }
            Donation donation = db.Donations.Find(idDonatie);
            BloodRequest br = db.BloodRequests.Find(idRequest);
            if(donation.trombocite >= br.trombocite)
            {
                donation.trombocite = donation.trombocite - br.trombocite;
                br.trombocite = 0;

            }
            else
            {
                br.trombocite = br.trombocite - donation.trombocite;
                donation.trombocite = 0;
            }

            if (donation.plasma >= br.plasma)
            {
                donation.plasma = donation.plasma - br.plasma;
                br.plasma = 0;
            }
            else
            {
                br.plasma = br.plasma - donation.plasma;
                donation.plasma = 0;
            }

            if (donation.globule_rosii >= br.globule_rosii)
            {
                donation.globule_rosii = donation.globule_rosii - br.globule_rosii;
                br.globule_rosii = 0;
            }
            else
            {
                br.globule_rosii = br.globule_rosii - donation.globule_rosii;
                donation.globule_rosii = 0;
            }

            if(br.globule_rosii == 0 && br.plasma == 0 && br.trombocite == 0)
            {
                br.state = "" + br.state.Split('-')[0] + "-FULFILLED";
            }

            db.Entry(donation).State = EntityState.Modified;
            db.SaveChanges();

            db.Entry(br).State = EntityState.Modified;
            db.SaveChanges();

       
            return RedirectToAction("SolveRequest",new { id = br.BloodRequestId});

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
