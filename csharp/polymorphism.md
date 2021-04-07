# Polymorphism Samples

Here we have three classes; a base class Car and two classes derived from it:

* **Car** is the first.
* **Compact** is derived from Car.
* **SUV** is derived from Car.

This establishes two "is a" relationships:

* Compact *is a* Car
* SUV *is a* Car

```
class Car
{
    public int VIN;
    public virtual void Info()
    {
        Console.WriteLine("Car");
    }
}

class Compact : Car
{
    public string name;
    public override void Info()
    {                
        Console.WriteLine($"Compact: {name}");
    }
}

class SUV : Car
{
    public override void Info()
    {
        Console.WriteLine("SUV");
    }
}
```

Notes:

* The base class, Car, has a virtual function called Info that derived classes can override (not overload! Different word!)
* Compact class overrides Info to provide its own output, which includes a public member called name.
* SUV class overrides Info with its own output.

When we create a variable that holds a Car instance, we can put a Car instance in it, or an instance of any class derived from Car.

Example main:

```
static void Main(string[] args)
{

    Car nextcar;
    int choice = 1; // Try setting this differently when you test it
    if (choice == 1)
    {
        nextcar = new Compact("Fred");
    }
    else
    {
        nextcar = new SUV();
    }
    nextcar.Info();

}
```

Try changing the code; instead of putting 1 in choice, put a 2 in it and see how the code runs. Trace it through in the debugger.

Notes:
* When we create an instance of Compact and save it in a Car variable, we can't directly access the members unique to Compact.
* If you need to access Compact's members, you can cast it to Compact, but be careful! If you cast something that isn't a Compact to a Compact, you'll get a runtime exception.

```


