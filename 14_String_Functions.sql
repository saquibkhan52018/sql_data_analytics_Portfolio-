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

select upper(emp_name) from emp;

select lower(emp_name) from emp;

select emp_name, length(emp_name) as name_lenght from emp;

select concat(emp_name, '-', department) as emp_info from emp;

select emp_name, left(emp_name,3) as first_3 from emp;

select emp_name,right(emp_name,3) as last_3 from emp;

select emp_name,substring(emp_name,1,4)as first_4 from emp;

select concat_ws('/',emp_name,city)as emp_info from emp;

select replace(city,'Bombay','Mumbai')as new_city from emp;

select trim(emp_name)as clean_name from emp;

 