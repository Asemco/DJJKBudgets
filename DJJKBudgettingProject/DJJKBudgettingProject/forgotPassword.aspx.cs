using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Helpers;

namespace DJJKBudgettingProject
{
    public partial class forgotPassword : System.Web.UI.Page
    {
        string cs = index.cs;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                Cache["verified"] = false;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string query = "SELECT answer FROM Users WHERE username=@username";
            lblResult.Text = "";
            if ((bool)Cache["verified"])
            {
                using (SqlConnection conn = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand(query, conn);
                    conn.Open();
                    cmd.Parameters.AddWithValue("@username", txtUsername.Text);

                    string answer = (string)cmd.ExecuteScalar();
                    string answer2 = answer.Trim().ToString();
                    string answer3 = txtAnswer.Text.ToString();
                    if (answer2 == answer3)
                    {
                        conn.Close();
                        string queryInsert = "UPDATE Users SET password=@password, salt=@salt WHERE username=@username";
                        cmd = new SqlCommand(queryInsert, conn);
                        conn.Open();
                        string salt = Crypto.GenerateSalt();
                        string hashedPassword = Crypto.Hash(txtPassword.Text + salt);
                        cmd.Parameters.AddWithValue("@password", hashedPassword);
                        cmd.Parameters.AddWithValue("@salt", salt);
                        cmd.Parameters.AddWithValue("@username", txtUsername.Text);
                        if (cmd.ExecuteNonQuery() > 0)
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
                        lblResult.Text = "That answer is incorrect.";
                        lblResult.ForeColor = System.Drawing.Color.Red;
                    }
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
            string query = "SELECT question FROM Users WHERE username=@username";

            using (SqlConnection conn = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                cmd.Parameters.AddWithValue("@username", txtUsername.Text);
                string question = (string)cmd.ExecuteScalar();
                if (question != null)
                {
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
                else
                {
                    lblResult.Text = "This account either does not exist, or does not have a secret question set.";
                    lblResult.ForeColor = System.Drawing.Color.Red;
                    lblQuestion.Text = "";
                }
            }
        }
    }
}