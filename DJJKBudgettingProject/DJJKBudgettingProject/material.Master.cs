using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace DJJKBudgettingProject
{
    public partial class material : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(string.IsNullOrEmpty(HttpContext.Current.User.Identity.Name))
            {
                // Not logged in.
                linklogout.Visible = false;

                ((HtmlGenericControl)Page.Master.FindControl("PageBody")).Attributes.Add("onload", "showLoginDialog();");
            }
            else
            {
                LoginMessage.Visible = false;
            }
        }
    }
}