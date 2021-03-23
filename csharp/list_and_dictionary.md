# List and Dictionary Demo

Entire sample:

```cs
using System;
using System.Collections.Generic;

namespace ListsDemo
{
    class Program
    {
        static void Main(string[] args)
        {

            // List of numbers
            // Lists have indexes like [0], [1], [2], etc.

            List<int> mynumbers = new List<int>();
            mynumbers.Add(150);
            mynumbers.Add(10);
            mynumbers.Add(-50);

            for (int i=0; i<mynumbers.Count; i++)
            {
                Console.WriteLine($"{i},{mynumbers[i]}");
            }

            Console.WriteLine("\nNext list\n");

            List<string> mystrings = new List<string>();
            mystrings.Add("Hello");
            mystrings.Add("Everybody");

            for (int i=0; i<mystrings.Count; i++)
            {
                Console.WriteLine($"{i},{mystrings[i]}");
            }

            Console.WriteLine("\nNow a dictionary\n");

            Dictionary<string, string> mycars = new Dictionary<string, string>();
            mycars["Chevy"] = "blue";
            mycars["Honda"] = "white";
            mycars["Toyota"] = "green";
            foreach (var vehicle in mycars)
            {
                Console.WriteLine($"{vehicle.Key},{vehicle.Value}");
            }
        }
    }
}
```

