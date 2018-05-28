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
    public class PersonalDetailsDoctorController : Controller
    {
        private BloodDonationEntities1 db = new BloodDonationEntities1();

        // GET: PersonalDetailsDoctor
        public ActionResult Index()
        {
            var personalDetailsDoctors = db.PersonalDetailsDoctors.Include(p => p.AspNetUser).Include(p => p.Clinic).Include(p => p.Doctor);
            return View(personalDetailsDoctors.ToList());
        }

        // GET: PersonalDetailsDoctor/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PersonalDetailsDoctor personalDetailsDoctor = db.PersonalDetailsDoctors.Find(id);
            if (personalDetailsDoctor == null)
            {
                return HttpNotFound();
            }
            return View(personalDetailsDoctor);
        }

        // GET: PersonalDetailsDoctor/Create
        public ActionResult Create()
        {
            ViewBag.DoctorId = new SelectList(db.AspNetUsers, "Id", "Email");
            ViewBag.ClinicId = new SelectList(db.Clinics, "ClinicId", "name");
            ViewBag.DoctorId = new SelectList(db.Doctors, "DoctorId", "username");
            return View();
        }

        // POST: PersonalDetailsDoctor/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "PersonalDetailsId,email,firstname,lastname,DoctorId,ClinicId")] PersonalDetailsDoctor personalDetailsDoctor)
        {
            if (ModelState.IsValid)
            {
                db.PersonalDetailsDoctors.Add(personalDetailsDoctor);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.DoctorId = new SelectList(db.AspNetUsers, "Id", "Email", personalDetailsDoctor.DoctorId);
            ViewBag.ClinicId = new SelectList(db.Clinics, "ClinicId", "name", personalDetailsDoctor.ClinicId);
            ViewBag.DoctorId = new SelectList(db.Doctors, "DoctorId", "username", personalDetailsDoctor.DoctorId);
            return View(personalDetailsDoctor);
        }

        // GET: PersonalDetailsDoctor/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PersonalDetailsDoctor personalDetailsDoctor = db.PersonalDetailsDoctors.Find(id);
            if (personalDetailsDoctor == null)
            {
                return HttpNotFound();
            }
            ViewBag.DoctorId = new SelectList(db.AspNetUsers, "Id", "Email", personalDetailsDoctor.DoctorId);
            ViewBag.ClinicId = new SelectList(db.Clinics, "ClinicId", "name", personalDetailsDoctor.ClinicId);
            ViewBag.DoctorId = new SelectList(db.Doctors, "DoctorId", "username", personalDetailsDoctor.DoctorId);
            return View(personalDetailsDoctor);
        }

        // POST: PersonalDetailsDoctor/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "PersonalDetailsId,email,firstname,lastname,DoctorId,ClinicId")] PersonalDetailsDoctor personalDetailsDoctor)
        {
            if (ModelState.IsValid)
            {
                db.Entry(personalDetailsDoctor).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.DoctorId = new SelectList(db.AspNetUsers, "Id", "Email", personalDetailsDoctor.DoctorId);
            ViewBag.ClinicId = new SelectList(db.Clinics, "ClinicId", "name", personalDetailsDoctor.ClinicId);
            ViewBag.DoctorId = new SelectList(db.Doctors, "DoctorId", "username", personalDetailsDoctor.DoctorId);
            return View(personalDetailsDoctor);
        }

        // GET: PersonalDetailsDoctor/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PersonalDetailsDoctor personalDetailsDoctor = db.PersonalDetailsDoctors.Find(id);
            if (personalDetailsDoctor == null)
            {
                return HttpNotFound();
            }
            return View(personalDetailsDoctor);
        }

        // POST: PersonalDetailsDoctor/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            PersonalDetailsDoctor personalDetailsDoctor = db.PersonalDetailsDoctors.Find(id);
            db.PersonalDetailsDoctors.Remove(personalDetailsDoctor);
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
