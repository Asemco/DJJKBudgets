using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace FormsAuthenticationExample.SecurePages
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session["username"] = null;
            FormsAuthentication.SignOut();
            FormsAuthentication.RedirectToLoginPage();
        }

        protected void btnCreateBudget_Click(object sender, EventArgs e)
        {

        }
    }
}