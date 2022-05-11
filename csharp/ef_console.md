# Entity Framework and SQL Server in a Console App

Add NuGet packages:

* Microsoft.EntityFrameworkCore.Tools
* Microsoft.EntityFrameworkCore.SqlServer
* Microsoft.EntityFrameworkCore.Design

*Note: If you're using an older version of .NET Core (such as 3.1), you need to specify the corresponding version when you install the packages. When you click on a package in the NuGet browse tab, there's a Version dropdown box from which you can make your selection. Otherwise the package might not install without any immediate explanation. For example, if you're using .NET 3.1, you can select the highest 3.1 version you see, such as 3.1.22. Note also that the Updates tab will show these packages as needing updates; Do **not** update them.*

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

**Tip: This is one place where you absolutely must use properties rather than regular member variables, even if they just have default { get; set; }.**

**Tip 2: The using statement inside the main below is handy because it automatically cleans up resources after the code inside it runs. This is a completely different use of the "using" keyword from the first three lines of the code below.**

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
            optionsBuilder.UseSqlServer(@"Server=.\SQLEXPRESS;Database=efconsole1;Integrated Security=SSPI;");
            // Or For username/password, use the following:
            // optionsBuilder.UseSqlServer(@"Server=.\SQLEXPRESS;Database=efconsole1;User Id=sa;Password=abc123;");
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

## If you're doing Code First

(If you've already created your tables using SSMS, you can skip this part.)

This next is necessary to create the tables from your code.

In DOS or BASH shell, switch to directory containing the csproj file. Then type the following two commands:
```
dotnet ef migrations add CreateSchool
dotnet ef database update
```

Note: You can alternatively use commands in the Nuget Package Manger Console, but if you do, you need to make sure you choose the current project in the Default project dropdown. In that case you would use these commands instead:

```
add-migration CreateSchool
update-database
```

