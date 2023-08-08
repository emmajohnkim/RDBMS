use employees;

select * from departments;
select emp_no, first_name, last_name from employees;

select emp_no, first_name, last_name from employees where first_name='Perry';

select emp_no, first_name, last_name, gender from employees where first_name like 'Zi_a';

select emp_no, first_name, last_name from employees where first_name='Perry' limit 10;

select emp_no, first_name, last_name, gender from employees where gender like 'F';

select emp_no, first_name, last_name, gender from employees where last_name like 'Makrucki';

select emp_no, first_name, last_name, gender from employees where gender like 'M' and first_name like 'Y%';

select emp_no, concat(first_name, ' ', last_name) as 'full name',  birth_date  from employees where birth_date like '______6___';

select emp_no, concat(first_name, ' ', last_name) as 'full name', datediff(curdate(), birth_date) div 365 as 'old' from employees where birth_date <= 50 ;

select emp_no, concat(first_name, ' ', last_name) as 'full name', hire_date  from employees where hire_date like '1988%';

select emp_no, hire_date  from employees where hire_date between '1988%' AND  '1999%' ;

select date_format(curdate(), '%d/%m/%Y') as 'today';




