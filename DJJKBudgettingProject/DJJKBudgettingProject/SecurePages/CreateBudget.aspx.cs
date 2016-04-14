using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Security;
using System.Web.Helpers;

namespace DJJKBudgettingProject.SecurePages
{
    public partial class CreateBudget : System.Web.UI.Page
    {

        string cs = index.cs;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            string budgetName = txtName.Text;
            string budgetDescription = txtDescription.Text;
            budgetName = budgetName.Trim();
            budgetDescription = budgetDescription.Trim();
            
            if (budgetName.Length > 0 || budgetDescription.Length > 0)
            {
                string query = "INSERT INTO budget ( VALUES (";
                //using (SqlConnection conn = new SqlConnection(cs))
                //{
                //    SqlCommand cmd = new SqlCommand(query, conn);
                //    conn.Open();
                //    cmd.Parameters.AddWithValue("@username", username);

                //    string salt = "";
                //    try
                //    {
                //        salt = (string)cmd.ExecuteScalar().ToString().Trim();
                //        if (salt != "")
                //        {
                //            string queryLogin = "SELECT Count(Username) FROM users WHERE username=@username AND password=@password";
                //            string hashedPassword = Crypto.Hash(password + salt);
                //            conn.Close();
                //            conn.Open();
                //            cmd = new SqlCommand(queryLogin, conn);
                //            cmd.Parameters.AddWithValue("@username", username);
                //            cmd.Parameters.AddWithValue("@password", hashedPassword);
                //            int result = (int)cmd.ExecuteScalar();
                //            if (result > 0)
                //                return true;
                //            else
                //                return false;
                //        }
                //    }
                //    catch (Exception e)
                //    {
                //    }
                //    return false;
                //}
            }
        }
    }
}