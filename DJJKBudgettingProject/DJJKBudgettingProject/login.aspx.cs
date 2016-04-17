using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace DJJKBudgettingProject
{
    public partial class login : System.Web.UI.Page
    {       
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();
            if (username.Length > 0 && password.Length > 0)
            {
                int userid = DBFactory.LoginUser(username, password);
                if (userid > 0)
                {
                    Session["username"] = username;
                    Session["userid"] = userid;
                    FormsAuthentication.RedirectFromLoginPage(username, false);
                }
                else
                {
                    lblResult.Text = "Invalid Username or Password. userid = " + userid;
                }
            }
             else
            {
                lblResult.Text = "Please enter a Username/Password.";
            }
        }
    }
}