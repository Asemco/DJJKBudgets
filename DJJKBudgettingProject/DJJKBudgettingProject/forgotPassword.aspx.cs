using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DJJKBudgettingProject
{
    public partial class forgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                Cache["verified"] = false;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            lblResult.Text = "";
            if ((bool)Cache["verified"])
            {
                if (txtAnswer.Text.Length > 0)
                {
                    User user = new User();
                    user.Username = txtUsername.Text;
                    user.Password = txtPassword.Text;
                    if (user.UpdateUserPassword() > 0)
                    {
                        lblResult.Text = "Successfully reset password!";
                        lblResult.ForeColor = System.Drawing.Color.Green;
                        Server.Transfer("~/login.aspx");
                    }
                    else
                    {
                        lblResult.Text = "That username and Secret Question/Answer combination does not exist.";
                        lblResult.ForeColor = System.Drawing.Color.Red;
                    }
                }
                else
                {
                    lblResult.Text = "Please enter a valid answer.";
                    lblResult.ForeColor = System.Drawing.Color.Red;
                }
            }
            else
            {
                lblResult.Text = "Please verify your account first.";
                txtUsername.Focus();
            }
        }

        protected void btnVerify_Click(object sender, EventArgs e)
        {
            User user = new User();
            user.Username = txtUsername.Text.Trim();
            string question = user.GetSecretQuestion();
            if (question != null)
            {
                lblQuestion.Text = question;
                lblResult.Text = "";
                Cache["verified"] = true;
            }
            else
            {
                lblResult.Text = "This account either does not exist, or does not have a secret question set.";
            }
        }
    }
}