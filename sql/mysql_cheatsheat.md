# Creating a database
```sql
create database business;
```

# Working with a database

Remember for all of this, in MySQL Workbench you need to type
```sql
use business; 
```

to use the database you're working with.

# Creating a table

Two examples; the first uses an autoincrement primary key field; the second does not:

```sql
create table employee (
    id int NOT NULL AUTO_INCREMENT,
    firstname varchar(50),
    lastname varchar(50),
    phone varchar(15),
    email varchar(255),
    department varchar(8),
    PRIMARY KEY (id)
);

create table department (
    id varchar(8) NOT NULL,
    name varchar(50),
    location varchar(50),
    PRIMARY KEY (id)
);
```

# Dropping a table

This cannot be undone!

```sql
drop table employee;
```
# Dropping a database
This cannot be undone!

```sql
drop database business;
```

# Selecting data

Some samples:

```sql
select * from product where id = 1;

select * from product where price > 5;

select * from product where price > 5 order by price;
```

You can also create calculated fields:

```sql
select name, price, price * 1.06 as withtax from product;
```

Getting a result without duplicates; use distinct:

```sql
select distinct location from department;
```

Getting the number of items. Here's how you get the total number of employees:

```sql
select count(*) from employee;
```

Here's how you get the number of employees in the ACCT department:

```sql
select count(*) from employee where department = 'ACCT';
```

You can do averages, and so on with numeric data, but remember you'll only get one result back:

```sql
select avg(price) from product;
select max(price) from product;
select min(price) from product;
```

# Inserting data

Here's a basic insert:

```sql
insert into department (id, name, location) values ('ACCT','Accounting','Detroit');
```

The table in this next example has an autoincrement column. Although we're allowed to set that in an insert, we typically don't. For example:

```sql
insert into employee (firstname, lastname, phone, email, department) values ('Maya','Angelou','248-112-2332','maya@abc.net','MGT');
```

# Updating data

```sql
update product set price = 1.85;
```

# Deleting data

Although you can use any columns in your delete's where clause, the best practice is to use the primary key:

```sql
delete from employee where id = 26;
```

# Selecting data from two tables (joining)

```sql
select * from employee join department on employee.department = department.id;
```

It's easier to use table alises in a join to speed up your typing:

```sql
select * from employee e join department d on e.department = d.id;
```

You can include where clauses. Let's get all the employee details but only those who work in department ACCT:

```sql
select * from employee e join department d on e.department = d.id where d.id = 'ACCT';
```

This example has a where clause but doesn't include the where fields in the final output, which is perfectly acceptable:

```sql
select e.firstname, e.lastname, d.location from employee e join department d on e.department = d.id where d.id = 'ACCT';
```

You can include only certain columns:

```sql
select e.*, d.name, d.location from employee e join department d on e.department = d.id;
```

You can rename a column in the result set if need  be:

```sql
select e.*, d.name as deptname, d.location from employee e join department d on e.department = d.id;
```

# Views

These are essentially aliases to select statements, but you treat them like tables. You can only read from a view; you can't update to a view.

First practice the select statement so you can get it right, such as this join example:

```sql
select employee.*, department.name, department.location from employee join department on employee.department = department.id;
```

Then create the view. You only create a view once:
```sql
create view employeedetail as select employee.*, department.name, department.location from employee join department on employee.department = department.id;
```

And now you can use it:

```
select * from employeedetail;
```

Or here's an example with a where clause:

```sql
select * from employeedetail where department = 'ACCT';
```


# Alter table

Be careful with these! You generally want to make sure your tables are well thought out up front, rather than to be modifying them regularly.

Add a column to a table:

```sql
alter table department add
    country varchar(20);
```

Alter table to add a foreign key:

```sql
alter table employee add
    foreign key (department)   /* The field in the employee table */
    references department(id);  /* The table and field we're referencing, this case table department's primary key id called it */
```
