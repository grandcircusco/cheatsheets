Console Program for Dapper

# Install the MySQL Data

As described in the first section of this cheatsheet: https://github.com/grandcircusco/cheatsheets/blob/master/sql/employee_practice.md

# Create a new Console project.

#### Then Add NuGet Packages:
Right-click Dependencies, click Manage NuGet Packages. Click the Browse tab. Add:
* **Dapper.Contrib**
* **MySQL.Data**

# Create a class that mirrors your data

Create a new class file called Employee

Add Dapper's using statement:

```cs
using Dapper.Contrib.Extensions;
```

Then create the class. Notice the attributes before the class name and before the field corresponding to the primary key (and see note after the code, below):

```cs
    [Table("tablename")]
    class Employee
    {
        [Key]
        public int id { get; set; }
        public string firstname { get; set; }
        public string lastname { get; set; }
        public string phone { get; set; }
        public string email { get; set; }
        public string department { get; set; }
        public override string ToString() {
            return $"{firstname} {lastname} {phone} {email} {department}";
        }
    }
```

Always add the ```[Table("tablename")]``` attribute before the class.

If you have an autoincrement primary key: Add the ```[Key]``` attribute before the primary key field.

OR

If your primary key is NOT an autoincrement, add the ```[ExplicitKey]``` attribute before the primary key field.

Make each field a property with ```{ get; set; }```

    
# Access the data in your Program.cs

```cs
using Dapper;
using Dapper.Contrib.Extensions;
using DapperConsole;
using MySql.Data.MySqlClient;

var db = new MySqlConnection("Server=127.0.0.1;Database=business;Uid=root;Pwd=abc123;");
List<Employee> emps = db.GetAll<Employee>().ToList();

foreach (Employee emp in emps)
{
	Console.WriteLine(emp);
}
    
```
