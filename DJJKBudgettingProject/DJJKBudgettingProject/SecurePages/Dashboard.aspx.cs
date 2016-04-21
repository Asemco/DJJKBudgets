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
            if (!IsPostBack)
            {
                //Automatically filled through the datasource so this doesn't work.
                //ListItem listItem = new ListItem("Select a Budget", "-1");
                //listBoxBudgets.Items.Insert(0, listItem);
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            
            Session["username"] = null;
            Session["userid"] = null;
            FormsAuthentication.SignOut();
            FormsAuthentication.RedirectToLoginPage();
        }

        protected void btnCreateBudget_Click(object sender, EventArgs e)
        {
            
        }
    }
}