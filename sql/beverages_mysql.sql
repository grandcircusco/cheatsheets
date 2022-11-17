drop database if exists beverages;
create database beverages;

use beverages;

create table drink (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(50),
    ingredients varchar(200),
    alcohol boolean,
    PRIMARY KEY (id)
);

INSERT INTO `beverages`.`drink` (`name`,`ingredients`,`alcohol`) VALUES ('Pepsi', 'Secret', false );
INSERT INTO `beverages`.`drink` (`name`,`ingredients`,`alcohol`) VALUES ('Dark and Stormy', 'Rum, Ginger Beer, Lime', true );
INSERT INTO `beverages`.`drink` (`name`,`ingredients`,`alcohol`) VALUES ('Fanta', 'Flavor,sugar,water', false );
