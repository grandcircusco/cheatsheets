## To load the data into MySQL
1. Open up MySQL Workbench
2. Click File -> New Query Tab (or press Ctrl+T)
3. Copy the code from here:
	https://raw.githubusercontent.com/grandcircusco/cheatsheets/master/sql/business_mysql.sql
    and paste it into the query tab.
4. Click the first lightening bolt to run all the lines in the file.
5. Close the query tab without saving it.

(You'll likely want to refresh the schemas pane by clicking its yin-yang refresh symbol.)

Now the data is added to your SQL Server for the business database.

## Practice
Now open up another query tab (see step 2 above). You want to tell MySQL which database you'll be using, so type the following and run it:

```
use business;
```

### Now write SQL queries to do the following:

1. Select all rows from the department table.
2. Get distinct departments from the employee table.
3. Get all the rows in the employee table where the last name contains 'oo'
4. Get all employees who work in the IT department.
5. Get all employees ordered by department, then by name.
6. Add a new row to the employee table. You can use whatever values you like.
7. Change the location of all rows in Department whose location is Southfield to Ferndale.
8. Delete the employee whose id is 26.
9. Join the employee table with the department table using the department ID.
