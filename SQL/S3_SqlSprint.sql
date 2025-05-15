create database mydb;

use mydb;
show tables;
create table table_one(id int primary key,name varchar(20), salary int);
create table table_two(student_names varchar(20),student_id int primary key,age int);
create table table_three(sudent_names varchar(20), student_id int not null primary key, age int); 

insert into table_one values(1,"Ram",222);
insert into table_one values(2,"Asha",333);
insert into table_one values(3,"Raja",444);
insert into table_one values(4,"Rohit",555);
insert into table_one values(5,"Arti",666);

insert into table_two values("Ram",1,11);
insert into table_two values("Raja",2,12);
insert into table_two values("Rohit",4,13);
insert into table_two values("Bina",6,14);
insert into table_two values("Bimal",7,15);

insert into table_three values("Ram",1,11);
insert into table_three values("Raja",3,12);
insert into table_three values("Rohit",4,13);
insert into table_three values("Bina",6,14);
insert into table_three values("Bimal",7,15);

alter table table_three rename column student_id to id;

#inner join when 2 tables have a common column
select * from table_one INNER JOIN table_three using(id);

#inner join: when 2 tables do not have same column name 9but they have same values in primary key column)
select * from table_one INNER JOIN table_two ON table_one.id=table_two.student_id;
select name,salary,age from table_one INNER JOIN table_two ON table_one.id=table_two.student_id;

#outer join: left outer join
select * from table_one left outer join table_two ON table_one.id=table_two.student_id;

#outer join: right outer join
select * from table_one right outer join table_two ON table_one.id=table_two.student_id;

#cross join: 5 in one table and 5 in second table resulting in 25 rows
select * from table_one cross join table_two;
select count(*) from table_one cross join table_two;

#natural join: similar to inner join when the columns have same heading
select * from table_one NATURAL JOIN table_three;
select count(*) from table_one NATURAL JOIN table_three;

#natural join: similar to cross join when the columns do not have same heading:NOT RECOMMENDED
select * from table_one NATURAL JOIN table_two;
select count(*) from table_one NATURAL JOIN table_two;

#ON is not allowed in naural join

#bad practice as merged data is saved as a new table
create table myinnerjoin as(select * from table_one inner join table_three using(id));
select * from myinnerjoin;

#good practice is by creating a view
create view innerT1T3 as (select name,salary,age from table_one INNER JOIN table_three using(id));
select * from innerT1T3;

select avg(salary) as mysal from table_one;

create view avgsalary as (select avg(salary) as mysal from table_one);

use sakila;
show full tables in sakila;
show full tables in sakila where TABLE_TYPE="VIEW"; #gives list of view in database