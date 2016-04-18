using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace DJJKBudgettingProject
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(HttpContext.Current.User.Identity.Name))
            {
                // Not logged in.
                ((HtmlGenericControl)Page.Master.FindControl("PageBody")).Attributes.Add("onload", "showLoginDialog();");
            }
            else
            {
                
            }
        }
    }
}