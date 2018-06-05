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
    public class DoctorsController : Controller
    {
        private BloodDonationEntities2 db = new BloodDonationEntities2();

        // GET: Doctors
        public ActionResult Index()
        {
            DoctorViewModel dvm = new DoctorViewModel
            {
                donations = db.Donations.AsEnumerable(),
                requests = db.BloodRequests.AsEnumerable(),
                donors = db.Donors.AsEnumerable(),
                clinics = db.Clinics.AsEnumerable(),
                detailsDoctor = db.PersonalDetailsDoctors.AsEnumerable()

            };

            return View(dvm);
        }

        // GET: Doctors/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Doctor doctor = db.Doctors.Find(id);
            if (doctor == null)
            {
                return HttpNotFound();
            }
            return View(doctor);
        }

        // GET: Doctors/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Doctors/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "BloodRequestId,ClinicId,CentreId,state,trombocite,plasma,globule_rosii,quantity,PacientCNP")] BloodRequest bloodRequest)
        {
            if (ModelState.IsValid)
            {
                var detailsDoctor1 = db.PersonalDetailsDoctors.AsEnumerable().Where(x=>x.DoctorId == Convert.ToString(Session["token"])).Single().ClinicId;

                bloodRequest.ClinicId = detailsDoctor1;
                db.BloodRequests.Add(bloodRequest);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(bloodRequest);
        }

        // GET: Doctors/Edit/5
        public ActionResult Edit(int id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BloodRequest request = db.BloodRequests.Find(id);
            if (request == null)
            {
                return HttpNotFound();
            }
            return View(request);
        }

        // POST: Doctors/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(BloodRequest request)
        {
            if (ModelState.IsValid)
            {
                db.Entry(request).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(request);
        }

        // GET: Doctors/Delete/5
        public ActionResult Delete(int id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BloodRequest request = db.BloodRequests.Find(id);
            if (request == null)
            {
                return HttpNotFound();
            }
            return View(request);
        }

        // POST: Doctors/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            BloodRequest request = db.BloodRequests.Find(id);
            db.BloodRequests.Remove(request);
            db.SaveChanges();
            return RedirectToAction("Index");
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
