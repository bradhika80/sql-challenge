
--Student Name : Radhika Balasubramaniam
-- Project Description : Build the database schema for the Employee

-- Create Table Employee  
Create Table Employee (
  Emp_No int PRIMARY KEY,
  Emp_Title_Id varchar(10) NOT NULL,
  Birth_Date Date NOT NULL,
  First_Name varchar(50) NOT NULL,
  Last_name varchar(50) NOT NULL,
  Sex varchar(10),
  Hire_Date Date NOT NULL);

-- Create Table Title
Create Table Title (
  Title_Id	varchar(10) PRIMARY KEY,
  Title varchar(100) NOT NULL);

				   
-- Add foreign key to employee table with Title 
--Deleting a title is restricted if there is still employees with the title. 
-- if title_id is updated the changes are cascaded to the Emp_Title_Id in the employees.
ALTER TABLE ONLY Employee
    ADD CONSTRAINT emp_title_id_fkey FOREIGN KEY (Emp_Title_Id) REFERENCES title(title_id) 
	ON UPDATE CASCADE ON DELETE RESTRICT;


-- Create Table department
Create Table Department (
  Dept_No varchar(10) PRIMARY KEY,
  Dept_Name varchar(50) NOT NULL);
 
 -- Create Table Dept_Emp
Create Table Dept_Emp (
	Emp_No int NOT NULL,
	Dept_No varchar(10) NOT NULL,
	Primary Key (Emp_No, Dept_No));

-- Add foreign key to Dept_Emp for Emp_No. 
-- If employee is deleted from employee table then the record is deleted from Dept_Emp (no longer working). 
-- If emp_no is updated from employee table, the updates are cascaded in the Dept_Emp
Alter Table only Dept_Emp Add CONSTRAINT Emp_No_fkey FOREIGN KEY (Emp_No) REFERENCES Employee(Emp_No) 
                       ON UPDATE CASCADE ON DELETE CASCADE;

-- Add foreign key to Dept_Emp for Dept_No. 
--Deletion of Department is restricted if there are employees still with the department.
-- if dept_no is updated in department, then the changes are cascaded to the employees in the dept.
Alter Table only Dept_Emp Add CONSTRAINT Dept_No_fkey FOREIGN KEY (Dept_No) REFERENCES Department(Dept_No) 
                       ON UPDATE CASCADE ON DELETE RESTRICT;

-- Create Table Dept_Manager
Create Table Dept_Manager (	
	Dept_No varchar(10) NOT NULL,
	Emp_No int NOT NULL,
	Primary Key (Dept_No, Emp_No));

-- Add foreign key to Dept_Manager for Emp_No. 
-- Deleting an employee from employee table it is restricted. The department should be asssigned new manager. 
-- If emp_no is updated from employee table, the updates are cascaded in the Dept_Manager
Alter Table only Dept_Manager Add CONSTRAINT Emp_No_fkey FOREIGN KEY (Emp_No) REFERENCES Employee(Emp_No) 
                       ON UPDATE CASCADE ON DELETE RESTRICT;

-- Add foreign key to Dept_Manager for Dept_No. 
--Deleting a department is restricted if there is still a  manager record for the department. 
-- if dept_no is updated the changes are cascaded to the employees in the dept.
Alter Table only Dept_Manager Add CONSTRAINT Dept_No_fkey FOREIGN KEY (Dept_No) REFERENCES Department(Dept_No)
                       ON UPDATE CASCADE ON DELETE RESTRICT;

 -- Create Table Salary
Create Table Salary (	
	Emp_No int NOT NULL Primary Key ,
	Salary float);

-- Add foreign key to Salary for Emp_No. 
-- If employee is deleted from employee table the record is deleted from salary, because salary is associated with employee. 
-- If emp_no is updated from employee table, the updates are cascaded in the Salary
Alter Table only Salary Add CONSTRAINT Emp_No_fkey FOREIGN KEY (Emp_No) REFERENCES Employee(Emp_No) 
                       ON UPDATE CASCADE ON DELETE CASCADE;
