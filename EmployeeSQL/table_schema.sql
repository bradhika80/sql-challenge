

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
  

-- Add foreign key to employee table with Title 
ALTER TABLE ONLY Employee
    ADD CONSTRAINT emp_title_id_fkey FOREIGN KEY (Emp_Title_Id) REFERENCES title(title_id);


