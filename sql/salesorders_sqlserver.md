# Sales Orders demo for SQL Server

This is a sample database of orders for SQL Server.

```sql
create database salessystem
go
use salessystem
go
create table Customers (
	id int identity not null primary key,
	name varchar(40),
	phone varchar(15),
	contactname varchar(60)
)
go
create table Items (
	id int identity primary key,
	name varchar(50),
	price decimal(6,2)
)
go
create table Orders (
	id int identity primary key,
	ordernum int,
	customerid int,
	orderdate datetime,
	itemid int,
	quantity int
)
go
SET IDENTITY_INSERT Customers ON
go
SET IDENTITY_INSERT Items ON
go
SET IDENTITY_INSERT Orders ON
go
insert into Customers 
	(id, name, phone, contactname) values (1, 'Acme Hardware', '8005551212', 'Fred Franklin')
go
insert into Customers 
	(id, name, phone, contactname) values (2, 'Falls Realty', '2181231234', 'Emily Emerson')
go
insert into Customers 
	(id, name, phone, contactname) values (3, 'Falls Realty', '2181231235', 'Abdul Amin')
go
insert into Customers 
	(id, name, phone, contactname) values (4, 'Julie''s Diner', '2691111515', 'Julie Johnson')
go
insert into Customers 
	(id, name, phone, contactname) values (5, 'Haberdasher Hattery', '6163213211', 'Larry Langman')
go

insert into Items
	(id, name, price) values (1, 'Mouse', 25.00)
go
insert into Items
	(id, name, price) values (2, 'Keyboard', 45.00)
go
insert into Items
	(id, name, price) values (3, 'MacBook', 800.00)
go
insert into Items
	(id, name, price) values (4, 'iPad', 625.00)
go
insert into Items
	(id, name, price) values (5, 'Credit Card Reader', 45.00)
go
insert into Items
	(id, name, price) values (6, 'Screen Cleaner', 4.25)
go
insert into Items
	(id, name, price) values (7, 'iPhone Charger', 15.00)
go

insert into Orders
	(id, ordernum, customerid, orderdate, itemid, quantity)
	values (1, 1, 1, '2020-08-01', 1, 3)
go
insert into Orders
	(id, ordernum, customerid, orderdate, itemid, quantity)
	values (2, 1, 1, '2020-08-01', 2, 2)
go
insert into Orders
	(id, ordernum, customerid, orderdate, itemid, quantity)
	values (3, 2, 2, '2020-08-02', 3, 2)
go
insert into Orders
	(id, ordernum, customerid, orderdate, itemid, quantity)
	values (4, 3, 4, '2020-08-02', 4, 1)
go
insert into Orders
	(id, ordernum, customerid, orderdate, itemid, quantity)
	values (5, 3, 4, '2020-08-01', 5, 1)
go
insert into Orders
	(id, ordernum, customerid, orderdate, itemid, quantity)
	values (6, 4, 1, '2020-08-03', 6, 3)
go
insert into Orders
	(id, ordernum, customerid, orderdate, itemid, quantity)
	values (7, 5, 5, '2020-08-03', 4, 2)
go
insert into Orders
	(id, ordernum, customerid, orderdate, itemid, quantity)
	values (8, 6, 3, '2020-08-04', 7, 3)
go
insert into Orders
	(id, ordernum, customerid, orderdate, itemid, quantity)
	values (9, 7, 4, '2020-08-05', 7, 1)
go
```

