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


--       DAY 05_ PRACTICE  GROUP BY     --


-- Q1 FIND THE NUMBER OF EMPLOYEES IN EACH DEPARTMENT --
select department, count(*)  as total_employees from employees group by department;  


-- Q2 FIND THE TOTAL SALARY OF EACH DEPARTMENT --
select department,sum(salary) as total_salary from employees group by department ;


-- Q3 FIND THE AVERAGE SALARY OF EACH DEPARTMENT --
select department , avg(salary) as avg_salary from employees group by department;


-- Q4 FIND THE HIGHEST SALARY IN EACH DEPARTMENT --
select department,max(salary) as high_salary from employees group by department;


-- Q5 FIND THE LOWEST SALARY IN EACH DEPARTMENT -- 
select department, min(salary) as low_salary from employees group by department;


-- Q6 FIND THE NUMBER OF  EMPLOYEES IN EACH CITY --
select city, count(*) as total_employees from employees group by city;  


-- Q7 FIND THE TOTAL SALARY PAID IN EACH CITY -- 
select city ,sum(salary) as salary_paid from employees group by city;


-- Q8 FIND THE AVERAGE SALARY IN EACH CITY --  
  select city,avg(salary) as avg_salary from employees group by city;
  
  
-- Q9 FIND THE HIGHEST SALARY IN EACH CITY --   
select city ,max(salary) as highest_salary from employees group by city;


-- Q10 FIND THE LOWWEST SALARY IN EACH CITY --
select city,min(salary) as lowest_salary from employees group by city;


-- GROUP BY WITH AGE --
     
-- Q11 FIND THE NUMBER OF EMPLOYEES OF EACH AGE --
select age,count(*) as total_employees from employees group by age;    


-- Q12 FIND THE AVERAGE SALARY FOR EACH AGE --
select age, avg(salary) as avg_salary from employees group by age;


-- Q13 FIND THE HIGHEST SALARY OF EACH AGE --
select age, max(salary) as Highest_salary from employees group by age;


-- Q14 FIND THE LOWEST SALARY OF EACH AGE --
select age,min(salary) as lowest_salary from employees group by age;


-- Q15 FIND THE TOTAL SALARY OF EACH AGE --
select age, sum(salary) as total_salary from employees group by age;


-- GROUP BY + ORDER BY --


-- Q16 FIND EMPLOYEES IN EACH DEPARTMENT AND SORT BY EMPLOYEE COUNT --
select department, count(*) as total_employees from employees group by department order by total_employees;


-- Q17 SORT DEPARTMENT BY EMPLOYEES COUNT FROM HIGHEST TO LOWEST --
select department,count(*) as total_employees from employees group by department order by total_employees desc; 


-- Q18 SORT DEPARTMENT BY TOTAL SALARY FROM HIGHEST TO LOWEST --
select department, sum(salary) as total_salary from employees group by department order by total_salary desc;


-- Q19 SORT CITIES BY AVERAGE SALARY FROM HIGH TO LOW --
select city,avg(salary) as avg_salary from employees group by city order by avg_salary desc;


-- Q20 SORT DEPARTMENT BY HIGHEST SALARY --
select department ,max(salary) as highest_salary from employees group by department order by highest_salary desc; 


--                 USE GROUP BY + WHERE               --


-- Q21 FIND THE NUMBER OF EMPLOYEES IN EACH DEPARTMENT WHOSE SALARY IS ABOVE 30000 --
select department,count(*) as total_employees from employees where salary>30000 group by department;


-- Q22 FIND AVERAGE SALARY OF EMPLOYEES OLDER THAN 23  IN EACH DEPARTMENT --
select department,avg(salary) as avg_salary from employees where age>23 group by department;


-- Q23 FIND TOTAL SALARY BY DEPARTMENT FOR EMPLOYEES EARNING MORE THAN 35000 --
select department, sum(salary) as total_salary from employees where salary>35000 group by department;


-- Q24 FIND THE HIGHEST SALARY IN EACH DEPARTMENT FOR EMPLOYEES OLDER THAN 23 --
select department,max(salary) as highest_salary from employees where age>23 group by department;


-- Q25 FIND THE NUMBER OF EMPLOYEES IN EACH CITY WHOSE SALARY IS ABOVE 40000 --
 select city,count(*) as total_salary from employees where salary>40000 group by city;
 
 --   MULTIPLE COLUMN GROUP BY   --  
 
 
 -- Q26 COUNT EMPLOYEE BY DEPARTMENT AND CITY --
 select department , city,count(*) as Total_employees from employees group by department,city;
 
 
 -- Q27 FIND TOTAL SALARY BY DEPARTMENT AND CITY --
 select department,city, sum(salary) as total_salary from employees group by department,city;
 
 
 -- Q28 FIND AVERAGE SALARY BY DEPARTMENT AND CITY --
 select department,city,avg(salary) as avg_salary from employees group by  department,city;
 
 
 -- Q29 FIND HIGHEST SALARY BY DEPARTMENT AND CITY --
 select department ,city ,max(salary) as highest_salary from employees group by department,city;
 
 
 -- Q30 FIND LOWEST SALARY BY DEPARTMENT AND CITY --  
select department,city,min(salary) as lowest_salary from employees group by department ,city;


-- Q31 FIND THE DEPARTMENT WITH THE HIGHEST TOTAL SALARY --
select department,sum(salary) as total_salary from employees group by department order by total_salary desc limit 1;


-- Q32 FIND THE DEPARTMENT WITH THE HIGHEST AVERAGE SALARY --
select department,avg(salary) as avg_salary from employees group by department order by avg_salary desc limit 1;


-- Q33 FIND THE CITY WITH THE HIGHEST AVERAGE SALARY 
select city,avg(salary) as avg_salary from employees group by city order by avg_salary desc limit 1;


-- Q34 FIND THE DEPARTMENT WITH THE LOWEST TOTAL SALARY --
select department,min(salary) as lowest_salary from employees group by department order by lowest_salary  limit 1;  


-- Q35 FIND THE CITY WITH THE HIGHEST NUMBER OF EMPLOYEES --
select city ,count(*) as total_employee from employees group by city order by total_employee desc limit 1;


-- Q36 FIND THE DEPARTMENT WITH THE LOWEST NUMBER OF EMPLOYEES --
select department,count(*) as total_employee from employees group by department order by total_employee limit 1; 


-- Q37 FIND TOTAL AND AVERAGE SALARY FOR EACH DEPARTMENT --
select department, sum(salary) as total_salary,avg(salary) as avg_salary from employees group by department ;


-- Q38 FIND MAXIMUM AND MINIMUM SALARY FOR EACH DEPARTMENT --
select department ,max(salary) as highest_salary ,min(salary) as lowest_salary from employees group by department; 


-- Q39 FIND EMPLOYEES COUNT AND TOTAL SALARY FOR EACH CITY --
select city,count(*) as total_employees,sum(salary) as total_salary from employees group by city;


-- Q40 FIND EMPLOYEES COUNT , MINIMUM SALARY AND MAXIMUM SALARY BY DEPARTMENT --
select department, count(*) as total_employee,
max(salary) as highest_salary,
min(salary) as lowest_salary
from employees 
group by department ;


-- Q41 FIND AVERAGE AGE OF EMPLOYEE IN EACH DEPARTMENT --
select department,avg(age) as avg_age from employees group by department;


-- Q42 FIND MAXIMUM AGE IN EACH DEPARTENT --
select department,max(age) as high_age from employees group by  department;


-- Q43 FIND MINIMUM AGE IN EACH DEPARTMENT --
select department,min(age) as min_age from employees group by department;       

       
-- Q44 FIND THE NUMBER OF EMPLOYEE IN EACH DEPARTMENT AND SORT ALBHABETICALLY --
select department,count(*) as total_employees from employees group by department order by total_employees; 


-- Q45 FIND TOTAL SALARY FOR EACH DEPARTMENT AND SORT FROM LOWEST TO HIGHEST --
select department,sum(salary) as total_salary from employees group by department order by total_salary ;


--  Q46 FIND AVERAGE SALARY BY CITY AND SORT FROM HIGHEST TO LOWEST --
select city,avg(salary) as avg_salary from employees group by city order by avg_salary desc;


-- Q47 FIND THE NUMBER OF EMPLOYEES BY DEPARTMENT AND CITY SORTED BY EMPLOYEES COUNT --
select department, city,count(*) as total_employees from employees group by department ,city order by total_employees desc;


-- Q48 FIND TOTAL SALARY BY DEPARTMENT AND CITY SORTED BY TOTAL SALARY --
select department , city ,sum(salary) as  total_salary from employees group by department,city order by total_salary desc;


-- Q49 FIND THE AVG SALARY OF EMPLOYEES IN MUMBAI FOR EACH DEPARTMENT --
select  department,avg(salary) as avg_salary from employees where city='Mumbai' group by department;


-- Q50 FIND THE HIGHEST PAID DEPARTMENT BASED ON AVG SALARY --
select department ,avg(salary) as avg_salary from employees group by department order by avg_salary desc limit 1;   
  
  
  
  