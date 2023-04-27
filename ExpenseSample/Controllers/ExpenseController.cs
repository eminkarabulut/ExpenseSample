using ExpenseSample.Helpers;
using ExpenseSample.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;

namespace ExpenseSample.Controllers
{
    public class ExpenseController : Controller
    {
        public IActionResult AddExpense()
        {
            DatabaseContext db = new DatabaseContext();

            int userId = HttpContext.Session.GetInt32("userid").Value;

            List<Expense> expenses = db.Expenses.Where(x => x.UserId == userId).ToList();

            AddExpenseViewModel model = new AddExpenseViewModel();
            model.Expenses = expenses;

            return View(model);
        }

        [HttpPost]
        public IActionResult AddExpense(AddExpenseViewModel model)
        {
            DatabaseContext db = new DatabaseContext();

            if (ModelState.IsValid)
            {
                Expense expense = new Expense();
                expense.Title = model.Title;
                expense.Description = model.Description;
                expense.Date = model.Date;
                expense.Category = model.Category;
                expense.Amount = model.Amount;

                int userId = HttpContext.Session.GetInt32("userid").Value;
                expense.UserId = userId;

                db.Expenses.Add(expense);
                db.SaveChanges();

            }

            List<Expense> expenses = db.Expenses.ToList();
            model.Expenses = expenses;

            return View(model);
        }

        public IActionResult ReportExpense()
        {
            DatabaseContext db = new DatabaseContext();
            var list = db.Expenses.Include(x => x.User).ToList()
                .GroupBy(x => x.User.Username).ToList();

            List<ReportExpenseViewModel> model = new List<ReportExpenseViewModel>();

            foreach (var g in list)
            {
                ReportExpenseViewModel item = new ReportExpenseViewModel();
                item.Username = g.Key;
                item.Total = g.Sum(x => x.Amount);

                model.Add(item);
            }

            return View(model);
        }
    }
}
