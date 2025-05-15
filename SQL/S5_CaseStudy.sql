use sakila;

show tables;
####TASK 1

select * from actor;

####TASK 2a

select concat(first_name," " ,last_name) as ActorName from actor;

####TASK 2b

select first_name, count(first_name) as Occurence from actor group by first_name;

####TASK 2c 

select last_name, count(last_name) as Occurence from actor group by last_name;

####TASK 3

select rating as Rating,count(*) as "Count of movies" from film group by rating;

####TASK 4

select rating as Rating,avg(rental_rate) as "Average rental rate(in $)" from film group by rating;

####TASK 5a

select title from film where replacement_cost<=9;

####TASK 5b

select title from film where replacement_cost between 15 and 20;

####TASK 5c

select title as MovieName, replacement_cost as Replacement_cost ,rental_rate as Rental_Rate from film order by replacement_cost desc, rental_rate;

####TASK 6 

select film.title as MovieName,count(film_actor.actor_id) as "No. of Actors" from film inner join film_actor 
on film.film_id = film_actor.film_id
group by film.film_id;

####TASK 7

select title from film where title like "K%" or title like "Q%";

####TASK 8

select first_name,last_name from actor inner join film_actor on actor.actor_id=film_actor.actor_id
inner join film
on film_actor.film_id=film.film_id
where film.title="Agent Truman";

####TASK 9

select film.title as Title from film inner join film_category
on film.film_id=film_category.film_id inner join category
on film_category.category_id=category.category_id
where category.name="Family";

####TASK 10

select film.title as Movie_Name,count(rental.rental_id) as Frequency_Rentals from film inner join inventory
on film.film_id= inventory.film_id 
inner join rental
on inventory.inventory_id = rental.inventory_id
group by film.film_id
order by Frequency_Rentals desc;

####TASK 11

select film_category.category_id as "Category ID", count(film_category.category_id) as "No. of Movies", avg((film.replacement_cost-film.rental_rate)) as "AVG Difference"
from film inner join film_category
on film.film_id = film_category.film_id
group by film_category.category_id
having avg((film.replacement_cost-film.rental_rate))>15;

####TASK 12

select category.name as "Genre",count(film.film_id) as "No. of Movies" from film inner join film_category
on film.film_id = film_category.film_id inner join category 
on film_category.category_id = category.category_id
group by category.category_id
order by count(film.film_id);