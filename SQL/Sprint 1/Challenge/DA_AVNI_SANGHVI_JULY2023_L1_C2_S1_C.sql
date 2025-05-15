################Challenge of Sprint 1

#TASK 1
create database if not exists stylexcarz_db;
use stylexcarz_db;

#TASK 2
create table if not exists salespersons(
salespersonid int primary key not null,
salesperson_name varchar(10) not null,
salesperson_city varchar(30) not null,
commission_rate int not null
);

create table if not exists customers(
customerid int primary key not null,
c_firstname varchar(50) not null,
c_lastname varchar(50) not null,
c_city varchar(50) not null,
c_rating int not null
);

create table if not exists orders(
orderid int primary key not null,
amount int not null,
orderdate date not null,
fk_sid int not null,
fk_cid int not null,
foreign key(fk_sid) references salespersons(salespersonid),
foreign key(fk_cid) references customers(customerid)
);

###TASK 3

#insert into table 1
insert into salespersons values(1001,'William','New York',12);
insert into salespersons values(1002,'Liam','New Jersey',13);
insert into salespersons values(1003,'Axelrod','San Josee',10);
insert into salespersons values(1004,'James','San Diego',11);
insert into salespersons values(1005,'Fran','Austin',26);
insert into salespersons values(1007,'Oliver','New York',15);
insert into salespersons values(1008,'John','Atlanta',2);
insert into salespersons values(1009,'Charles','New Jersey',2);

#insert into table 2
insert into customers values(2001,'Anny','Hoffman','New York',1);
insert into customers values(2002,'Jenny','Giovanni','New Jersey',2);
insert into customers values(2003,'Williams','Liu','San Jose',3);
insert into customers values(2004,'Harry','Grass','San Diego',3);
insert into customers values(2005,'John','Clemens','Austin',4);
insert into customers values(2006,'Fanny','Cisneros','New York',4);
insert into customers values(2007,'Jonathan','Pereira','Atlanta',3);

#insert into table 3
insert into orders values(3001,23,'2020-02-01',1009,2007);
insert into orders values(3002,20,'2021-02-03',1007,2007);
insert into orders values(3003,89,'2021-03-06',1002,2002);
insert into orders values(3004,67,'2021-04-02',1004,2002);
insert into orders values(3005,30,'2021-07-30',1001,2007);
insert into orders values(3006,35,'2021-09-18',1001,2004);
insert into orders values(3007,19,'2021-10-02',1001,2001);
insert into orders values(3008,21,'2021-10-09',1003,2003);
insert into orders values(3009,45,'2021-10-10',1009,2005);

###TASK 4
select * from salespersons;
update salespersons set commission_rate=15 where salespersonid=1001;
update salespersons set commission_rate=15 where salespersonid=1002;
update salespersons set commission_rate=15 where salespersonid=1003;
update salespersons set commission_rate=15 where salespersonid=1004;
update salespersons set commission_rate=15 where salespersonid=1008;
update salespersons set commission_rate=15 where salespersonid=1009;

###TASK 5

#create backup database
create database if not exists stylexcarz_db_bkp;
use stylexcarz_db_bkp;

#backup for orders table
create table if not exists orders_bkp like stylexcarz_db.orders;
insert orders_bkp select * from stylexcarz_db.orders;

####TASK 6
use stylexcarz_db;
select * from orders; #2007,2002
select * from customers;
update customers set c_rating=c_rating + 3 where customerid=2007;
update customers set c_rating=c_rating + 3 where customerid=2002;