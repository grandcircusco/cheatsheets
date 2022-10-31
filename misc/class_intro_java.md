# Java Version of the Pen class and some samples

First, here's the Pen.java class:

```java
class Pen {
    public String InkColor;
    public String PointType;
    public String Brand;
    public double InkAmount;

    public void Draw()  {
        this.InkAmount = this.InkAmount - 1.0;
    }

    public void Refill()  {
        this.InkAmount = 10.0;
    }
}
```

And here's the Main.java class that runs the program:
```java
class Main {
    public static void main(String[] args) {
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
        System.out.println(String.format("%s %s by %s with ink amount %s",
            FirstPen.InkColor, FirstPen.PointType, FirstPen.Brand,
            FirstPen.InkAmount));
        System.out.println(String.format("%s %s by %s with ink amount %s",
            SecondPen.InkColor, SecondPen.PointType, SecondPen.Brand,
            SecondPen.InkAmount));

        // Now let's call some methods of the two pens.

        System.out.println(FirstPen.InkAmount);
        FirstPen.Draw();
        FirstPen.Draw();
        SecondPen.Draw();
        System.out.println("First pen's ink level:");
        System.out.println(FirstPen.InkAmount);
        System.out.println("Second pen's ink level:");
        System.out.println(SecondPen.InkAmount);
        SecondPen.Refill();
        System.out.println("Second pen got a refill! Its level is now:");
        System.out.println(SecondPen.InkAmount);
    }
}
```
