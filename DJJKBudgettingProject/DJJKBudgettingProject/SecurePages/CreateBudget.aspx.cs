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
                lblResult.ForeColor = System.Drawing.Color.Red;
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
                            int result = budget.InsertBudget();
                            if (result > 0)
                            {
                               budget.BudgetId = result;
                                lblResult.Text = "Budget inserted correctly!";
                            }
                        else
                        {
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

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Budget budget = new Budget();
            budget.UserId = (int)Session["userid"];
            budget.Name = TextBox1.Text.Trim();
            budget.Description = TextBox3.Text.Trim();
            budget.Start_Date = upCalendar1.SelectedDate.ToShortDateString();
            budget.End_Date = upCalendar2.SelectedDate.ToShortDateString();
            try
            {
                Console.WriteLine("WOORKS");
                budget.Saving = Math.Round(Convert.ToDecimal(TextBox4.Text), 2);
                
                budget.UpdateBudget();
                Label2.Text = "Updated Record.";
                Label2.ForeColor = System.Drawing.Color.Green;
            }
            catch (Exception excep)
            {
                Label2.Text = "Incorrect savings amount!  Please enter how much you'd like to save as a number.";
                Label2.ForeColor = System.Drawing.Color.Red;
                return;
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Console.WriteLine("wow");
            Budget budget = new Budget();
            budget.BudgetId = Convert.ToInt32(DropDownList1.SelectedValue);
            budget.DeleteBudget();
        }
        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            Budget budget = new Budget();
            budget.BudgetId = Convert.ToInt32(DropDownList2.SelectedValue);
            budget = budget.GetBudgetById();
            TextBox1.Text = budget.Name;
            TextBox3.Text = budget.Description;
            TextBox4.Text = budget.Saving.ToString();
            upCalendar1.TodaysDate = DateTime.Parse(budget.Start_Date);
            upCalendar2.TodaysDate = DateTime.Parse(budget.End_Date);
        }
        protected void btnAddCategory_Click(object sender, EventArgs e)
        {
            Budget budget = new Budget();
            budget.BudgetId = Convert.ToInt32(DropDownList2.SelectedValue);
            if(budget.InsertBudgetCategory(Convert.ToInt32(ListBox1.SelectedValue)) > 0)
            {
                Label3.Text = "Successfully added category";
                Label3.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                Label3.Text = "Failed to add category";
                Label3.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}