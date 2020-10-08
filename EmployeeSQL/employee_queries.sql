-- List the following details of each employee: employee number, last name, first name, sex, and salary.

select 
	  e.emp_no as "Employee Number",
	  e.last_name as "Last Name",
	  e.first_name as "First Name",
	  e.sex as "Sex", 
	  s.salary  as "Salary"
	  from employee e join salary s on s.emp_no = e.emp_no;
	  
