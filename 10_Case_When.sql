create database sql_Practice;
use sql_Practice;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    city VARCHAR(50),
    salary INT,
    age INT
);

INSERT INTO employees (emp_id, emp_name, dept_id, city, salary, age) VALUES
(1, 'Affan', 101, 'Mumbai', 30000, 22),
(2, 'Ali', 102, 'Delhi', 35000, 25),
(3, 'Sara', 101, 'Mumbai', 45000, 24),
(4, 'Zoya', 103, 'Pune', 28000, 23),
(5, 'Ahmed', 102, 'Delhi', 40000, 26),
(6, 'Aman', 101, 'Lucknow', 32000, 21),
(7, 'Neha', 103, 'Mumbai', 38000, 27),
(8, 'Riya', 104, 'Pune', 42000, 24),
(9, 'Kabir', 101, 'Delhi', 50000, 28),
(10, 'Arjun', 104, 'Mumbai', 47000, 25);
select * from employees;

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

INSERT INTO departments VALUES
(101, 'IT'),
(102, 'HR'),
(103, 'Sales'),
(104, 'Finance'),
(105, 'Marketing');

CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    dept_id INT
);

INSERT INTO projects VALUES
(1, 'Website Development', 101),
(2, 'Recruitment System', 102),
(3, 'Sales Dashboard', 103),
(4, 'Financial Analysis', 104),
(5, 'Marketing Campaign', 105);

CREATE TABLE emp (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    city VARCHAR(50)
);

INSERT INTO emp
(emp_id, emp_name, department, salary, city)
VALUES
(1, 'Affan', 'IT', 30000, 'Mumbai'),
(2, 'Ali', 'HR', 35000, 'Delhi'),
(3, 'Sara', 'IT', 45000, 'Mumbai'),
(4, 'Zoya', 'Sales', 28000, 'Pune'),
(5, 'Ahmed', 'HR', 50000, 'Delhi'),
(6, 'Aman', 'IT', 32000, 'Lucknow'),
(7, 'Neha', 'Sales', 38000, 'Mumbai'),
(8, 'Riya', 'Finance', 42000, 'Pune'),
(9, 'Kabir', 'IT', 50000, 'Delhi'),
(10, 'Arjun', 'Finance', 47000, 'Mumbai');

INSERT INTO emp
(emp_id, emp_name, department, salary, city)
VALUES
(11, 'Bushra', 'IT', 30000, 'Mumbai');

INSERT INTO emp
(emp_id, emp_name, department, salary, city)
VALUES
(16, 'Bisma', 'HR', 90000, 'Kerala');




INSERT INTO emp
(emp_id, emp_name, department, salary, city)
VALUES
(12, 'Bareera', 'IT', 80000, 'Mumbai'),
(13, 'Warisha', 'HR', 60000, 'Mumbai'),
(14, 'Ishra' , 'Sales',70000,'Pune' ),
(15, 'Imama' , 'Finance',85000,'Delhi');


select * from emp;

-- CASE 
  -- WHEN Condition THEN Result
  -- WHEN Condition THEN Result
  --  ELSE Result 
     -- END
     
-- if salary is 50000 or more - high
-- if salary is 35000 or more - medium
-- otherwise low --

select emp_name,salary, 
case 
when salary>=50000 then 'High'
when salary>=35000 then 'Medidum'
else 'low'
end as salary_category from emp;


-- salary 50000 + 20% bonus
-- salary 35000 + 10% bonus
-- otherwise 5% bonus

select emp_name, salary,
case 
when salary>=50000 then ' 20% bonus'
when salary>=35000 then ' !0% bonus'
else '5% bonus '
end as salary_bonus
from emp;  
 
 
-- IT __ TECHNOLOGY
-- HR __ HUMAN RESOURCE
-- SALES __ SALES TEAM 
-- OTHERWISE FINANCE


select emp_name, department ,
case 
when department= 'IT' then ' Technology'
when department= 'HR' then ' Human Resource'
when department= ' Sales ' then ' Sales Team '
else 'finance'
end as department_category from emp;

     
-- if salary 50000 __ 3
-- if salary 35000 to  49999 __ 2
-- salary below 35000 __ 1


select emp_name , salary,
case 
when  salary>= 50000 then 3
when salary>= 35000 then 2
else 1
end as salayy_rank from emp; 



-- if employee from  IT and salary 40000 then senior IT
-- otherwise other 


select emp_name, department, salary, 
case
when department='IT' and salary >=70000 then ' Senior It '
when department='HR' and salary >=60000 then ' Senior HR '
when department='Sales' and salary>=50000 then ' Senior Sales '
else ' Other '
end as employee_type from emp;


-- agar employee IT ya HR department meih hai 
-- important department
-- otheserwise other   


select emp_name, department,
case
when department ='IT' or department='HR'
then ' Important Department '
else ' other'
end as department_type from emp; 


-- Count IT department employee and count other employee

select count(
case 
when department='IT' then 1
end) as IT_employee ,
count(
case
when department<>'IT' then 1 end) as other_employees from emp;


-- TOTAL SALARY OF IT DEPARTMENT
SELECT	sum(
case
when department='IT'
then salary 
else 0
end )as IT_total_salary from emp;


-- total salary of HR department 

 
select sum(case when department='HR'
then salary 
else 0
end) as hr_total_salary from emp;
 
 -- SALES TOTAL SALARY 

select sum(case
when  department='Sales'
then salary 
else 0
end) as sales_total_salary from emp; 


-- total salary of finance departments
 
 select sum(
 case 
 when department='Finance' then salary 
 else 0 end ) as finance_total_salary from emp;
   
   
   
 select count(
 case 
 when department='IT' then 1
 end) as it_total,
 count(
 case
 when department!='IT' then 1
 end) as other_emp from emp;
 