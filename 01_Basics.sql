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

-- Q1 DISPLAY ALL EMPLOYEES --  
select * from employees;

-- Q2 DISPLAY ONLY EMPLOYEE NAME --
SELECT emp_name from employees;

-- Q3 DISPLAY EMPLOYEE NAME AND SALARY --
SELECT emp_name, salary from employees;

-- Q4 DISPLAY EMPLOYEE NAME AND DEPARTMENT
select emp_name, department from employees;

-- Q5 DISPLAY EMPLOYEE NAME AND CITY --
select emp_name , city from employees;

-- Q6 DISPLAY EMPLOYEE NAME AND AGE --
select emp_name,age from employees;

-- Q7 DISPLAY EMPLOYEE_ID AND EMPLOYEE NAME --
select emp_id,emp_name from employees;

-- Q8 DISPLAY EMPLOYEE_NAME DEPARTMENT AND SALARY --  
select emp_name,department,salary from employees;

-- Q9 DISPLAY EMPLOYEE_NAME AND SALARY WITH NEW HEADING --
select emp_name as employee_name,salary as monthly_salary from employees;

-- Q10 CONVERT EMPLOYEE SALLARY IN ANNUAL SALARY --
select emp_name,salary, salary*12 as annual_salary from employees;

-- Q11 DISPLAY EMPLOYEE NAME AND AGE --
select emp_name, age from employees;

-- Q12 DISPLAY EMPLOYEES COMPLETE DETAILS --
select * from employees;

-- Q13 DISPLAY EMPLOYEE_NAME AND CITY --
select emp_name, city from employees;

-- Q14 DISPLAY EMPLOYEE_NAME , MONTHLY SALARY AND ANNUAL SALARY --
select emp_name,salary as monthly_salary ,salary*12 as annual_salary from employees;

-- Q15 ADD 5000 TO EACH EMPLOYEES SALARY AND DISPLAY THE NEW SALARY --
select emp_name, salary, salary + 5000 as increased_salary from employees; 

-- Q16 SUBSTRACT 2000 FROM EACH EMPLOYEES SALARY AND DISPLAY THE REDUCED SALARY --
select emp_name,salary, salary -2000 as reduced_salary from employees;

-- Q17 DISPLAY THE DAILY SALARY OF EACH EMPLOYEES , ASSUMING 30 DAY PER MONTH  --
select emp_name, salary, salary/30 as perday_salary from employees;

-- Q18 INCRESED EACH EMPLOYEES SALARY BY 10% AND DISPLAY THE NEW SALARY  --
select emp_name ,salary, salary*1.10 as salary_after_10__percent from employees;

-- Q19 DISPLAY CURRENT EMPLOYEE AGE AND AFTER 5 YEAR EMPLOYEE AGE--
select emp_name,age,age+5 as after_5_years from employees;

-- Q20 DISPLAY THE EMPLOYEE_NAME , DEPARTMENT, SALARY AND ANNUAL SALARY --
select emp_name,department, salary, salary*12 as annual_salary from employees;           

             


