using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace DJJKBudgettingProject
{
    public partial class material : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string name = HttpContext.Current.User.Identity.Name;

            if (string.IsNullOrEmpty(name))
            {
                // Not logged in.
                linklogout.Visible = false;

                lblWelcome.Text = "Welcome, Guest!";
            }
            else
            {
                LoginMessage.Visible = false;

                lblWelcome.Text = "Welcome, " + name + "!";
            }
        }

        protected void linklogout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            FormsAuthentication.RedirectToLoginPage();
        }
    }
}