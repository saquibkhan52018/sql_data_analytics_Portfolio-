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


--  HAVING CLAUSE PRACTICE -- 


-- Q1 FIND DEPARTMENT HAVING MORE THAN 2 EMPLOYEES -- 
select department,count(*) as total_employee from employees group by department having count(*)>2;


-- Q2 FIND DEPARTMENT HAVING EXACTLY 2 EMPLOYEES --
select department ,count(*) as total_employees from employees group by department having count(*)=2;


-- Q3 FIND DEPARTMENT HAVING FEWER THAN 3 EMPLOYEES --
select department,count(*) as total_employee from employees  group by department having count(*)<3;


-- Q4 FIND DEPARTMENT WHERE TOTAL SALARY IS GREATER THAN 100000 -- 
select department, sum(salary) as total_salary from employees group by department having sum(salary)>100000;


-- Q5 FIND DEPARTMENT WHERE TOTAL SALARY IS LESS THAN 10000 --
select department,sum(salary) as total_salary from employees group by department having sum(salary)<100000;


-- Q6 FIND DEPARTMENT WHERE AVERAGE SALARY IS GREATER THAN 40000 --
select department,avg(salary) as avg_salary from employees group by department having avg(salary)>40000;


-- Q7 FIND DEPARTMENT WHERE AVERAGE SALARY IS LESS THAN 35000 --
select department,avg(salary) as avg_salary from employees group by department having avg(salary)<35000;


-- Q8 FIND CITIES HAVING MORE THAN 2 EMPLOYEES --
select city,count(*) as total_employee from employees group by city having count(*)>2;


-- Q9 FIND CITIES HAVING EXCTLY 2 EMPLOYEE --
select city,count(*) as total_employee from employees group by city having count(*)=2;


-- Q10 FIND DEPARTMENT WITH MAXIMUM SALARY GREATER THAN 45000 --
select department, max(salary) as highest_salary from employees group by department having max(salary)>45000;


-- Q11 FIND DEPARTMENT WHERE MINIMUM SALARY IS GREATER THAN  30000 --
select department,min(salary) as lowest_salary from employees group by department having min(salary)>30000;


-- Q12 FIND DEPARTMENT HAVING TOTOL SALARY EXACTLY 100000 --
select department, sum(salary) as total_salary from employees group by department having sum(salary)=10000;


-- Q13 FIND DEPARTMENT HAVING AVERAGE AGE GREATER THAN 24 --
select department,avg(age) as avg_age from employees group by department having avg(age)>24;


-- Q14 FIND CITY WHERE AVG SALARY IS GREATER THAN 40000 --
select city,avg(salary) as avg_salary from employees group by city having avg(salary)>40000;


-- Q15 FIND CITY WHERE TOTAL SALARY IS GREATER THAN 80000 --
select city,sum(salary) as total_salary from employees group by city having sum(salary)>80000;                     


-- Q16 FIND DEPARTMENT HAVING MORE THAN 1 EMPLOYEES AND TOTAL SALARY ABOVE 70000 --
select department, count(*) as total_employees, sum(salary) as total_salary from employees group by department having count(*)>1 and sum(salary)>70000;


-- Q17 FIND DEPARTMENT HAVING ATLEAST 2 EMPLOYEES --
select department,count(*) as total_employees from  employees group by department having count(*)>=2;


-- Q18 FIND DEPARTMENT WITH AVERAGE SALARY BETWEEN 30000 AND 40000 --
select department,avg(salary) as avg_salary from employees group by department having avg(salary) between 30000 and 40000;


-- Q19 FIND CITY HAVING MORE THAN 1 EMPLOYEES AND AVG SALARY ABOVE 35000 --
select city,count(*) as total_employee,avg(salary) as avg_salary from employees group by city having count(*)>1 and avg(salary)>35000;


-- Q20 FIND DEPARTMENT WHERE MAXIMUM SALARY IS ABOVE 45000 AND MINIMUM SALARY IS BELOW 35000 --
select department,max(salary) as highest_salary ,min(salary) as lowest_salary from employees group by department having max(salary)>45000 and min(salary)<35000;


-- Q21 FIND DEPARTMENT HAVING TOTAL SALARY BETWEEN 70000 AND 150000 --
select department,sum(salary) as total_salary from employees   group by department having sum(salary) between 70000 and 150000;


-- Q22 FIND DEPARTMENT HAVING AVERAGE SALARY EXACTLY 44500 --
select department,avg(salary) as avg_salary from employees group by department having avg(salary)>=44500;  


-- Q23 FIND CITY HAVING TOTAL EMPLOYEE GREATER THAN 3 --
select city,count(*) as total_employee from employees group by city having count(*)>3;  


-- Q24 FIND DEPARTMENT HAVING AT LEAST ONE EMPLOYEE EARNING MORE THAN 50000 --
select department, count(*) as total_employee ,max(salary) as max_salary from employees group by department having count(*)>=1 and max(salary)>50000;


-- Q25 FIND DEPARTMENT WHERE NO EMPLOYEE EARN BELOW 30000 --
select department,min(salary) as total_salary from employees group by department having min(salary)>=30000; 


-- Q26 FIND CITY HAVING AVERAGE AGE ABOVE 25 --
select city, avg(age) as avg_age from employees group by city having avg(salary)>25;


-- Q27 FIND DEPARTMENT HAVING 3 OR MORE EMPLOYEES AND TOTAL SALARY ABOVE 1000000 --
select department,sum(salary) as total_salary ,count(*) as total_employee from employees group by department having sum(salary)>100000 and count(*)>=3; 


-- Q28 FIND CITY WHERE MAXIMUM SALARY IS GREATER THAN 50000 --
select city,max(salary) as high_salary from employees group by city having max(salary)>50000;


-- Q29 FIND DEPARTMENT WHERE TOTAL SALARY IS GREATER THAN AVG SALARY * NUMBER OF EMPLOYEES --
select department, sum(salary) as total_salary from employees group by department having sum(salary)>avg(salary)*count(*); 


-- Q30 FIND DEPARTMENT WHERE AVG SALARY IS GREATER THAN 30000 AND EMPLOYEE COUNT GREATER THAN 2 --
select department,avg(salary) as avg_salary,count(*) as total_employee from employees group by department having avg(salary)>30000 and count(*)>2; 


-- Q31 FIND DEPARTMENT WHERE TOTAL SALARY EXCEEDS 120000 --
select department,sum(salary) as total_salary from employees group by department having sum(salary)>120000;


-- Q32 FIND CITY WHERE EMPLOYEES COUNT IS BETTWEEN 2 AMD 4 --
select city,count(*) as total_employee from employees group by city having count(*) between 2 and 4;

-- Q33 FIND DEPARTMENT WHERE MINIMUM SALARY IS GREATER THAN 25000 --
select department,min(salary) as min_salary from employees group by department having min(salary)>25000;


-- Q34 FIND THE DEPARTMENT WHERE MAXIMUM SALARY IS LESS THAN 50000 --
select department,max(salary) as max_salary from employees group by department having max(salary)<50000;


-- Q35 FIND CITY WHERE AVERAGE SALARY IS AT LEAST 35000 --
select city,avg(salary) as avg_salary from employees group by city having avg(salary)>=35000;


-- Q36 FIND DEPARTMENT HAVING MORE THAN 2 EMPLOYEES AND MAXIMUM SALARY ABOVE 40000 --
select department, count(*) as total_employee , max(salary) as max_salary from employees group by department having count(*)>2 and max(salary)>40000;


-- Q37 FIND CITY HAVING TOTAL SALARY ABOVE 100000 AND AVERAGE SALARY ABOVE 30000 --
select city,sum(salary) as total_salary , avg(salary) as avg_salary from employees group by city having sum(salary)>100000 and avg(salary)>30000;

-- Q38 FIND DEPARTMENT WHERE AVERAGE AGE IS BETWEEN 22 AND 26 --
select department,avg(age) as avg_age from employees group by department having avg(age) between 22 and 26;


-- Q39 FIND DEPARTMENT WHERE EMPLOYEE COUNT IS NOT EQUAL TO 1 --
select department ,count(*) as total_employee from employees group by department having count(*)!=1;


-- Q40 FIND DEPARTMENT WHERE TOTAL SALARY IS NOT LESS THAN 100000 --
select department ,sum(salary) as total_salary from employees group by department having sum(salary)>=100000 ;    
           

-- Q41 FIND THE DEPARTMENT WITH THE HIGHEST TOTAL SALARY --
select department ,sum(salary) as total_salary from employees group by department order by total_salary desc limit 1; 


-- Q42 FIND THE DEPARTMENT WITH THE HIGHEST AVERAGE SALARY --
select department ,avg(salary) as avg_salary from employees group by department order by avg_salary desc limit 1;


-- Q43 FIND THE DEPARTMENT WITH THE LOWEST AVG SALARY --
select department,avg(salary) as avg_salary from employees group by department order by avg_salary asc limit 1;


-- Q44 FIND THE DEPARTMENT WITH THE HIGHEST NUMBER OF EMPLOYEES --
select department,count(*) as total_employee from employees group by department order by total_employee desc limit 1;


-- Q45 FIND DEPARTMENT HAVING MORE THAN 2 EMPLOYEE ORDER BY EMPLOYEE COUNT --    
select department,count(*) as total_employee from employees group by department having count(*)>2 order  by total_employee desc;


-- Q46 FIND DEPARTMENT HAVING AVERAGE SALARY ABOVE 35000 HIGHEST AVERAGE FIRST --
select department,avg(salary) as avg_salary from employees group by department having avg(salary)>35000 order by avg_salary desc;


-- Q47 FIND CITY HAVING MORE THAN 1 EMPLOYEE SORTED ALBHABETICALLY --
select city,count(*) as total_employee from employees group by city having count(*)>1 order by city asc;


-- Q48 FIND DEPARTMENT WITH TOTAL SALARY ABOVE 80000 HIGHEST TOTAL SALARY FIRST --
select department, sum(salary) as total_salary from employees group by department having sum(salary)>80000 order by total_salary desc;


-- Q49 FIND DEPARTMENT HAVING MORE THAN 1 EMPLOYEE AND AVERAGE  SALARY GREATER THAN 35000 --
select department,count(*) as  total_employee,avg(salary) as avg_salary from employees group by department having count(*)>1 and avg(salary)>35000;


-- Q50 FIND DEPARTMENT HAVING MORE THAN 2 EMPLOYEE TOTAL SALARY ABOVE 100000 AND AVERAGE SALARY ABOVE 35000 --
select department,
count(*) as total_employee,
sum(salary) as total_salary,
avg(salary) as avg_salary
from employees 
group by department
having count(*)>2
and sum(salary)>100000 
and avg(salary)>35000;

          

        
  



