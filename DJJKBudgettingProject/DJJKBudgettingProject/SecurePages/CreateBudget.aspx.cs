using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Security;
using System.Web.Helpers;

namespace DJJKBudgettingProject.SecurePages
{
    public partial class CreateBudget : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            string budgetName = txtName.Text;
            string budgetDescription = txtDescription.Text;
            decimal budgetSaving;
            string startDate = calendarStart.SelectedDate.ToShortDateString();
            string endDate = calendarEnd.SelectedDate.ToShortDateString();
            budgetName = budgetName.Trim();
            budgetDescription = budgetDescription.Trim();
            try
            {
                budgetSaving = Convert.ToDecimal(txtSave.Text);
            }
            catch (Exception excep)
            {
                lblResult.Text = "Incorrect savings amount!  Please enter how much you'd like to save as a number.";
                return;
            }

            if (budgetName.Length > 0)
            {
                if (budgetDescription.Length > 0)
                {
                    if (startDate != "0001-01-01")
                    {
                        if (endDate != "0001-01-01" && endDate.CompareTo(startDate) > 0)
                        {
                            int result = DBFactory.CreateBudget((int)Session["userid"], budgetName, budgetDescription, budgetSaving, startDate, endDate);
                            if (result > 0)
                                lblResult.Text = "Budget inserted correctly!";
                            else
                                lblResult.Text = "Budget was not inserted.";
                        }
                        else
                        {
                            lblResult.Text = "You must set an end date that's later than the start date of your budget.";
                        }
                    }
                    else
                    {
                        lblResult.Text = "You must set a start date for your budget. ";
                    }
                }
                else
                {
                    lblResult.Text = "You must set a Budget Description!";
                }
            }
            else
            {
                lblResult.Text = "You must set a Budget Name!";
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedIndex == 2) {

            }
        }
    }
}