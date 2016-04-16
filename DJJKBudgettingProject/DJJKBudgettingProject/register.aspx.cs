using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DJJKBudgettingProject
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if ((bool)Cache["verified"])
            {
                string username = txtUsername.Text;
                string password = txtPassword.Text;
                string email = txtEmail.Text;
                string firstName = txtFirstName.Text;
                string lastName = txtLastName.Text;
                string question = txtQuestion.Text;
                string answer = txtAnswer.Text;
                decimal income;
                decimal payFrequency;

                try
                {
                    income = Convert.ToDecimal(txtIncome.Text);
                }
                catch (Exception excep)
                {
                    lblResult.Text = "Your income was incorrect. Please enter the numerical value for the year. Eg. 42000";
                    return;
                }

                try
                {
                    payFrequency = Convert.ToDecimal(txtFrequency.Text);
                }
                catch (Exception excep)
                {
                    lblResult.Text = "Your Pay Frequency was incorrect.  Please choose an amount, in days. Eg. 7";
                    return;
                }


                if (question != "")
                {
                    if (answer != "")
                    {
                        if (DBFactory.RegisterUser(username, password, email, firstName, lastName, income, payFrequency, question, answer) > 0)
                        {
                            Server.Transfer("~/login.aspx");
                        }
                        else
                        {
                            lblResult.Text = "Registration failed.";
                            lblResult.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                }
                else
                {
                    if (DBFactory.RegisterUser(username, password, email, firstName, lastName, income, payFrequency) > 0)
                    {

                    }
                    else
                    {
                        lblResult.Text = "Registration failed.";
                        lblResult.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }
        }

        protected void btnVerify_Click(object sender, EventArgs e)
        {
            int verify = DBFactory.DoesUserExist(txtUsername.Text);
            if (verify > 0)
            {
                lblResult.Text = "Username is available!";
                Cache["verified"] = true;
            }
            else
            {
                lblResult.Text = "The username is not available.";
            }
        }
    }
}