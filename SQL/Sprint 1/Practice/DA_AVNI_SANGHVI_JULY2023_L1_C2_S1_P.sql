######################################PRACTICE FOR SPRINT 1

#######TASK 1

create database if not exists techmac_db;
use techmac_db;

#######TASK 2

#create first table
create table if not exists techhyve_employees( 
employee_id int,
firstName varchar(10),
lastName varchar(10),
gender varchar(7),
age int
);

#create second table
create table if not exists techcloud_employees(
employee_id int,
firstName varchar(10),
lastName varchar(10),
gender varchar(7),
age int
);

#create third table
create table if not exists techsoft_employees(
employee_id int,
firstName varchar(10),
lastName varchar(10),
gender varchar(7),
age int
);

alter table techhyve_employees modify employee_id varchar(8);
alter table techcloud_employees modify employee_id varchar(8);
alter table techsoft_employees modify employee_id varchar(8);

#set primary key constraint in first table
alter table techhyve_employees add constraint primary key(employee_id);

#set primary key constraint in second table
alter table techcloud_employees add constraint primary key(employee_id);

#set primary key constraint in third table
alter table techsoft_employees add constraint primary key(employee_id);

#age constraint in table 1
alter table techhyve_employees add constraint check (age>21 and age<55);

#age constraint in table 2
alter table techcloud_employees add constraint check (age>21 and age<55);

#age constraint in table 3
alter table techsoft_employees add constraint check (age>21 and age<55);

##############TASK 3

#adding column in table 1
alter table techhyve_employees add (Communication_Proficiency int);
alter table techhyve_employees add constraint check(Communication_Proficiency>=1 and Communication_Proficiency<=5);
alter table techhyve_employees alter Communication_Proficiency set default 1;

#adding column in table 2
alter table techcloud_employees add (Communication_Proficiency int);
alter table techcloud_employees add constraint check(Communication_Proficiency>=1 and Communication_Proficiency<=5);
alter table techcloud_employees alter Communication_Proficiency set default 1;

#adding column in table 3
alter table techsoft_employees add (Communication_Proficiency int);
alter table techsoft_employees add constraint check(Communication_Proficiency>=1 and Communication_Proficiency<=5);
alter table techsoft_employees alter Communication_Proficiency set default 1;

########TASK 4

#insert data into table 1
insert into techhyve_employees values('TH0001','Eli','Evans','Male',26,1);
insert into techhyve_employees values('TH0002','Carlos','Simmons','Male',32,2);
insert into techhyve_employees values('TH0003','Kathie','Bryant','Femaale',25,1);
insert into techhyve_employees values('TH0004','Joey','Hughes','Male',41,4);
insert into techhyve_employees values('TH0005','Alice','Mattews','Female',52,4);

#insert data into table 2
insert into techcloud_employees values('TC0001','Teresa','Bryant','Female',39,2);
insert into techcloud_employees values('TC0002','Alexis','Patterson','Male',48,5);
insert into techcloud_employees values('TC0003','Rose','Bell','Female',42,3);
insert into techcloud_employees values('TC0004','Gemma','Watkins','Female',44,3);
insert into techcloud_employees values('TC0005','Kingston','Martinez','Male',29,2);

#insert data into table 3
insert into techsoft_employees values('TS0001','Peter','Burtler','Male',44,4);
insert into techsoft_employees values('TS0002','Harold','Simmons','Male',54,4);
insert into techsoft_employees values('TS0003','Juliana','Sanders','Female',36,2);
insert into techsoft_employees values('TS0004','Paul','Ward','Male',29,2);
insert into techsoft_employees values('TS0005','Nicole','Bryant','Female',30,2);

#####TASK 5

create database if not exists backup_techmac_db;
use backup_techmac_db;

#For table 1
create table if not exists techhyve_employees_bkp like techmac_db.techhyve_employees;
insert techhyve_employees_bkp select * from techmac_db.techhyve_employees;

#For table 2
create table if not exists techcloud_employees_bkp like techmac_db.techcloud_employees;
insert techcloud_employees_bkp select * from techmac_db.techcloud_employees;

#For table 3
create table if not exists techsoft_employees_bkp like techmac_db.techsoft_employees;
insert techsoft_employees_bkp select * from techmac_db.techsoft_employees;

##########TASK 6

use techmac_db;

#deleting from table 1
delete from techhyve_employees where employee_id='TH0003';
delete from techhyve_employees where employee_id='TH0005';

#deleting from table 2
delete from techcloud_employees where employee_id='TC0001';
delete from techcloud_employees where employee_id='TC0004';

#####TASK 7
use techmac_db;
select * from techhyve_employees union select * from techcloud_employees;

truncate table techhyve_employees;
truncate table techcloud_employees;