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

Another entire sample for books:

```cs
using System;
using System.Collections.Generic;

namespace Books
{
    class Program
    {
        static void Main(string[] args)
        {

            Dictionary<string, int> books = new Dictionary<string, int>();
            books.Add("Gulliver's Travels", 500);
            books.Add("Moby Dick", 200);
            books.Add("Alice in Wonderland", 150);
            books.Add("Huckleberry Finn", 320);

            // Books I've read
            // Two lists
            // One is titles
            // Another is pages that I read
            // Example
            //    Gulliver's Travels    100
            //    Moby Dick             200
            //
            //    Total Pages read:     300

            List<string> names = new List<string>();
            List<int> pages = new List<int>();
            names.Add("Gulliver's Travels");
            pages.Add(100);

            names.Add("Moby Dick");
            pages.Add(200);

            while (true)
            {
                Console.WriteLine("\nBooks I have read and number of pages\n");
                int total = 0;
                for (int i = 0; i < pages.Count; i++)
                {
                    Console.WriteLine($"{names[i]} read {pages[i]}");
                    total = total + pages[i];
                }
                Console.WriteLine(total);

                Console.WriteLine("\nWhat book did you read next?\n");
                foreach (var text in books)
                {
                    Console.WriteLine($"{text.Key} has {text.Value} pages.");
                }

                // Let the user type in a book
                string entry = Console.ReadLine();
                // Make sure it's a book in the list
                if (books.ContainsKey(entry) == false)
                {
                    Console.WriteLine("Sorry, that book is not available.");
                }
                else
                {
                    // Let the user type in the number of pages they read
                    Console.Write("How many pages did you read? ");
                    int count = Int32.Parse(Console.ReadLine());
                    names.Add(entry);
                    pages.Add(count);
                }

            }

        }
    }
}
```
