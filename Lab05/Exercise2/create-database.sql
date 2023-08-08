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