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
    public class CentresController : Controller
    {
        private BloodDonationEntities2 db = new BloodDonationEntities2();

        // GET: Centres
        public ActionResult Index()
        {
            var centres = db.Centres.Include(c => c.Address);
            return View(centres.ToList());
        }

        // GET: Centres/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Centre centre = db.Centres.Find(id);
            if (centre == null)
            {
                return HttpNotFound();
            }
            return View(centre);
        }

        // GET: Centres/Create
        public ActionResult Create()
        {
            ViewBag.addressId = new SelectList(db.Addresses, "AdressId", "Country");
            return View();
        }

        // POST: Centres/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "CentreId,name,contact,addressId")] Centre centre)
        {
            if (ModelState.IsValid)
            {
                db.Centres.Add(centre);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.addressId = new SelectList(db.Addresses, "AdressId", "Country", centre.addressId);
            return View(centre);
        }

        // GET: Centres/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Centre centre = db.Centres.Find(id);
            if (centre == null)
            {
                return HttpNotFound();
            }
            ViewBag.addressId = new SelectList(db.Addresses, "AdressId", "Country", centre.addressId);
            return View(centre);
        }

        // POST: Centres/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "CentreId,name,contact,addressId")] Centre centre)
        {
            if (ModelState.IsValid)
            {
                db.Entry(centre).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.addressId = new SelectList(db.Addresses, "AdressId", "Country", centre.addressId);
            return View(centre);
        }

        // GET: Centres/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Centre centre = db.Centres.Find(id);
            if (centre == null)
            {
                return HttpNotFound();
            }
            return View(centre);
        }

        // POST: Centres/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Centre centre = db.Centres.Find(id);
            db.Centres.Remove(centre);
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
