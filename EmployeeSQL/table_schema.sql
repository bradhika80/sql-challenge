

DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Title;
DROP TABLE IF EXISTS Department;


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

-- Create Table department
Create Table Department (
  Dept_No varchar(10) PRIMARY KEY,
  Dept_Name varchar(50) NOT NULL);
  
Create Table Dept_Emp (
	Emp_No int NOT NULL,
	Dept_No varchar(10) NOT NULL,
	Primary Key (Emp_No, Dept_No));

-- Add foreign key to Dept_Emp for Emp_No. 
-- If employee is deleted then the record is deleted. If emp_no is updated, the updates are cascaded in the Dept_Emp
Alter Table only Dept_Emp Add CONSTRAINT Emp_No_fkey FOREIGN KEY (Emp_No) REFERENCES Employee(Emp_No) 
                       ON UPDATE CASCADE ON DELETE CASCADE;

-- Add foreign key to Dept_Emp for Dept_No. 
--If department is deleted with employees in department, it is restricted. If no records for corresponding dept in Dept_Emp it is deleted.
-- if dept_no is updated the changes are cascaded to the employees in the dept.
Alter Table only Dept_Emp Add CONSTRAINT Dept_No_fkey FOREIGN KEY (Dept_No) REFERENCES Employee(Emp_No) 
                       ON UPDATE CASCADE ON DELETE RESTRICT;
					   
					   
-- Add foreign key to employee table with Title 
ALTER TABLE ONLY Employee
    ADD CONSTRAINT emp_title_id_fkey FOREIGN KEY (Emp_Title_Id) REFERENCES title(title_id) ON UPDATE CASCADE ON DELETE RESTRICT;
;


