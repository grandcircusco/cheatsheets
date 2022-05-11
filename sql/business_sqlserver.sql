create database bigbusiness
go
use bigbusiness
go
create table employee (
    id int identity primary key,
    firstname varchar(50),
    lastname varchar(50),
    phone varchar(15),
    email varchar(255),
	salary decimal(8,2),
    department varchar(8)
)
go
create table location (
    id int identity primary key,
    name nvarchar(30) not null,
    city nvarchar(20),
    state char(2)
)
go
create table department (
    id varchar(8) primary key,
    name varchar(50),
    location int
)
go
set identity_insert employee on
go
insert into employee (id, firstname, lastname, phone, email, salary, department) values (1,'Abdul','Amin','248-111-2222','abdul@abc.net',100123.99,'ACCT');
go
insert into employee (id, firstname, lastname, phone, email, salary, department) values (2,'Barbara','Baker','248-123-1234','barb@abc.net',120000.00,'HR');
go
insert into employee (id, firstname, lastname, phone, email, salary, department) values (3,'Cherine','Cooper','248-321-3232','cher@abc.net',50000.00,'MGT');
go
insert into employee (id, firstname, lastname, phone, email, salary, department) values (4,'Douglas','Dickerson','248-315-5151','doug@abc.net',123000.00,'ADMIN');
go
insert into employee (id, firstname, lastname, phone, email, salary, department) values (5,'Emily','Emerson','248-111-1112','em@abc.net',60000.00,'ACCT');
go
insert into employee (id, firstname, lastname, phone, email, salary, department) values (6,'Fred','Franklin','248-155-5555','fred@abc.net',85000.00,'IT');
go
insert into employee (id, firstname, lastname, phone, email, salary, department) values (7,'George','Goodman','248-999-8888','george@abc.net',75000.00,'IT');
go
insert into employee (id, firstname, lastname, phone, email, salary, department) values (8,'Harry','Hamilton','248-989-9899','harry@abc.net',120000.00,'MGT');
go
insert into employee (id, firstname, lastname, phone, email, salary, department) values (9,'Isaiah','Israel','248-888-2488','isaiah@abc.net',90000.00,'IT');
go
insert into employee (id, firstname, lastname, phone, email, salary, department) values (10,'Jamal','Johnson','248-555-6262','jamal@abc.net',50000.00,'ADMIN');
go
insert into employee (id, firstname, lastname, phone, email, salary, department) values (11,'Kesha','Kabir','248-645-2542','kesha@abc.net',110000.00,'IT');
go
insert into employee (id, firstname, lastname, phone, email, salary, department) values (12,'Larry','Langman','248-654-1356','larry@abc.net',80000.00,'ACCT');
go
insert into employee (id, firstname, lastname, phone, email, salary, department) values (13,'Moses','Meier','248-789-1234','moses@abc.net',75000.00,'CSR');
go
insert into employee (id, firstname, lastname, phone, email, salary, department) values (14,'Nancy','Noble','248-262-2626','nancy@abc.net',100000.00,'IT');
go
insert into employee (id, firstname, lastname, phone, email, salary, department) values (15,'Otto','Ourada','248-616-7373','otto@abc.net',50000.00,'IT');
go
insert into employee (id, firstname, lastname, phone, email, salary, department) values (16,'Paul','Patterson','248-166-2677','paul@abc.net',90000.00,'MGT');
go
insert into employee (id, firstname, lastname, phone, email, salary, department) values (17,'Quincy','Qualls','248-765-1621','quincy@abc.net',50000.00,'CSR');
go
insert into employee (id, firstname, lastname, phone, email, salary, department) values (18,'Ruby','Ringwald','248-765-2747','ruby@abc.net',75000.00,'CSR');
go
insert into employee (id, firstname, lastname, phone, email, salary, department) values (19,'Sarah','Smith','248-763-2245','sarah@abc.net',90000.00,'HR');
go
insert into employee (id, firstname, lastname, phone, email, salary, department) values (20,'Terry','Taylor','248-789-8206','terry@abc.net',85000.00,'ACCT');
go
insert into employee (id, firstname, lastname, phone, email, salary, department) values (21,'Uday','Uppal','248-801-3866','uday@abc.net',90000.00,'SALES');
go
insert into employee (id, firstname, lastname, phone, email, salary, department) values (22,'Valorie','Valentine','248-743-1866','valorie@abc.net',95000.00,'SALES');
go
insert into employee (id, firstname, lastname, phone, email, salary, department) values (23,'William','White','248-731-1122','will@abc.net',100000.00,'MGT');
go
insert into employee (id, firstname, lastname, phone, email, salary, department) values (24,'Xavier','Xander','248-886-2785','xavier@abc.net',80000.00,'SALES');
go
insert into employee (id, firstname, lastname, phone, email, salary, department) values (25,'Yasmine','Yeager','248-827-3853','yasmine@abc.net',120000.00,'HR');
go
insert into employee (id, firstname, lastname, phone, email, salary, department) values (26,'Ziggy','Zingerman','248-367-5833','ziggy@abc.net',115000.00,'MGT');
go
set identity_insert employee off
go
set identity_insert location on
go
insert into location (id, name, city, state) values (1, 'Main Building', 'Detroit', 'MI')
go
insert into location (id, name, city, state) values (2, 'Central', 'Lansing', 'MI')
go
insert into location (id, name, city, state) values (3, 'West Side', 'Grand Rapids', 'MI')
go
insert into location (id, name, city, state) values (4, 'Home/Remote', '', '')
go
set identity_insert location off
go
insert into department (id, name, location) values ('ACCT','Accounting',1);
go
insert into department (id, name, location) values ('ADMIN','Administration',1);
go
insert into department (id, name, location) values ('CSR','Customer Service',2);
go
insert into department (id, name, location) values ('HR','Human Resources',2);
go
insert into department (id, name, location) values ('IT','Information Technology',4);
go
insert into department (id, name, location) values ('MGT','Management',3);
go
insert into department (id, name, location) values ('SALES','Sales',3);
go
