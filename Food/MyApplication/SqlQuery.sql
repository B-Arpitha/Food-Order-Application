create database food;
use food;

create table user_table( 
	user_id integer AUTO_INCREMENT, 
	user_name varchar(50) Not Null,
    password varchar(50),
    email varchar(50) unique,
    address varchar(50),
    ph_number long,
    role varchar(25) default 'user',
    PRIMARY KEY  (user_id));
    
insert into user_table
(user_name,password,email,address,ph_number,role) 
values 
( 'arp','arp*','arp@gmail.com','blore','98765321','admin');   
insert into user_table
(user_name,password,email,address,ph_number) 
values 
( 'bru','bru*','bru@gmail.com','blore','98765321');  
    
select * from user_table;

  create table menu_table(
	dish_Name varchar(50) primary key,
    dish_img varchar(20),
    ingredients varchar(200),
    available_Quantity integer,
    price long,
    date_Of_Updation date);
    
insert into menu_table values('dosa','dosa.jpg','dfd','5','56',CURDATE());
insert into menu_table values('idli','idli.jpg','dsfv','5','56',CURDATE());
    
select * from menu_table;

create table cart_table(
cart_id integer AUTO_INCREMENT,
    dish_name varchar(50),
    dish_img varchar(50),
    user_id integer,
    quantity integer,
    price long,
    date_of_insert date,
    primary key(cart_id),
    FOREIGN KEY (dish_name) REFERENCES menu_table(dish_name),
    FOREIGN KEY (user_id) REFERENCES user_table(user_id));
    
 select * from cart_table;
    
select * from order_table;
    