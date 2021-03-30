# Sample Class

The class below demonstrates:

* Static variables
* Static methods
* Member variables
* Member methods
* Constructor
* Adding instances to a list
* Looping through the list and checking for certain criteria

```cs
using System;
using System.Collections.Generic;

namespace ConstructorDemo
{
    class CheckingAccount
    {
        // Static variable shared between all instances
        static public decimal AnnualFee = 5.00m;

        // Member variables
        public decimal Balance = 100.00m;
        public decimal OverdraftFee = 25.00m;
        public string CustomerName;

        // Constructor
        public CheckingAccount(decimal bal, decimal over, string custname)
        {
            Balance = bal;
            OverdraftFee = over;
            CustomerName = custname;
        }

        // Member methods/functions
        public void Deposit(decimal amount)
        {
            Balance += amount;
        }

        // Static function that can only access static variables
        static public void PrintAnnualFee()
        {
            Console.WriteLine(CheckingAccount.AnnualFee);
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            List<CheckingAccount> accounts = new List<CheckingAccount>();
            accounts.Add(new CheckingAccount(100.0m, 20.00m, "Jack Johnson"));
            accounts.Add(new CheckingAccount(1000.0m, 10.00m, "Suzie Smith"));
            accounts.Add(new CheckingAccount(500.0m, 15.00m, "George Washington"));

            foreach (CheckingAccount cur in accounts)
            {
                if (cur.Balance >= 500)
                {
                    Console.WriteLine($"{cur.CustomerName} has balance {cur.Balance}");
                }
            }
        }
    }
}
```
