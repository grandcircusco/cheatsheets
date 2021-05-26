create database business;
use business;
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
insert into employee (id, firstname, lastname, phone, email, department) values (1,'Abdul','Amin','248-111-2222','abdul@abc.net','ACCT');
insert into employee (id, firstname, lastname, phone, email, department) values (2,'Barbara','Baker','248-123-1234','barb@abc.net','HR');
insert into employee (id, firstname, lastname, phone, email, department) values (3,'Cherine','Cooper','248-321-3232','cher@abc.net','MGT');
insert into employee (id, firstname, lastname, phone, email, department) values (4,'Douglas','Dickerson','248-315-5151','doug@abc.net','ADMIN');
insert into employee (id, firstname, lastname, phone, email, department) values (5,'Emily','Emerson','248-111-1112','em@abc.net','ACCT');
insert into employee (id, firstname, lastname, phone, email, department) values (6,'Fred','Franklin','248-155-5555','fred@abc.net','IT');
insert into employee (id, firstname, lastname, phone, email, department) values (7,'George','Goodman','248-999-8888','george@abc.net','IT');
insert into employee (id, firstname, lastname, phone, email, department) values (8,'Harry','Hamilton','248-989-9899','harry@abc.net','MGT');
insert into employee (id, firstname, lastname, phone, email, department) values (9,'Isaiah','Israel','248-888-2488','isaiah@abc.net','IT');
insert into employee (id, firstname, lastname, phone, email, department) values (10,'Jamal','Johnson','248-555-6262','jamal@abc.net','ADMIN');
insert into employee (id, firstname, lastname, phone, email, department) values (11,'Kesha','Kabir','248-645-2542','kesha@abc.net','IT');
insert into employee (id, firstname, lastname, phone, email, department) values (12,'Larry','Langman','248-654-1356','larry@abc.net','ACCT');
insert into employee (id, firstname, lastname, phone, email, department) values (13,'Moses','Meier','248-789-1234','moses@abc.net','CSR');
insert into employee (id, firstname, lastname, phone, email, department) values (14,'Nancy','Noble','248-262-2626','nancy@abc.net','IT');
insert into employee (id, firstname, lastname, phone, email, department) values (15,'Otto','Ourada','248-616-7373','otto@abc.net','IT');
insert into employee (id, firstname, lastname, phone, email, department) values (16,'Paul','Patterson','248-166-2677','paul@abc.net','MGT');
insert into employee (id, firstname, lastname, phone, email, department) values (17,'Quincy','Qualls','248-765-1621','quincy@abc.net','CSR');
insert into employee (id, firstname, lastname, phone, email, department) values (18,'Ruby','Ringwald','248-765-2747','ruby@abc.net','CSR');
insert into employee (id, firstname, lastname, phone, email, department) values (19,'Sarah','Smith','248-763-2245','sarah@abc.net','HR');
insert into employee (id, firstname, lastname, phone, email, department) values (20,'Terry','Taylor','248-789-8206','terry@abc.net','ACCT');
insert into employee (id, firstname, lastname, phone, email, department) values (21,'Uday','Uppal','248-801-3866','uday@abc.net','SALES');
insert into employee (id, firstname, lastname, phone, email, department) values (22,'Valorie','Valentine','248-743-1866','valorie@abc.net','SALES');
insert into employee (id, firstname, lastname, phone, email, department) values (23,'William','White','248-731-1122','will@abc.net','MGT');
insert into employee (id, firstname, lastname, phone, email, department) values (24,'Xavier','Xander','248-886-2785','xavier@abc.net','SALES');
insert into employee (id, firstname, lastname, phone, email, department) values (25,'Yasmine','Yeager','248-827-3853','yasmine@abc.net','HR');
insert into employee (id, firstname, lastname, phone, email, department) values (26,'Ziggy','Zingerman','248-367-5833','ziggy@abc.net','MGT');

insert into department (id, name, location) values ('ACCT','Accounting','Detroit');
insert into department (id, name, location) values ('ADMIN','Administration','Detroit');
insert into department (id, name, location) values ('CSR','Customer Service','Southfield');
insert into department (id, name, location) values ('HR','Human Resources','Southfield');
insert into department (id, name, location) values ('IT','Information Technology','Grand Rapids');
insert into department (id, name, location) values ('MGT','Management','Southfield');
insert into department (id, name, location) values ('SALES','Sales','Southfield');
