use sakila;

####TASK 1

select film.film_id as ID,film.title as MovieName,count(rental_id) as "Number of Copies" from film inner join inventory on 
film.film_id = inventory.film_id inner join rental on
inventory.inventory_id = rental.inventory_id
where film.title in ("Brotherhood blanket","Soup Wisdom")
group by film.film_id;

####TASK 2

select category.name as Genre,count(film.title) as "No. of Movies" from film inner join film_category on
film.film_id = film_category.film_id inner join category on
film_category.category_id = category.category_id
group by category.name;

####TASK 3

select first_name,last_name,sum(replacement_cost) as replacement_cost from 
(select first_name,last_name,(select replacement_cost from film where film.film_id = film_actor.film_id) as replacement_cost 
from film_actor left join actor using(actor_id)) as t1 group by first_name,last_name order by replacement_cost desc limit 3;

####TASK 4

select name as Genre,(select sum(amount) from payment where
rental_id in (select rental_id from rental where 
inventory_id in (select inventory_id from inventory where
film_id in (select film_id from film_category where film_category.category_id=category.category_id)))) as Sales from
category;

####TASK 5

