using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Helpers;

namespace DJJKBudgettingProject
{
    class DBFactory
    {
        public static string cs = ConfigurationManager.ConnectionStrings["cs_Budget"].ConnectionString;

        /////////////////////* USER METHODS */

        /// <summary>
        /// Method used for the user to login. Returns: UserID or 0, if unsuccessful.
        /// </summary>
        /// <param name="username">string</param>
        /// <param name="password">string</param>
        /// <returns>UserID or 0, if unsuccessful</returns>
        public static int LoginUser(string username, string password)
        {
            string query = "SELECT salt FROM users WHERE username=@username";
            using (SqlConnection conn = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                cmd.Parameters.AddWithValue("@username", username);

                string salt = "";
                try
                {
                    salt = (string)cmd.ExecuteScalar().ToString().Trim();
                    if (salt != "")
                    {
                        string queryLogin = "SELECT userid FROM users WHERE username=@username AND password=@password";
                        string hashedPassword = Crypto.Hash(password + salt);
                        conn.Close();
                        conn.Open();
                        cmd = new SqlCommand(queryLogin, conn);
                        cmd.Parameters.AddWithValue("@username", username);
                        cmd.Parameters.AddWithValue("@password", hashedPassword);
                        int result = (int)cmd.ExecuteScalar();
                        if (result > 0)
                        {
                            return result;
                        }
                        else
                            return 0;
                    }
                }
                catch (Exception excep)
                {
                    
                }
                return 0;
            }
        }

        /// <summary>
        /// Method for the user to confirm resetting their password. Returns: 1 or 0, if unsuccessful.
        /// </summary>
        /// <param name="username">string</param>
        /// <param name="password">string</param>
        /// <param name="answer">string</param>
        /// <returns>1 or 0, if unsuccessful.</returns>
        public static int ResetPassword(string username, string password, string answer)
        {
            string query = "SELECT answer FROM Users WHERE username=@username";
            using (SqlConnection conn = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                cmd.Parameters.AddWithValue("@username", username);

                string storedAnswer = (string)cmd.ExecuteScalar();
                if (answer == storedAnswer)
                {
                    conn.Close();
                    string queryInsert = "UPDATE Users SET password=@password, salt=@salt WHERE username=@username";
                    cmd = new SqlCommand(queryInsert, conn);
                    conn.Open();
                    string salt = Crypto.GenerateSalt();
                    string hashedPassword = Crypto.Hash(password + salt);
                    cmd.Parameters.AddWithValue("@password", hashedPassword);
                    cmd.Parameters.AddWithValue("@salt", salt);
                    cmd.Parameters.AddWithValue("@username", username);
                    return cmd.ExecuteNonQuery();
                }
            }
            return 0;
        }

        /// <summary>
        /// Method to verify that the username exists.  Returns: Secret Question or null, if unsuccessful.
        /// </summary>
        /// <param name="username">string</param>
        /// <returns>Secret Question or null, if unsuccessful.</returns>
        public static string GetSecretQuestion(string username)
        {
            string query = "SELECT question FROM Users WHERE username=@username";

            using (SqlConnection conn = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                cmd.Parameters.AddWithValue("@username", username);
                return (string)cmd.ExecuteScalar();
            }
            return null;
        }

        /// <summary>
        /// Method to check if the user exists.  Returns: 0 or 1, if unsuccessful.
        /// </summary>
        /// <param name="username">string</param>
        /// <returns>0 or 1, if unsuccessful.</returns>
        public static int DoesUserExist(string username)
        {
            string query = "SELECT count(userid) FROM Users WHERE username=@username";

            using (SqlConnection conn = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                cmd.Parameters.AddWithValue("@username", username);
                return (int)cmd.ExecuteScalar();
            }
            return 1;
        }

        /// <summary>
        /// Method to register and insert the user into the database. Returns: 1 or 0, if unsuccessful.
        /// </summary>
        /// <param name="username">string</param>
        /// <param name="password">string</param>
        /// <param name="email">string</param>
        /// <param name="firstName">string</param>
        /// <param name="lastName">string</param>
        /// <param name="income">decimal</param>
        /// <param name="payFrequency">decimal</param>
        /// <returns>1 or 0, if unsuccessful.</returns>
        public static int RegisterUser(string username, string password, string email, string firstName, string lastName, decimal income, decimal payFrequency)
        {
            string query = "INSERT INTO Users (username, password, email, firstname, lastname, salt, income, payfrequency) " +
                "VALUES (@username, @password, @email, @firstname, @lastname, @salt, @income, @payfrequency);";
            using (SqlConnection conn = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                string salt = Crypto.GenerateSalt();
                string hashedPassword = Crypto.Hash(password + salt);
                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue("@password", hashedPassword);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@firstname", firstName);
                cmd.Parameters.AddWithValue("@lastname", lastName);
                cmd.Parameters.AddWithValue("@salt", salt);
                cmd.Parameters.AddWithValue("@income", income);
                cmd.Parameters.AddWithValue("@payfrequency", payFrequency);
                return cmd.ExecuteNonQuery();
            }
            return 0;
        }

        /// <summary>
        /// Method to register and insert the user into the database. Includes the secret question and answer. Returns: 1 or 0, if unsuccessful.
        /// </summary>
        /// <param name="username">string</param>
        /// <param name="password">string</param>
        /// <param name="email">string</param>
        /// <param name="firstName">string</param>
        /// <param name="lastName">string</param>
        /// <param name="income">decimal</param>
        /// <param name="payFrequency">decimal</param>
        /// <param name="question">string</param>
        /// <param name="answer">string</param>
        /// <returns></returns>
        public static int RegisterUser(string username, string password, string email, string firstName, string lastName, decimal income, decimal payFrequency, string question, string answer)
        {
            string query = "INSERT INTO Users (username, password, email, question, answer, firstname, lastname, salt, income, payfrequency) " +
                "VALUES (@username, @password, @email, @question, @answer, @firstname, @lastname, @salt, @income, @payfrequency);";
            using (SqlConnection conn = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                string salt = Crypto.GenerateSalt();
                string hashedPassword = Crypto.Hash(password + salt);
                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue("@password", hashedPassword);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@question", question);
                cmd.Parameters.AddWithValue("@answer", answer);
                cmd.Parameters.AddWithValue("@firstname", firstName);
                cmd.Parameters.AddWithValue("@lastname", lastName);
                cmd.Parameters.AddWithValue("@salt", salt);
                cmd.Parameters.AddWithValue("@income", income);
                cmd.Parameters.AddWithValue("@payfrequency", payFrequency);
                return cmd.ExecuteNonQuery();
            }
            return 0;
        }

        /////////////////////* BUDGET METHODS */

        /// <summary>
        /// Used to create and insert the budget into the database. Returns: 1 or 0, if unsuccessful.
        /// </summary>
        /// <param name="userid">int</param>
        /// <param name="budgetName">string</param>
        /// <param name="budgetDescription">string</param>
        /// <param name="budgetSaving">decimal</param>
        /// <param name="startDate">string</param>
        /// <param name="endDate">string</param>
        /// <returns>1 or 0, if unsuccessful.</returns>
        public static int CreateBudget(int userid, string budgetName, string budgetDescription, decimal budgetSaving, string startDate, string endDate)
        {
            string query = "INSERT INTO budget (userid, name, description, saving, start_date, end_date) " +
                                           "VALUES (@userid, @name, @description, @saving, @start_date, @end_date)";
            using (SqlConnection conn = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                cmd.Parameters.AddWithValue("@userid", userid);
                cmd.Parameters.AddWithValue("@name", budgetName);
                cmd.Parameters.AddWithValue("@description", budgetDescription);
                cmd.Parameters.AddWithValue("@saving", budgetSaving);
                cmd.Parameters.AddWithValue("@start_date", startDate);
                cmd.Parameters.AddWithValue("@end_date", endDate);

                return (int)cmd.ExecuteNonQuery();
            }
        }

        /// <summary>
        /// Method used to delete a budget. Returns: 1 or 0, if unsuccessful.
        /// </summary>
        /// <param name="budgetid">int</param>
        /// <returns>1 or 0, if unsuccessful.</returns>
        public static int DeleteBudget(int budgetid)
        {
            using (SqlConnection conn = new SqlConnection(cs))
            {
                string query = "DELETE FROM budget WHERE budgetid=@budgetid";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@budgetid", budgetid);

                return cmd.ExecuteNonQuery();
            }
            return 0;
        }
    }
}
