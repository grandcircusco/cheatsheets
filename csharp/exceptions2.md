# Advanced Exceptions


Run the following code and notice the errors you get:
```cs
using System;

namespace TryCatchDemo4
{
    class Program
    {
        static void Main(string[] args)
        {
            int[] nums = { 5, 10, 15, 20 };
            string entry = Console.ReadLine();
            int index = Int32.Parse(entry);
            Console.WriteLine(nums[index]);
        }
    }
}
```

Try entering something that isn't an integer, such as abc:
```
abc
Unhandled exception. System.FormatException: Input string was not in a correct format.
   at System.Number.ThrowOverflowOrFormatException(ParsingStatus status, TypeCode type)
   at System.Number.ParseInt32(ReadOnlySpan`1 value, NumberStyles styles, NumberFormatInfo info)
   at System.Int32.Parse(String s)
   at TryCatchDemo4.Program.Main(String[] args) in D:\gc\DevBuild202103\dev\Week4\TryCatchDemo4\Program.cs:line 12
Press any key to continue . . .
```

Try entering a valid number, but one that is outside the bounds of the array:

```
50
Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
   at TryCatchDemo4.Program.Main(String[] args) in D:\gc\DevBuild202103\dev\Week4\TryCatchDemo4\Program.cs:line 12
```
Here we're catching the two different types of exceptions:
```
using System;

namespace TryCatchDemo4
{
    class Program
    {
        static void Main(string[] args)
        {
            int[] nums = { 5, 10, 15, 20 };
            string entry = Console.ReadLine();
            try
            {
                int index = Int32.Parse(entry);
                Console.WriteLine(nums[index]);
            }
            catch (FormatException)
            {
                Console.WriteLine("Sorry, that's not a valid integer.");
            }
            catch (IndexOutOfRangeException)
            {
                Console.WriteLine($"Please make sure the number is between 0 and {nums.Length}");
            }
        }
    }
}
```
