# SQL REFERENCE

## SELECT STATEMENTS
Select all records, all columns from a table:
```sql
SELECT * FROM Students
```


Select only two columns from a table:
```sql
SELECT FirstName, LastName, ID FROM Students
```

Select all columns from rows that meet a condition:
```sql
SELECT * FROM Students WHERE ID > 2000
```

Select the rows in a particular order, such as LastName ascending:
```sql
SELECT * FROM Students ORDER BY LastName ASC
```

Select the rows in a particular order, such as LastName ascending and then FirstName descending:
```sql
SELECT * FROM Students ORDER BY LastName ASC, FirstName DESC
```

Retrieve unique values for a particular column from a table:
```sql
SELECT DISTINCT FirstName FROM Students
```

Combine distinct, a where clause, and an ordering:
```sql
SELECT DISTINCT LastName FROM Students WHERE ID > 2000 ORDER BY ID ASC
```

Join two tables together:
```sql
SELECT * FROM Students INNER JOIN Bootcamps on Students.CampID = Bootcamps.ID
```

## TABLE STATEMENTS

Create a table named Students with the columns indicated.  Set the primary key to the first column, ID:
```sql
CREATE TABLE Students (
			ID INT(11) NOT NULL AUTO_INCREMENT,
			FirstName VARCHAR(55),
			LastName VARCHAR(55),
			PRIMARY KEY ID
		)
```

Delete a table from the database.
```sql
DROP TABLE Students
```

Add a new record into table tbl, putting "Jane" in FirstName and "Smith" in LastName. (We don't provide a value for ID since it's an autoincrement field.):
```sql
INSERT INTO Students (FirstName, LastName) VALUES (“Jane”, "Smith")
```

Remove records where condition is met.
```sql
DELETE FROM Students WHERE ID=102
```

Change the value stored in col1 for records where condition is met:
```sql
UPDATE Students SET LastName=“Williams” WHERE ID=101
```

Modifying a table: Add a column of datatype Varchar(60) named Email:
Example:
```sql
ALTER TABLE Students ADD COLUMN Email VARCHAR(60)
```

Remove the column Email from table Students.  All values are lost:
```sql
ALTER TABLE Students DROP COLUMN Email
```

## Syntax Notes:

On most SQL servers, SQL keywords like SELECT, FROM, ORDER BY, DISTINCT, ASC, DESC, etc. are not case sensitive.  Many reference materials follow the convention of capitalizing them for clarity, but many developers don’t do this in actual practice.
Closing semicolon is optional unless the query includes more statements.
