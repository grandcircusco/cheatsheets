# Creating an API App (DevBuild/Dapper version)

The very bottom of this document has the entire model, DAL, and controllers for the app. (Note: Although this example has a Department model, it doesn't have a controller or DAL code for that. Coming soon!)

### Setup

Create a new app of type **ASP.NET Core Web API** (*not MVC*)

Delete WeatherForecast.cs and Controllers/WeatherForecaseController.cs

Add the usual Dapper and MySQL extensions through NuGet:

* Dapper.Contrib
* MySql.Data

### Models

[This step is optional; you don't have to put your classes inside a Models folder.]

Add a new folder called **Models** by right-clicking on your project name and clicking **Add -> New Folder**.

Inside the new Models folder, create a model for each table, and create a DAL like you did before with database projects.

After you create a DAL, add the connection string injection to Startup.cs:

## Database Connection

Add the connection string to your appsettings.json. **UPDATE THE DATABASE NAME TO MATCH YOUR DATABASE!!**

**appsettings.json**
```js
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
    "db": "Server=localhost;Database=DATABASENAME;Uid=root;Password=abc123"
  }
}
```

**(.NET v5) Startup.cs**
```cs
public void ConfigureServices(IServiceCollection services)
{
    services.AddControllers();
    string connstring = Configuration.GetConnectionString("db");
    IDbConnection db = new MySqlConnection(connstring);
    DAL.db = db;
}
```


**(.NET v6) Program.cs**
Add these lines at the end *before* the app.Run() line:
```cs
    string connstring = Configuration.GetConnectionString("db");
    IDbConnection db = new MySqlConnection(connstring);
    DAL.db = db;
```

### Controllers

Typically you will create a controller for each table. Do **not** use the New Controller popup menu. Instead, right-click on Controllers, click Add, and click New Item.

In the Add New Item window, choose the type **API Controller - Empty**. Name it to match your table name, followed by Controller.cs (for example EmployeeContoller.cs).

List out your Routes. Either save them in a Specifications document, or right in the comments of your code.

Write the controller methods for each route. Remember to use GET for any reads; POST for any creates; DELETE for any deletes, and either POST or PUT for updates. (PUT is preferred, but some people use POST. If you do use POST, then Create and Update will need different routes!)

Test each one in PostMan. (See separate doc for that.)

## Code

### Models/Employee.cs
```cs
using Dapper.Contrib.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BusApi.Models
{
    [Table("employee")]
    public class Employee
    {
        [Key]
        public int id { get; set; }
        public string firstname { get; set; }
        public string lastname { get; set; }
        public string department { get; set; }
    }
}
```

### Models/Department.cs
```cs
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Dapper.Contrib.Extensions;

namespace BusApi.Models
{
    [Table("department")]
    public class Department
    {
        [Key]
        public string id { get; set; }
        public string name { get; set; }
        public string location { get; set; }
    }
}
```
### Models/DAL.cs
```cs
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using Dapper.Contrib.Extensions;

namespace BusApi.Models
{
    public class DAL
    {
        public static IDbConnection db;

        // Get all of the employee rows
        public static List<Employee> ReadAllEmps()
        {
            return db.GetAll<Employee>().ToList();
        }

        // Get a single Employee by ID
        public static Employee ReadOneEmp(int id)
        {
            return db.Get<Employee>(id);
        }

        // Insert an employee into the table
        public static int CreateEmp(Employee emp)
        {
            db.Insert(emp);
            // The Insert method sets the ID
            // for us, so we can just return that.
            return emp.id;
        }

        // Update an employee
        public static void UpdateEmp(Employee emp)
        {
            db.Update(emp);
        }

        // Delete an employee
        public static void DeleteEmp(int id)
        {
            Employee obj = new Employee();
            obj.id = id;
            db.Delete(obj);
        }

    }
}
```

### Controllers/EmployeeController.cs
```cs
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BusApi.Models; // Add this

namespace BusApi.Controllers
{
    // It's a good idea to rename the route with an actual name rather than rely on [Controller].
    [Route("employee")]
    [ApiController]
    public class EmployeeController : ControllerBase
    {
        /*
         *   URL Paths (Routes)
         * 
         *   GET /employee -- return all employees
         *   GET /employee/{id}  -- return a single employee by id
         *   POST /employee -- create an employee
         *   PUT /employee -- update an existing employee
         *   DELETE /employee/{id} -- delete a single employee by id
         *   
         */

        [HttpGet]
        public List<Employee> ReadAllEmps()
        {
            return DAL.ReadAllEmps();
        }

        [HttpGet("{empid}")]
        public Employee ReadOneEmp(int empid)
        {
            return DAL.ReadOneEmp(empid);
        }

        [HttpPost]
        public int CreateEmp(Employee emp)
        {
            return DAL.CreateEmp(emp);
        }

        [HttpPut]
        public int UpdateEmp(Employee emp)
        {
            DAL.UpdateEmp(emp);
            return 1;
        }

        [HttpDelete("{empid}")]
        public int DeleteEmp(int empid)
        {
            DAL.DeleteEmp(empid);
            return 1;
        }
    }
}
```

