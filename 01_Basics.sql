create database sql_Practice;
use sql_Practice;
create table employees
(emp_id int primary key, 
emp_name varchar(50),
department varchar(50),
city varchar(50),
salary int,
age int);

INSERT INTO employees
(emp_id, emp_name, department, city, salary, age)
VALUES
(1, 'Affan', 'IT', 'Mumbai', 30000, 22),
(2, 'Ali', 'HR', 'Delhi', 35000, 25),
(3, 'Sara', 'IT', 'Mumbai', 45000, 24),
(4, 'Zoya', 'Sales', 'Pune', 28000, 23),
(5, 'Ahmed', 'HR', 'Delhi', 40000, 26),
(6, 'Aman', 'IT', 'Lucknow', 32000, 21),
(7, 'Neha', 'Sales', 'Mumbai', 38000, 27),
(8, 'Riya', 'Finance', 'Pune', 42000, 24),
(9, 'Kabir', 'IT', 'Delhi', 50000, 28),
(10, 'Arjun', 'Finance', 'Mumbai', 47000, 25);

select * from employees;
