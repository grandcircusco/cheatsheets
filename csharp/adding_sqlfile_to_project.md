# Adding a SQL file to a solution
...so you can include it in your GitHub repo.

You have two choices:

* Save it from the MySQL Workbench 

or

* Create a new text file in Visual Studio and copy the SQL code into it

**IMPORTANT:** When you include a SQL file, other developers using it will typically just run the whole file, meaning they'll open it in MySQL Workbench, and Workbench will run every statement in it from top to bottom.

As such, treat it like you would any other code. Test it out! See the tips at the bottom of this cheatsheet for more info.

## Saving a file from MySQL Workbench

This one is easy; the only hard part is you need to know the path of your solution.

**Tip: _Know how to find these paths quickly and easily. Below I give one suggestion, but better is to just know the paths so you can type them in manually. Good developers know where their files are on their computer._**

1. In MySQL Workbench, press Ctrl+S (or click the menu File -> Save Script)
2. Navigate to your solution folder and save the file with a .sql extension. (Tip: You probably want to name it the same as your database, as in mycoolgame.sql)

But how do you find solution folder? There are several ways. Here is one way:

1. In Visual Studio, right-click on the solution itself (in Solution Explorer) and click Open Folder in File Explorer.
2. When File Explorer opens, click on the nav bar so it turns into a folder. Copy this folder and paste it into the File Save box in MySQL Workbench and press Enter.
3. Create a filename (best to use the database name, with a .sql extension) and save!

Another way:
1. In Visual Studio, right-click on the solution itself (in Solution Explorer) and click Copy Full Path. This actually gives you more than the path, though; it includes the solution filename.
2. Paste the full path into the File Save box in MySQL Workbench and remove the solution filename, replacing it with the name of your file.

The BEST way:
1. Know where it is on your hard drive and find it in the MySQL Workbench's File Save box! (No sarcasm here; this really is the best way. Good developers know where their files are!)

## Saving a file from within Visual Studio

This one is also easy, but there's a downside: **If you make changes over in MySQL Workbench, you need to copy them over to here.**

1. Right-click on the solution name in Solution Explorer and then click Add then New Item.
2. Choose "Sql File" in the list. (Or choose Text file but change the extension to .sql)
3. Type in a name (usually the database name) and make sure it ends with .sql
4. Click Add.
5. When the file opens, copy and paste all your code from MySQL Workbench.

# Tips

Treat your SQL file as a single set of code meant to be run from top to bottom.

The very first line should be a drop database line at the top, along with an "if exists" clause. This way you can run it over and over, allowing you to "reset" your database back to the beginning.

The second line should create the database.

The third line should use the database. For example:

```sql
drop database if exists coolgameapp;
create database coolgameapp;
use coolgameapp;
```

The next section should create your tables. Be mindful of foreign keys! If a table has a foreign key referencing an "other" table, the "other" table must be created first! (Think about why this is.)

For example:

```sql
/* First table that second table references in a foreign key */
create table department (
    id varchar(8) NOT NULL,
    name varchar(50),
    location varchar(50),
    PRIMARY KEY (id)
);

/* Second table that references first table in a foreign key */
create table employee (
    id int NOT NULL AUTO_INCREMENT,
    firstname varchar(50),
    lastname varchar(50),
    phone varchar(15),
    email varchar(255),
    department_id varchar(8),
    hiredate datetime,
    PRIMARY KEY (id),
    FOREIGN KEY (department_id) references department(id)
);
```

Then you need to populate the table with the foreign keys first, so that they exist, like so:

```sql
/* Have to fill department first so they exist before filling employee table */
insert into department (id, name, location) values ('ACCT','Accounting','Detroit');
insert into department (id, name, location) values ('ADMIN','Administration','Detroit');

/* Now these will all work since the departments all exist */
insert into employee (id, firstname, lastname, phone, email, department_id, hiredate) values (1,'Abdul','Ebrahim','248-111-2222','ebrahim@abc.net','ACCT', '2022-03-05');
insert into employee (id, firstname, lastname, phone, email, department_id, hiredate) values (2,'Barbara','Emerson','248-123-1234','barb@abc.net','ADMIN', '2021-05-13');
insert into employee (id, firstname, lastname, phone, email, department_id, hiredate) values (3,'Cherine','Franklin','248-321-3232','cher@abc.net','ACCT', '2021-02-10');
```


