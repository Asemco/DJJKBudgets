using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace DJJKBudgettingProject
{
    public class Transaction
    {
        public int TransactionId { get; set; }
        public int UserId { get; set; }
        public int CategoryId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public decimal Amount { get; set; }
        public string DateSpent { get; set; }

        public DataSet GetTransactions()
        {
            DBFactory.Transactions dbft = new DBFactory.Transactions();
            return dbft.GetTransactions(UserId);
        }

        public Transaction GetTransactionById(int transactionId)
        {
            DBFactory.Transactions dbft = new DBFactory.Transactions();
            DataRow temp = dbft.GetTransactionById(transactionId);
            TransactionId = Convert.ToInt32(temp["transactionid"].ToString());
            UserId = Convert.ToInt32(temp["userid"].ToString());
            CategoryId = Convert.ToInt32(temp["categoryid"].ToString());
            Name = temp["name"].ToString();
            Description = temp["description"].ToString();
            Amount = Convert.ToDecimal(temp["amount"].ToString());
            DateSpent = temp["datespent"].ToString();
            return this;
        }

        public int InsertTransaction()
        {
            DBFactory.Transactions dbft = new DBFactory.Transactions();
            return dbft.InsertTransaction(this);
        }

        public int UpdateTransaction()
        {
            DBFactory.Transactions dbft = new DBFactory.Transactions();
            return dbft.UpdateTransaction(this);
        }

        public int DeleteTransaction()
        {
            DBFactory.Transactions dbft = new DBFactory.Transactions();
            return dbft.DeleteTranscation(TransactionId);
        }
    }
}