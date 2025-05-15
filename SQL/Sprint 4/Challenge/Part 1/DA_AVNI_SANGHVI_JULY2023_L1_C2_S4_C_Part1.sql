use world;

####TASK 1

select * from country;

select count(*) as count from country;

select name,population from country where code in ('USA','GBR','ARE');

####TASK 2

select continent, sum(population) as total_population from country group by continent order by total_population desc;

####TASK 3

select name as CountryNames from country where continent='Europe' and code in (select countrycode from countrylanguage where language='French');

####TASK 4

select name from country where population in (select max(population) from country group by continent);