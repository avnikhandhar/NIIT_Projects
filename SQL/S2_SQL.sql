use sakila;

show tables;

select * from city;
select * from film;

#search for all coulmns for a specific row
select * from film where title="AFRICAN EGG";

#searching few coulmns for a specific row
select title, release_year from film where title="AFRICAN EGG";

select * from film where rental_duration=6 && length=62;

use sakila;
#using and operator
select * from film where length<15 and replacement_cost>50;

#use or operator
select * from film where length<15 or replacement_cost>50;

#use like
select title from film where title like "air%";

select title from film where title like "________"; #with exact 8 characters

select city from city where city like "__"; #with 2 characters

select city from city where city in ("Abu Dhabi","dublin","karnal");

#perform division without remainder

select 8 div 3;

#perform division with remainder
select 8/3;

#perform division with first calculation and then print the rounded number-nearest number
select round(8/3);
select round(7/3);

#get ascii values
select ascii(" ");
select ascii("a");
select ascii("A");

###############################################
select * from actor;

select * from actor  where first_name like "s%";# starting with s followed by any  number of letters including 0
select * from actor  where first_name regexp "^s"; #starting with s only
select * from actor  where first_name regexp "z"; #having z in any position
select * from actor  where first_name regexp "z?"; # returning first_name with 0 or any number f occurences of z

select * from actor  where first_name regexp "z+";
select * from actor  where first_name regexp "z."; # returning with one character after z
select * from actor  where first_name regexp "z...";# returning three characters after z

######################################

select * from film limit 5; #limiting output to 5 outputs

#creating alias

select title as my_movie from film;

#in-built function

select current_user();
select connection_id();
select version();
select database();
select curdate();
select current_date();
select current_timestamp();

select concat("My fav movie is ",title) from film limit 3;
select concat("My fav movie is ",title) as "my fav" from film limit 3;

#arranging in an order
select replacement_cost from film order by replacement_cost; #default is ascending order
select * from film where length>50 order by replacement_cost; #order by is always placed at the end of the command
select * from film order by replacement_cost desc limit 3; 
select * from film order by replacement_cost desc limit 1; #to get highest value of replacement_cost

#group by
#select * from film group by length limit 4;
#select title, rating, rental_rate from film group by rating;

#having
#select * from film group by rental_rate having rental_rate>2;

#count
select count(title) from film;
select count(country_id) from city;

#upper and lower
select upper(title) from film; #converts to upper case
select lower(title) from film; #converts to lower case

#getting length
select char_length(title) from film;

#getting unique values
select distinct(title) from film;

#sum calculate
select sum(rental_rate) from film;

#average calculate
select avg(rental_rate) from film;