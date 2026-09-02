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
  
select * from projects;
select * from departments;


-- INNER JOIN QUESTION --

-- Q1 DISPLAY EMPLOYEE NAME AND DEPARTMENT NAME --
select e.emp_name,d.dept_name
from employees e
inner join departments d
on e.dept_id = d.dept_id;


-- Q2 DISPLAY EMPLOYEE NAME SALARY AND DEPARTMENT NAME WHOSE SALARY GREATER THAN 35000 --
select e.emp_name , d.dept_name , e.salary
from employees e 
inner join departments d 
on e.dept_id = d.dept_id 
where e.salary>35000;


-- Q3 SHOW  ONLY IT DEPARTMENT EMPLOYEES --
select e.emp_name , d.dept_name
from employees e 
inner join departments d
on e.dept_id = d.dept_id
where d.dept_name='IT';


-- Q4 DISPLAY EMPLOYEES SALARY HIGHEST TO LOWEST --
select e.emp_name,e.salary ,d.dept_name
from employees e
inner join departments d
on e.dept_id = d.dept_id 
order by e.salary desc ;  


-- Q5 DISPLAY THE ENPLOYEE NAME , DEPARTMENT NAME,AND SALARY OF ALL EMPLOYEES WHOSE DEPARTMNET IN HR 
select e.emp_name,e.salary,d.dept_name 
from employees e
inner join departments d
on e.dept_id=d.dept_id
where d.dept_name='HR';


--  LEFT JOIN QUESTION --

-- Q6 DISPLAY ALL EMPLOYEE AND THEIR DEPARTMENT NAME --
select e.emp_name,d.dept_name 
from employees e 
left join departments d 
on e.dept_id = d.dept_id;    


-- Q7 DISPLAY ALL EMPLOYEE INCLUDING EMPLOYEES WHO DO NOT BELONG TO ANY DEPARTMENT 
 select e.emp_name ,d.dept_name 
 from employees e 
 left join departments d 
 on e.dept_id=d.dept_id ;
 
 
-- Q8 FIND EMPLOYEE WHO DO NOT HAVE A MATCHING TABLE --
select e.emp_name ,d.dept_name
from employees e 
left join departments d 
on e.dept_id=d.dept_id 
where d.dept_id is null;


-- Q9 DISPlAY ALL EMPLOYEES AND THEIR NAME DEPARTMENT NAME ,SORTED BY EMPLOYEES NAME --
select e.emp_name,d.dept_name 
from employees e 
left join departments d 
on e.dept_id=d.dept_id
order by e.emp_name ;    


-- Q10 DISPLAY ALL EMPLOYEES WITH THEIR DEPARTMENTS NAME AND SALARY INCLUDING EMPLOYEES FROM EVERY DEPARTMENT --
select e.emp_name,e.salary,d.dept_name
from employees e 
left join departments d 
on e.dept_id=d.dept_id; 


--  RIGHT JOIN QUESTION --  

-- Q11 DISPLAY ALL DEPARTMENT AND THE EMPLOYEES WORKING IN THEM --
select d.dept_name,e.emp_name
from departments d 
right join employees e 
on d.dept_id=e.dept_id; 

select e.emp_name ,d.dept_name
from employees e 
right join departments d 
on e.dept_id=d.dept_id;


-- Q12 DISPLAY ALL DEPARTMENTS ALONG WITH EMPLOEE NAME AND SALARY --
select e.emp_name,e.salary,d.dept_name
from employees e 
right join departments d
on e.dept_id=d.dept_id;

select d.dept_name,e.emp_name,e.salary
from departments d
right join employees e 
on d.dept_id=e.dept_id;


-- Q13 FIND DEPARTMENT THAT DO NOT HAVE ANY EMPLOYEES --
select e.emp_name,d.dept_name
from employees e 
right join departments d 
on e.dept_id=d.dept_id
where e.emp_id is null; 


-- Q14 DISPLAY ALL DEPARTMENT AND THEIR EMPLOYEES SORTED BY DEPARTMENT NAME --
select e.emp_name,d.dept_name
from employees e 
right join departments d 
on e.dept_id=d.dept_id
order by d.dept_name;


-- Q15 DISPLAY ALL DEPARTMENTS AND EMPLOYEES WHO HAVE A SALARY GREATER THAN 35000 --
select e.emp_name,e.salary,d.dept_name
from employees e 
right join departments d 
on e.dept_id=d.dept_id 
where e.salary>35000
order by e.salary desc;


-- MULTIPLE JOIN QUESTION --

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
  
  
  