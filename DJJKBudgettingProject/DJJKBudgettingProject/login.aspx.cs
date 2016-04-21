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
            txtUsername.Focus();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            User user = new User();
            user.Username = txtUsername.Text.Trim();
            user.Password = txtPassword.Text.Trim();
            if (user.Username.Length > 0 && user.Password.Length > 0)
            {
                int userid = user.LoginUser();
                if (userid > 0)
                {
                    Session["username"] = user.Username;
                    Session["userid"] = userid;
                    FormsAuthentication.RedirectFromLoginPage(user.Username, false);
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