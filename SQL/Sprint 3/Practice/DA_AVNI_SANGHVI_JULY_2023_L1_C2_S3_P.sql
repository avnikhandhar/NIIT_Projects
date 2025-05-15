use hr;

####TASK 1

select employees.employee_id,employees.first_name,employees.last_name from employees 
left outer join departments 
on 
employees.department_id=departments.department_id 
where departments.department_name='IT';

#other way
select employees.employee_id,employees.first_name,employees.last_name from employees 
inner join departments 
on 
employees.department_id=departments.department_id 
where departments.department_name='IT';

####TASK 2

select min(employees.salary) as MIN,max(employees.salary) as MAX, departments.department_name from employees 
left outer join departments on employees.department_id=departments.department_id 
group by department_name;

####TASK 3

select city,count(*) as emp_count from employees left outer join departments on employees.department_id=departments.department_id natural join locations group by city limit 10;

####TASK 4

select employees.employee_id,employees.first_name,employees.last_name from employees
left outer join job_history
on
employees.employee_id=job_history.employee_id
where job_history.end_date='1999-12-31';

####TASK 5

select employee_id,first_name, department_name, (year(curdate())-year(hire_date)) as Total_Experience from employees 
left outer join departments
on
employees.department_id = departments.department_id
where (year(curdate())-year(hire_date))>=25;