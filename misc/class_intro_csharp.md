# C# Version of the Pen class and some samples

```cs
using System;

class Pen
{
    public string InkColor;
    public string PointType;
    public string Brand;
    public double InkAmount;

    public void Draw()
    {
        InkAmount = InkAmount - 1.0;
    }

    public void Refill()
    {
        InkAmount = 10.0;
    }
}



class Program
{

    public static void Main(string[] args)
    {
        // Let's make a first pen and fill in its properties
        Pen FirstPen = new Pen();
        FirstPen.InkColor = "Green";
        FirstPen.PointType = "Ballpoint";
        FirstPen.Brand = "Bic";
        FirstPen.InkAmount = 10.0;

        // Let's make a second pen and fill in its properties
        Pen SecondPen = new Pen();
        SecondPen.InkColor = "Blue";
        SecondPen.PointType = "Gel";
        SecondPen.Brand = "Papermate";
        SecondPen.InkAmount = 3.5;

        // Let's print out information about the two pens!

        Console.WriteLine($"{FirstPen.InkColor} {FirstPen.PointType} by {FirstPen.Brand} with ink amount {FirstPen.InkAmount}");
        Console.WriteLine($"{SecondPen.InkColor} {SecondPen.PointType} by {SecondPen.Brand} with ink amount {SecondPen.InkAmount}");

        // Now let's call some methods of the two pens.

        Console.WriteLine(FirstPen.InkAmount);
        FirstPen.Draw();
        FirstPen.Draw();
        SecondPen.Draw();
        Console.WriteLine("First pen's ink level:");
        Console.WriteLine(FirstPen.InkAmount);
        Console.WriteLine("Second pen's ink level:");
        Console.WriteLine(SecondPen.InkAmount);
        SecondPen.Refill();
        Console.WriteLine("Second pen got a refill! Its level is now:");
        Console.WriteLine(SecondPen.InkAmount);
    }
}
```
