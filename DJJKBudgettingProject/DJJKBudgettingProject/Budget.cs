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

        public Budget GetBudgetById()
        {
            DBFactory.Budgets dbfb = new DBFactory.Budgets();
            DataRow temp = dbfb.GetBudgetById(BudgetId);
            BudgetId = Convert.ToInt32(temp["budgetid"].ToString());
            UserId = Convert.ToInt32(temp["userid"].ToString());
            Name = temp["name"].ToString();
            Description = temp["description"].ToString();
            Saving = Convert.ToDecimal(temp["amount"].ToString());
            Start_Date = temp["datespent"].ToString();
            End_Date = temp["categoryid"].ToString();
            return this;
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
        public int InsertBudgetCategory(int categoryid)
        {
            DBFactory.Budgets dbfb = new DBFactory.Budgets();
            return dbfb.InsertBudgetCategory(this, categoryid);
        }
    }
}