# Basic methods:

```cs
using System;

namespace FunctionDemo1
{
    class Program
    {

        // Suggestion: Trace through this code line by line with the debugger.
        //             Use the "step into" button to go into the functions.
        //             Watch the values of your variables in the "Locals" pane.

        // Example of function that takes two int parameters and returns an int
        static int Multiply(int x, int y)
        {
            int product = x * y;
            return product;
        }

        // Example of function that takes three int parameters and returns an int
        static int SpecialFormula(int x, int y, int z)
        {
            int a = x * y + z;
            return a;
        }

        // Example of function that doesn't return anything
        static void Printout(string name)
        {

            if (name == "Cogswell")
            {
                Console.WriteLine("Sorry Teacher Cogswell, only students allowed here.");
                return;
            }
            Console.WriteLine($"Welcome {name}!");
            Console.WriteLine("This is my program!");
        }

        static void Main(string[] args)
        {
            string name = Console.ReadLine();
            Printout(name);

            int p = 10;
            int q = 20;
            int r = Multiply(p, q);
            Console.WriteLine(r);

            int s = 30;
            int t = SpecialFormula(s, p, q);
            Console.WriteLine(t);

            // Call the function with actual values
            int u = Multiply(3, 15);
            Console.WriteLine(u);

        }
    }
}
```

Some basic methods demonstrating difference between "by value" and "by reference":

```cs
using System;

namespace MoreOnMethods
{
    class Program
    {
        // Pass by value
        static void demo1(int x)
        {
            x++;
            Console.WriteLine($"Inside demo1, added 1 to get {x}!");
        }

        // Pass by reference
        static void demo2(ref int x)
        {
            x++;
            Console.WriteLine($"Inside demo2, uses 'by ref' and added 1 to get {x}!");
        }

        static void Main(string[] args)
        {
            // Run the code and watch the output carefully

            int n = 3;
            Console.WriteLine($"In main, starting out n is {n}");

            // demo1 is by value, so it can't change the value of n outside of demo1
            demo1(n);
            Console.WriteLine($"In main, after calling demo1, n is {n}");

            // demo2 is by ref, so it CAN change the value of n outside of demo2
            demo2(ref n);
            Console.WriteLine($"In main, after calling demo2, n is {n}");

            demo2(ref n);
            Console.WriteLine($"In main, after calling demo2 again, n is {n}");

        }
    }
}
```
