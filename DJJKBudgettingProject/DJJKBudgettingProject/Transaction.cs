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

        public DataRow GetTransactionById()
        {
            DBFactory.Transactions dbft = new DBFactory.Transactions();
            return dbft.GetTransactionById(TransactionId);
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