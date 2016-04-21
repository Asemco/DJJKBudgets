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
                User user = new User();
                user.Username = txtUsername.Text;
                user.Password = txtPassword.Text;
                user.Email = txtEmail.Text;
                user.FirstName = txtFirstName.Text;
                user.LastName = txtLastName.Text;

                try
                {
                    user.Income = Convert.ToDecimal(txtIncome.Text);
                }
                catch (Exception excep)
                {
                    lblResult.Text = "Your income was incorrect. Please enter the numerical value for the year. Eg. 42000";
                    return;
                }

                try
                {
                    user.PayFrequency = Convert.ToInt32(txtFrequency.Text);
                }
                catch (Exception excep)
                {
                    lblResult.Text = "Your Pay Frequency was incorrect.  Please choose an amount, in days. Eg. 7";
                    return;
                }

                if (user.InsertUser() > 0)
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

        protected void btnVerify_Click(object sender, EventArgs e)
        {
            User user = new User();
            user.Username = txtUsername.Text.Trim();
            bool verify = user.DoesUserExist();
            if (!verify)
            {
                lblResult.Text = "The username you have chosen is available!";
                Cache["verified"] = true;
            }
            else
            {
                lblResult.Text = "The username you have chosen is not available.";
                Cache["verified"] = false;
            }
        }
    }
}