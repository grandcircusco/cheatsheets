## Outline Overview

1. Build the database in MySQL Workshop
2. Create your new ASP.NET MVC project in Visual Studio.
3. Create the model classes
4. Create the DAL. Include a static MySqlConnection member as in ```public static MySqlConnection DB;```.
5. Place your connection string in the appsettings.json file. (See below for details)
6. Create your MySqlConnection in the Startup.cs and save it into the DAL's DB member.
7. Continue the DAL: Try to include CRUD operations for all the tables and any other similar operations you can think of based on the project requirements.
8. Start building controllers. Think about the URLs you'll need to go into the controller. As you build the controllers, you'll be adding actions, some of which will require views.

## Detailed Outline

### 1: Design your tables and create the SQL for them inside MySQL Workbench.

### 2. Create a new project of type ASP.NET Core Web App (Model-View-Controller)

Save the .sql file in your project folder. (One way to do this is right-click in your project, do add new Text File, change the filename to your database dot sql as in morecoffee.sql) and then paste all your SQL into it.

#### Add NuGet Packages:
Right-click Dependencies, click Manage NuGet Packages. Click the Browse tab. Add:
* **Dapper.Contrib**
* **MySQL.Data**

### 3. Create a model class for each table

Right-click the Models folder and click Add Class. Tip: Make the class file name the same as the table it matches with.

Add Dapper's using statement:

```cs
using Dapper.Contrib.Extensions;
```

Always add the ```[Table("tablename")]``` attribute before the class.

If you have an autoincrement primary key: Add the ```[Key]``` attribute before the primary key field.

OR

If your primary key is NOT an autoincrement, add the ```[ExplicitKey]``` attribute before the primary key field.

Make each field a public property with ```{ get; set; }```


### 4. Create a DAL class.

Add the using statements:
```cs
using MySql.Data.MySqlClient;
using Dapper;
using Dapper.Contrib.Extensions;
```

and if ```System.Linq``` is not present, add that in too.

The DAL needs a MySqlConnection; make this a static, public member:

```cs
public static MySqlConnection DB;
```

### 5. Add the connection string to appsettings.js

For example:

```json
{
  "Logging": {
    "LogLevel": {
      "Default": "Information",
      "Microsoft": "Warning",
      "Microsoft.Hosting.Lifetime": "Information"
    }
  },
  "AllowedHosts": "*",
  "ConnectionStrings": {
    "db": "Server=localhost;Database=morecoffee;Uid=root;Password=abc123"
  }
}
```

**Remember to change the database name in the above connection string!**

### 6. Create the MySqlConnection service

Open Startup.cs and find the ConfigureServices function. Add code such as the two commented lines into the function:

```cs
public void ConfigureServices(IServiceCollection services)
{
	// Add the following two lines:
	string connstring = Configuration.GetConnectionString("db"); // Add this
	DAL.DB = new MySqlConnection(connstring);                    // Add this
	services.AddControllersWithViews();
}
```

### 7. Continue the DAL class.

You will typically want to write an entire set of CRUD functions in the DAL right at the beginning.

The first couple of functions to add are the GetAll ones.

```cs
public static List<Department> GetAllDepartments()
{
	return DB.GetAll<Department>().ToList();
}
```

### 8. Add a controller

Add a controller for each model class. Make sure you capitalize "C" in the filename.

Add a using statement with the namespace of your models.

**Note: (You might need to add your model path to the controller file's ```using``` lines as in ```using BusinessDemo.Models;```.)**

IMPORTANT! Name your controller file without a "1" after the word Controller. The default has a 1 because it tries to use HomeController.cs, which already exists.
And so it tries using HomeController1.cs. The "1" will break! So name it, for example, BusinessController.cs, NOT BusinessController1.cs.

Figure out your paths or routes. If you use index, you'll need to add a view for the Index one. 

Create a section of code comments describing the routes.

* Add a controller action (which is a method in the controller) for each route.
* Add a view to each action
* Do a database lookup by calling your DAL code
* Pass the data into the view's model
* In the view, specify the model's type with the @model directive at the top
* Display the data -- either just display it, or loop through a list, or prepopulate a form.

Example; the controller action might look like this:

```cs
public IActionResult Index()
{
	List<Category> cats = DAL.GetAllCategories();
	return View(cats);
}
```

Pass the data into the View function. Then match the data's type in the view itself with the @model line:

You might encounter the need to send multiple objects to a view. You can send the additional objects through ViewData or ViewBag; or you can create another class that contains the objects, and use that class for your model.


