using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace DonareSange.Models
{
    public class AspNetUsersController : Controller
    {
        private BloodDonationEntities2 bd = new BloodDonationEntities2();
        

        // GET: AspNetUsers
        public ActionResult Index()
        {
            
            return View(bd.AspNetUsers.AsEnumerable());
        }

        // GET: AspNetUsers/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AspNetUser AspNetUser = bd.AspNetUsers.Find(id);
            if (AspNetUser == null)
            {
                return HttpNotFound();
            }
            return View(AspNetUser);
        }

        // GET: AspNetUsers/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: AspNetUsers/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,username,userType,password")] AspNetUser AspNetUser)
        {
            
            if (ModelState.IsValid)
            {
                string id = Guid.NewGuid().ToString();
                AspNetUser.Id = id;
                bd.AspNetUsers.Add(AspNetUser);
                bd.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(AspNetUser);
        }

        // GET: AspNetUsers/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AspNetUser AspNetUser = bd.AspNetUsers.Find(id);
            if (AspNetUser == null)
            {
                return HttpNotFound();
            }
            return View(AspNetUser);
        }

        // POST: AspNetUsers/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,username,password")] AspNetUser AspNetUser)
        {
            if (ModelState.IsValid)
            {
                bd.Entry(AspNetUser).State = EntityState.Modified;
                bd.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(AspNetUser);
        }

        // GET: AspNetUsers/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AspNetUser AspNetUser = bd.AspNetUsers.Find(id);
            if (AspNetUser == null)
            {
                return HttpNotFound();
            }
            return View(AspNetUser);
        }

        // POST: AspNetUsers/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            AspNetUser AspNetUser = bd.AspNetUsers.Find(id);
            bd.AspNetUsers.Remove(AspNetUser);
            bd.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                bd.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
