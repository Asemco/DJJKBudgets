using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace DJJKBudgettingProject
{
    public class Budget
    {
        public int BudgetId { get; set; }
        public int Userid { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public decimal Saving { get; set; }
        public string Start_Date { get; set; }
        public string End_Date { get; set; }

        public DataSet GetBudgets()
        {
            return DBFactory.GetBudgets(Userid);
        }

        public DataRow GetBudgetById()
        {
            return DBFactory.GetBudgetById(BudgetId);
        }

        public int InsertBudget()
        {
            return DBFactory.InsertBudget(this);
        }

        public int UpdateBudget()
        {
            return DBFactory.UpdateBudget(this);
        }

        public int DeleteBudget()
        {
            return DBFactory.DeleteBudget(BudgetId);
        }
    }
}