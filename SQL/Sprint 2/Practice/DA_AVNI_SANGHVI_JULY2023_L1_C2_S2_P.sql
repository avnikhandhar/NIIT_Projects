###########Practice of Sprint 2

###TASK 1
use sakila;
select * from customer where active=0;

###TASK 2
select first_name,last_name,email from customer where active=0;

###TASK 3

select store_id from customer where active=0 group by store_id order by count(active) desc limit 1;

###TASK 4
select title from film where rating='PG-13';

###TASK 5

select title as Title from film where rating='PG-13' order by length desc limit 3;

###TASK 6
select title from film where rating='PG-13' order by rental_duration limit 1;

###TASK 7
select avg(rental_rate) from film;

###TASK 8
select sum(replacement_cost) from film;

###TASK 9
select * from category;
select * from film_category;

select count(film_id) from film_category left join category on film_category.category_id=category.category_id where name="Animation";
select count(film_id) from film_category left join category on film_category.category_id=category.category_id where name="Children";

#Other way of achieving the result
select count(*) from film_category where category_id = (select category_id as aid from category where name='Animation');
select count(*) from film_category where category_id = (select category_id as aid from category where name='Children');