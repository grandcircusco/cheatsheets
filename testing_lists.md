(I'll add more notes on this soon, but I wanted to get these samples up ASAP)

Here's a sample class called Person. Notice the class contains a static list, along with static methods for adding and searching that list.

```cs
public class Person
{
	public string Department;
	public string Name;

	public static List<Person> AllItems = new List<Person>();
	public static void Add(Person someone)
	{
		AllItems.Add(someone);
	}

	// Search for all items with a given number
	public static List<Person> Find(string searchDept)
	{
		List<Person> results = new List<Person>();
		foreach (Person item in AllItems)
		{
			if (item.Department == searchDept)
			{
				results.Add(item);
			}
		}
		return results;
	}
}
```

Now let's test out that the add and search really work. We'll add three people to the list, two people in department IT and one person in department ACCT.
We'll then search for the IT department and make sure we get back 2 people.

```cs
[Fact]
public void TestSearch()
{
	// Since the list is static, it stays around between tests.
	// Let's clear it out first.
	Person.AllItems.Clear();

	Person m1 = new Person() { Name = "Fred", Department = "IT" };
	Person.Add(m1);

	m1 = new Person() { Name = "Sally", Department = "ACCT" };
	Person.Add(m1);

	m1 = new Person() { Name = "Julia", Department = "IT" };
	Person.Add(m1);

	// Search for people in Department 1. Should get back 2 people.
	int expected = 2;
	int actual = Person.Find("IT").Count;
	Assert.Equal(expected, actual);
}
```

Or we can do multiple tests using Theory/InlineData. Let's search for:

IT should give us back 2 items
ACCT should give us back 1 item
ADMIN should give us back 0 items

```cs
[Theory]
[InlineData("IT", 2)]
[InlineData("ACCT", 1)]
[InlineData("ADMIN", 0)]
public void TestSearches(string Dept, int expected)
{
	// Since the list is static, it stays around between tests.
	// Let's clear it out first.
	Person.AllItems.Clear();

	Person m1 = new Person() { Name = "Fred", Department = "IT" };
	Person.Add(m1);

	m1 = new Person() { Name = "Sally", Department = "ACCT" };
	Person.Add(m1);

	m1 = new Person() { Name = "Julia", Department = "IT" };
	Person.Add(m1);

	// Search for people in Department 1. Should get back 2 people.
	int actual = Person.Find(Dept).Count;
	Assert.Equal(expected, actual);
}
```
