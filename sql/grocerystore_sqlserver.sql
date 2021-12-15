create database grocerystore
go
use grocerystore

create table Category (
	id varchar(10) primary key,
	name varchar(30),
	description varchar(100),
	location varchar(10)
)

create table Product (
	id int identity primary key,
	name varchar(30),
	description varchar(100),
	price decimal(6,2),
	inventory int,
	category_id varchar(10),

	constraint fk_product_category foreign key (category_id) references Category(id)
)
go

insert into category (id, name, description, location) values ('PRODUCE', 'Fruit and Veggies', 'Fresh fruit and vegetables', 'A16')
insert into category (id, name, description, location) values ('DAIRY','Dairy and Eggs','Dairy products plus eggs','A10')
insert into category (id, name, description, location) values ('FROZEN','Frozen Foods','Frozen pizza, frozen dinners, frozen sides','A5')
insert into category (id, name, description, location) values ('MEAT','Meat','Beef, Pork, Chicken, Seafood','B1')
insert into category (id, name, description, location) values ('CONDIMENTS','Condiments','Salad dressings, Ketchup','B3')

insert into product (name, description, price, inventory, category_id) values ('Banana','Ripe and tasty',0.30,50,'PRODUCE')
insert into product (name, description, price, inventory, category_id) values ('Gala Apple','Sweet and crisp',1.20,40,'PRODUCE')
insert into product (name, description, price, inventory, category_id) values ('Orange Juice','Extra pulp the way Grandma served it',2.75,12,'PRODUCE')
insert into product (name, description, price, inventory, category_id) values ('Whole Milk','One Gallon Vitamin D',18.85,22,'DAIRY')
insert into product (name, description, price, inventory, category_id) values ('Large Eggs','One Dozen',0.95,45,'DAIRY')
insert into product (name, description, price, inventory, category_id) values ('Frozen Pizza','Meat lovers',5.45,8,'FROZEN')
insert into product (name, description, price, inventory, category_id) values ('Angus Beef','3-pound package',7.25,12,'MEAT')
insert into product (name, description, price, inventory, category_id) values ('Rotisserie Chicken','3 pound, Fresh cooked',6.25,4,'MEAT')
insert into product (name, description, price, inventory, category_id) values ('Peanut Butter','Smooth and creamy peanutty',4.25,9,'CONDIMENTS')
insert into product (name, description, price, inventory, category_id) values ('Garlic Toast','Crispy and Savory',5.99,6,'FROZEN')
insert into product (name, description, price, inventory, category_id) values ('French Fries','Perfect like Fast Food',6.99,5,'FROZEN')
insert into product (name, description, price, inventory, category_id) values ('Thousand Island','Creamy and Tasty',4.35,6,'CONDIMENTS')
go
