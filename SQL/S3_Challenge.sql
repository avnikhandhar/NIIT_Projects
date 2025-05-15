use hr;

####TASK 1

create view top_cities as (select city,count(*) as emp_count from employees 
left outer join departments 
on 
employees.department_id=departments.department_id 
natural join locations 
group by city
order by emp_count desc
limit 5);

select * from top_cities;

####TASK 2

select employees.first_name,employees.last_name,employees.salary,departments.department_name,locations.city,countries.country_name
from employees
inner join departments
on employees.department_id = departments.department_id
inner join locations
on departments.location_id = locations.location_id
inner join countries
on locations.country_id = countries.country_id
where locations.city in (select city from top_cities);

####TASK 3

create view Count_Emp as (select locations.city, count(*) as emp_count from employees
inner join departments
on employees.department_id = departments.department_id
inner join locations
on departments.location_id = locations.location_id
group by city);

select * from Count_Emp where emp_count<10;

####TASK 4

create view avg_exp as (select employees.first_name,(year(curdate())-year(hire_date)) as exp from employees
inner join departments
on employees.department_id = departments.department_id
inner join locations
on departments.location_id = locations.location_id
where locations.city in (select city from Count_Emp));

select avg(exp) as Avg_Exp from avg_exp;

####TASK 5

select employees.first_name,employees.last_name,employees.email,employees.phone_number, (year(curdate())-year(hire_date)) as exp from employees
inner join departments
on employees.department_id = departments.department_id
inner join locations
on departments.location_id = locations.location_id
where locations.city in (select city from top_cities) and (year(curdate())-year(hire_date))>=10;

####TASK 6

select employees.manager_id as Manager_ID from employees
inner join departments
on employees.department_id = departments.department_id
inner join locations
on departments.location_id = locations.location_id
where locations.city in (select city from top_cities) and (year(curdate())-year(hire_date))>=10;