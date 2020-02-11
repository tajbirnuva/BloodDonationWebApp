using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BloodDonationWebApp.DAL.Models
{
    public class UserDetails
    {
        public string Name { get; set; }
        public int Id { get; set; }
        public string Gender { get; set; }
        public int Age { get; set; }
        public string City { get; set; }
        public string Mobile { get; set; }
        public string Status { get; set; }
        public string DonateDate { get; set; }
        public string BloodGroup{ get; set; }
    }
}