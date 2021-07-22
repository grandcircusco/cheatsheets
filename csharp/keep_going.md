Here's the Keep Going function that we build together in class:

```cs
static bool KeepGoing()
{
	while (true)
	{
		// Print out message asking if user wants to continue
		Console.WriteLine("Would you like to go again? (y/n)");
		// Ask the user for their input
		string response = Console.ReadLine();
		response = response.ToLower();
		// Check if they typed "y". If so, return true.
		// Otherwise return false.   YES   yes
		if (response == "y" || response == "yes")
		{
			return true;
		}
		else if (response == "n" || response == "no")
		{
			return false;
		}
		else
		{
			Console.WriteLine("Please enter y or n");
		}
	}
}
```

# Example Usage

And here it is used in an example. Suppose we want to print out the numbers from 1 to 10.
Before adding in the KeepGoing stuff, **get the program working for a single time**. So first
we create a new project and our Program.cs would look like this:

```cs
using System;

namespace KeepGoingPractice
{
	class Program
	{
		static void Main(string[] args)
		{
			Console.WriteLine("Hello World!");
		}
	}
}
```

We remove the Hello World line, and then add our loop so it works.

```cs
using System;

namespace KeepGoingPractice
{
	class Program
	{
		static void Main(string[] args)
		{
			Console.WriteLine("Welcome to my looper!");

			for (int i=1; i<=10; i++)
			{
				Console.WriteLine(i);
			}
      
		}
	}
}
```

After your program works, THEN you can add in the KeepGoing stuff.

So next, we identify which lines we want to run over and over. We want to run our loop part,
that is, the "for" line through its own closing bracket. You don't need to add these comments,
but here they are so you can see them:

```cs
using System;

namespace KeepGoingPractice
{
	class Program
	{
		static void Main(string[] args)
		{
			Console.WriteLine("Welcome to my looper!");

			for (int i=1; i<=10; i++)    // REPEAT FROM HERE
			{
				Console.WriteLine(i);
			}                            // DOWN TO HERE

		}
	}
}
```

Now put a ```do``` before the first line, and surround the lines with open and close curlies like below; in
other words:

**The code that you want to repeat will go inside the do statement's curly brackets.**

```cs
using System;

namespace KeepGoingPractice
{
	class Program
	{
		static void Main(string[] args)
		{
			Console.WriteLine("Welcome to my looper!");

			do
			{
      
				for (int i = 1; i <= 10; i++)    // REPEAT FROM HERE
				{
					Console.WriteLine(i);
				}                                // DOWN TO HERE
        
			}


		}
	}
}

```

and then add a ```while``` immediately after the do's closing curly:

```cs
using System;

namespace KeepGoingPractice
{
	class Program
	{
		static void Main(string[] args)
		{
			Console.WriteLine("Welcome to my looper!");

			do
			{
      
				for (int i = 1; i <= 10; i++)    // REPEAT FROM HERE
				{
					Console.WriteLine(i);
				}                                // DOWN TO HERE
        
			} while (KeepGoing());


		}
	}
}
```

And finally paste in the KeepGoing function. (You can optionally add this function in before you put in the do-while stuff,
as long as you put this function before or after the main function -- not inside the main function.)

```cs
using System;

namespace KeepGoingPractice
{
	class Program
	{
		static bool KeepGoing()
		{
			// Version 0.04. (Agile Programming)
			while (true)
			{
				// Print out message asking if user wants to continue
				Console.WriteLine("Would you like to go again? (y/n)");
				// Ask the user for their input
				string response = Console.ReadLine();
				response = response.ToLower();
				// Check if they typed "y". If so, return true.
				// Otherwise return false.   YES   yes
				if (response == "y" || response == "yes")
				{
					return true;
				}
				else if (response == "n" || response == "no")
				{
					return false;
				}
				else
				{
					Console.WriteLine("Please enter y or n");
				}
			}
		}

		static void Main(string[] args)
		{
			Console.WriteLine("Welcome to my looper!");

			do
			{
      
				for (int i = 1; i <= 10; i++)    // REPEAT FROM HERE
				{
					Console.WriteLine(i);
				}                                // DOWN TO HERE
        
			} while (KeepGoing());


		}
	}
}
```

