# XUnit and Testing Lists

Keep it simple! Use arrays when needed.

Suppose we want to test a static method called RemoveFirst that looks like this:

```cs
public static List<int> RemoveFirst(List<int> mylist)
```

Here are some tests we can perform:

```cs
using Xunit;
using ListStuff;
using System.Collections.Generic;

namespace ListStuff_Tests
{
	public class UnitTest1
	{

		[Fact]
		public void TestRemoveFirst1()
		{
			List<int> values = new List<int>() { 5, 10, 15, 20, 25, 30 };
			List<int> expected = new List<int>() { 10, 15, 20, 25, 30 };

			List<int> actual = ListMethods.RemoveFirst(values);
			Assert.Equal(expected, actual);
		}

		[Fact]
		public void TestRemoveFirst2()
		{
			List<int> values = new List<int>() { };
			List<int> expected = new List<int>() { };

			List<int> actual = ListMethods.RemoveFirst(values);
			Assert.Equal(expected, actual);

		}

		[Fact]
		public void TestRemoveFirst3()
		{
			// Let's make sure the original list was not modified!
			List<int> values = new List<int>() { 5, 10, 15, 20, 25, 30 };

			List<int> actual = ListMethods.RemoveFirst(values);
			Assert.Equal(6, values.Count);
		}

		// Here's how to do lists in a theory. Start with arrays.
		// Note: There are MUCH more complex ways to do this, but this one works well.
		[Theory]
		[InlineData(new int[] { 5, 10, 15, 20}, new int[] {10, 15, 20})]
		[InlineData(new int[] { 5 }, new int[] { })]
		[InlineData(new int[] { }, new int[] { })]
		public void TestRemoveFirst(int[] valuesarray, int[] expectedarray)
		{
			// Copy the arrays into lists. Then call the method we're testing.
			List<int> values = new List<int>(valuesarray);
			List<int> expected = new List<int>(expectedarray);

			List<int> actual = ListMethods.RemoveFirst(values);
			Assert.Equal(expected, actual);
		}

	}
}
```
