using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using BloodDonationWebApp.DAL.Models;

namespace BloodDonationWebApp.DAL.Gateway
{
    public class UsersGateway:BaseGateway
    {
        public bool UsersExist(string email)
        {
            string query = "SELECT * FROM Users WHERE Email=@Email";
            Command = new SqlCommand(query, Connection);
            Command.Parameters.AddWithValue("@Email", email);

            Connection.Open();
            Reader = Command.ExecuteReader();
            bool exist = Reader.HasRows;
            Connection.Close();

            return exist;
        }


        public int SaveUsers(Users aUsers)
        {
            string query = "INSERT INTO Users(Name,Email,Password) VALUES (@Name,@Email,@Password)";
            Command = new SqlCommand(query, Connection);
            Command.Parameters.AddWithValue("@Name", aUsers.Name);
            Command.Parameters.AddWithValue("@Email", aUsers.Email);
            Command.Parameters.AddWithValue("@Password", aUsers.Password);


            Connection.Open();
            int rawAffect = Command.ExecuteNonQuery();
            Connection.Close();

            return rawAffect;
        }




         public Users GetUsers(string userEmail)
        {

            string query = "SELECT * From Users WHERE Email=@userEmail";
            Command = new SqlCommand(query, Connection);
            Command.Parameters.AddWithValue("@userEmail", userEmail);
            
            Connection.Open();
            Reader = Command.ExecuteReader();
           Users aUsers =new Users();
             Reader.Read();
            

                aUsers.Id =Convert.ToInt32(Reader["Id"]) ;
                aUsers.Name = Reader["Name"].ToString();
                aUsers.Email = Reader["Email"].ToString();
                aUsers.Password = Reader["Password"].ToString();
               
            Connection.Close();
            return aUsers;          
        }





         public int SaveUserDetails(UserDetails aUserDetails)
         {
             string query = "INSERT INTO UserDetails(Id,Gender,Age,City,Mobile,Status,BloodGroup) VALUES (@Id,@Gender,@Age,@City,@Mobile,@Status,@BloodGroup)";
             Command = new SqlCommand(query, Connection);
             Command.Parameters.AddWithValue("@Id", aUserDetails.Id);
             Command.Parameters.AddWithValue("@Gender", aUserDetails.Gender);
             Command.Parameters.AddWithValue("@Age", aUserDetails.Age);
             Command.Parameters.AddWithValue("@City", aUserDetails.City);
             Command.Parameters.AddWithValue("@Mobile", aUserDetails.Mobile);
             Command.Parameters.AddWithValue("@Status", aUserDetails.Status);
             Command.Parameters.AddWithValue("@BloodGroup", aUserDetails.BloodGroup);

             Connection.Open();
             int rawAffect = Command.ExecuteNonQuery();
             Connection.Close();

             return rawAffect;
         }




         public UserDetails GetUserDetails(int id)
         {

             string query = "SELECT * From UserDetails WHERE Id=@Id";
             Command = new SqlCommand(query, Connection);
             Command.Parameters.AddWithValue("@Id", id);

             Connection.Open();
             Reader = Command.ExecuteReader();
             UserDetails aUserDetails = new UserDetails();
             Reader.Read();


             aUserDetails.Id = Convert.ToInt32(Reader["Id"]);
             aUserDetails.Age =Convert.ToInt32( Reader["Age"]);
             aUserDetails.Gender = Reader["Gender"].ToString();
             aUserDetails.City = Reader["City"].ToString();
             aUserDetails.Status = Reader["Status"].ToString();
             aUserDetails.Mobile = Reader["Mobile"].ToString();
             aUserDetails.DonateDate = Reader["DonateDate"].ToString();
             aUserDetails.BloodGroup = Reader["BloodGroup"].ToString();
             Connection.Close();
             return aUserDetails;
         }




         public int UpdateUserDetails(UserDetails aUserDetails)
         {
             string query = "UPDATE UserDetails SET Gender=@Gender,Age=@Age,City=@City,Mobile=@Mobile,Status=@Status,BloodGroup=@BloodGroup WHERE Id=@Id";
             Command = new SqlCommand(query, Connection);
             
             Command.Parameters.AddWithValue("@Gender", aUserDetails.Gender);
             Command.Parameters.AddWithValue("@Age", aUserDetails.Age);
             Command.Parameters.AddWithValue("@City", aUserDetails.City);
             Command.Parameters.AddWithValue("@Mobile", aUserDetails.Mobile);
             Command.Parameters.AddWithValue("@Status", aUserDetails.Status);
             Command.Parameters.AddWithValue("@BloodGroup", aUserDetails.BloodGroup);
             Command.Parameters.AddWithValue("@Id", aUserDetails.Id);

             Connection.Open();
             int rawAffect = Command.ExecuteNonQuery();
             Connection.Close();

             return rawAffect;
         }



         public List<UserDetails> GetAllDonor(string city, string blood)
         {
             string query = "EXEC SelectAllDonor @City=@city , @BloodGroup=@BloodGroup";
             Command = new SqlCommand(query, Connection);
             Command.Parameters.AddWithValue("@city", city);
             Command.Parameters.AddWithValue("@BloodGroup", blood);
             Connection.Open();
             Reader = Command.ExecuteReader();
             List<UserDetails> donorList = new List<UserDetails>();
             while (Reader.Read())
             {
                 UserDetails aUserDetails = new UserDetails();

                 aUserDetails.Name = Reader["Name"].ToString();
                 aUserDetails.Age = Convert.ToInt32(Reader["Age"]);
                 aUserDetails.BloodGroup = Reader["BloodGroup"].ToString();
                 aUserDetails.Status = Reader["Status"].ToString();
                 aUserDetails.Mobile = Reader["Mobile"].ToString();

                 donorList.Add(aUserDetails);
             }

             Connection.Close();

             return donorList;

         }
































    }
}