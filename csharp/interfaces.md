# Interfaces

Look closely at the comments in the code below. Remember that an interface is *not* a base class. Classes that implement an interface do not inherit from the interface.

Instead we say the class "implements" the interface.

The interface is simply a promise, or "contract." The class agrees to include the methods listed in the interface.

Benefits:

* The compiler will stop you if you don't implement all the methods
* You can use the interface type as a parameter in a function.

```
using System;
namespace InterfaceDemo
{
    interface ICar
    {
        void Drive();
        void AddGas(int amount);
        // void ChangeTires(); // try adding this line and see what you can do to fix any errors.
    }
    class CompactCar : ICar
    {
        private int GasAmount = 0;
        public void Drive()
        {
            Console.WriteLine("I'm going somewhere");
        }
        public void AddGas(int amount)
        {
            GasAmount += amount;
        }
        // We're free to add additional methods. The interface is the bare minimum of what we promise to implement
        public void UpgradEngine()
        {
        }
    }
    class Program
    {
        // Think about: This function asks for an ICar as a parameter. So I can pass in an instance of CompactCar.
        // Let's suppose I create another class called Truck. Truck is not derived from CompactCar, and they have
        // no common class ancestors. If Truck implements ICar, then I can pass that in too.
        static void OilChange(ICar currentcar)
        {
            // Instances coming in to this function as ICar still have their other members, but this function
            // is unaware of them. So we can't call UpgradeEngine on our CompactCar, even though it exists.
            Console.WriteLine("Welcome to Oil Change Center");
            currentcar.Drive();
        }
        static void Main(string[] args)
        {
            CompactCar mycar = new CompactCar();
            mycar.Drive();
            mycar.AddGas(10);
            mycar.Drive();
            OilChange(mycar);
        }
    }
}
```
