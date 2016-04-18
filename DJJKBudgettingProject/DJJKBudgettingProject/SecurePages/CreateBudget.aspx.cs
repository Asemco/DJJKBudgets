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

            Budget budget = new Budget();
            budget.UserId = (int)Session["userid"];
            budget.Name = txtName.Text.Trim();
            budget.Description = txtDescription.Text.Trim();
            budget.Start_Date = calendarStart.SelectedDate.ToShortDateString();
            budget.End_Date = calendarEnd.SelectedDate.ToShortDateString();
            try
            {
                budget.Saving = Convert.ToDecimal(txtSave.Text);
            }
            catch (Exception excep)
            {
                lblResult.Text = "Incorrect savings amount!  Please enter how much you'd like to save as a number.";
                return;
            }

            if (budget.Name.Length > 0)
            {
                if (budget.Description.Length > 0)
                {
                    if (budget.Start_Date != "0001-01-01")
                    {
                        if (budget.End_Date != "0001-01-01" && budget.End_Date.CompareTo(budget.Start_Date) > 0)
                        {
                            int result = DBFactory.Budgets.InsertBudget(budget);
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