# Overloading Functions

When you overload a function, you're technically making two separate functions.

But they have the same name, just different parameters. So when you're calling them, they feel like a single function that accepts different parameters.

```
using System;

namespace Overloading1
{
    class Program
    {

        // method (or function) overloading

        static int sum(int x, int y) // Method "signature" is two integers
        {
            return x + y;
        }

        static int sum(int x, int y, int z) // Method signature of three integers
        {
            return x + y + z;
        }

        /*
         * Not allowed: Why not? Look closely at the differenc in this and the first sum function.
         * 
        static string sum(int x, int y)
        {
            return "Something";
        }
        */

        static string sum(string first, string last)
        {
            return first + " " + last;
        }


        static void Main(string[] args)
        {

            Console.WriteLine(10);
            Console.WriteLine("Hello");
            Console.WriteLine();

            // We have "two" calls to the sum function. Or do we?
            // They feel like the same function but with different parameters (two ints vs three ints).
            // That's the goal, so it "feels" like we're calling the same function but
            // are in fact calling two separate functions.

            Console.WriteLine(sum(10,20));
            Console.WriteLine(sum(10, 20, 30));

        }
    }
}
```
