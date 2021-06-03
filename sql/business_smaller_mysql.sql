drop database busapi;
create database busapi;
use busapi;
create table employee (
    id int NOT NULL AUTO_INCREMENT,
    firstname varchar(50),
    lastname varchar(50),
    department varchar(8),
    PRIMARY KEY (id)
);

create table department (
    id varchar(8) NOT NULL,
    name varchar(50),
    location varchar(50),
    PRIMARY KEY (id)
);
insert into employee (id, firstname, lastname, department) values (1,'Abdul','Amin','ACCT');
insert into employee (id, firstname, lastname, department) values (2,'Barbara','Baker','HR');
insert into employee (id, firstname, lastname, department) values (3,'Cherine','Cooper','MGT');


insert into department (id, name, location) values ('ACCT','Accounting','Detroit');
insert into department (id, name, location) values ('ADMIN','Administration','Detroit');
insert into department (id, name, location) values ('CSR','Customer Service','Southfield');
insert into department (id, name, location) values ('HR','Human Resources','Southfield');
insert into department (id, name, location) values ('IT','Information Technology','Grand Rapids');
insert into department (id, name, location) values ('MGT','Management','Southfield');
insert into department (id, name, location) values ('SALES','Sales','Southfield');
