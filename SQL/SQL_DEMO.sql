create database mydemo;

use mydemo;

create table student_data(roll_no int primary key,name varchar(20), age int);

insert into student_data values(101,"Adam",13);
insert into student_data values(102,"Madam",14);
insert into student_data values(103,"Radam",15);

select * from student_data;

#update student_data set age=16; wrong since its sets for every row with age=16

# set sql_safe_updates=0 is the defualt value. The system starts with safe updates. So updating all columns at once is not allowed.Since the wrong
#query will change the entire values of the tables

update student_data set age=16 where roll_no=102; # this is the correct approach

#wrong way to delete
delete from student_data; #safe_updates is not allowing to delete

#right way to delete
delete from student_data where roll_no=101;

