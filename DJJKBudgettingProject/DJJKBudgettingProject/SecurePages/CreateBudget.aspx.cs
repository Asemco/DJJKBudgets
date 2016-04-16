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

        string cs = index.cs;
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
                            string query = "INSERT INTO budget (userid, name, description, saving, start_date, end_date) " +
                                           "VALUES (@userid, @name, @description, @saving, @start_date, @end_date)";
                            using (SqlConnection conn = new SqlConnection(cs))
                            {
                                SqlCommand cmd = new SqlCommand(query, conn);
                                conn.Open();
                                cmd.Parameters.AddWithValue("@userid", Session["userid"]);
                                cmd.Parameters.AddWithValue("@name", budgetName);
                                cmd.Parameters.AddWithValue("@description", budgetDescription);
                                cmd.Parameters.AddWithValue("@saving", budgetSaving);
                                cmd.Parameters.AddWithValue("@start_date", startDate);
                                cmd.Parameters.AddWithValue("@end_date", endDate);

                                int result = (int)cmd.ExecuteNonQuery();
                                if (result > 0)
                                {
                                    lblResult.Text = "Budget inserted correctly!";
                                    return;
                                }
                                else
                                    lblResult.Text = "Budget was not inserted.";
                            }
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
    }
}