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

--  CTE PATTERN 
-- WITH CTE_NAME AS (
-- SELECT ......)
-- SELECT * FROM CTE_NAME    


with high_salary as  (
select emp_name,salary from emp where salary>50000)
select * from high_salary;


select * from emp;

with city_wise as(
select emp_name,city from emp where city='Mumbai')
select * from city_wise;

with dept_wise as (
select emp_name,department from emp where department='HR')
select * from dept_wise;

with dept_wise as (
select emp_name,department , salary from emp where department='IT')
select * from dept_wise;

with dept_avg as(
select department , avg(salary) as avg_salary from emp group by department)
select * from dept_avg;
				
				
with dept_avg as(
select department,avg(salary) as avg_salary from emp group by department) 
select * from dept_avg where avg_salary>50000;

-- SALARY > 50000

with emp_salary as(
select emp_name,salary from emp where salary>50000)
select * from emp_salary;


-- DEPARTMENT WISE AVERAGE SALARY  

with dept_avg as(
select department,avg(salary) as avg_salary from emp group by department)
select * from dept_avg;


-- AVERAGE SALARY >50000

with dept_avg as(
select department, avg(salary) as avg_salary from emp group  by department)
select * from dept_avg where avg_salary >50000;


-- HIGHEST SALARY EMPLOYEE 

with high_salary as (
select max(salary) as highest_salary from emp )
select emp_name,salary from emp where salary= ( select highest_salary from high_salary);

 
 with high_salary as (
 select max(salary) as highest_salary from emp)
 select emp_name,salary from emp where salary=(select highest_salary from high_salary);
 
 
 -- CTE + RANK() HIGHEST PAID OF EVERY DEPPARTMENNT 
 
 with ranked_emp as(
 select emp_name,department,salary, rank() over(partition by department  order by salary desc )  as rnk from emp)
 select emp_name,department,salary from ranked_emp where rnk=1;


-- SECOND HIGHEST SALARY

WITH rank_salary as(
select emp_name,salary,dense_rank() over(order by salary desc) as rnk from emp)
select emp_name,salary from rank_salary where rnk=2;