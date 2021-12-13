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
insert into Customers 
	(name, phone, contactname) values ('Acme Hardware', '8005551212', 'Fred Franklin')
go
insert into Customers 
	(name, phone, contactname) values ('Falls Realty', '2691111515', 'Emily Emerson')
go
insert into Customers 
	(name, phone, contactname) values ('Falls Realty', '2691111515', 'Abdul Amin')
go
insert into Customers 
	(name, phone, contactname) values ('Julie''s Diner', '2691111515', 'Julie Johnson')
go
insert into Customers 
	(name, phone, contactname) values ('Haberdashere Hattery', '2691111515', 'Larry Langman')
go

insert into Items
	(name, price) values ('Mouse', 25.00)
go
insert into Items
	(name, price) values ('Keyboard', 45.00)
go
insert into Items
	(name, price) values ('MacBook', 800.00)
go
insert into Items
	(name, price) values ('iPad', 625.00)
go
insert into Items
	(name, price) values ('Credit Card Reader', 45.00)
go
insert into Items
	(name, price) values ('Screen Cleaner', 4.25)
go
insert into Items
	(name, price) values ('iPhone Charger', 15.00)
go

insert into Orders
	(ordernum, customerid, orderdate, itemid, quantity)
	values (1, 1, '2020-08-01', 1, 3)
go
insert into Orders
	(ordernum, customerid, orderdate, itemid, quantity)
	values (1, 1, '2020-08-01', 2, 2)
go
insert into Orders
	(ordernum, customerid, orderdate, itemid, quantity)
	values (2, 2, '2020-08-02', 3, 2)
go
insert into Orders
	(ordernum, customerid, orderdate, itemid, quantity)
	values (3, 3, '2020-08-02', 4, 1)
go
insert into Orders
	(ordernum, customerid, orderdate, itemid, quantity)
	values (3, 3, '2020-08-01', 5, 1)
go
insert into Orders
	(ordernum, customerid, orderdate, itemid, quantity)
	values (4, 1, '2020-08-03', 6, 3)
go
insert into Orders
	(ordernum, customerid, orderdate, itemid, quantity)
	values (5, 4, '2020-08-03', 4, 2)
go
insert into Orders
	(ordernum, customerid, orderdate, itemid, quantity)
	values (6, 2, '2020-08-04', 7, 3)
go
insert into Orders
	(ordernum, customerid, orderdate, itemid, quantity)
	values (7, 3, '2020-08-05', 7, 1)
go
```

