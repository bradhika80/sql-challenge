-- List the following details of each employee: employee number, last name, first name, sex, and salary.

select 
	  e.emp_no as "Employee Number",
	  e.last_name as "Last Name",
	  e.first_name as "First Name",
	  e.sex as "Sex", 
	  s.salary  as "Salary"
	  from employee e join salary s on s.emp_no = e.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986.

select 
	  last_name as "Last Name",
	  first_name as "First Name",
	  hire_date as "Hire Date" 
	  from employee where date_part('year', hire_date) = 1986