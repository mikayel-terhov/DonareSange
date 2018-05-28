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
    public class PersonalDetailsStaffMemberController : Controller
    {
        private BloodDonationEntities1 db = new BloodDonationEntities1();

        // GET: PersonalDetailsStaffMember
        public ActionResult Index()
        {
            var personalDetailsStaffMembers = db.PersonalDetailsStaffMembers.Include(p => p.AspNetUser).Include(p => p.Centre).Include(p => p.Staff);
            return View(personalDetailsStaffMembers.ToList());
        }

        // GET: PersonalDetailsStaffMember/Details/5
        public ActionResult Details(decimal id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PersonalDetailsStaffMember personalDetailsStaffMember = db.PersonalDetailsStaffMembers.Find(id);
            if (personalDetailsStaffMember == null)
            {
                return HttpNotFound();
            }
            return View(personalDetailsStaffMember);
        }

        // GET: PersonalDetailsStaffMember/Create
        public ActionResult Create()
        {
            ViewBag.StaffId = new SelectList(db.AspNetUsers, "Id", "Email");
            ViewBag.CentreId = new SelectList(db.Centres, "CentreId", "name");
            ViewBag.StaffId = new SelectList(db.Staffs, "StaffId", "username");
            return View();
        }

        // POST: PersonalDetailsStaffMember/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "PersonalDetailsId,email,firstname,lastname,StaffId,CentreId")] PersonalDetailsStaffMember personalDetailsStaffMember)
        {
            if (ModelState.IsValid)
            {
                db.PersonalDetailsStaffMembers.Add(personalDetailsStaffMember);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.StaffId = new SelectList(db.AspNetUsers, "Id", "Email", personalDetailsStaffMember.StaffId);
            ViewBag.CentreId = new SelectList(db.Centres, "CentreId", "name", personalDetailsStaffMember.CentreId);
            ViewBag.StaffId = new SelectList(db.Staffs, "StaffId", "username", personalDetailsStaffMember.StaffId);
            return View(personalDetailsStaffMember);
        }

        // GET: PersonalDetailsStaffMember/Edit/5
        public ActionResult Edit(decimal id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PersonalDetailsStaffMember personalDetailsStaffMember = db.PersonalDetailsStaffMembers.Find(id);
            if (personalDetailsStaffMember == null)
            {
                return HttpNotFound();
            }
            ViewBag.StaffId = new SelectList(db.AspNetUsers, "Id", "Email", personalDetailsStaffMember.StaffId);
            ViewBag.CentreId = new SelectList(db.Centres, "CentreId", "name", personalDetailsStaffMember.CentreId);
            ViewBag.StaffId = new SelectList(db.Staffs, "StaffId", "username", personalDetailsStaffMember.StaffId);
            return View(personalDetailsStaffMember);
        }

        // POST: PersonalDetailsStaffMember/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "PersonalDetailsId,email,firstname,lastname,StaffId,CentreId")] PersonalDetailsStaffMember personalDetailsStaffMember)
        {
            if (ModelState.IsValid)
            {
                db.Entry(personalDetailsStaffMember).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.StaffId = new SelectList(db.AspNetUsers, "Id", "Email", personalDetailsStaffMember.StaffId);
            ViewBag.CentreId = new SelectList(db.Centres, "CentreId", "name", personalDetailsStaffMember.CentreId);
            ViewBag.StaffId = new SelectList(db.Staffs, "StaffId", "username", personalDetailsStaffMember.StaffId);
            return View(personalDetailsStaffMember);
        }

        // GET: PersonalDetailsStaffMember/Delete/5
        public ActionResult Delete(decimal id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PersonalDetailsStaffMember personalDetailsStaffMember = db.PersonalDetailsStaffMembers.Find(id);
            if (personalDetailsStaffMember == null)
            {
                return HttpNotFound();
            }
            return View(personalDetailsStaffMember);
        }

        // POST: PersonalDetailsStaffMember/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(decimal id)
        {
            PersonalDetailsStaffMember personalDetailsStaffMember = db.PersonalDetailsStaffMembers.Find(id);
            db.PersonalDetailsStaffMembers.Remove(personalDetailsStaffMember);
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
