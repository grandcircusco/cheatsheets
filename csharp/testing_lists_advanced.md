# Testing Collections: Super advanced!

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

	public static void Remove(Person someone)
	{
		AllItems.Remove(someone);
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

	// Search for people in Department IT. Should get back 2 people.
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

	// Search for people in Department IT. Should get back 2 people.
	int actual = Person.Find(Dept).Count;
	Assert.Equal(expected, actual);
}
```

Here's a test of whether the collection contains an item. Note that we're testing for the exact instance!

```cs
[Fact]
public void TestContains()
{
	// Since the list is static, it stays around between tests.
	// Let's clear it out first.

	// NOTE: Watch how in this case we're looking for
	// the EXACT object, not one with just the same fields
	Person.AllItems.Clear();

	Person fred = new Person() { Name = "Fred", Department = "IT" };
	Person.Add(fred);

	Person sally = new Person() { Name = "Sally", Department = "ACCT" };
	Person.Add(sally);

	Person julia = new Person() { Name = "Julia", Department = "IT" };
	Person.Add(julia);

	// Test if the list contains sally.
	// We're checking for the exact object we put in.
	Assert.Contains<Person>(sally, Person.AllItems);

}
```

Now here's how we can test whether an instance matches certain criteria, not necessarily an exact instance. (But be careful with this; think carefully **when** you would 
use it. Remember, these tests run under a carefully controlled set of parameters. These are not user run-time tests. One case you likely would need this is with database operations.)

```cs
[Fact]
public void TestContains2()
{
	// Since the list is static, it stays around between tests.
	// Let's clear it out first.

	Person.AllItems.Clear();

	Person fred = new Person() { Name = "Fred", Department = "IT" };
	Person.Add(fred);

	Person sally = new Person() { Name = "Sally", Department = "ACCT" };
	Person.Add(sally);

	Person julia = new Person() { Name = "Julia", Department = "IT" };
	Person.Add(julia);

	// Test if the list contains sally regardless of whether
	// it's the same original object
	Assert.Contains<Person>(Person.AllItems, item =>
	{
		return item.Name == "Sally";
	});
```

Now a couple similar tests, but does not contain. To do this we'll call our Remove method that we have in our Person class:

```cs
[Fact]
public void TestDoesNotContain()
{
	// Since the list is static, it stays around between tests.
	// Let's clear it out first.

	// NOTE: Watch how in this case we're looking for
	// the EXACT object, not one with just the same fields
	Person.AllItems.Clear();

	Person fred = new Person() { Name = "Fred", Department = "IT" };
	Person.Add(fred);

	Person sally = new Person() { Name = "Sally", Department = "ACCT" };
	Person.Add(sally);

	Person julia = new Person() { Name = "Julia", Department = "IT" };
	Person.Add(julia);

	// Let's remove Julia from the list and make sure
	// the instance was actually removed. Note that
	// we're looking for the exact same instance.

	Person.Remove(julia);

	Assert.DoesNotContain<Person>(julia, Person.AllItems);

}

[Fact]
public void TestDoesNotContain2()
{
	// Since the list is static, it stays around between tests.
	// Let's clear it out first.

	Person.AllItems.Clear();

	Person fred = new Person() { Name = "Fred", Department = "IT" };
	Person.Add(fred);

	Person sally = new Person() { Name = "Sally", Department = "ACCT" };
	Person.Add(sally);

	Person julia = new Person() { Name = "Julia", Department = "IT" };
	Person.Add(julia);

	// Let's remove Julia. But when we search, we'll make sure
	// there isn't one that matches name Julia and Department IT.

	Person.Remove(julia);

	// Test if the list contains sally regardless of whether
	// it's the same original object
	Assert.DoesNotContain<Person>(Person.AllItems, item =>
	{
		return item.Name == "Julia" && item.Department == "IT";
	});

}
```

## Advanced Stuff

Please do not use these until you've taken the time to fully study them, along with testing concepts. Remember, you control the testing environment.

Here we test for the exact results in our Search function.

```cs
[Fact]
public void TestSearchExactResults()
{
	// Here's we'll make sure we get back the exact results
	// we're looking for. We're going to make sure that
	// the search contains these two objects:
	//    Name = Fred, Department = IT
	//    Name = Julia, Department = IT

	// Since the list is static, it stays around between tests.
	// Let's clear it out first.

	Person.AllItems.Clear();

	Person fred = new Person() { Name = "Fred", Department = "IT" };
	Person.Add(fred);

	Person sally = new Person() { Name = "Sally", Department = "ACCT" };
	Person.Add(sally);

	Person julia = new Person() { Name = "Julia", Department = "IT" };
	Person.Add(julia);

	// Search for people in Department IT. Should get back 2 people.
	List<Person> actual = Person.Find("IT");

	Assert.Collection<Person>(actual,
		item => { Assert.Equal(fred, item); },
		item => { Assert.Equal(julia, item); }
	);

	// This works, HOWEVER, it's order-dependent. If I reverse
	// these like so, it fails:
	//Assert.Collection<Person>(actual,
	//	item => { Assert.Equal(julia, item); },
	//	item => { Assert.Equal(fred, item); }
	//);

}
```

And here we're validating items in the entire collection.

```cs
[Fact]
public void TestAllValid()
{
	Person.AllItems.Clear();

	Person fred = new Person() { Name = "Fred", Department = "IT" };
	Person.Add(fred);

	Person sally = new Person() { Name = "Sally", Department = "ACCT" };
	Person.Add(sally);

	Person julia = new Person() { Name = "Julia", Department = "IT" };
	Person.Add(julia);

	// We'll make sure all the items in the collection
	// are valid, meaning they all have a non-empty string
	// for both Name and Department fields.
	// Why would you do this? To verify for example that the
	// constructors are getting called, or that the data is
	// getting read correctly. However, those could be individual
	// tests themselves rather than testing the entire collection.
	// Remember, these are not runtime tests; these are to verify
	// that the data we put into the lists is what in fact ends
	// up in the lists.

	Assert.All<Person>(Person.AllItems, item =>
	{
		Assert.True(item.Name != null && item.Name != "" &&
			item.Department != null && item.Department != "");
	});
}
```
