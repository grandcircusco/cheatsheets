drop database if exists business;
create database business;
use business;
create table employee (
    id int NOT NULL AUTO_INCREMENT,
    firstname varchar(50),
    lastname varchar(50),
    phone varchar(15),
    email varchar(255),
    department varchar(8),
    hiredate datetime,
    PRIMARY KEY (id)
);

create table department (
    id varchar(8) NOT NULL,
    name varchar(50),
    location varchar(50),
    PRIMARY KEY (id)
);
insert into employee (id, firstname, lastname, phone, email, department, hiredate) values (1,'Abdul','Ebrahim','248-111-2222','ebrahim@abc.net','ACCT', '2022-03-05');
insert into employee (id, firstname, lastname, phone, email, department, hiredate) values (2,'Barbara','Emerson','248-123-1234','barb@abc.net','HR', '2021-05-13');
insert into employee (id, firstname, lastname, phone, email, department, hiredate) values (3,'Cherine','Franklin','248-321-3232','cher@abc.net','MGT', '2021-02-10');
insert into employee (id, firstname, lastname, phone, email, department, hiredate) values (4,'Douglas','Qualls','248-315-5151','doug@abc.net','ADMIN', '2020-08-19');
insert into employee (id, firstname, lastname, phone, email, department, hiredate) values (5,'Emily','Baker','248-111-1112','baker@abc.net','ACCT', '2022-07-14');
insert into employee (id, firstname, lastname, phone, email, department, hiredate) values (6,'Fred','Noble','248-155-5555','fred@abc.net','IT', '2021-05-28');
insert into employee (id, firstname, lastname, phone, email, department, hiredate) values (7,'George','Langman','248-999-8888','george@abc.net','IT', '2022-02-20');
insert into employee (id, firstname, lastname, phone, email, department, hiredate) values (8,'Harry','Goodman','248-989-9899','harry@abc.net','MGT', '2022-04-04');
insert into employee (id, firstname, lastname, phone, email, department, hiredate) values (9,'Isaiah','Schechter','248-888-2488','isaiah@abc.net','IT', '2020-12-03');
insert into employee (id, firstname, lastname, phone, email, department, hiredate) values (10,'Jamal','Meier','248-555-6262','meier@abc.net','ADMIN', '2022-05-11');
insert into employee (id, firstname, lastname, phone, email, department, hiredate) values (11,'Kesha','Habeeb','248-645-2542','kesha@abc.net','IT', '2021-11-16');
insert into employee (id, firstname, lastname, phone, email, department, hiredate) values (12,'Larry','Hamilton','248-654-1356','larry@abc.net','ACCT', '2022-06-22');
insert into employee (id, firstname, lastname, phone, email, department, hiredate) values (13,'Moses','Johnson','248-789-1234','moses@abc.net','CSR', '2022-05-25');
insert into employee (id, firstname, lastname, phone, email, department, hiredate) values (14,'Nancy','Cooper','248-262-2626','cooper@abc.net','IT', '2021-11-27');
insert into employee (id, firstname, lastname, phone, email, department, hiredate) values (15,'Otto','Zingerman','248-616-7373','otto@abc.net','IT', '2020-12-20');
insert into employee (id, firstname, lastname, phone, email, department, hiredate) values (16,'Paul','Ringwald','248-166-2677','paul@abc.net','MGT', '2022-03-14');
insert into employee (id, firstname, lastname, phone, email, department, hiredate) values (17,'Quincy','White','248-765-1621','white@abc.net','CSR', '2020-08-19');
insert into employee (id, firstname, lastname, phone, email, department, hiredate) values (18,'Ruby','Taylor','248-765-2747','ruby@abc.net','CSR', '2022-05-01');
insert into employee (id, firstname, lastname, phone, email, department, hiredate) values (19,'Sarah','Dickerson','248-763-2245','sarah@abc.net','HR', '2021-01-10');
insert into employee (id, firstname, lastname, phone, email, department, hiredate) values (20,'Terry','Patterson','248-789-8206','patterson@abc.net','ACCT', '2022-06-09');
insert into employee (id, firstname, lastname, phone, email, department, hiredate) values (21,'Uday','Patel','248-801-3866','patel@abc.net','SALES', '2020-09-03');
insert into employee (id, firstname, lastname, phone, email, department, hiredate) values (22,'Valorie','Xander','248-743-1866','valorie@abc.net','SALES', '2020-08-02');
insert into employee (id, firstname, lastname, phone, email, department, hiredate) values (23,'William','Smith','248-731-1122','smith@abc.net','MGT', '2022-06-11');
insert into employee (id, firstname, lastname, phone, email, department, hiredate) values (24,'Xavier','Yeager','248-886-2785','xavier@abc.net','SALES', '2022-01-22');
insert into employee (id, firstname, lastname, phone, email, department, hiredate) values (25,'Yasmine','Valentine','248-827-3853','valentine@abc.net','HR', '2021-02-20');
insert into employee (id, firstname, lastname, phone, email, department, hiredate) values (26,'Ziggy','Ourada','248-367-5833','ziggy@abc.net','MGT', '2021-09-16');

insert into department (id, name, location) values ('ACCT','Accounting','Detroit');
insert into department (id, name, location) values ('ADMIN','Administration','Detroit');
insert into department (id, name, location) values ('CSR','Customer Service','Southfield');
insert into department (id, name, location) values ('HR','Human Resources','Southfield');
insert into department (id, name, location) values ('IT','Information Technology','Grand Rapids');
insert into department (id, name, location) values ('MGT','Management','Southfield');
insert into department (id, name, location) values ('SALES','Sales','Southfield');
