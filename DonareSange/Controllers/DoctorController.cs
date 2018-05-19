using DonareSange.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DonareSange.Controllers
{
    public class DoctorController : Controller
    {
        List<Pacient> pacients = new List<Pacient>();
        List<Request> requests = new List<Request>();

        public ActionResult Index()
        {
            
            return View(GetRequests());
        }

        public DoctorData GetRequests()
        {
            requests.Add(new Request(1, 1, 1, State.LOW, 15, 52, 2, 100, 1));
            requests.Add(new Request(0, 2, 3, State.LOW, 15, 52, 2, 100, 1));
            requests.Add(new Request(1, 4, 7, State.LOW, 15, 52, 2, 100, 1));
            requests.Add(new Request(2, 5, 8, State.LOW, 15, 52, 2, 100, 1));
            requests.Add(new Request(3, 6, 9, State.LOW, 15, 52, 2, 100, 1));
            requests.Add(new Request(4, 7, 10, State.LOW, 15, 52, 2, 100, 1));
            requests.Add(new Request(5, 8, 11, State.LOW, 15, 52, 2, 100, 1));
            requests.Add(new Request(6, 9, 12, State.LOW, 15, 52, 2, 100, 1));


            DoctorData data = new DoctorData();
            data.requests = requests;
            data.pacients = pacients;

            return data;
        }
        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idClinica,  idCentru ,  state ,  trombocite,  globuleRosii,  plasma,  cantitate,  IDpacient")] Request request)
        //public ActionResult Create()
        {
            //if (ModelState.IsValid)
            //{
            //    requests.Add(request);
            //    return RedirectToAction("Index");
            //}
            //Console.WriteLine(request.idCentru);
            return View();
        }
    }
}