Dapper Demo that follows the installation of MySQL slides.

```cs
using MySql.Data.MySqlClient;
using System;
using Dapper;
using System.Collections.Generic;

namespace DapperMySQLConsole1
{

    class Category
    {
        public int category_id { get; set; }
        public string name { get; set; }
    }

    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Testing Dapper. Should print out a number and no exception errors.");
            using (var connection = new MySqlConnection("Server=127.0.0.1;Database=testdb;Uid=root;Pwd=abc123;"))
            {
                List<Category> result = connection.Query<Category>("SELECT * FROM category").AsList();
                Console.WriteLine(result.Count);
            }
        }
    }
}
```
