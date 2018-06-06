using DonareSange.Models;
using DonareSange.Models.AdditionalModelViewsA;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using PagedList;

namespace DonareSange.Controllers
{
    public class AdminController : Controller
    {
        private ApplicationSignInManager _signInManager;
        private ApplicationUserManager _userManager;

        public AdminController()
        {
        }

        public AdminController(ApplicationUserManager userManager, ApplicationSignInManager signInManager)
        {
            UserManager = userManager;
            SignInManager = signInManager;
        }

        public ApplicationSignInManager SignInManager
        {
            get
            {
                return _signInManager ?? HttpContext.GetOwinContext().Get<ApplicationSignInManager>();
            }
            private set
            {
                _signInManager = value;
            }
        }

        public ApplicationUserManager UserManager
        {
            get
            {
                return _userManager ?? HttpContext.GetOwinContext().GetUserManager<ApplicationUserManager>();
            }
            private set
            {
                _userManager = value;
            }
        }
        // GET: Admin
        
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> RegisterAdmin(RegisterViewModel model)
        {
            if (ModelState.IsValid)
            {
                var user = new ApplicationUser { UserName = model.Email, Email = model.Email, UserType = model.UserType.ToString() };
                var result = await UserManager.CreateAsync(user, model.Password);
                Session["type"] = user.UserType;
                Session["token"] = user.Id;
                var db = new BloodDonationEntities2();
                var users = db.AspNetUsers;
                string id = "";
                foreach (AspNetUser u in users)
                {
                    if (u.Email == model.Email)
                    {
                        id = u.Id;
                    }
                }
                if (model.UserType == UserTypes.DONOR)
                {
                    var personalDetails = new DonorPersonalDetail
                    {
                        DonorId = id,
                        email = model.Email
                    };
                    db.DonorPersonalDetails.Add(personalDetails);
                    db.SaveChanges();
                }
                else if (model.UserType == UserTypes.DOCTOR)
                {
                    var personalDetails = new PersonalDetailsDoctor
                    {
                        DoctorId = id,
                        email = model.Email
                    };
                    db.PersonalDetailsDoctors.Add(personalDetails);
                    db.SaveChanges();
                }
                else if (model.UserType == UserTypes.STAFF)
                {
                    var personalDetails = new PersonalDetailsStaffMember
                    {
                        StaffId = id,
                        email = model.Email
                    };
                    db.PersonalDetailsStaffMembers.Add(personalDetails);
                    db.SaveChanges();
                }
                if (result.Succeeded)
                {
                    await SignInManager.SignInAsync(user, isPersistent: false, rememberBrowser: false);


                    return RedirectToAction("Index", "AdminViews");
                }
                AddErrors(result);
            }

            // If we got this far, something failed, redisplay form
            return View(model);
        }
        private IEnumerable<SelectListItem> GetSelectListItems(IEnumerable<string> elements)
        {
            // Create an empty list to hold result of the operation
            var selectList = new List<SelectListItem>();

            // For each string in the 'elements' variable, create a new SelectListItem object
            // that has both its Value and Text properties set to a particular value.
            // This will result in MVC rendering each item as:
            //     <option value="State Name">State Name</option>
            foreach (var element in elements)
            {
                selectList.Add(new SelectListItem
                {
                    Value = element,
                    Text = element
                });
            }

            return selectList;
        }
        private void AddErrors(IdentityResult result)
        {
            foreach (var error in result.Errors)
            {
                ModelState.AddModelError("", error);
            }
        }
        public ActionResult Create()
        {
            ExtendedUserDTO objExpandedUserDTO = new ExtendedUserDTO();
            return View(objExpandedUserDTO);
        }
        // PUT: /Admin/Create
        
    }
}