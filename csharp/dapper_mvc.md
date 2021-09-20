First: Design your tables and create the SQL for them.

### 1. Create a new project of type ASP.NET Core Web App (Model-View-Controller)

Save the .sql file in your project folder. (One way to do this is right-click in your project, do add new Text File, change the filename to your database dot sql as in morecoffee.sql) and then paste all your SQL into it.

### 2. Right-click Dependencies, click Manage NuGet Packages. Click the Browse tab. Add Dapper.Contrib and MySQL.Data

### 3. Create a model class for each table

Right-click the Models folder and click Add Class. Tip: Make the class file name the same as the table it matches with.

Add Dapper's using statement:

```cs
using Dapper.Contrib.Extensions;
```

Always add the ```[Table("tablename")]``` attribute before the class and the ```[Key]``` attribute before the primary key field.

Make each field a property with ```{ get; set; }```


### 4. Create a DAL class.

Add the using statements:
```cs
using MySql.Data.MySqlClient;
using Dapper;
using Dapper.Contrib.Extensions;
```

and if ```System.Linq``` is not present, add that in too.

The DAL needs a MySqlConnection. This is usually a static member:

```cs
public static MySqlConnection DB = new MySqlConnection("Server=localhost;Database=business;Uid=root;Password=abc123");
```

**Remember to change the database name in the above connection string!**

You will typically want to write an entire set of CRUD functions in the DAL right at the beginning.

The first couple of functions to add are the GetAll ones.

```cs
public static List<Department> GetAllDepartments()
{
	return DB.GetAll<Department>().ToList();
}
```

### 5. Add a controller (You might need to add your model path to the controller file's ```using``` lines as in 
```using BusinessDemo.Models;```.)

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


