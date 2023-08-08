use employees;
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

create index ix_first_namelab6ex1 on employees(first_name, last_name);


CREATE VIEW v_salary AS SELECT e.emp_no, e.first_name, e.last_name, e.gender, s.salary FROM employees AS e INNER JOIN salaries AS s ON e.emp_no=s.emp_no;

SELECT * FROM v_salary;

CREATE VIEW departments_and_employees AS SELECT de.emp_no, de.dept_no, d.dept_name FROM dept_emp AS de INNER JOIN departments AS d ON de.dept_no=d.dept_no;

SELECT * FROM departments_and_employees;

CREATE VIEW departments_info AS SELECT dae.emp_no, dae.dept_no, dae.dept_name FROM departments_and_employees AS dae INNER JOIN dept_manager AS dm ON dae.emp_no=dm.emp_no;

SELECT * FROM departments_info;

CREATE VIEW v_emp AS SELECT di.emp_no, di.dept_no, di.dept_name, e.first_name, e.last_name, e.gender, e.hire_date FROM departments_info AS di INNER JOIN employees AS e ON di.emp_no=e.emp_no;

select * from v_emp;
select * from v_emp where dept_name ='Development';

CREATE VIEW v_emp_info AS SELECT m.emp_no, m.dept_no, m.dept_name, m.first_name, m.last_name, t.title, m.gender, m.hire_date  FROM v_emp AS m INNER JOIN titles AS t ON m.emp_no=t.emp_no;

select * from v_emp_info;

delimiter //
create procedure sp_deptname(IN deptname varchar(100), OUT empNo int)
begin
select * from v_emp  where dept_name=deptname;
select count(*) into empNo from v_emp where dept_name=deptname;

end //
delimiter ;
/* call stored procedure */
call sp_deptname('Development', @empNo);
select @empNo;

delimiter //
create procedure sp_salary(IN slrName varchar(100), OUT empNo int)
begin
select * from v_salary where salary = slrName ;
select count(*) into empNo from v_salary where salary = slrName ;
end //
delimiter ;
/* call stored procedure */
call sp_OutParameterDemo('Georgi', @empNo);
select @empNo;


delimiter //
create procedure sp_title(IN tName varchar(100), OUT empNo int)
begin
select * from v_emp_info where title = tName ;
select count(*) into empNo from v_emp_info where title = tName ;
end //
delimiter ;
/* call stored procedure */
call sp_title('Senior Staff', @empNo);
select @empNo;



