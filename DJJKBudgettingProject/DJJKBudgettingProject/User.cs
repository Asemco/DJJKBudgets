using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace DJJKBudgettingProject
{
    public class User
    {
        public int UserId { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }
        public string Question { get; set; }
        public string Answer { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Salt { get; set; }
        public decimal Income { get; set; }
        public int PayFrequency { get; set; }

        /// <summary>
        /// Returns False or True, if Unsuccessful.
        /// </summary>
        /// <returns>Returns False or True, if Unsuccessful.</returns>
        public bool DoesUserExist()
        {
            DBFactory.Users dbfu = new DBFactory.Users();
            if (dbfu.DoesUserExist(Username) > 0)
                return true;
            else
                return false;
        }

        public User GetUserById()
        {
            DBFactory.Users dbfu = new DBFactory.Users();
            DataRow temp = dbfu.GetUserById(UserId);
            Username = temp["username"].ToString();
            Password = temp["password"].ToString();
            Email = temp["Email"].ToString();
            FirstName = temp["FirstName"].ToString();
            LastName = temp["LastName"].ToString();
            Salt = temp["Salt"].ToString();
            try {
                Income = Convert.ToDecimal(temp["Income"].ToString());
            } catch (FormatException e)
            {
                Income = 0;
            }
            try {
                PayFrequency = Convert.ToInt32(temp["PayFrequency"].ToString());
            } catch (FormatException e)
            {
                PayFrequency = 0;
            }
            return this;
        }

        public int LoginUser()
        {
            DBFactory.Users dbfu = new DBFactory.Users();
            return dbfu.LoginUser(Username, Password);
        }

        public int UpdateUserPassword()
        {
            DBFactory.Users dbfu = new DBFactory.Users();
            return dbfu.UpdateUserPassword(this);
        }

        public string GetSecretQuestion()
        {
            DBFactory.Users dbfu = new DBFactory.Users();
            return dbfu.GetSecretQuestion(Username);
        }

        public int GetUserId()
        {
            DBFactory.Users dbfu = new DBFactory.Users();
            return dbfu.GetUserId(Username);
        }

        public int InsertUser()
        {
            DBFactory.Users dbfu = new DBFactory.Users();
            return dbfu.InsertUser(this);
        }

        public int UpdateUser()
        {
            DBFactory.Users dbfu = new DBFactory.Users();
            return dbfu.UpdateUser(this);
        }

        public int DeleteUser()
        {
            DBFactory.Users dbfu = new DBFactory.Users();
            return dbfu.DeleteUser(UserId);
        }
    }
}
