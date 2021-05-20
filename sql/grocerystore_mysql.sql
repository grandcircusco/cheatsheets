create database grocerystore;
use grocerystore;
CREATE TABLE category (
    id VARCHAR(10) NOT NULL,
    name VARCHAR(30),
    description VARCHAR(100),
    location VARCHAR(10),
    PRIMARY KEY (id)
);
CREATE TABLE product (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(30),
    description VARCHAR(100),
    price DECIMAL(6 , 2 ),
    inventory INT,
    category VARCHAR(10),
    PRIMARY KEY (id)
);

insert into product (name, description, price, inventory, category) values ('Banana','Ripe and tasty','0.3','50','FRUIT');
insert into product (name, description, price, inventory, category) values ('Gala Apple','Sweet and crisp','1.2','40','FRUIT');
insert into product (name, description, price, inventory, category) values ('Orange Juice','Extra pulp the way Grandma served it','2.75','12','FRUIT');
insert into product (name, description, price, inventory, category) values ('Whole Milk','One Gallon Vitamin D','18.85','22','DAIRY');
insert into product (name, description, price, inventory, category) values ('Large Eggs','One Dozen','0.95','45','DAIRY');
insert into product (name, description, price, inventory, category) values ('Frozen Pizza','Meat lovers','5.45','8','FROZEN');
insert into product (name, description, price, inventory, category) values ('Angus Beef','3-pound package','7.25','12','MEAT');
insert into product (name, description, price, inventory, category) values ('Rotisserie Chicken','3 pound, Fresh cooked','6.25','4','MEAT');
insert into product (name, description, price, inventory, category) values ('Peanut Butter','Smooth and creamy peanutty','4.25','9','CONDIMENTS');
insert into product (name, description, price, inventory, category) values ('Garlic Toast','Crispy and Savory','5.99','6','FROZEN');
insert into product (name, description, price, inventory, category) values ('French Fries','Perfect like Fast Food','6.99','5','FROZEN');
insert into product (name, description, price, inventory, category) values ('Thousand Island','Creamy and Tasty','4.35','6','CONDIMENTS');

insert into category (id, name, description, location) values ('FRUIT','Fruit and Veggies','Fresh fruit and vegetables','A15');
insert into category (id, name, description, location) values ('DAIRY','Dairy and Eggs','Dairy products plus eggs','A10');
insert into category (id, name, description, location) values ('FROZEN','Frozen Foods','Frozen pizza, frozen dinners, frozen sides','A5');
insert into category (id, name, description, location) values ('MEAT','Meat','Beef, Pork, Chicken, Seafood','B1');
insert into category (id, name, description, location) values ('CONDIMENTS','Condiments','Salad dressings, Ketchup','B3');
