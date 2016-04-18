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
        public int UserId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public decimal Saving { get; set; }
        public string Start_Date { get; set; }
        public string End_Date { get; set; }

        public DataSet GetBudgets()
        {
            DBFactory.Budgets dbfb = new DBFactory.Budgets();
            return dbfb.GetBudgets(UserId);
        }

        public DataRow GetBudgetById()
        {
            DBFactory.Budgets dbfb = new DBFactory.Budgets();
            return dbfb.GetBudgetById(BudgetId);
        }

        public int InsertBudget()
        {
            DBFactory.Budgets dbfb = new DBFactory.Budgets();
            return dbfb.InsertBudget(this);
        }

        public int UpdateBudget()
        {
            DBFactory.Budgets dbfb = new DBFactory.Budgets();
            return dbfb.UpdateBudget(this);
        }

        public int DeleteBudget()
        {
            DBFactory.Budgets dbfb = new DBFactory.Budgets();
            return dbfb.DeleteBudget(BudgetId);
        }
    }
}