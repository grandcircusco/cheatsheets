# Overriding the ToString method

```
using System;

namespace ToStringDemo
{

    class Employee
    {
        public string FirstName;
        public string LastName;
        public override string ToString()
        {
            return $"{FirstName} {LastName}";
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            Employee emp = new Employee();
            emp.FirstName = "Julia";
            emp.LastName = "Johnson";
            Console.WriteLine(emp);

            string output = emp.ToString();
            Console.WriteLine(output);
        }
    }
}
```
