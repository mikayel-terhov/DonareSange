﻿using System;
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
    public class DonationsController : Controller
    {
        private BloodDonationEntities2 db = new BloodDonationEntities2();

        // GET: Donations
        public ActionResult Index()
        {
            var donations = db.Donations.Include(d => d.AspNetUser).Include(d => d.Centre);
            return View(donations.ToList());
        }

        // GET: Donations/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
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

        // GET: Donations/Create
        public ActionResult Create()
        {
            ViewBag.DonorId = new SelectList(db.AspNetUsers, "Id", "Email");
            ViewBag.CentreId = new SelectList(db.Centres, "CentreId", "name");
            return View();
        }

        // POST: Donations/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "DonationId,DonorId,CentreId,date,passedTests,quantity,trombocite,plasma,globule_rosii")] Donation donation)
        {
            if (ModelState.IsValid)
            {
                db.Donations.Add(donation);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.DonorId = new SelectList(db.AspNetUsers, "Id", "Email", donation.DonorId);
            ViewBag.CentreId = new SelectList(db.Centres, "CentreId", "name", donation.CentreId);
            return View(donation);
        }

        // GET: Donations/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Donation donation = db.Donations.Find(id);
            if (donation == null)
            {
                return HttpNotFound();
            }
            ViewBag.DonorId = new SelectList(db.AspNetUsers, "Id", "Email", donation.DonorId);
            ViewBag.CentreId = new SelectList(db.Centres, "CentreId", "name", donation.CentreId);
            return View(donation);
        }

        // POST: Donations/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "DonationId,DonorId,CentreId,date,passedTests,quantity,trombocite,plasma,globule_rosii")] Donation donation)
        {
            if (ModelState.IsValid)
            {
                db.Entry(donation).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.DonorId = new SelectList(db.AspNetUsers, "Id", "Email", donation.DonorId);
            ViewBag.CentreId = new SelectList(db.Centres, "CentreId", "name", donation.CentreId);
            return View(donation);
        }

        // GET: Donations/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
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

        // POST: Donations/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Donation donation = db.Donations.Find(id);
            db.Donations.Remove(donation);
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
