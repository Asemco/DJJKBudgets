using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Helpers;
using System.Data.SqlClient;

namespace DJJKBudgettingProject
{
    public partial class register : System.Web.UI.Page
    {
        string cs = index.cs;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string salt = Crypto.GenerateSalt();
            string hashedPassword = Crypto.Hash(txtPassword.Text + salt);
            string query = "INSERT INTO Users (username, password, email, firstname, lastname, salt, income, payfrequency) " +
                "VALUES (@username, @password, @email, @firstname, @lastname, @salt, @income, @payfrequency);";

            // If the question is set, checks if the answer is set.  If both are, then it'll set both.
            // Otherwise, they are both set to null.
            if (txtQuestion.Text != "")
                if (txtAnswer.Text != "")    
                    query = "INSERT INTO Users (username, password, email, question, answer, firstname, lastname, salt, income, payfrequency) " +
                "VALUES (@username, @password, @email, @question, @answer, @firstname, @lastname, @salt, @income, @payfrequency);";

            decimal income;
            decimal payFrequency;
            try
            {
                income = Convert.ToDecimal(txtIncome.Text);
                payFrequency = Convert.ToDecimal(txtFrequency.Text);
            }   catch (Exception excep)
            {
                lblResult.Text = "Invalid Income/Pay Frequency.";
                return;
            } 

            using (SqlConnection conn = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                cmd.Parameters.AddWithValue("@username", txtUsername.Text);
                cmd.Parameters.AddWithValue("@password", hashedPassword);
                cmd.Parameters.AddWithValue("@email", txtEmail.Text);

                // It'll only attempt to add something to the command if they're both set.  It'll have the right query in that case.
                if (txtQuestion.Text != "")
                {
                    if ((txtAnswer.Text) != "")
                    {
                        cmd.Parameters.AddWithValue("@question", txtQuestion.Text);
                        cmd.Parameters.AddWithValue("@answer", txtAnswer.Text);
                    }
                }
                cmd.Parameters.AddWithValue("@firstname", txtFirstName.Text);
                cmd.Parameters.AddWithValue("@lastname", txtLastName.Text);
                cmd.Parameters.AddWithValue("@salt", salt);
                cmd.Parameters.AddWithValue("@income", income);
                cmd.Parameters.AddWithValue("@payfrequency", payFrequency);
                if (cmd.ExecuteNonQuery() > 0)
                {
                    Server.Transfer("~/login.aspx");
                }
                else
                {
                    lblResult.Text = "Could not create user. Either we can't insert nulls, or the user exists.";
                    lblResult.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
    }
}