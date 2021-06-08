```cs
using System;

namespace VetDemo
{
    /*
     * SPECS:
     *     We are going to model a vet and pets type
     *     Create a Pet class that has a name property, and a talk method
     *     Create a Cat class derived from Pet that overrides talk
     *     Create a Dog class derived from Pet that overrides talk
     *     
     *     Create a Vet method that takes a Pet as a parameter and calls Talk.
     */

    class Pet
    {
        public string Name;
        public virtual void Talk()
        {
            Console.WriteLine("Hello");
        }
    }

    class Cat : Pet
    {
        public override void Talk()
        {
            Console.WriteLine("Meow!");
        }
    }

    class Dog : Pet
    {
        public override void Talk()
        {
            Console.WriteLine("Bark");
        }
    }

    class Program
    {
        static void Vet(Pet pt)
        {
            Console.WriteLine($"Welcome {pt.Name}!");
            pt.Talk();
        }

        static void Main(string[] args)
        {
            Cat c1 = new Cat();
            c1.Name = "Mittens";

            Cat c2 = new Cat();
            c2.Name = "Puffy";

            Dog d1 = new Dog();
            d1.Name = "Fido";

            Vet(c1);
            Vet(c2);
            Vet(d1);
        }
    }
}
```
