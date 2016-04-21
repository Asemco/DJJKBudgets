using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DJJKBudgettingProject
{
    public partial class CreateTransaction : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {

            Transaction transaction = new Transaction();
            transaction.UserId = (int)Session["userid"];
            transaction.CategoryId = Convert.ToInt32(liBoxCreateCategories.SelectedItem.Value);
            transaction.Name = txtCreateName.Text.Trim();
            transaction.Description = txtCreateDescription.Text.Trim();
            transaction.DateSpent = calendarCreateDateSpent.SelectedDate.ToShortDateString();

            try
            {
                transaction.Amount = Convert.ToDecimal(txtCreateAmount.Text);
            }
            catch (Exception excep)
            {
                lblCreateResult.Text = "Incorrect savings amount!  Please enter how much you'd like to save as a number.";
                return;
            }

            if (transaction.Name.Length > 0)
            {
                if (transaction.Description.Length > 0)
                {
                    if (transaction.CategoryId != -1)
                    {
                        if (transaction.DateSpent != "0001-01-01")
                        {
                            int result = transaction.InsertTransaction();
                            if (result > 0)
                                lblCreateResult.Text = "Transaction inserted correctly.";
                            else
                                lblCreateResult.Text = "Transaction was not inserted!";
                        }
                        else
                        {
                            lblCreateResult.Text = "You must set a spent date! ";
                        }
                    }
                    else
                    {
                        lblCreateResult.Text = "You must select a category!";
                    }
                }
                else
                {
                    lblCreateResult.Text = "You must set a Transaction Description!";
                }
            }
            else
            {
                lblCreateResult.Text = "You must set a Transaction Name!";
            }
        }

        protected void liBoxCreateCategories_DataBound(object sender, EventArgs e)
        {
            ListItem listItem = new ListItem("Select a Category", "-1");
            liBoxCreateCategories.Items.Insert(0, listItem);
        }

        protected void liBoxUpdateTransactions_DataBound(object sender, EventArgs e)
        {
            ListItem listItem = new ListItem("Select a Transaction", "-1");
            liBoxUpdateCategories.Items.Insert(0, listItem);
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Transaction transaction = new Transaction();
            transaction.TransactionId = Convert.ToInt32(liBoxUpdateTransactions.SelectedItem.Value);
            transaction.UserId = (int)Session["userid"];
            transaction.CategoryId = Convert.ToInt32(liBoxUpdateCategories.SelectedItem.Value);
            transaction.Name = txtUpdateName.Text.Trim();
            transaction.Description = txtUpdateDescription.Text.Trim();
            transaction.DateSpent = calendarUpdateDateSpent.SelectedDate.ToShortDateString();

            try
            {
                transaction.Amount = Convert.ToDecimal(txtUpdateAmount.Text);
            }
            catch (Exception excep)
            {
                lblUpdateResult.Text = "Incorrect savings amount!  Please enter how much you'd like to save as a number.";
                return;
            }

            if (transaction.Name.Length > 0)
            {
                if (transaction.Description.Length > 0)
                {
                    if (transaction.CategoryId != -1)
                    {
                        if (transaction.DateSpent != "0001-01-01")
                        {
                            int result = transaction.UpdateTransaction();
                            if (result > 0)
                                lblUpdateResult.Text = "Transaction inserted correctly.";
                            else
                                lblUpdateResult.Text = "Transaction was not inserted!";
                        }
                        else
                        {
                            lblUpdateResult.Text = "You must set a spent date! ";
                        }
                    }
                    else
                    {
                        lblUpdateResult.Text = "You must select a category!";
                    }
                }
                else
                {
                    lblUpdateResult.Text = "You must set a Transaction Description!";
                }
            }
            else
            {
                lblUpdateResult.Text = "You must set a Transaction Name!";
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Transaction transaction = new Transaction();
            transaction.TransactionId = Convert.ToInt32(liBoxDeleteTransactions.SelectedItem.Value);
            transaction.DeleteTransaction();
            lblDeleteResult.Text = "Transaction was deleted successfully.";
        }

        protected void liBoxUpdateTransactions_SelectedIndexChanged(object sender, EventArgs e)
        {
            Transaction transaction = new Transaction();
            if (liBoxUpdateTransactions.SelectedItem.Value != "-1")
            {
                int transactionId = Convert.ToInt32(liBoxUpdateTransactions.SelectedItem.Value);
                transaction = transaction.GetTransactionById(transactionId);
                txtUpdateName.Text = transaction.Name;
                txtUpdateDescription.Text = transaction.Description;
                txtUpdateAmount.Text = transaction.Amount.ToString();
                liBoxUpdateCategories.SelectedIndex = transaction.CategoryId - 1;
                calendarUpdateDateSpent.SelectedDate = DateTime.Parse(transaction.DateSpent);
                calendarUpdateDateSpent.VisibleDate = calendarUpdateDateSpent.SelectedDate;
            }
        }

        protected void liBoxDeleteTransactions_SelectedIndexChanged(object sender, EventArgs e)
        {
            Transaction transaction = new Transaction();
            if (liBoxDeleteTransactions.SelectedItem.Value != "-1")
            {
                int transactionId = Convert.ToInt32(liBoxDeleteTransactions.SelectedItem.Value);
                transaction = transaction.GetTransactionById(transactionId);
                txtDeleteName.Text = transaction.Name;
                txtDeleteDescription.Text = transaction.Description;
                txtDeleteAmount.Text = transaction.Amount.ToString();
                liBoxDeleteCategories.SelectedIndex = transaction.CategoryId - 1;
                calendarDeleteDateSpent.SelectedDate = DateTime.Parse(transaction.DateSpent);
                calendarDeleteDateSpent.VisibleDate = calendarDeleteDateSpent.SelectedDate;
            }
        }
    }
}