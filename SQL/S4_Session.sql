use world;

select code from country where name="Finland";
select language from countrylanguage where countrycode="FIN";

#using sub query
select language from countrylanguage where countrycode= (select code from country where name="Finland");

select count(*) from city where countrycode='IND';
select count(*) from countrylanguage where countrycode='IND'; 

select name,
(select count(*) from city where countrycode=code) as cities,
(select count(*) from countrylanguage where countrycode=code) as languages
from country;

select * from (select name,code from country where IndepYear is not null) as k;


select continent,sum(population) as total_p from country group by continent;

select avg(total_p) from (select continent,sum(population) as total_p from country group by continent) as g;

select code from country where continent="Asia";

select * from city where countrycode in ("IND","FIN");

select * from city where countrycode in (select code from country where continent="Asia");

#select * from city where countrycode = (select code from country where continent="Asia");

#select * from city where district in (select code from country where continent="Asia"); since district and country code dosen't match

#patching pair wise data
select * from city where (countrycode,name) in (select code, name from country where continent="Asia");

select * from city where (countrycode,name) not in (select code, name from country where continent="Asia");

#select 'Finland' = (select name from country);

select 'Finland' = any(select name from country);

select name,population from country where population= any(select population from city);


####################################################################################################################

select 0 is true;
select 5 is true;

select name,population from country where population = any (select population from city);

select count(*) from city where exists (select NULL from country where capital=33);

select * from city;
select * from city where exists (select * from country where capital=ID);
select count(*) from city where exists (select * from country where capital=ID);

select count(*) from city where not exists (select * from country where capital=ID);

select * from country;
select capital,name from country where capital is null;
select capital,name from country where capital is null;

######################################################################################################################

