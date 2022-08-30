# TDD Steps

Typically you'll have your main project for your app you're building.

Separately you'll create a test project that tests the individual methods in your main app.

So two projects:
* The main app (the "real" project that you give to your customers)
* The test app (for testing the real project. You do not give this to your customers)

Provide the test project with a name that describes which project you're testing.

Example:
* MortgageApp project
* MortgageApp_Tests project

You'll see pairs of projects like this: The real project, and its associated test project.

## Steps to create the projects

1. Create the real project. For this example, just create a console app called PracticePart1.

2. Create the test project consisting of an xUnit project for C#. Call this example PracticePart1_Tests (Tip: Type xunit in the project search box and look for the C# one)

3. Connect the projects by adding a reference like so: In Solution Explorer, right-click on PracticePart1_Tests project's Dependencies item, and click Add Project Reference. In the box that opens, check the project you're testing, in this case PracticePart1, and then click OK.

## Practice Steps

1. In our PracticePart1, add a new class call it Coupon. This is where our code will go. We won't touch Program.cs for a while until we get our class built and fully tested.

Change the word "internal" in the class line to "public".


