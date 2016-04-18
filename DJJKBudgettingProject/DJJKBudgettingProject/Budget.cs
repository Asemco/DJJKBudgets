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
            return DBFactory.Budgets.GetBudgets(UserId);
        }

        public DataRow GetBudgetById()
        {
            return DBFactory.Budgets.GetBudgetById(BudgetId);
        }

        public int InsertBudget()
        {
            return DBFactory.Budgets.InsertBudget(this);
        }

        public int UpdateBudget()
        {
            return DBFactory.Budgets.UpdateBudget(this);
        }

        public int DeleteBudget()
        {
            return DBFactory.Budgets.DeleteBudget(BudgetId);
        }
    }
}