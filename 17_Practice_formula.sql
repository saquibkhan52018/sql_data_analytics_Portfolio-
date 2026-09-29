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

select * from departments;
select * from employees;
select * from emp;
select * from projects;

CREATE TABLE students_2025 (
    student_id INT,
    student_name VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO students_2025 (student_id, student_name, city) VALUES
(9, 'Bushra', 'Mumbai'),
(10, 'Ishra', 'Pune'),
(11, 'Bisma', 'Delhi'),
(12, 'Warisha', 'Nashik');


INSERT INTO emp
(emp_id, emp_name, department, salary, city)
VALUES
(12, 'Bareera', 'IT', 80000, 'Mumbai'),
(13, 'Warisha', 'HR', 60000, 'Mumbai'),
(14, 'Ishra' , 'Sales',70000,'Pune' ),
(15, 'Imama' , 'Finance',85000,'Delhi');

CREATE TABLE students_2026 (
    student_id INT,
    student_name VARCHAR(50),
    city VARCHAR(50)
);


INSERT INTO students_2026 (student_id, student_name, city) VALUES
(13, 'Bushra', 'Mumbai'),
(14, 'Imama', 'Pune'),
(15, 'Filza', 'Mumbai'),
(16, 'Warisha', 'Nashik');


CREATE TABLE orders_date (
    order_id INT,
    customer_name VARCHAR(50),
    order_date DATE,
    amount INT
);
INSERT INTO orders_date
(order_id, customer_name, order_date, amount)
VALUES
(101, 'Bareera', '2026-01-15', 5000),
(102, 'Ishra', '2026-02-20', 7000),
(103, 'Warisha', '2026-03-10', 4500),
(104, 'Imama', '2026-04-25', 8000),
(105, 'Bushra', '2026-05-05', 6500);

select * from orders_date;


 


select order_date,date_format(order_date , '%d-%m-%y')as formatted_date from orders_date;

select order_date,date_format(order_date,'%dd-%mm-%yy')as formatted_date from orders_date;

select order_date ,date_format(order_date,'%D-%M-%Y')as formatted_date from orders_date; 

select month(order_date) as  month_sales ,sum(amount) as total_sales from orders_date group by month(order_date);

select monthname(order_date)as month,
sum(amount)as total_sales
from orders_date
group by month(order_date),
monthname(order_date)
order by month(order_date);


select count(*) as total_employees;


 MULTIPLE JOIN QUESTION --

-- Q16 DISPLAY THE EMPLOYEE NAME,DEPARTMENT NAME,AND PROJECT NAME --
select e.emp_name,d.dept_name,p.project_name
from employees e 
inner join departments d 
on e.dept_id=d.dept_id
inner join projects p 
on e.dept_id=p.dept_id;


-- Q17 DISPLAY THE EMPLOYEE NAME,SALARY ,DEPARTMENT NAME AND PROJECT NAME FRO EMPLOYEES WORKING IN THE IT DEPARTMENT --
select e.emp_name,e.salary ,d.dept_name,p.project_name
from employees e
inner join departments d
on e.dept_id=d.dept_id
inner join projects p  
on e.dept_id=p.dept_id
where d.dept_name='IT';

  
-- Q18 DISPLAY EMPLOYEE WHO ARE WORKING ON THE WEBSITE DEVELOPMENT PROJECT ALONG WITH DEPARTMENT NAME --
select e.emp_name,d.dept_name,p.project_name
from employees e 
inner join departments d
on e.dept_id=d.dept_id
inner join projects p 
on e.dept_id=p.dept_id
WHERE p.project_name='Website Development';
  
  
-- Q19 DISPLAY EMPLOYEE NAME,DEPARTMENT NAME,PROJECT NAME,AND SALARY FOR EMPLOYEE EARNING MORE THAN 40000 --
select e.emp_name,e.salary,d.dept_name,p.project_name
from employees e 
inner join departments d 
on e.dept_id=d.dept_id
inner join  projects p 
on e.dept_id=p.dept_id
where e.salary>40000; 


-- Q20 DISPLAY ALL THE EMPLOYEE ALONG WITH THEIR DEPARTMENT
-- AND PROJECTS INFORMATION INCLUDING EMPLOYEES
-- WHO MAY NOT HAVE A MATCHING PROJECTS --
select e.emp_name,d.dept_name,p.project_name
from employees e 
inner join departments d 
on e.dept_id=d.dept_id
left join projects p 
on e.project_id=p.project_id;
  
  select * from employees;
  select * from departments;
  select * from projects;
  
  alter table employees add column project_id int;
  
UPDATE employees SET project_id = 1 WHERE emp_id = 1; -- Affan -> Website Development;
UPDATE employees SET project_id = 2 WHERE emp_id = 2; -- Ali -> Recruitment System;
UPDATE employees SET project_id = 3 WHERE emp_id = 4; -- Zoya -> Sales Dashboard;
update employees set project_id = 4 where emp_id = 5; -- Aman -> Marketing Campaign;

