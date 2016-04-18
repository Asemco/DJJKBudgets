using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace DJJKBudgettingProject
{
    class User
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

        public bool DoesUserExist()
        {
            if (DBFactory.Users.DoesUserExist(Username) > 0)
                return true;
            else
                return false;
        }

        public int GetUserId()
        {
            return DBFactory.Users.GetUserId(Username);
        }

        public int InsertUser()
        {
            return DBFactory.Users.InsertUser(this);
        }

        public int UpdateUser()
        {
            return DBFactory.Users.UpdateUser(this);
        }

        public int DeleteUser()
        {
            return DBFactory.Users.DeleteUser(UserId);
        }
    }
}
