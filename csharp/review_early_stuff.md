# Review of Basic Topics in C#

```cs
//
// Boolean (bool)
// A bool variable has two choices for values: true or false
Console.WriteLine("Boolean tests");
bool goagain = true;
Console.WriteLine(goagain); // When we run this, we will see in our output True
goagain = false;
Console.WriteLine(goagain); // Expect False

// How to "flip" a boolean from true to false or vice versa
goagain = !goagain;         // Was false, so now true
Console.WriteLine(goagain);

//
// Integers (int)
// Roughly four billion possible choices
Console.WriteLine();
Console.WriteLine("Integer tests");
int count = 10;
Console.WriteLine(count);

// Operators: increment and decrement
count++;   // same as count = count + 1. (A shorthand)
Console.WriteLine(count); // Expect 11

count *= 2;  // Same as count = count * 2
Console.WriteLine(count);  // Expect 22

//
// Single character (char)
// We use the single quotes around it, and only one character
// (Don't need to know this for the assessment: These are "unicode" characters. You can google it.)
Console.WriteLine();
Console.WriteLine("Character tests");
char ch = 'A';
Console.WriteLine(ch);
ch = '[';
Console.WriteLine(ch);
ch = '仓';
Console.WriteLine(ch);
ch = '俿';
Console.WriteLine(ch);  // The console unfortunately doesn't handle full unicode

//
// Floating Point Characters (double, float)
// Most people just use double
Console.WriteLine();
Console.WriteLine("Floating Point (mainly double) tests");
double q = 3.14;
Console.WriteLine(q);

// The built-in Math library works mostly with doubles
// How about square root

double r = Math.Sqrt(q);
Console.WriteLine(r);

q = Math.PI; // A much better approximation of PI
Console.WriteLine(q);

//
// Decimal type for handling money!
// (Too many programmers don't know this and use floating point! No!)
//
Console.WriteLine();
Console.WriteLine("Decimal tests");
decimal balance = 1000m;  // Add a suffix of "m" which likely means "money"
decimal rate = .025m;     // 2.5%
Console.WriteLine(balance * rate); // Calculate the interest

//
// Arrays
// To declare an array, you start with the type that it holds followed by [].
// That entire thing, e.g. int[] , is the type.
// That is unique to C#. Earlier languages you put the brackets after the variable name.

Console.WriteLine();
Console.WriteLine("Array tests");
int[] numbers = { 10, 20, 15, 8, 3 };
numbers[2] = 16; // Change the third one from 15 to 16. Third one has index 2.
Console.WriteLine(numbers[2]); // Expect to see 16

Console.WriteLine("Loop!");
for (int index = 0; index < numbers.Length; index++)
{
	Console.WriteLine(numbers[index]);
}

// Practice: Write a loop that adds one to each element in the array,
// so the first element changes from 10 to 11, second from 20 to 21.

//
// Strings
// Basic string concepts, plus string manipulations
// Search for substring, append to a string (sort of), split a string,
// join an array of strings back into a string
// Strings are technically objects stored in shared memory, but C#
// does a good job of hiding that, so we don't really need to know that.
// Strings cannot be changed: "immutable".

string words = "The quick brown fox jumped over the lazy dogs.";
Console.WriteLine(words);

string[] parts = words.Split();
foreach (string word in parts)
{
	Console.WriteLine(word);
}

// Join them back together into a new string
string copy = string.Join(';', parts);
Console.WriteLine(copy);

// Search for a substring "fox"
int pos = words.IndexOf("fox");
Console.WriteLine($"The word fox occurs at position {pos}");

// Determine if a word exists
pos = words.IndexOf("cat");
if (pos >= 0)
{
	Console.WriteLine("Found it!");
}
else
{
	Console.WriteLine("cat does not exist in this sentence.");
}

// Append to a string
words += " No cats allowed.";
Console.WriteLine(words);

//
// Lists
// (This is a great example, together with the Rectangle Class!!!)
// Make sure you really understand EVERYTHING in this section
//

Console.WriteLine();
Console.WriteLine("List Tests (and class instances and ToString)");
List<Rectangle> mylist = new List<Rectangle>();
mylist.Add(new Rectangle("First", 10.5, 20.6));
mylist.Add(new Rectangle("Second", 25.6, 13.2));
mylist.Add(new Rectangle("Third", 12.9, 11.3));

foreach (Rectangle rect in mylist)
{
	Console.WriteLine(rect);
}

//
// Dictionaries
// Remember dictionaries map from one thing to another.
// But we can also think of them as "key-value pairs".
// Try to embrace *both* ways of looking at it.

Console.WriteLine();
Console.WriteLine("Dictionary Practice");
Dictionary<string, int> spelling = new Dictionary<string, int>();

// Two ways to add to the dictionary
spelling["One"] = 1;     // The string "One" maps to 1. OR think of it as we added the pair ("One", 1)
spelling["Fifty"] = 50;

// or...

spelling.Add("One Hundred", 100); // Same effect but we're adding this mapping as a single pair.

// Let's loop!
//foreach (var pair in spelling)
// In general we just use "var" here. But for this example, let's drill down in and
// see what the actual type is and use it. But in the future, just use var.
foreach (KeyValuePair<string, int> pair in spelling)
{
	Console.WriteLine($"{pair.Key} maps to {pair.Value}");
}


//
// Enums
// Just like "bool" can hold two possible values, enums have a limited amount.
// This "Season" example allows for four different values.
// Technically they're stored as numbers, starting with 0.

Console.WriteLine();
Console.WriteLine("Enum tests");
Season now = Season.Summer;
Console.WriteLine(now);

enum Season
{
	Winter,
	Spring,
	Summer,
	Autumn
}

class Rectangle
{
	public string Name;
	public double Length;
	public double Height;
	public Rectangle(string _Name, double _Length, double _Height)
	{
		Name = _Name;
		Length = _Length;
		Height = _Height;
	}
	// To add a ToString, start typing public override and double-click ToString
	// And then remove the code it automatically included

	public override string ToString()
	{
		return $"{Name}: Length {Length} Height {Height} Area: {Length * Height} Perimeter: {2 * Length + 2 * Height}";
	}
}

```
