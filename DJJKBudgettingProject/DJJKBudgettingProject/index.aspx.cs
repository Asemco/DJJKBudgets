using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Helpers;
using System.Configuration;

namespace DJJKBudgettingProject
{
    public partial class index : System.Web.UI.Page
    {

        public static string cs = ConfigurationManager.ConnectionStrings["cs_Budget"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {            
            
        }
    }
}