show variables like "secure_file_priv";

use sakila;


(select * from actor)
into outfile
"C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\07-08-2023.txt"
fields terminated by "\t"
lines terminated by "\n";

(select * from actor)
into outfile
"C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\07-08-2023.csv"
fields terminated by ","
lines terminated by "\n";

#######################################################

use mydemo;

show tables;

create table if not exists mynewtable(rollno int,name varchar(20),age int,index age_index(age));

insert into mynewtable values(12,"Rajan",32);
insert into mynewtable values(13,"Raja",34);
insert into mynewtable values(14,"Raman",32);
#insert into mynewtable values(14,"Raman",32,18); # do not enter values for index

select * from mynewtable;

show indexes from mynewtable;