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
            return DBFactory.GetTransaction(UserId);
        }

        public DataRow GetTransactionById()
        {
            return DBFactory.GetTransactionById(TransactionId);
        }

        public int InsertTransaction()
        {
            return DBFactory.InsertTransaction(this);
        }

        public int UpdateTransaction()
        {
            return DBFactory.UpdateTransaction(this);
        }

        public int DeleteTransaction()
        {
            return DBFactory.DeleteTranscation(TransactionId);
        }
    }
}