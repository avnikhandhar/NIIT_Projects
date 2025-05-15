use hr;

####TASK 1

select employees.employee_id,employees.first_name,employees.last_name,
(select departments.department_name from departments where employees.department_id=departments.department_id) as DeptName from employees;

####TASK 2

select employee_id,first_name,last_name,salary from employees
where salary > (select avg(salary) group by department_id);

####TASK 3

select first_name,last_name from employees
where department_id in (select department_id from departments where department_name='Sales') and
salary < (select avg(salary) from employees);

####TASK 4 

select first_name,last_name,salary from employees where 
salary > (select max(salary) from employees where department_id in (select department_id from departments where department_name='IT_Prog'))
order by salary;


####TASK 5

select job_id, min(salary) as min_sal from employees group by job_id order by min_sal;

select min(salary) from employees group by job_id order by min(salary);

select * from employees where salary in (select min(salary) as min_sal from employees group by job_id order by min_sal);

####TASK 6

select first_name,last_name, department_id from employees e1 where
salary > (select (0.60*(max(salary))) as SAL from employees e2 where e2.department_id = e1.department_id);

####TASK 7 not done

select * from employees where employees.department_id in (select department_id from departments where departments.location_id in (select location_id from locations where country_id not in ('UK')));

####TASK 8

(select first_name,last_name, salary from employees order by salary desc limit 5)
into outfile
"C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\S4_P8File.csv"
fields terminated by ","
lines terminated by "\n";