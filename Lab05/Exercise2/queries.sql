insert into departments values(1, "Development");
insert into departments values(2, "Web");
insert into departments values(3, "Graphic");
insert into departments values(4, "Game");
insert into departments values(5, "Marketing");

insert into employees values(1, "Vu Ba A", '2003-12-20', '031203006247', 'M', 'Hai Phong', '2025-05-05', 2);
insert into employees values(2, "Vu Ba B", '2002-12-01', '031203006245', 'F', 'Binh Duong', '2025-05-05', 2);
insert into employees values(3, "Vu Ba C", '2003-06-19', '031203006242', 'F', 'Ha Noi', '2025-05-05', 3);
insert into employees values(4, "Vu Ba D", '2001-11-20', '031203006238', 'M', 'Ha Noi', '2025-05-05', 1);
insert into employees values(5, "Vu Ba E", '2001-05-09', '031203006299', 'M', 'Da Nang', '2025-05-05', 5);

insert into projects values(1, 2, curdate(), 40);
insert into projects values(2, 5, curdate(), 38);
insert into projects values(3, 1, curdate(), 35.7);
insert into projects values(4, 3, curdate(), 41.2);
insert into projects values(5, 4, curdate(), 39);


select * from departments;
select * from employees;
select * from projects;

select * from employees
where gender = 'F';

select employees.emp_name, sum(projects.cost) as total_salary
from projects
join employees
on projects.emp_id = employees.emp_id
group by employees.emp_id;

select employees.emp_name
from employees
join departments
on employees.dept_id = departments.dept_id
where departments.dept_name = 'Web';

select departments.dept_name, count(employees.dept_id) as number_of_emps
from departments
left join employees
on departments.dept_id = employees.dept_id
group by employees.dept_id;

select employees.emp_name
from employees
join projects 
on employees.emp_id = projects.emp_id
group by employees.emp_id;

select departments.dept_name, max(employees.dept_id)
from departments
left join employees
on departments.dept_id = employees.dept_id
group by employees.dept_id;

select departments.dept_name, count(employees.dept_id) as number_of_emps
from departments
left join employees
on departments.dept_id = employees.dept_id
group by employees.dept_id
having departments.dept_name = 'Web';

select employees.emp_name, sum(projects.cost) as total_salary
from projects
join employees
on projects.emp_id = employees.emp_id
where employees.cmnd like '%9'
group by employees.emp_id;

select employees.emp_name
from employees
join departments







