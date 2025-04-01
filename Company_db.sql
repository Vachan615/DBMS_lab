drop database if exists company; 
create database company; 
use company; 
create table if not exists Employee( 
ssn varchar(35) primary key, 
name varchar(35) not null, 
address varchar(255) not null, 
sex varchar(7) not null, 
salary int not null, 
super_ssn varchar(35), 
d_no int, 
foreign key (super_ssn) references Employee(ssn) on delete set null 
); 
create table if not exists Department( 
d_no int primary key, 
dname varchar(100) not null, 
mgr_ssn varchar(35), 
mgr_start_date date, 
foreign key (mgr_ssn) references Employee(ssn) on delete cascade 
); 
create table if not exists DLocation( 
d_no int not null, 
d_loc varchar(100) not null, 
foreign key (d_no) references Department(d_no) on delete cascade 
); 
create table if not exists Project( 
p_no int primary key, 
p_name varchar(25) not null, 
p_loc varchar(25) not null, 
d_no int not null, 
foreign key (d_no) references Department(d_no) on delete cascade 
); 
create table if not exists WorksOn( 
ssn varchar(35) not null, 
p_no int not null, 
hours int not null default 0, 
foreign key (ssn) references Employee(ssn) on delete cascade, 
foreign key (p_no) references Project(p_no) on delete cascade 
); 
INSERT INTO Employee VALUES 
("01NB235", "Chandan_Krishna","Siddartha Nagar, Mysuru", "Male", 1500000, "01NB235", 5), 
("01NB354", "Employee_2", "Lakshmipuram, Mysuru", "Female", 1200000,"01NB235", 2), 
("02NB254", "Employee_3", "Pune, Maharashtra", "Male", 1000000,"01NB235", 4), 
("03NB653", "Employee_4", "Hyderabad, Telangana", "Male", 2500000, "01NB354", 5), 
("04NB234", "Employee_5", "JP Nagar, Bengaluru", "Female", 1700000, "01NB354", 1); 
INSERT INTO Department VALUES 
(001, "Human Resources", "01NB235", "2020-10-21"), 
(002, "Quality Assesment", "03NB653", "2020-10-19"), 
(003,"System assesment","04NB234","2020-10-27"), 
(005,"Production","02NB254","2020-08-16"), 
(004,"Accounts","01NB354","2020-09-4"); 
INSERT INTO DLocation VALUES 
(001, "Jaynagar, Bengaluru"), 
(002, "Vijaynagar, Mysuru"), 
(003, "Chennai, Tamil Nadu"), 
(004, "Mumbai, Maharashtra"), 
(005, "Kuvempunagar, Mysuru"); 
INSERT INTO Project VALUES 
(241563, "System Testing", "Mumbai, Maharashtra", 004), 
(532678, "IOT", "JP Nagar, Bengaluru", 001), 
(453723, "Product Optimization", "Hyderabad, Telangana", 005), 
(278345, "Yeild Increase", "Kuvempunagar, Mysuru", 005), 
(426784, "Product Refinement", "Saraswatipuram, Mysuru", 002); 
INSERT INTO WorksOn VALUES 
("01NB235", 278345, 5), 
("01NB354", 426784, 6), 
("04NB234", 532678, 3), 
("02NB254", 241563, 3), 
("03NB653", 453723, 6); 
SELECT * FROM Department; 
+------+-------------------+---------+----------------+ 
| d_no | dname            
 | mgr_ssn | mgr_start_date | 
+------+-------------------+---------+----------------+ 
|    
1 | Human Resources   | 01NB235 | 2020-10-21    
|    
|    
|    
|    
2 | Quality Assesment | 03NB653 | 2020-10-19    
3 | System assesment  | 04NB234 | 2020-10-27    
4 | Accounts         
5 | Production       
 | 01NB354 | 2020-09-04    
 | 02NB254 | 2020-08-16    
 | 
 | 
 | 
 | 
 | 
+------+-------------------+---------+----------------+ 
SELECT * FROM Employee; 
+---------+-----------------+-------------------------+--------+---------+-----------+------+ 
| ssn     | name            | address                 | sex    | salary  | super_ssn | d_no | 
+---------+-----------------+-------------------------+--------+---------+-----------+------+ 
| 01NB235 | Chandan_Krishna | Siddartha Nagar, Mysuru | Male   | 1500000 | 01NB235   |    5 | 
| 01NB354 | Employee_2      | Lakshmipuram, Mysuru    | Female | 1200000 | 01NB235   |    2 | 
| 02NB254 | Employee_3      | Pune, Maharashtra       | Male   | 1000000 | 01NB235   |    4 | 
| 03NB653 | Employee_4      | Hyderabad, Telangana    | Male   | 2500000 | 01NB354   |    5 | 
| 04NB234 | Employee_5      | JP Nagar, Bengaluru     | Female | 1700000 | 01NB354   |    1 | 
+---------+-----------------+-------------------------+--------+---------+-----------+------+ 
SELECT * FROM DLocation; 
+------+----------------------+ 
| d_no | d_loc                
| 
+------+----------------------+ 
|    
1 | Jaynagar, Bengaluru  | 
|    
|    
|    
|    
2 | Vijaynagar, Mysuru   
| 
3 | Chennai, Tamil Nadu  | 
4 | Mumbai, Maharashtra  | 
5 | Kuvempunagar, Mysuru | 
+------+----------------------+ 
SELECT * FROM Project; 
| p_name               
+--------+----------------------+------------------------+------+ 
| p_no   
| p_loc                  
| d_no | 
+--------+----------------------+------------------------+------+ 
| 241563 | System Testing       
| Mumbai, Maharashtra    
| 278345 | Yeild Increase       
| 426784 | Product Refinement   
| Kuvempunagar, Mysuru   
|    
|    
| Saraswatipuram, Mysuru |    
| 453723 | Product Optimization | Hyderabad, Telangana   
| 532678 | IOT                  
| JP Nagar, Bengaluru    
|    
|    
4 | 
5 | 
2 | 
5 | 
1 | 
+--------+----------------------+------------------------+------+ 
SELECT * FROM WorksOn; 
+---------+--------+-------+ 
| ssn    
 | p_no   
| hours | 
+---------+--------+-------+ 
| 01NB235 | 278345 |    
 5 | 
| 01NB354 | 426784 |    
| 04NB234 | 532678 |    
| 02NB254 | 241563 |    
| 03NB653 | 453723 |    
 6 | 
 3 | 
 3 | 
 6 | 
+---------+--------+-------+ -- Make a list of all project numbers for projects that involve an employee whose last name is 
‘Scott’, either as a worker or as a manager of the department that controls the project. 
select p_no,p_name,name from Project p, Employee e where p.d_no=e.d_no and e.name like 
"%Krishna"; 
+--------+----------------------+-----------------+ 
| p_no   
| p_name               
| name           
 | 
+--------+----------------------+-----------------+ 
| 278345 | Yeild Increase       
| Chandan_Krishna | 
| 453723 | Product Optimization | Chandan_Krishna | 
+--------+----------------------+-----------------+ -- Show the resulting salaries if every employee working on the ‘IoT’ project is given a 10 
percent raise. 
select w.ssn,name,salary as old_salary,salary*1.1 as new_salary from WorksOn w join 
Employee e 
where w.ssn=e.ssn and w.p_no=(select p_no from Project where p_name="IOT") ; 
+---------+------------+------------+------------+ 
| ssn    
 | name      
 | old_salary | new_salary | 
+---------+------------+------------+------------+ 
| 04NB234 | Employee_5 |    
1700000 |  1870000.0 | 
+---------+------------+------------+------------+ 
-- Find the sum of the salaries of all employees of the ‘Accounts’ department, as well as the 
maximum salary, the minimum salary, and the average salary in this department. 
select sum(salary) as sal_sum, max(salary) as sal_max,min(salary) as sal_min,avg(salary) as 
sal_avg 
from Employee e join Department d on e.d_no=d.d_no where d.dname="Accounts"; 
+---------+---------+---------+--------------+ 
| sal_sum | sal_max | sal_min | sal_avg      
| 
+---------+---------+---------+--------------+ 
| 1000000 | 1000000 | 1000000 | 1000000.0000 | 
+---------+---------+---------+--------------+ -- Retrieve the name of each employee who works on all the projects controlled by department 
number 1 (use NOT EXISTS operator). 
select Employee.ssn,name,d_no from Employee where not exists 
(select p_no from Project p where p.d_no=1 and p_no not in 
(select p_no from WorksOn w where w.ssn=Employee.ssn)); 
+---------+------------+------+ 
| ssn    
 | name      
 | d_no | 
+---------+------------+------+ 
| 04NB234 | Employee_5 |    
1 | 
+---------+------------+------+ -- For each department that has more than one employees, retrieve the department number and 
the number of its employees who are making more than Rs. 6,00,000. 
select d.d_no, count(*) from Department d join Employee e on e.d_no=d.d_no where 
salary>600000 
group by d.d_no having count(*) >1; 
+------+----------+ 
| d_no | count(*) | 
+------+----------+ 
|    
5 |       
 2 | 
+------+----------+ -- Create a view that shows name, dept name and location of all employees 
create view emp_details as 
select name,dname,d_loc from Employee e join Department d on e.d_no=d.d_no join 
DLocation dl on 
d.d_no=dl.d_no; 
select * from emp_details; 
+-----------------+-------------------+----------------------+ 
| name           
 | dname             
| d_loc               
 | 
+-----------------+-------------------+----------------------+ 
| Chandan_Krishna | Production        
| Kuvempunagar, Mysuru | 
| Employee_2     
| Employee_3     
| Employee_4     
| Employee_5     
 | Quality Assesment | Vijaynagar, Mysuru  
 | Accounts          
 | 
| Mumbai, Maharashtra  | 
 | Production        
 | Human Resources   
| Kuvempunagar, Mysuru | 
| Jaynagar, Bengaluru  | 
+-----------------+-------------------+----------------------+ 
-- Create a trigger that prevents a project from being deleted if it is currently being worked by 
any employee. 
DELIMITER // 
create trigger PreventDelete 
before delete on Project 
for each row 
BEGIN 
IF EXISTS (select * from WorksOn where p_no=old.p_no) THEN 
signal sqlstate '45000' set message_text='This project has an employee assigned'; 
END IF; 
END; // 
DELIMITER ; 
delete from Project where p_no=241563;  
ERROR 1644 (45000): This project has an employee assigned 
