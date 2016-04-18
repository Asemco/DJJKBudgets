using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DJJKBudgettingProject
{
    public partial class UpdateTrans : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            string test = txtName.Text;
            //GridViewRow test = new GridViewRow();
            //DataRow dr;
            //DBFactory.UpdateTransaction(dr);
        }

        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try {
                int budgetid = Convert.ToInt32(listBoxBudgets.SelectedItem.Value);
                DataSet ds = DBFactory.GetTransaction(budgetid);
                grdTrans.DataSource = ds;
                grdTrans.DataBind();
            } catch (Exception excep)
            {

            }

        }
    }
}