use hr;

####TASK 1
select count(employee_id) as total_emp from employees;

####TASK 2
select department_id, count(department_id) as emp_in_dept from employees group by(department_id);

####TASK 3
select first_name,last_name,salary from employees where salary>6000;

####TASK 4
select count(*) from employees where salary>20000;

####TASK 5
select * from employees where commission_pct is not null;

####TASK 6
select concat(first_name,' ',last_name) as Name from employees where commission_pct is not null;

####TASK 7
select employee_id as "Employee ID",concat(first_name,' ',last_name) as "Employee Full Name",email as "Email ID",phone_number as "Phone Number" from employees;

###TASK 8
select department_id,sum(salary) as SAL from employees group by (department_id) order by SAL desc limit 3;

###TASK 9
select * from employees where department_id=(select department_id from departments where department_name='IT');

####TASK 10
select count(employee_id) as COUNT, avg(salary) as AVG_SAL from employees where department_id=(select department_id from departments where department_name='IT');

####TASK 11
select department_id as "Department ID",count(employee_id) as "Number of Employees" from employees where salary between 7000 and 10000 group by department_id;