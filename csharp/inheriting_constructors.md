This sample shows how to wire up a constructor inside both a base class and derived class.

Pay special attention to the constructor lines in the classes, as well as the calls to "new" in the main, and the number of parameters going into each.

Remember: When you create an instance of a class, C# needs to first "construct" any base classes first. In this code, that means when you construct a new Compact, C# first has to run a constructor in Car.

```
using System;

namespace ConstDemo
{
    class Car
    {
        public string Make;
        public string Model;

        public Car(string pMake, string pModel)
        {
            Make = pMake;
            Model = pModel;
        }
    }

    class Compact : Car
    {
        public int Hatchbacksize;

        // Try this:
        // public Compact() : base("abc", "def")


        public Compact(string pMake, string pModel, int pHatchbacksize) : base(pMake, pModel)
        {
            Hatchbacksize = pHatchbacksize;
        }
    }


    class Program
    {

        static void Main(string[] args)
        {

            Car mycar = new Car("Chevy", "Nova");
            Console.WriteLine(mycar.Make);
            Console.WriteLine(mycar.Model);

            Compact secondcar = new Compact("Honda", "Civic", 30);
            Console.WriteLine(secondcar.Make);
            Console.WriteLine(secondcar.Model);
            Console.WriteLine(secondcar.Hatchbacksize);

        }
    }
}
```
