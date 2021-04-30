# Entity Framework and SQL Server in a Console App

Add NuGet packages:

* Microsoft.EntityFrameworkCore.Tools
* Microsoft.EntityFrameworkCore.SqlServer
* Microsoft.EntityFrameworkCore.Design

You can do this via NuGet inside Visual Studio or via the dotnet command as follows:

```
dotnet add package Microsoft.EntityFrameworkCore.SqlServer
dotnet add package Microsoft.EntityFrameworkCore.Design
dotnet add package Microsoft.EntityFrameworkCore.Tools
```

Add the Student and Course classes (plain old objects), which are two entity classes, as shown in the code below. Then add one context class that includes a connection string.

Add the appropriate using statements:

* using Microsoft.EntityFrameworkCore;
* using System.Linq;


Then add code in the main that accesses the data such as in the example shown below.

```cs
using System;
using Microsoft.EntityFrameworkCore;
using System.Linq;

namespace efconsole2
{

    public class Student
    {
        public int StudentId { get; set; }
        public string Name { get; set; }
    }
    public class Course
    {
        public int CourseId { get; set; }
        public string CourseName { get; set; }
    }

    public class SchoolContext : DbContext
    {
        public DbSet<Student> Students { get; set; }
        public DbSet<Course> Courses { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(@"Server=DESKTOP-N3E6T0C\SQLEXPRESSGC;Database=gcentity2;User Id=sa;Password=abc123;");
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");
            using (var context = new SchoolContext())
            {
                Student st = new Student()
                {
                    Name = "Sally"
                };
                context.Students.Add(st);
                context.SaveChanges();
                
                var sts = context.Students.Where(s => s.Name == "Sally").ToList();
                Console.WriteLine(sts.Count);
            }
        }
    }
}
```

Next, In DOS or BASH shell, switch to directory containing the csproj file. Then type the following two commands:
```
dotnet ef migrations add CreateSchoolDB3
dotnet ef database update
```

Note: You can alternatively use commands in the Nuget Package Manger Console, but if you do, you need to make sure you choose the current project in the Default project dropdown. In that case you would use these commands instead:

```
add-migration CreateShoolDB3
update-database
```

