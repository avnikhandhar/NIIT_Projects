use sakila;

#TASK 1 Display full names of actors
select concat(first_name,' ',last_name) as full_name from actor;

#TASK 2i Display number of times each first names appears
select first_name,count(first_name) as frequency from actor group by first_name;

#TASK 2ii Count of actors that have unique first names
select count(distinct first_name) from actor;

#TASK 3i Display the number of times each last name appears in the database
select last_name,count(last_name) as frequency from actor group by last_name;

#TASK 3ii Display all the unique last names
select count(distinct last_name) from actor;

#TASK 4i Display the list of records for movies which are rated 'R'
select title from film where rating='R';

#TASK 4ii Display the list of records which are not rated 'R'
select title from film where rating!='R';

#TASK 4iii Display the records which are suitable for audience below 13 years of age.
select title from film where rating='PG-13';

#TASK 5i Display the records where replacement cost is up to $11.
select title from film where replacement_cost<=11;

#TASK 5ii Display the records where replacement cost is between $11 and $20.
select title from film where replacement_cost between 11 and 20;

#TASK 5iii Display the movies in decrasing order of their replacement costs
select title,replacement_cost from film order by replacement_cost desc;

#TASK 6 Display top 3 movies with greatest number of actors
select actor.first_name, actor.last_name, count(film_actor.actor_id) as count
from actor inner join film_actor on actor.actor_id = film_actor.actor_id
group by film_actor.actor_id 
order by count desc
limit 3;

#TASK 7 Display the titles of movies starting with letter 'K' and 'Q'
select * from film where title like 'K%' or title like 'Q%';

#TASK 8 Display all the actors in 'Agent Truman' film.
select first_name,last_name from actor inner join film_actor on actor.actor_id=film_actor.actor_id
inner join film
on film_actor.film_id=film.film_id
where film.title="Agent Truman";

#TASK 9 Identify all the movies categorized as family films
select title from film where film_id in (select film_id from film_category where category_id in (select category_id from category where name='Family'));

#TASK 10i Display the maximum,minimum and average rental rates of movies based on ratings. The output must be in descending order of average rental rates.
select rating,max(rental_rate) as MAX, min(rental_rate) as MIN, avg(rental_rate) as average 
from film 
group by rating
order by average desc;

#TASK 10ii Display the movies in descending order of rental frequencies.
select film.title as Movie_Name,count(rental.rental_id) as Frequency_Rentals from film inner join inventory
on film.film_id= inventory.film_id 
inner join rental
on inventory.inventory_id = rental.inventory_id
group by film.film_id
order by Frequency_Rentals desc;

#TASK 11 In how many film categories,the difference between the average film replacement cost and average film rental rate is greater than $15.
#Identify such films, along with correspinding average film replacement cost and average film rental rate
select film_category.category_id as "Category ID", count(film_category.category_id) as "No. of Movies", avg((film.replacement_cost-film.rental_rate)) as "AVG Difference"
from film inner join film_category
on film.film_id = film_category.film_id
group by film_category.category_id
having avg((film.replacement_cost-film.rental_rate))>15;

#TASK 12 Display the film categories in which the number of movies is greater than 70............not done
select category.name as "Genre",count(film.film_id) as No_of_Movies from film inner join film_category
on film.film_id = film_category.film_id inner join category 
on film_category.category_id = category.category_id
group by category.category_id
having count(film.film_id)>70
order by count(film.film_id) desc;