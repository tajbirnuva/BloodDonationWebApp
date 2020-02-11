using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BloodDonationWebApp.DAL.Gateway;
using BloodDonationWebApp.DAL.Models;

namespace BloodDonationWebApp.BLL
{
    public class UserManager
    {
        UsersGateway aUsersGateway=new UsersGateway();

        public string SaveUsers(Users aUsers)
        {
            if (aUsersGateway.UsersExist(aUsers.Email))
            {
                return "Already Exist User";
            }
            else
            {
                int rowAffect = aUsersGateway.SaveUsers(aUsers);
                if (rowAffect > 0)
                {
                    return "Save Successful";
                }
                else
                {
                    return "Operation Fail";
                }
            }
        }



        public Users GetUsers(string userEmail)
        {
            Users aUsers = new Users();
            if(aUsersGateway.UsersExist(userEmail))
            {
               
                aUsers = aUsersGateway.GetUsers(userEmail);
                return aUsers;
            }
            else
            {
                return aUsers=null;
            }
            
        }


        public string SaveUserDetails(UserDetails aUserDetails)
        {
                int rowAffect = aUsersGateway.SaveUserDetails(aUserDetails);
                if (rowAffect > 0)
                {
                    return "Save Successful";
                }
                else
                {
                    return "Operation Fail";
                }
            }



        public UserDetails GetUserDetails(int id)
        {
            UserDetails aUserDetails = new UserDetails();
            aUserDetails = aUsersGateway.GetUserDetails(id);
            return aUserDetails;
        }




        public string UpdateUserDetails(UserDetails aUserDetails)
        {
            int rowAffect = aUsersGateway.UpdateUserDetails(aUserDetails);
            if (rowAffect > 0)
            {
                return "Save Successful";
            }
            else
            {
                return "Operation Fail";
            }
        }





    
    
    }
    }
