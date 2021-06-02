# Card Game Sample

### CardAPI.cs

This class abstracts away the API calls into their own class. This is the interface into the API. No other classes should use HttpClient to connect to the card server.

```cs
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;

namespace CardDemo2.Models
{

    public class CardAPI
    {
        // We want to return a string, but because we're async, we wrap Task<> around the string return type.
        public static async Task<string> GetNewDeck()
        {
            HttpClient client = new HttpClient();
            client.BaseAddress = new Uri("https://deckofcardsapi.com");
            var response = await client.GetAsync("/api/deck/new/shuffle/?deck_count=1");
            ShuffleResults cards = await response.Content.ReadAsAsync<ShuffleResults>();
            return cards.deck_id;
        }

        public static async Task<Hand> DrawFiveCards(string deck_id)
        {
            HttpClient client = new HttpClient();
            client.BaseAddress = new Uri("https://deckofcardsapi.com");
            var response = await client.GetAsync($"/api/deck/{deck_id}/draw/?count=5");
            DrawResults drew = await response.Content.ReadAsAsync<DrawResults>();

            Hand hnd = new Hand();

            foreach (DrawResultsCard c in drew.cards)
            {
                // Each card in this array has a value and a suit
                Card newc = new Card();
                newc.Suit = c.suit[0].ToString();
                switch (c.value)
                {
                    case "ACE":
                        newc.Rank = 14;
                        break;
                    case "KING":
                        newc.Rank = 13;
                        break;
                    case "QUEEN":
                        newc.Rank = 12;
                        break;
                    case "JACK":
                        newc.Rank = 11;
                        break;
                    default:
                        newc.Rank = Int32.Parse(c.value);
                        break;
                }
                newc.Image = c.image;
                hnd.Cards.Add(newc);
            }

            return hnd;

        }
    }

    // These classes are for retrieving data from the API

    // This class is only used to retrieve a new shuffled deck id from the API
    public class ShuffleResults
    {
        public bool success { get; set; }
        public string deck_id { get; set; }
        public int remaining { get; set; }
        public bool shuffled { get; set; }

        //public static string CurrentDeckId;

    }

    // This class is only used to retrieve a set of cards
    public class DrawResults
    {
        public bool success { get; set; }
        public string deck_id { get; set; }
        public List<DrawResultsCard> cards { get; set; }
        public int remaining { get; set; }
    }

    public class DrawResultsCard
    {
        public string code { get; set; }
        public string image { get; set; }
        public string value { get; set; }
        public string suit { get; set; }
    }

}
```

### Hand.cs

This is our "real" model. The other classes are just used to retrieve data from the API server.

```cs
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CardDemo2.Models
{

    public class AnotherCardGame
    {
        // Here is where you would create a different game, like the FiveCardDraw class below.
    }

    public class FiveCardDraw
    {
        public string deck_id;
        public List<Hand> Hands = new List<Hand>();

        public async Task CreateDeck()
        {
            deck_id = await CardAPI.GetNewDeck();
        }

        public async Task Deal()
        {
            Hands = new List<Hand>();
            Hand left = await CardAPI.DrawFiveCards(deck_id);

            // To test, try something like this to fake a flush:
            //left.Cards[0].Suit = "D";
            //left.Cards[1].Suit = "D";
            //left.Cards[2].Suit = "D";
            //left.Cards[3].Suit = "D";
            //left.Cards[4].Suit = "D";
            //
            // or this to fake a straight:
            //left.Cards[0].Rank = 3;
            //left.Cards[1].Rank = 4;
            //left.Cards[2].Rank = 5;
            //left.Cards[3].Rank = 6;
            //left.Cards[4].Rank = 7;

            left.PlayerName = "Fred";
            Hand right = await CardAPI.DrawFiveCards(deck_id);
            right.PlayerName = "Sally";
            Hands.Add(left);
            Hands.Add(right);
        }

        // TIP: Instead of returning the name or index of who won,
        // you might return the actual Hand instance of who won.
        public string DetermineWinner()
        {
            if (Hands[0].GetValue() > Hands[1].GetValue())
            {
                // Hands[0] wins
                return Hands[0].PlayerName;
            }
            else if (Hands[1].GetValue() > Hands[0].GetValue())
            {
                // Hands[1] wins
                return Hands[1].PlayerName;
            }
            else
            {
                // Tie or Draw
                return "Draw";
            }
        }

    }


    public enum HandValue
    {
        None,
        Straight,
        Flush
    }

    public class Hand
    {
        public string PlayerName { get; set; }

        // For now we're assuming there will always be five cards in the hand
        public List<Card> Cards = new List<Card>();

        public HandValue GetValue()
        {
            // Check if it's a flush. If so just return Flush
            // Look at the indexes carefully here. I'm comparing each one to the first. That's sufficient to decided if they're all equal.
            if (Cards[0].Suit == Cards[1].Suit && Cards[0].Suit == Cards[2].Suit && Cards[0].Suit == Cards[3].Suit && Cards[0].Suit == Cards[4].Suit)
            {
                return HandValue.Flush;
            }

            // For Straight:
            // 1. Find the minimum
            // 2. Loop through next four cards higher than minimum and see if they're all present

            int minimum = 15;
            foreach (Card cd in Cards)
            {
                if (cd.Rank < minimum)
                {
                    minimum = cd.Rank;
                }
            }

            // Think this through: Why are we starting out assuming foundStraight is true?
            bool foundStraight = true;
            for (int cur = minimum + 1; cur <= minimum + 4; cur++) // Counter for what we're looking for
            {
                bool foundMatch = false;
                // Now step through each card to find a match
                foreach (Card cd in Cards)
                {
                    if (cd.Rank == cur)
                    {
                        foundMatch = true;
                    }
                }
                if (foundMatch == false)
                {
                    foundStraight = false;
                    break;
                }
            }

            if (foundStraight)
            {
                return HandValue.Straight;
            }

            return HandValue.None;
        }
    }

    public class Card
    {
        // Suits can be H C S D
        public string Suit { get; set; }
        public int Rank { get; set; }
        public string Image { get; set; }
    }
}
```

### HomeController.cs

We're saving away the new card game into a static variable in the controller. This works if we only want one game.
Later we'll explore how to let different logged in users each have their own game.

```cs
using CardDemo2.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;

namespace CardDemo2.Controllers
{
    public class HomeController : Controller
    {
        public FiveCardDraw CurrentGame;
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public async Task<IActionResult> Index()
        {
            CurrentGame = new FiveCardDraw();
            await CurrentGame.CreateDeck();

            await CurrentGame.Deal();

            return View(CurrentGame);
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
```

### Index.cshtml

This is a really basic view just to show the cards and who won.

```cs
@model FiveCardDraw
@{
    ViewData["Title"] = "Home Page";
}

<div class="text-center">
    <h1 class="display-4">Welcome</h1>
    <p>Learn about <a href="https://docs.microsoft.com/aspnet/core">building Web apps with ASP.NET Core</a>.</p>
</div>

@foreach (Hand hnd in Model.Hands)
{
    <h2>@hnd.PlayerName</h2>
    foreach (Card crd in hnd.Cards)
    {
        <img src="@crd.Image" /><br />
    }
}

Winner: @(Model.DetermineWinner())
```
