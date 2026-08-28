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


--  WHERE CLAUSE  BASIC --

-- Q1 FIND ALL EMPLOYEE WHO LIVE IN MUMBAI --  
select * from employees where city= 'Mumbai';

-- Q2 FIND ALL EMPLOYEE WHO LIVE IN DELHI --  
select * from employees where city ='Delhi';

-- Q3 FIND ALL EMPLOYEES WHO WORK IN IT DEPARTMENT --
select * from employees where department ='IT';

-- Q4 FIND EMPLOYEE WHOSE SALARY IS GRATER THAN 30000 --
select * from employees where salary >30000;
  
-- Q5 FIND EMPLOYEE WHO SALARY IS GRATER THAN 40000 --   
select * from employees where salary >40000;

-- Q6 FIND EMPLOYEES WHOSE SALARY IS LESS THAN 30000 --
select * from employees where salary<30000;

-- Q7 FIND EMPLOYEE WHOSE AGE IS GRATER THAN 25 --
select * from employees where age>25;

-- Q8 FIND EMPLOYEE WHOSE AGE IS LESS THAN 25 --
select * from employees where age<25;

-- Q9 FIND EMPLOYEE WHOSE SALARY EXACT 35000 --
select * from employees where salary =35000;

-- Q10 FIND EMPLOYEE WHOSE NAME IS AFFAN --
select * from employees where emp_name ='Affan';

--  WHERE CLAUSE MEDIUM QUESTION  --

-- Q11 FIND EMPLOYEE WHO WORK IN IT_DEPT AND LIVE IN MUMBAI --
select * from employees where department='IT' and city = 'Mumbai';

-- Q12 FIND EMPLOYEE WHO WORK IN THE HR_DEPT AND LIVE IN DELHI --
select * from employees where department='HR' and city='Delhi';

-- Q13 FIND EMPLOYEE WHOSE SALARY IS GREATER THAN AND EQUAL TO 40000 --
select * from employees where salary>=40000; 

-- Q14 FIND EMPLOYEE WHOSE SALARY BETWEEN 30000 AND 40000 --
select * from employees where salary between 30000 and 40000;

-- Q15 FIND EMPLOYEE WHO AGE EITHER 22 OR 23 --
select * from employees where age in (22,23);

-- Q16 FIND EMPLOYEE WHO LIVE IN EITHER MUMBAI OR DELHI --
select * from employees where city in ('Mumbai','Delhi');

-- Q17 FIND EMPLOYEES WHO WORK IN EITHER IT OR FINANCE -- 
select * from employees where department in ('IT','Finance');   

-- Q18 FIND EMPLOYEE WHO DO NOT WORK IN HR DEPARTMENT --
select * from  employees where department!='HR';

-- Q19 FIND EMPLOYEE WHOSE SALARY IS GREATER THAN 35000 AND AGE LESS THAN 25 --
select * from employees where salary>35000 and age<25;

-- Q20 FIND EMPLOYEE WHO DO NOT LIVE IN MUMBAI --
select * from employees where city!='Mumbai';

-- Q21 FIND IT_DEPT FROM MUMBAI WHOSE SALARY IS GREATER THAN 40000 --
select * from employees where department='IT' and city='Mumbai' and salary>40000;

-- Q22 FIND DELHI EMPLOYEE WHOSE SALARY BETWEEN 35000 AND 50000 --
select * from employees where city='Delhi' and salary between 35000 and 50000;

-- Q23 FIND IT EMPLOYEE WHOSE AGE IS LESS THAN 25 --
select * from employees where department='IT' and age<25;

-- Q24 FIND EMPLOYEE WHO LIVE IN MUMBAI AND PUNE AND HAVE SALARY IS GRATER THAN 40000 --
select * from employees where city in('Mumbai','Pune') and salary>40000;

-- Q25 FIND EMPLOYEE WHO EITHER WORK IN IT OR HAVE A SALARY GREATER THAN 45000 --
select * from employees where department='IT' or salary =45000;

-- Q26 FIND EMPLOYEE WHO WORK IN IT AND HAVE A SALARY GREATER THAN 35000 --
select * from employees where department='IT' and salary>35000;

 -- Q27 FIND EMPLOYEE WHO LIVE IN MUMBAI AND ARE YOUNGER THAN 25 --
 select * from employees where city='Mumbai' and age<25;
 
 -- Q28 FIND EMPLOYEE WHOSE SALARY IS BETWEEN 30000 AND 45000 AND AGE IS GREATER THAN 22 --
 select * from employees where salary between 30000 and 45000 and age>22;
 
 -- Q29 FIND EMPLOYEE WHO WORK IN IT OR HR AND HAVE SALARY GREATER THAN 35000 --
 select * from employees where department in ('IT','HR' )and salary>35000;
 
 -- Q30 FIND EMPLOYEE WHO LIVE IN MUMBAI OR DELHI AND ARE OLDER THAN 24 --
 select * from employees where city in ('Mumbai','Delhi') and age>24;
 
 -- Q31 FIND EMPLOYEE WHO ARE NOT LIVE IN DELHI AND SALARY HAVE GREATER THAN  40000 --
 select * from employees where city!='Delhi' and salary>40000;
 
 -- Q32 FIND EMPLOYEE WHO WORK IN FINANCE AND SALARY HAVE GREATER THAN 40000 --
 select * from employees where department='Finance' and salary>40000;
 
 -- Q33 FIND EMPLOYEES WHOSE  AGE IS BETWEEN 22 AND 26 --
 select * from employees where age between 22 and 26;
 
 -- Q34 FIND EMPLOYEE WHOSE SALARY NOT BETWEEN 30000 AND 40000 --
 select * from employees where salary not between 30000 and 40000 ;
 
 -- Q35 FIND EMPLOYEE WHO ARE EITHER YOUNGER THAN 23 OR HAVE A SALARY  IS GREATER THAN 45000 --
 select * from employees where age<23 or salary>45000;
 
 -- Q36 FIND IT EMPLOYEE FROM MUMBAI OR DELHI --
 select * from employees where city in ('Mumbai','Delhi') and department='IT';
 select * from employees where department='IT' and city in ('Mumbai','Delhi');
 
 -- Q37 FIND EMPLOYEE WHO ARE NOT WORKING IN IT AND HAVE SALARY LESS THAN 40000 --
 select * from employees where department!='IT' and salary<40000;
 select * from employees where salary<40000 and department!='IT';
 
 -- Q38 FIND EMPLOYEE FROM MUMBAI WHOSE SALARY IS BETWEEN 30000 AND 40000 --
 select * from employees where city='Mumbai' and salary between 30000 and 40000 ;
 
 -- Q39 FIND EMPLOYEE WHO WORK IN IT OR FINANCE AND ARE YOUNGER THAN 26 --
 select * from employees where department in ('finance','IT')and age<26;
 
 -- Q40 FIND EMPLOYEE WHOSE SALARY IS GREATER THAN 30000 BUT LESS THAN 45000 --
 select * from employees where salary>30000 and salary<45000;
 
 -- Q41 FIND EMPLOYEE FROM DELHI WHO ARE EITHER YOUNGER THAN 26 OR HAVE A SALARY GREATER THAN 45000 --
 select * from employees where department='Delhi' and (age<26 or salary>45000);
 
 -- Q42 FIND EMPLOYEE WHO ARE FROM MUMBAI AND DO NOT WORK IN IT --
 select * from employees where city='Mumbai' and department!='IT';
 
 -- Q43 FIND EMPLOYEE WHOSE SALARY IS ATLEAST 40000 AND AGE IS BETWEEN 24 AND 28 --
 select * from employees where salary>=40000 and age between 24 and 28;
 
 -- Q44 FIND EMPLOYEE WHO LIVE IN MUMBAI , DELHI AND PUNE AND HAVE SALARY GREATER THAN 35000 --
 select * from employees where city in ('Mumbai','Pune','Delhi') and salary>35000;
 
 -- Q45 FIND EMPLOYEE WHO ARE NOT FROM MUMBAI AND DO NOT WORK IN HR --
 select * from employees where city!='Mumbai' and department!='HR';

-- Q46 FIND EMPLOYEE WHO WORK IN IT OR SALES AND HAVE SALARY BETWEEN 30000 AND 45000 --
select * from employees where department in ('IT','Sales')and salary between 30000 and 45000;

-- Q47 FIND EMPLOYEE FROM MUMBAI WHOSE AGE IS GREATER THAN 22 AND SALARY IS LESS THAN 45000 --
select * from employees where department='Mumbai' and age>22 AND salary<45000; 

-- Q48 FIND EMPLOYEE WHO ARE NOT FROM DELHI AND WHOSE SALALRY IS NOT BETWEEN 30000 AND 40000 --
select * from employees where department!='Delhi' and salary not between 30000 and 40000;

-- Q49 FIND EMPLOYEE WHO WORK IN IT AND ARE EITHER YOUNGER THAN 25 OR HAVE A SALARY GREATER THAN 45000 --
select * from employees where department='IT' and (age<25 or salary>45000);

-- Q50 FIND EMPLOYEE FROM MUMBAI DELHI OR PUNE WHO ARE OLDER THAN 23 AND HAVE A SALARY GREATER THAN 35000 --
select * from employees where city in('Mumbai','Delhi','Pune') and ( age>23 and salary>35000);  
select * from employees where city in('Mumbai','Delhi','Pune') and age>23 and salary>35000;

--  AND , OR , NOT PRACTICE --

-- FIND EMPLOYEE WHO WORK IN IT AND HAVE SALARY GREATER THAN 30000 --
select * from employees where department='IT'and salary>30000;

-- Q2 FIND EMPLOYEE FROM MUMBAI AND AGE GREATER THAN 23 --
select * from employees where city='Mumbai' and age>23;

-- Q3 FIND IT EMPLOYEE FROM MUMBAI --
select * from employees where department='IT' and city='Mumbai'; 

-- Q4 FIND HR EMPLOYEE FROM MUMBAI --
select * from employees where department='HR ' and city='Mumbai';

-- Q5 FIND EMPLOYEE WHOSE SALARY IS ABOVE 40000 AND AGE ABOVE 25 --
select * from employees where salary>40000 and age>25;

-- OR QUESTION PRACTICE --

-- Q6 FIND EMPLOYEE FROM  IT OR HR --
select * from employees where department='IT' or department='HR';

-- Q7 FIND EMPLOYEE FROM MUMBAI OR DELHI --
select * from employees where city='Mumbai' or city='Delhi';

-- Q8 FIND EMPLOYEE FROM PUNE OR LUCKNOW --
select * from employees where city='Pune' or city='Lucknow';

-- Q9 FIND EMPLOYEE WHOSE SALARY IS GREATER THAN 45000 OR AGE IS GREATER THAN 27 --
select * from employees where salary>45000 or age>27;

-- Q10 FIND EMPLOYEE WORKING IN SALES OR FINANCE --
select * from employees where department='Sales' or department='finance';


-- NOT QUESTION --             

-- Q11 FIND EMPLOYEE WHO ARE NOT WORK FROM IT -- 
select * from employees where department!='IT';

-- Q12 FIND EMPLOYEE WHO ARE NOT FROM MUMBAI --
select * from employees where city!='Mumbai';

-- Q13 FIND EMPLOYEE WHOSE AGE IS NOT BELOW 25 --
select * from employees where not age<25;

-- Q14 FIND EMPLOYEE WHO ARE NEITHER FROM IT NOR HR --
select * from employees where department<> 'IT' and department<> 'HR';

-- Q15 FIND EMPLOYEE WHO ARE NEITHER FROM SALES NOR FINANCE --
select * from employees where department<>'Sales' and department<>'Finance';  


-- MIX AND + OR + NOT QUESTION --


-- Q16 FIND IT EMPLOYEE FROM MUMBAI OR DELHI --
select * from employees where department='IT' and (city='Mumbai' or city='Delhi');


-- Q17 FIND HR EMPLOYEE FROM DELHI OR PUNE WITH SALARY ABOVE 35000 --
select * from employees where department='HR' and(city='Delhi'or city='Pune') and salary>35000;


-- Q18 FIND EMPLOYEE FROM MUMBAI OR PUNE WITH SALARY ABOVE 35000 --
select * from employees where (city='Mumbai' or city='Pune') and salary>35000;


-- Q19 FIND EMPLOYEE IT OR HR EMPLOYEE WITH SALARY ABOVE 35000 --
select * from employees where ( department='IT' or department='HR') and salary>35000;


-- Q20 FIND EMPLOYEE WHO ARE NOT FROM IT AND SALARY ABOVE 30000 --
select * from employees where department!='IT' and salary>30000; 


-- Q21 FIND EMPLOYEE WHO ARE NOT FROM MUMBAI AND AGE ABOVE 24 --
select * from employees where city!='Mumbai' and age>24;


-- Q22 FIND EMPLOYEE FROM IT OR SALES WHO EARN MORE THAN 30000 --
select * from employees where (department='IT' or department='Sales') and salary>30000;


-- Q23 FIND EMPLOYEE FROM MUMBAI OR DELHI WHO ARE YOUNGER THAN 26 --
select * from employees where (city='Mumbai' or city='Delhi') and age<26;


-- Q24 FIND EMPLOYEE WHO ARE NOT IN HR AND SALARY IS GREATER THAN 35000 --
select * from employees where department!='HR' and salary>35000;


-- Q25 FIND EMPLOYEE WHO ARE NOT FROM PUNE AND  SALARY BELOW  40000 --
select * from employees where department!='Pune'  and salary<40000;


-- Q26 FIND IT  EMPLOYEE FROM MUMBAI WHOSE  SALARY IS GREATER THAN 30000 -- 
select * from employees where department='IT' and city='Mumbai' and salary>30000;


-- Q27 FIND HR OR FINANCE EMPLOYEE WHOSE SALARY IS ABOVE 35000 --
select * from employees where (department='HR' and department='Finance') and salary>35000; 


-- Q28 FIND EMPLOYEE FROM MUMBAI DELHI PUNE --
select * from employees where city='Delhi' or city='Mumbai' or city='Pune';   
    
  
-- Q29 FIND EMPLOYEE WHOSE SALARY IS BETWEEN 30000 AND 40000 USING AND --
select * from employees where salary>=30000 and salary<=40000;


-- Q30 FIND EMPLOYEE AGED 23-27 AND SALARY ABOVE 30000 --
select * from employees where age>=23 and age<=27 and salary>30000;


-- Q31 FIND IT EMPLOYEE WHOSE SALARY IS ABOVE 40000 OR AGE IS ABOVE 25 --
select * from employees where department='IT' and (salary>40000 or age=25);


-- Q32 FIND EMPLOYEE FROM MUMBAI OR DELHI BUT EXCLUDE HR --
select * from employees where (city='Mumbai' and city='Delhi') and department!='HR'; 


-- Q33 FIND EMPLOYEE WHO ARE NOT FROM MUMBAI AND EITHER SALARY IS ABOVE 40000 OR AGE IS ABOVE 26 --
select *  from employees where city!='Mumbai' and (salary>40000 or age>26);
          

    

 

  