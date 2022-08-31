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

## Detailed Steps

1. Create the primary project. (The "real" project that you give to your customers)
2. Create the test project consisting of an xUnit project for C#. Example Name: ProjectName_Tests
3. Set up test file dependency to reference primary project
  
    a. Right click the test projects "Dependencies" file and select "add a project reference"
  
    b. Check the box next to the project you'd like to connect to the new test file and click ok.

4. Create class files
  
    a. Update "internal" to "public" so the test project can access it

5. Add using statements to the Test projects's UnitTest1.cs file. Ex: Using NameSpace;
6. Create a skeleton of the method without any logic inside in the class file
7. Create tests for all scenarios you would like your method to evaluate(including the constructor if applicable)
8. Finally construct the method you will use in the specified class.
9. In the toolbar under tests select "Run all tests" from the drop down to ensure your method is working correctly.
