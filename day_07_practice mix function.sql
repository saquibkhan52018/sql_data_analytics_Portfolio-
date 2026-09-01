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

-- PART 1 DISTINCT FUNCTION --  

-- Q1 DISPLAY ALL UNIQUE DEPARTMENT -- 
select distinct department from employees ;


-- Q2 DISPLAY ALL UNIQUE CITY -- 
select distinct city from employees; 


-- Q3 DISPLAY UNIQUE COMBINNATION OF DEPARTMENT AND CITY -- 
select distinct department,city from employees;


-- Q4 FIND THE NUMBER OF UNIQUE DEPARTMENT --
select count(distinct department) as  unique_department from employees ;


-- Q5 FIND THE NUMBER OF UNIQUE CITY --
select count(distinct city ) as unique_city from employees;


-- PART 02 LIMIT --


-- Q6 DISPLAY THE FIRST 5 EMPLOYEE --
select * from employees limit 5 ;


--  Q7 DISPLAY THE FIRST 3 EMPLOYEES WITH THE HIGHEST SALARY --
select * from employees order by salary desc limit 3;


-- Q8 DISPLAY THE 2 EMPLOYEES WITH LOWEST SALARY --
select * from employees order by salary asc limit 2;


-- Q9 DISPLAY THE TOP HIGHEST PAID EMPLOYEES --
select * from employees order by salary desc limit 1;


-- Q10 DISPLAY ONLY THE FIRST 2 IT EMPLOYEES --
select * from employees where department='IT'  limit 2;     


--  PART 3 COUNT() --

-- Q11 COUNT TOTAL EMPLOYEE --
select count(*) from employees;


-- Q12 COUNT EMPLOYEE IN IT 
select department,count(*) from employees where department='IT'; 


-- Q13 COUNT EMPLOYEE FROM MUMBAI --
select city,count(*) from employees where city='Mumbai';


-- Q14 COUNT EMPLOYEE WHOSE SALARY IS GREATER THAN 40000 --
select count(*)  from employees where salary>40000;  


-- Q15 COUNT EMPLOYEE WHOSE AGE IS 25 OR ABOVE --
select count(*) as employee from employees where age>=25;


-- PART 04 SUM() FUNCTION --

-- Q16 FIND TOTAL SALARY OF ALL EMPLOYEE --
select sum(salary) as total_salary from employees ;


-- Q17 FIND TOTAL SALARY PAID TO IT --
select sum(salary) as total_it_salary from employees where department='IT'; 


-- Q18 FIND TOTAL SALARY PAID TO HR --
select sum(salary) as total_hr_salary from employees where department='HR';


-- Q19 FIND TOTAL SALARY OF EMPLOYEE FROM MUMBAI --
select sum(salary) as total_Mum_salary from employees where city='Mumbai';


-- Q20 FIND TOTAL SALARY OF EMPLOYEE EARNING MORE THAN 35000 --
select sum(salary) as total_salary from employees where salary>35000;


-- PART 05 AVG() FUNCTION --

-- Q21 FIND AVERAGE SALARY OF ALL EMPLOYEES --
select avg(salary) from employees;


-- Q22 FIND AVERAGE SALARY OF IT EMPLOYEE --
select avg(salary) from employees where department='IT';


-- Q23 FIND AVERAGE SALARY OF HR EMPLOYEE --
select avg(salary) from employees where department='HR';


-- Q24 FIND AVERAGE SALARY OF ALL EMPLOYEE --
select avg(salary) as avg_salary from employees;


-- Q25 FIND AVERAGE SALARY OF EMPLOYEE FROM MUMBAI --
select avg(salary) as avg_salary from employees where city='Mumbai';   


-- PART 06 MIN() AND MAX() FUNCTION --

-- Q26 FIND THE HIGHEST SALARY --
select max(salary) as highest_salary from employees ;


-- Q27 FIND THE LOWEST SALARY -- 
select min(salary) as lowest_salary from employees ;


-- Q28 FIND THE HIGHEST AGE --
select max(age) as highest_age from employees;


-- Q29 FIND THE LOWEST AGE -- 
select min(age) as lowest_age from employees ;


-- Q30 FIND THE HIGHEST SALARY IN IT DEPARTMENT --
select max(salary) as high_salary from employees where department='IT';

-- PART 07 GROUP BY AGGREGATE FUNCTION --


-- Q31 FIND THE NUMBER OF EMPLOYEE IN EACH DEPARTMENT --
select department,count(*) as total_employee from employees group by department;


-- Q32 FIND THE TOTAL SALARY OF EACH DEPARTMENT --
select department,sum(salary) as total_salary from employees group by department;


-- Q33 FIND AVERAGE SALARY OF EACH DEPARTMENT --
select department,avg(salary) as avg_salary from employees group by department;


-- Q34 FIND THE HIGHEST SALARY OF EACH DEPARTMENT -- 
select department,max(salary) as highest_salary from employees group by department;


-- Q35 FIND THE LOWEST SALARY OF EACH DEPARMENT -- 
select department,min(salary) as lowest_salary from employees group by department;


-- Q36 COUNT EMPLOYEE IN EACH DEPARTMENT --
select department,count(*) as total_employee from employees group by department;


-- Q37 FIND THE TOTAL SALARY IN EACH CITY --
select city,sum(salary) as total_salary from employees group by city;


-- Q38 FIND AVG SALARY IN EACH CITY -- 
select city,avg(salary) as avg_salary from employees group by city;


-- Q39 FIND DEPARTMENT HAVING MORE THAN 2 EMPLOYEES --
select department, count(*) as total_employee from employees group by department having count(*)>2;


-- Q40 FIND DEPARTMENT WHOSE TOTAL SALARY IS GREATER THAN 100000 --
select department,sum(salary) as total_salary from employees group by department having sum(salary)>100000;


   --  PART 08 MIXED QUESTION -- 
   
-- Q41 FIND THE TOP HIGHEST PAID EMPLOYEES -- 
select emp_name,salary from employees order by salary desc limit 3; 


-- Q42 FIND THE 3 LOWEST PAID EMPLOYEE -- 
SELECT emp_name,salary FROM employees order by salary asc limit 3; 


-- Q43 FIND THE HIGHEST PAID IT EMPLOYEES --
select department,max(salary) as highest_salary from employees where department='IT' ORDER BY department desc limit 1;


-- Q44 FIND THE LOWEST PAID SALES EMPLOYEE --
select department , min(salary) as lowest_paid from employees where department='Sales' order by department asc limit 1;  


-- Q45 FIND DEPARTMENT WHERE AVERGE SALARY IS GREATER THAN 40000 --
select department,avg(salary) as avg_salary from employees group by department having avg(salary)>40000;


-- Q46 FIND CITY HAVING MORE THAN 2 EMPLOYEE --            
select city ,count(*) as total_employee from employees group by city having count(*)>2;


-- Q47 FIND THE DEPARTMENT WITH THE HIGHEST TOTAL SALARY --
select department,max(salary) as highest_salary from employees group by department order by highest_salary desc limit 1; 


-- Q48 FIND THE DEPARTMENT WITH THE LOWEST AVERAGE SALARY --
select department ,avg(salary) as avg_salary from employees group by department order by avg_salary asc limit 1;


-- Q49 FIND THE TOP 2 DEPARTMENT BASED ON TOTAL SALARY --
select department, sum(salary) as total_salary from employees group by department order by total_salary desc limit 2;  
                     
         
-- Q50 FIND CITY WHERE THE AVERAGE IS GREATER THAN 35000 AND SHOW THEM FROM HIGHEST AVERAGE SALARY TO LOWEST --
select city,
avg(salary) as avg_salary 
from employees 
group by city 
having avg_salary>35000 
order by avg_salary desc ;  
 


          

        
  



