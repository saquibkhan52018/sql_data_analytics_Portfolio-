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

select department,avg(salary) from emp group by department;


-- Window Function 

 
select
emp_name,
department,
salary,avg(salary) over(partition by department) as avg_salary from emp;

select emp_name,department,salary,sum(salary) over(partition by department) as total_salary from emp;

-- Row_Number()

select emp_name,department,salary ,row_number() over(order by salary desc) as row_num from emp; 

select emp_name,department,salary ,row_number() over(order by salary desc ) as row_num from emp;

-- RANK()
select emp_name,salary,rank()over(order by salary desc) as rank_emp from emp;
select emp_name,department,salary,rank() over(order by salary desc) as ranking from emp;

-- DENSE RANK()
SELECT	emp_name,department,salary,dense_rank()over(order by salary desc) as salary_dense from emp;


-- PARTITION BY 
select emp_name,department,salary , rank() over(partition by department order by salary desc) as salary_partititon from emp;
select emp_name,department,salary,rank() over(partition by department order by salary desc) as partititon_salary from emp;

select emp_name,department,salary,row_number()over(partition by department order by salary desc) as salary_rank from emp;

-- SUM() OVER()
select emp_name,salary,sum(salary) over() as total_salary from emp; 
select emp_name,department,salary ,sum(salary) over(partition by department ) as dept_total_salary from emp;
select emp_name,department,salary,sum(salary) over (partition by department ) as dept_total_salary from emp;
select emp_name,department,salary,sum(salary) over (partition by department ) as dept_total_salary from emp;

-- avg() over()

select emp_name,department,salary,avg(salary) over (partition by department ) as dept_avg_salary from emp;

-- lag ()

select emp_name,salary, lag(salary) over (order by salary desc) as previous_salary from emp;

-- Lead()

select emp_name ,salary , lead(salary) over (order by salary desc) as next_salary from emp;


-- sum() over() running 

select  emp_name,salary,sum(salary) over (order by salary desc) as running_total from emp;
select emp_name,salary,sum(salary) over (order by salary asc) as running_total from emp;


-- partition by running total 
 
 select emp_name,department,salary, sum(salary) over (partition by department order by salary) as running_total from emp;
select emp_name,department ,salary,  sum(salary) over (partition by department order by salary desc ) as running_total from emp;
  


-- FIND THE HIGHEST PAID EMPLOYEES IN EACH DEPARTMENT 
select emp_name,department,salary from (
select emp_name,department,salary,row_number()over(partition by department order by salary desc) as rn from emp) t where rn=1;


-- SHOW EACH EMPLOYEE SALARY ALONG WITH THE AVERAGE SALARY OF THEIR DEPARTMENT
select emp_name,department,salary, avg(salary) over (partition by department ) as avg_salary from emp;


-- SHOW EACH EMPLOYEE SALARY AND THE DIFFRENT THEIR SALARY AND THE PREVIOUS EMPLPYEE SALARY 
select emp_name,salary,lag(salary) over (order by salary) as previous_salary from emp;


-- SHOW EACH EMPLOYEE SALARY AND THE NEXT EMPLOYEE SALARY
select emp_name,salary,lead(salary) over (order by salary desc) as next_salary from emp;


-- ASSING A UNIQUE NUMBER TO EMPLOYEE BASED ON SALARY FROM HIGHEST TO LOWEST WITHIN EACH DEPARTMENT
SELECT emp_name,department,salary, row_number() over (partition by department order by salary desc) as  unique_emp from emp;


-- CALCULATE THE RUNNIG TOTAL OF SALARIES WITHIN EACH DEPARTMENT FROM HIGH TO LOW SALARY 
select emp_name,department,salary, sum(salary) over(partition by department order by salary desc) as dept_runnig_total from emp;


--  SHOW EACH EMPLOPYEE SALARY AND THE TOTAL SALARY OF THEIR DEPARTMENT IN THE SAME ROW
select emp_name,department,salary , sum(salary) over(partition by department )as total_salary from emp;



-- FIND THE EMPLOYEE WITH THEIR THIER HIGHEST SALARY IN THE COMPANY
select emp_name,salary from(
select emp_name,salary ,
                  dense_rank () over(order by salary desc)
									as rnk from emp)
                                    t where rnk=3;
                                    
  
  -- second highest salary in each department 
select emp_name,department,salary from (
select emp_name,department, salary ,
          dense_rank() over(partition by department order by salary desc) as rnk from emp) t where rnk=2;
								