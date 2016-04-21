using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DJJKBudgettingProject.SecurePages
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                User user = new User();
                user.UserId = Convert.ToInt32(Session["userid"]);
                user = user.GetUserById();
                txtUsername.Text = user.Username.Trim();
                txtEmail.Text = user.Email.Trim();
                txtFirstName.Text = user.FirstName.Trim();
                txtLastName.Text = user.LastName.Trim();
                txtPayFrequency.Text = user.PayFrequency.ToString();
                txtIncome.Text = user.Income.ToString();
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            lblUpdateResult.Text = "";
            User user = new User();
            user.UserId = Convert.ToInt32(Session["userid"]);
            user.Username = txtUsername.Text;
            user.Email = txtEmail.Text;
            user.Password = txtNewPassword.Text;
            user.FirstName = txtFirstName.Text;
            user.LastName = txtLastName.Text;

            try
            {
                user.Income = Convert.ToDecimal(txtIncome.Text);
            }
            catch (Exception excep)
            {
                lblUpdateResult.Text = "Your income was incorrect. Please enter a numerical value for your yearly income. Eg. 42000";
                return;
            }

            try
            {
                user.PayFrequency = Convert.ToInt32(txtPayFrequency.Text);
            }
            catch (Exception excep)
            {
                lblUpdateResult.Text = "Your Pay Frequency was incorrect.  Please choose an amount, in days. Eg. 7";
                return;
            }
            if (!string.IsNullOrWhiteSpace(user.Email))
            {
                if (!string.IsNullOrWhiteSpace(user.FirstName))
                {
                    if (!string.IsNullOrWhiteSpace(user.LastName))
                    {
                        if (user.UpdateUser() > 0)
                        {
                            lblUpdateResult.Text += "Profile Updated";
                            lblUpdateResult.ForeColor = System.Drawing.Color.Green;
                        }
                        else
                        {
                            lblUpdateResult.Text = "Profile Update Failed.";
                            lblUpdateResult.ForeColor = System.Drawing.Color.Red;
                        }

                        if (!string.IsNullOrWhiteSpace(txtNewPassword.Text))
                        {
                            user.Password = txtNewPassword.Text;
                            if (user.UpdateUserPassword() > 0)
                            {
                                lblUpdateResult.Text += " with a New Password too!";
                            }
                        }
                    }
                }
            }
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            btnDelete.Visible = true;
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            lblDeleteResult.Text = "Sorry, but you are not allowed to delete your profile.";
            btnDelete.Visible = false;
            btnConfirm.Visible = false;
        }
    }
}