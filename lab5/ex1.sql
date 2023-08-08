use employees;

select * from employees
where gender = "F";

select employees.emp_no, first_name, last_name, max(salaries.salary) as highest_salary
from employees
join salaries
on employees.emp_no = salaries.emp_no
group by salaries.emp_no;

select employees.emp_no, first_name, last_name
from employees
join titles
on employees.emp_no = titles.emp_no
where titles.title = 'Senior Engineer';

select employees.emp_no, first_name, last_name
from employees
join titles
on employees.emp_no = titles.emp_no
join dept_emp
on employees.emp_no = dept_emp.emp_no
where titles.title = 'Senior Engineer'
and dept_emp.dept_no = (
	select dept_no from departments
    where dept_name = 'Development'
);

select titles.title as job, 
       count(*) as employees_count 
from titles
join employees
on titles.emp_no = employees.emp_no
group by titles.title;

select departments.dept_no, 
	   departments.dept_name as job, 
	   sum(salaries.salary) as total_salary
from departments
join dept_emp
on departments.dept_no = dept_emp.dept_no
join salaries
on dept_emp.emp_no = salaries.emp_no
group by dept_emp.dept_no;

select employees.first_name, employees.last_name, departments.dept_name 
from employees
join dept_manager
on employees.emp_no = dept_manager.emp_no
join departments
on dept_manager.dept_no = departments.dept_no
where year(dept_manager.from_date) = 1988;

select employees.first_name, employees.last_name
from employees
join dept_emp
on employees.emp_no = dept_emp.emp_no
join departments
on dept_emp.dept_no = departments.dept_no
where year(dept_emp.from_date) >= 1985;

select titles.title as job, 
	   avg(salaries.salary) as avg_salary
from titles
join employees
on titles.emp_no = employees.emp_no
join salaries
on employees.emp_no = salaries.emp_no
group by titles.title;

select departments.dept_no, 
	   departments.dept_name, 
	   count(*) as female_emp_count
from departments
join dept_emp
on departments.dept_no = dept_emp.dept_no
join employees
on dept_emp.emp_no = employees.emp_no
where employees.gender = 'F'
group by dept_emp.dept_no;

select departments.dept_no, 
	   departments.dept_name,
       employees.last_name as manager,
       employees.gender
from departments
join dept_manager
on departments.dept_no = dept_manager.dept_no
join employees
on dept_manager.emp_no = employees.emp_no
where employees.gender = 'F'
group by dept_manager.dept_no;








