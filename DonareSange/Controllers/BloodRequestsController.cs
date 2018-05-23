using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using DonareSange.Models;

namespace DonareSange.Controllers
{
    public class BloodRequestsController : Controller
    {
        private BloodDonationEntities1 db = new BloodDonationEntities1();

        // GET: BloodRequests
        public ActionResult Index()
        {
            var bloodRequests = db.BloodRequests.Include(b => b.Centre).Include(b => b.Clinic);
            return View(bloodRequests.ToList());
        }

        // GET: BloodRequests/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BloodRequest bloodRequest = db.BloodRequests.Find(id);
            if (bloodRequest == null)
            {
                return HttpNotFound();
            }
            return View(bloodRequest);
        }

        // GET: BloodRequests/Create
        public ActionResult Create()
        {
            ViewBag.CentreId = new SelectList(db.Centres, "CentreId", "name");
            ViewBag.ClinicId = new SelectList(db.Clinics, "ClinicId", "name");
            return View();
        }

        // POST: BloodRequests/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "BloodRequestId,ClinicId,CentreId,state,trombocite,plasma,globule_rosii,quantity,PacientCNP")] BloodRequest bloodRequest)
        {
            if (ModelState.IsValid)
            {
                db.BloodRequests.Add(bloodRequest);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CentreId = new SelectList(db.Centres, "CentreId", "name", bloodRequest.CentreId);
            ViewBag.ClinicId = new SelectList(db.Clinics, "ClinicId", "name", bloodRequest.ClinicId);
            return View(bloodRequest);
        }

        // GET: BloodRequests/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BloodRequest bloodRequest = db.BloodRequests.Find(id);
            if (bloodRequest == null)
            {
                return HttpNotFound();
            }
            ViewBag.CentreId = new SelectList(db.Centres, "CentreId", "name", bloodRequest.CentreId);
            ViewBag.ClinicId = new SelectList(db.Clinics, "ClinicId", "name", bloodRequest.ClinicId);
            return View(bloodRequest);
        }

        // POST: BloodRequests/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "BloodRequestId,ClinicId,CentreId,state,trombocite,plasma,globule_rosii,quantity,PacientCNP")] BloodRequest bloodRequest)
        {
            if (ModelState.IsValid)
            {
                db.Entry(bloodRequest).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CentreId = new SelectList(db.Centres, "CentreId", "name", bloodRequest.CentreId);
            ViewBag.ClinicId = new SelectList(db.Clinics, "ClinicId", "name", bloodRequest.ClinicId);
            return View(bloodRequest);
        }

        // GET: BloodRequests/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BloodRequest bloodRequest = db.BloodRequests.Find(id);
            if (bloodRequest == null)
            {
                return HttpNotFound();
            }
            return View(bloodRequest);
        }

        // POST: BloodRequests/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            BloodRequest bloodRequest = db.BloodRequests.Find(id);
            db.BloodRequests.Remove(bloodRequest);
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
