using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Helpers;
using System.Data.SqlClient;
using System.Web.Security;

namespace DJJKBudgettingProject
{
    public partial class login : System.Web.UI.Page
    {

        string cs = index.cs;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private bool AuthenticateUser(string username, string password)
        {
            string query = "SELECT salt FROM users WHERE username=@username";
            using (SqlConnection conn = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                cmd.Parameters.AddWithValue("@username", username);

                string salt = "";
                try {
                    salt = (string)cmd.ExecuteScalar().ToString().Trim();
                    if (salt != "")
                    {
                        string queryLogin = "SELECT userid FROM users WHERE username=@username AND password=@password";
                        string hashedPassword = Crypto.Hash(password + salt);
                        conn.Close();
                        conn.Open();
                        cmd = new SqlCommand(queryLogin, conn);
                        cmd.Parameters.AddWithValue("@username", username);
                        cmd.Parameters.AddWithValue("@password", hashedPassword);
                        int result = (int)cmd.ExecuteScalar();
                        if (result > 0)
                        {
                            Session["userid"] = result;
                            return true;
                        }
                        else
                            return false;
                    }
                } catch (Exception excep)
                {
                }
                return false;
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();
            if (username.Length > 0 && password.Length > 0)
            {
                if (AuthenticateUser(username, password))
                {
                    Session["username"] = username;
                    FormsAuthentication.RedirectFromLoginPage(username, false);
                }
                else
                {
                    lblResult.Text = "Invalid Username or Password";
                }
            }
             else
            {
                lblResult.Text = "Please enter a Username/Password.";
            }
        }
    }
}