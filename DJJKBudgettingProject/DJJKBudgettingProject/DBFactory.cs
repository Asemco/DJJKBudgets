using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Helpers;

namespace DJJKBudgettingProject
{
    public class DBFactory
    {
        public static string cs = ConfigurationManager.ConnectionStrings["cs_Budget"].ConnectionString;


        /////////////////////* USER METHODS */
        public class Users
        {
            /// <summary>
            /// Method used to get the User ID.  Returns: UserID or 0, if Unsuccessful.
            /// </summary>
            /// <param name="username">string</param>
            /// <returns>UserID or 0, if Unsuccessful.</returns>
            public int GetUserId(string username)
            {
                string query = "SELECT userid FROM users WHERE username=@username";
                using (SqlConnection conn = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand(query, conn);
                    conn.Open();
                    cmd.Parameters.AddWithValue("@username", username);

                    return (int)cmd.ExecuteScalar();
                }
                return 0;
            }

            /// <summary>
            /// Method used to get a single user.  Returns: Filled DataRow or empty DataRow, if Unsuccessful.
            /// </summary>
            /// <param name="userid">int</param>
            /// <returns>Filled DataRow or empty DataRow, if Unsuccessful.</returns>
            public DataRow GetUserById(int userid)
            {
                string query = "SELECT * FROM users WHERE userid=@userid";
                DataSet ds = new DataSet();
                using (SqlConnection conn = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@userid", userid);

                    try
                    {
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        da.Fill(ds);
                        return ds.Tables[0].Rows[0];
                    }
                    catch (Exception excep)
                    {
                        // Non-existant transaction was attempted to be selected.
                    }
                }
                return ds.Tables[0].NewRow(); // If this is ever reached, I think all hell will break loose.  But it shouldn't be reached.
            }

            /// <summary>
            /// Method used for the user to login. Returns: UserID or 0, if Unsuccessful.
            /// </summary>
            /// <param name="username">string</param>
            /// <param name="password">string</param>
            /// <returns>UserID or 0, if Unsuccessful.</returns>
            public int LoginUser(string username, string password)
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
            /// Method to verify that the username exists.  Returns: Secret Question or null, if Unsuccessful.
            /// </summary>
            /// <param name="username">string</param>
            /// <returns>Secret Question or null, if Unsuccessful.</returns>
            public string GetSecretQuestion(string username)
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
            /// Method to check if the user exists.  Returns: 0 or 1, if Unsuccessful.
            /// </summary>
            /// <param name="username">string</param>
            /// <returns>0 or 1, if Unsuccessful.</returns>
            public int DoesUserExist(string username)
            {
                if (string.IsNullOrWhiteSpace(username))
                    return 1;
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
            /// Method used to register and insert the user into the database.  Returns: 1 or 0, if Unsuccessful.
            /// </summary>
            /// <param name="user">A filled User object.</param>
            /// <returns>1 or 0, if Unsuccessful.</returns>
            public int InsertUser(User user)
            {
                string query = "INSERT INTO Users (username, password, email, firstname, lastname, salt, income, payfrequency) " +
                    "VALUES (@username, @password, @email, @firstname, @lastname, @salt, @income, @payfrequency);";
                using (SqlConnection conn = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand(query, conn);
                    conn.Open();
                    string salt = Crypto.GenerateSalt();
                    string hashedPassword = Crypto.Hash(user.Password + salt);
                    cmd.Parameters.AddWithValue("@username", user.Username);
                    cmd.Parameters.AddWithValue("@password", hashedPassword);
                    cmd.Parameters.AddWithValue("@email", user.Email);
                    cmd.Parameters.AddWithValue("@firstname", user.FirstName);
                    cmd.Parameters.AddWithValue("@lastname", user.LastName);
                    cmd.Parameters.AddWithValue("@salt", user.Salt);
                    cmd.Parameters.AddWithValue("@income", user.Income);
                    cmd.Parameters.AddWithValue("@payfrequency", user.PayFrequency);
                    return cmd.ExecuteNonQuery();
                }
                return 0;
            }

            /// <summary>
            /// Method used to delete the user.  Returns: 1 or 0, if Unsuccessful.
            /// </summary>
            /// <param name="userid"></param>
            /// <returns>1 or 0, if Unsuccessful.</returns>
            public int DeleteUser(int userid)
            {
                using (SqlConnection conn = new SqlConnection(cs))
                {
                    string query = "DELETE FROM users WHERE userid=@userid";
                    conn.Open();
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@userid", userid);

                    return cmd.ExecuteNonQuery();
                }
                return 0;
            }

            /// <summary>
            /// Method used to update the user's info, besides the password.  Returns: 1 or 0, if Unsuccessful.
            /// </summary>
            /// <param name="user">All except Username, Salt and Password.</param>
            /// <returns>1 or 0, if Unsuccessful.</returns>
            public int UpdateUser(User user)
            {
                using (SqlConnection conn = new SqlConnection(cs))
                {
                    string query = "SELECT * FROM users WHERE userid=@userid";
                    DataSet ds = new DataSet();
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@userid", user.UserId);

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(ds);
                    DataRow dr = ds.Tables[0].Rows[0];
                    if (dr != null)
                    {
                        dr["email"] = user.Email;
                        dr["firstname"] = user.FirstName;
                        dr["lastname"] = user.LastName;
                        dr["income"] = user.Income;
                        dr["payfrequency"] = user.PayFrequency;
                    }
                    SqlCommandBuilder builder = new SqlCommandBuilder(da);
                    return da.Update(ds);
                }
                return 0;
            }

            /// <summary>
            /// Method used to reset the user's password.  Returns: 1 or 0, if Unsuccessful.
            /// </summary>
            /// <param name="user">Required: Username, Password</param>
            /// <returns>1 or 0, if Unsuccessful.</returns>
            public int UpdateUserPassword(User user)
            {
                using (SqlConnection conn = new SqlConnection(cs))
                {
                    string query = "SELECT * FROM users WHERE username=@username";
                    DataSet ds = new DataSet();
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@username", user.Username);

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(ds);
                    DataRow dr = ds.Tables[0].Rows[0];
                    if (dr != null)
                    {
                        string salt = Crypto.GenerateSalt();
                        string hashedPassword = Crypto.Hash(user.Password + salt);
                        dr["password"] = hashedPassword;
                        dr["salt"] = salt;
                    }
                    SqlCommandBuilder builder = new SqlCommandBuilder(da);
                    return da.Update(ds);
                }
            }

        }

        /////////////////////* BUDGET METHODS */
        public class Budgets
        {
            /// <summary>
            /// Method to get all budgets.  Returns: Filled DataSet or empty DataSet, if Unsuccessful.
            /// </summary>
            /// <param name="userid">int</param>
            /// <returns>Filled DataSet or empty DataSet, if Unsuccessful.</returns>
            public DataSet GetBudgets(int userid)
            {
                string query = "SELECT * FROM budget WHERE userid=@userid";
                DataSet ds = new DataSet();
                using (SqlConnection conn = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@userid", userid);

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(ds);
                }
                return ds;
            }

            /// <summary>
            /// Method to get a single budget.  Returns: Filled DataRow or empty DataRow, if Unsuccessful.
            /// </summary>
            /// <param name="budgetid">int</param>
            /// <returns>Filled DataRow or empty DataRow, if Unsuccessful.</returns>
            public DataRow GetBudgetById(int budgetid)
            {
                string query = "SELECT * FROM budget WHERE budgetid=@budgetid";
                DataSet ds = new DataSet();
                using (SqlConnection conn = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@budgetid", budgetid);

                    try
                    {
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        da.Fill(ds);
                        return ds.Tables[0].Rows[0];
                    }
                    catch (Exception excep)
                    {
                        // Non-existant transaction was attempted to be selected.
                    }
                }
                return ds.Tables[0].NewRow(); // If this is ever reached, I think all hell will break loose.  But it shouldn't be reached.
            }

            /// <summary>
            /// Used to create and insert the budget into the database. Returns: 1 or 0, if Unsuccessful.
            /// </summary>
            /// <param name="budget">A Filled Budget object.</param>
            /// <returns>1 or 0, if Unsuccessful.</returns>
            public int InsertBudget(Budget budget)
            {
                string query = "INSERT INTO budget (userid, name, description, saving, start_date, end_date) " +
                                               "VALUES (@userid, @name, @description, @saving, @start_date, @end_date)";
                using (SqlConnection conn = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand(query, conn);
                    conn.Open();
                    cmd.Parameters.AddWithValue("@userid", budget.UserId);
                    cmd.Parameters.AddWithValue("@name", budget.Name);
                    cmd.Parameters.AddWithValue("@description", budget.Description);
                    cmd.Parameters.AddWithValue("@saving", budget.Saving);
                    cmd.Parameters.AddWithValue("@start_date", budget.Start_Date);
                    cmd.Parameters.AddWithValue("@end_date", budget.End_Date);

                    return cmd.ExecuteNonQuery();
                }
            }

            /// <summary>
            /// Method used to delete a budget. Returns: 1 or 0, if Unsuccessful.
            /// </summary>
            /// <param name="budgetid">int</param>
            /// <returns>1 or 0, if Unsuccessful.</returns>
            public int DeleteBudget(int budgetid)
            {
                using (SqlConnection conn = new SqlConnection(cs))
                {
                    string query = "DELETE FROM budget WHERE budgetid=@budgetid";
                    conn.Open();
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@budgetid", budgetid);

                    return cmd.ExecuteNonQuery();
                }
                return 0;
            }

            /// <summary>
            /// Method used to update a budget.  Returns: 1 or 0, if Unsuccessful.
            /// </summary>
            /// <param name="budget">A Filled Budget object.</param>
            /// <returns>1 or 0, if Unsuccessful.</returns>
            public int UpdateBudget(Budget budget)
            {
                using (SqlConnection conn = new SqlConnection(cs))
                {
                    string query = "SELECT * FROM budget WHERE budgetid=@budgetid";
                    DataSet ds = new DataSet();
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@budgetid", budget.BudgetId);

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(ds);
                    DataRow dr = ds.Tables[0].Rows[0];
                    if (dr != null)
                    {
                        dr["name"] = budget.Name;
                        dr["description"] = budget.Description;
                        dr["saving"] = budget.Saving;
                        dr["start_date"] = budget.Start_Date;
                        dr["end_date"] = budget.End_Date;
                    }
                    SqlCommandBuilder builder = new SqlCommandBuilder(da);
                    return da.Update(ds);
                }

                return 0;
            }
        }

        /////////////////////* TRANSACTION METHODS */
        public class Transactions
        {
            /// <summary>
            /// Method to get all transactions.  Returns: Filled DataSet or empty DataSet, if Unsuccessful.
            /// </summary>
            /// <param name="userid">int</param>
            /// <returns>Filled DataSet or empty DataSet, if Unsuccessful.</returns>
            public DataSet GetTransactions(int userid)
            {
                string query = "SELECT * FROM transactions WHERE userid=@userid";
                DataSet ds = new DataSet();
                using (SqlConnection conn = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@userid", userid);

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(ds);
                }
                return ds;
            }

            /// <summary>
            /// Method to get a single transcation.  Returns: Filled DataRow or empty DataRow, if Unsuccessful.
            /// </summary>
            /// <param name="transactionid">int</param>
            /// <returns>Filled DataRow or empty DataRow, if Unsuccessful.</returns>
            public DataRow GetTransactionById(int transactionid)
            {
                string query = "SELECT * FROM transactions WHERE transactionid=@transactionid";
                DataSet ds = new DataSet();
                using (SqlConnection conn = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@transactionid", transactionid);

                    try
                    {
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        da.Fill(ds);
                        return ds.Tables[0].Rows[0];
                    }
                    catch (Exception excep)
                    {
                        // Non-existant transaction was attempted to be selected.
                    }
                }
                return ds.Tables[0].NewRow(); // If this is ever reached, I think all hell will break loose.  But it shouldn't be reached.
            }

            /// <summary>
            /// Method to create a transaction.  Returns: 1 or 0, if Unsuccessful.
            /// </summary>
            /// <param name="trans">A Filled Transaction object.</param>
            /// <returns>1 or 0, if Unsuccessful.</returns>
            public int InsertTransaction(Transaction trans)
            {
                string query = "INSERT INTO transactions (userid, categoryid, name, description, amount, datespent) " +
                                               "VALUES (@userid, @categoryid, @name, @description, @amount, @datespent)";
                using (SqlConnection conn = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand(query, conn);
                    conn.Open();
                    cmd.Parameters.AddWithValue("@userid", trans.UserId);
                    cmd.Parameters.AddWithValue("@categoryid", trans.CategoryId);
                    cmd.Parameters.AddWithValue("@name", trans.Name);
                    cmd.Parameters.AddWithValue("@description", trans.Description);
                    cmd.Parameters.AddWithValue("@amount", trans.Amount);
                    cmd.Parameters.AddWithValue("@datespent", trans.DateSpent);

                    return cmd.ExecuteNonQuery();
                }
            }

            /// <summary>
            /// Method used to delete a particular transaction.  Returns: 1 or 0, if Unsuccessful.
            /// </summary>
            /// <param name="transactionid">int</param>
            /// <returns>1 or 0, if Unsuccessful.</returns>
            public int DeleteTranscation(int transactionid)
            {
                using (SqlConnection conn = new SqlConnection(cs))
                {
                    string query = "DELETE FROM transactions WHERE transactionid=@transactionid";
                    conn.Open();
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@transactionid", transactionid);

                    return cmd.ExecuteNonQuery();
                }
                return 0;
            }

            /// <summary>
            /// Method to update a particular transaction.  Returns: 1 or 0, if Unsuccessful.
            /// </summary>
            /// <param name="trans">A Filled Transaction object.</param>
            /// <returns>1 or 0, if Unsuccessful.</returns>
            public int UpdateTransaction(Transaction trans)
            {
                using (SqlConnection conn = new SqlConnection(cs))
                {
                    string query = "SELECT * FROM transactions WHERE transactionid=@transactionid";
                    DataSet ds = new DataSet();
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@transactionid", trans.TransactionId);

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(ds);
                    DataRow dr = ds.Tables[0].Rows[0];
                    if (dr != null)
                    {
                        dr["categoryid"] = trans.CategoryId;
                        dr["name"] = trans.Name;
                        dr["description"] = trans.Description;
                        dr["amount"] = trans.Amount;
                        dr["datespent"] = trans.DateSpent;
                    }
                    SqlCommandBuilder builder = new SqlCommandBuilder(da);
                    return da.Update(ds);
                }

                return 0;
            }
        }

        /////////////////////* CATEGORY METHODS */
        public class Categories
        {
            /// <summary>
            /// Method to get all categories.  Returns: Filled DataSet or empty DataSet, if Unsuccessful.
            /// </summary>
            /// <returns>Filled DataSet or empty DataSet, if Unsuccessful.</returns>
            public DataSet GetCategories()
            {
                string query = "SELECT * FROM category";
                DataSet ds = new DataSet();
                using (SqlConnection conn = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand(query, conn);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(ds);
                }
                return ds;
            }

            /// <summary>
            /// Method to get a single category.  Returns: Filled DataRow or empty DataRow, if Unsuccessful.
            /// </summary>
            /// <param name="categoryid">int</param>
            /// <returns>Filled DataRow or empty DataRow, if Unsuccessful.</returns>
            public DataRow GetCategoryById(int categoryid)
            {
                string query = "SELECT * FROM category WHERE categoryid=@categoryid";
                DataSet ds = new DataSet();
                using (SqlConnection conn = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@categoryid", categoryid);

                    try
                    {
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        da.Fill(ds);
                        return ds.Tables[0].Rows[0];
                    }
                    catch (Exception excep)
                    {
                        // Non-existant transaction was attempted to be selected.
                    }
                }
                return ds.Tables[0].NewRow(); // If this is ever reached, I think all hell will break loose.  But it shouldn't be reached.
            }
        }     
    }
}
