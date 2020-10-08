--1. List the following details of each employee: employee number, last name, first name, sex, and salary.

select 
	  e.emp_no as "Employee Number",
	  e.last_name as "Last Name",
	  e.first_name as "First Name",
	  e.sex as "Sex", 
	  s.salary  as "Salary"
	  from employee e join salary s on s.emp_no = e.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.

select 	  
	  first_name as "First Name",
	  last_name as "Last Name",
	  hire_date as "Hire Date" 
	  from employee where date_part('year', hire_date) = 1986
	  
--3. List the manager of each department with the following information:
--      department number, department name, the manager's employee number, last name, first name.

select 
       d.dept_no as "Department Number",
	   d.dept_name as "Department Name",
	   e.emp_no as "Manager Employee Number",
	   e.last_name as "Manager Last Name",
	   e.first_name as "Manager First Name"
	   from department d 
	               join dept_manager dm on dm.dept_no = d.dept_no
				   join employee e on dm.emp_no = e.emp_no
	
--4. List the department of each employee with the following information: employee number, last name, first name, and department name
select      
	   e.emp_no as "Employee Number",
	   e.last_name as "Last Name",
	   e.first_name as "First Name",
	   d.dept_name as "Department Name"
	   from employee e 
	               join dept_emp de on de.emp_no = e.emp_no 
				   join department d on de.dept_no = d.dept_no
				   
-- 5. list first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select 	  
	  first_name as "First Name",
	  last_name as "Last Name",
	  sex as "Sex" 
	  from employee where first_name = 'Hercules' and last_name like 'B%'