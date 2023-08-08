drop database if exists `VTCAEmployees`;
create database `VTCAEmployees`;
use `VTCAEmployees`;

create table departments(
	dept_id varchar(7) primary key,
    dept_name varchar(50)
);

create table employees(
	emp_id varchar(7) primary key,
    emp_name varchar(50),
    birthday datetime,
    cmnd char(12),
    gender enum('M','F'),
    address varchar(100),
    working_date datetime,
    dept_id varchar(7),
    check(emp_name NOT REGEXP '[0-9]+'),
    check(cmnd REGEXP '^[0-9]+$'),
    check(year(working_date) > year(birthday) + 20),
    constraint `fk_emp_deptId` foreign key(dept_id) references departments(dept_id) on delete set null
);

create table projects(
	project_id varchar(8) primary key,
	emp_id varchar(7),
    assigned_date datetime not null,
    cost double,
    check(cost > 0),
    constraint `fk_prj_empId` foreign key(emp_id) references employees(emp_id) on delete cascade
);


insert into departments values(1, "Development");
insert into departments values(2, "Web");
insert into departments values(3, "Graphic");
insert into departments values(4, "Game");
insert into departments values(5, "Marketing");

insert into employees values(1, "A", '2003-12-20', '012345678910', 'M', 'Hai Phong', '2025-05-05', 2);
insert into employees values(2, "B", '2002-12-01', '112233445566', 'F', 'Binh Duong', '2025-05-05', 2);
insert into employees values(3, "C", '2003-06-19', '778899101011', 'F', 'Ha Noi', '2025-05-05', 3);
insert into employees values(4, "D", '2001-11-20', '111212131314', 'M', 'Ha Noi', '2025-05-05', 1);
insert into employees values(5, "E", '2001-05-09', '141515161617', 'M', 'Da Nang', '2025-05-05', 5);

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









