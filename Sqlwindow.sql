create table employee1(
emp_id int,
emp_name varchar(10),
dept_name varchar(10),
salary int
)

Insert into employee1 values(100,'devi','admin',2000),(101,'babu','admin',2000),(103,'sidu','admin',3000),(100,'sana','admin',4000)
Insert into employee1 values(100,'ram','IT',2000),(101,'sheils','IT',5000),(103,'bob','IT',3000),(100,'Ben','IT',3000)
Insert into employee1 values(100,'bel','finance',2000),(101,'bet','finance',5000),(103,'buck','finance',3000),(100,'bath','finance',3000)

select * from employee1

select dept_name, max(salary) as Salary_max 
from employee1
group by dept_name

select *,
max(salary) over() as max_salary
from employee1

select *,
max(salary) over(partition by dept_name) as max_salary
from employee1

select *,
row_number() over(partition by dept_name) as rno
from employee1

select e.* from (
    select *,
row_number() over(partition by dept_name order by emp_id) as rno
from employee1) e
where e.rno < 3 

select e.* from (
    select *,
rank() over(partition by dept_name order by emp_id desc) as rnk
from employee1) e
where e.rnk < 3 


    select e.*,
   rank() over(partition by dept_name order by salary desc) as rnk,
dense_rank() over(partition by dept_name order by salary desc) as dense_rnk
from employee1 e












