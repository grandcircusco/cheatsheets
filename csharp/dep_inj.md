# Polymorphism and Dependency Injection Demos

This code demonstrates two important concepts, polymorphism and dependency injection. Carefully read the comments in the code to understand what it's doing.

```cs
using System;
using System.Collections.Generic;

namespace DepInject1
{
    // Every car has an engine. So we'll make two classes: Engine and Car
    // And we'll create an instance of Engine in Car's constructor.

    abstract class Engine
    {
        public virtual void Run()
        {
            Console.WriteLine("Engine is running!");
        }
    }

    class EconomyEngine : Engine
    {
        public override void Run()
        {
            Console.WriteLine("Running with good gas mileage!");
        }
    }

    class TurboEngine : Engine
    {
        public override void Run()
        {
            Console.WriteLine("Running really fast!");
        }
    }

    class Car
    {
        Engine _engine;
        public Car(Engine pEngine)
        {
            _engine = pEngine;
        }
        public void Drive()
        {
            Console.WriteLine("Car is starting up!");
            _engine.Run();
            Console.WriteLine("Car is going!");
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            
            // Let's create an instance of EconomyEngine and store it
            // in a variable that can hold instances of EconomyEngine
            // Then we'll call the EconomyEngine's version of Run
            EconomyEngine basicengine = new EconomyEngine();
            basicengine.Run();

            // Let's create an instance of TurboEngine and store it
            // in a variable that can hold instances of TurboEngine
            // Then we'll call the TurboEngine's version of Run
            TurboEngine fastengine = new TurboEngine();
            fastengine.Run();

            // Now for something different. Let's declare a variable
            // that can hold an instance of Engine. But we're allowed
            // to store instances of derived classes, such as TurboEngine.
            // And when we call Run, it will still call the correct version,
            // in this case TurboEngine.Run.
            Engine anotherengine = new TurboEngine(); // Stored an instance of a derived class
            anotherengine.Run();   // When we called Run, the program called the correct *version* of Run

            // Using this concept we can make a list that holds instances
            // of Engine -- or instances of any class derived from Engine.
            List<Engine> engines = new List<Engine>();
            engines.Add(basicengine);
            engines.Add(fastengine);
            engines.Add(anotherengine);
            Console.WriteLine("Loop through all the engines:");
            foreach (Engine eng in engines)
            {
                // Each time we call Run, we'll call the correct version of Run.
                eng.Run();
            }


            // Dependency Injection
            // Now let's make an instance of Car. Car takes an Engine
            // as a parameter in its constructor, which means we can
            // pass an instance of any class derived from Engine.
            // Look at the code for Car.Drive. Which version of Run will
            // it call? This concept -- calling the correct version -- is
            // called "polymorphism."
            // By creating the instance of Engine (or subclass of Engine),
            // and passing it in to the constructor, we're "injecting"
            // an instance the class depends on. Thus "Dependency Injection."
            Car honda = new Car(new TurboEngine());
            honda.Drive();

            Console.WriteLine("");

            Car chevy = new Car(new EconomyEngine());
            chevy.Drive();
        }
    }
}
```
