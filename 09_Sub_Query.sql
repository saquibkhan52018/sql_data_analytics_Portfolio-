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
(12, 'Bareera', 'IT', 80000, 'Mumbai'),
(13, 'Warisha', 'HR', 60000, 'Mumbai'),
(14, 'Ishra' , 'Sales',70000,'Pune' ),
(15, 'Imama' , 'Finance',85000,'Delhi');


select * from emp;



select * from emp where department in(select department from emp where emp_name='Ali');
select * from emp where department in(select department from emp where emp_name='Affan');
select * from emp where city in(select city from emp where emp_name='Affan');
select * from emp where city in(select city from emp where emp_name='Zoya');
select * from emp where department in(select department from emp where emp_name='Ahmed');
select * from emp where city in(select city from emp where emp_name='Riya');
select * from emp where department in(select department from emp where emp_name in('Aman','Neha'));
select * from emp where department in(select department from emp where salary=50000);
select * from emp where city in(select city from emp where department='IT');
select * from emp where salary>any(select salary from emp where department='HR');


-- SUB QUERY QUESTION 

-- Q1 FIND ALL EMPLOYEE WHOSE SALARY IS GREATER THAN THE AVERAGE SALARY 
select * from emp where salary>(select avg(salary) from emp);


-- Q2 FIND THE EMPLOYEE WHO HAS THE HIGHEST SALARY 
select emp_name,salary from emp where salary=(select max(salary) from emp);


-- Q3 FIND EMPLOYEE WHO HAS LOWEST SALARY 
select emp_name,salary from emp where salary=(select min(salary) from emp);


-- Q4 FIND SALARY WHOSE SALARY IS EQUAL TO 50000 
select emp_name,salary from emp where salary=50000;


-- Q5 FIND EMPLOYEE WHOSE SALARY IS GREATER THAN EMPLOYEE 'KABIR'
select * from emp where salary>(select salary from emp where emp_name='Kabir');


-- FIND EMPLOYEE WHO WORK IN THE SAME DEPARTMENT AS AFFAN 
select * from emp
 where department=(select department from emp where emp_name='Affan'); 


-- Q6 FIND EMPLOYEE WHOSE SALARY IS GREATER THAN ANY SALARY IN THE IT DEPARTMENT
select * from emp
 where salary > any(select salary from emp where department='IT'); 


-- Q7 FIND EMPLOYEE WHOSE SALARY IS GREATER THAN ALL SALARY IN THE IT DEPARTMENT 
select * from emp
 where salary > all(select salary from emp where department='IT');


-- Q8 FIND EMPLOYEE WHO BELONG TO DEPARTMENT THAT HAVE EMPLOYEE FROM MUMBAI 
select * from emp
 where department in(select department from emp where city ='Mumbai');


-- Q9 FIND EMPLOYEE WHOSE SALARY IS GREATER THAN THE AVERAGE SALARY OF THE FINANCE DEPARTMENT 
select * from emp
 where salary>(select avg(salary) from emp where department='Finance');


-- Q10 FIND THE SECOND HIGHEST SALARY 
select max(salary) from emp where salary<(select max(salary) from emp);


-- Q11 FIND THE THIRD HIGHEST SALARY 
select  max(salary) from emp
   where salary <(
    select max(salary) from emp where salary<(select max(salary) from emp));
    

-- Q12 FIND THE SALARY WHOSE SALARY IS GREATER THAN BAREERA 
select * from emp where salary>(select salary from emp where emp_name='Bareera');


-- Q13 FIND EMPLOYEE WHO WORK IN THE SAME CITY AS ISHRA 
select * from emp where city=(select city from emp where emp_name='Ishra');


-- Q14 FIND EMPLOYEE WHOSE SALARY IS LESS THAN THE AVERAGE SALARY OF ALL EMPLOYEE 
select * from emp where salary<(select avg(salary) from emp );


-- Q15 FIND THE EMPLOYEE HAVING THE HIGHEST SALARY IN THE IT DEPARTMENT 
select *
 from emp
 where department='IT'
 and salary=(select max(salary)from emp where department='IT');
 
 
 -- Q16 FIND EMPLOYEE WHOSE SALARY IS GREATER THAN THE AVERAGE SALARY OF THEIR DEPARTMENT 
 select e.* from emp e where salary>(select avg(e2.salary) from emp e2 where e2.department=e.department);
 
 
-- FIND EMPLOYEE WHO ARE EARNING MORE THAN ANY EMPLOYEE OF FINANCE 
select * from emp where salary> any (select salary from emp where department='Finance'); 


-- FIND EMPLOYEE WHO ARE EARNING MORE THAN ALL EMPLOYEE IN FINANCE 
select * from emp where salary > all(select salary from emp where department='Finance'); 


-- FIND EMPLOYEE WHOSE DEPARTMENT IS PRESENT IN THE DEPARTMENT OF MUMBAI EMPLOYEE 
select * from emp where department in(select distinct department from emp where city='Mumbai'); 

    
	
