# Exception Handling

The following code causes an unhandled exception:

```cs
int num = Int32.Parse("Hello");
```

Here's the error you'll see:

```
Unhandled exception. System.FormatException: Input string was not in a correct format.
```
Here's how you add a handler:

```cs
try {
    int num = Int32.Parse("Hello");
}
catch (Exception e) {
    Console.WriteLine("That was not a valid integer.");
}
```

We used a generic Exception class. However, we can also specify which exception to catch. Look at the exception name in the original error and use that:

```cs
try {
    int num = Int32.Parse("Hello");
}
catch (FormatException e) {
    Console.WriteLine("That was not a valid integer.");
}
```

You can use an exception in a loop. The following will loop as long as the user is entering an invalid number.

```
int num = 0;
bool good = false;
while (!good) {
    try {
        Console.Write("Please enter a number:");
        num = Int32.Parse(Console.ReadLine());
        good = true;
    }
    catch (Exception) {
        Console.WriteLine("Please enter a valid number.");
    }
}
Console.WriteLine($"You entered {num}");
```

Example session:
```
Please enter a number:abc
Please enter a valid number.
Please enter a number:123   
You entered 123
```
