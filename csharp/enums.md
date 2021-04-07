# Enum sample

Notes:

* Each enum is actually stored as a number. The first one gets stored as 0, then 1, and so on, unless you specify others. (Read the docs for how to do specify numbers.)

* In C#, when you print out an enum, it prints the word, e.g. "Heart" or "Spade" instead of 0 or 1. Other languages will just print out the underlying value. Remember this if you work in other languages.

```
using System;
using System.Collections.Generic;

namespace CardGame
{

    // We are creating a type, and listing the choices that variables of that type can hold.

    enum Suit
    {
        Heart,
        Spade,
        Club,
        Diamond,
    }


    class Program
    {
        static void Main(string[] args)
        {
            // Suits: Hearts, Spades, Clubs, Diamonds

            List<Suit> cards = new List<Suit>();

            cards.Add(Suit.Heart);
            cards.Add(Suit.Club);
            cards.Add(Suit.Heart);
            cards.Add(Suit.Spade);
            cards.Add(Suit.Spade);

            foreach (Suit card in cards)
            {
                Console.WriteLine(card);
            }

        }
    }
}
```
