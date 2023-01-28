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

--Window function

--Aggregate window function

select dept_name, max(salary) as Salary_max 
from employee1
group by dept_name

select *,
max(salary) over() as max_salary
from employee1

select *,
max(salary) over(partition by dept_name) as max_salary
from employee1

--Ranking window function

--Row()
select *,
row_number() over() as rno
from employee1

select *,
row_number() over(partition by dept_name) as rno
from employee1

select e.* from (
    select *,
row_number() over(partition by dept_name order by emp_id) as rno
from employee1) e
where e.rno < 3 

--Rank()
select e.* from (
    select *,
rank() over(partition by dept_name order by emp_id desc) as rnk
from employee1) e
where e.rnk < 3 

--Dense_rank
    select e.*,
   rank() over(partition by dept_name order by salary desc) as rnk,
dense_rank() over(partition by dept_name order by salary desc) as dense_rnk
from employee1 e

select e.*,
   rank() over(partition by dept_name order by salary desc) as rnk,
   row_number() over(partition by dept_name order by salary desc) as rno,
dense_rank() over(partition by dept_name order by salary desc) as dense_rnk
from employee1 e

--Value window function
--Lead and Lag

select e.*,
lag(salary) over(partition by dept_name order by emp_id) as Pre_emp_salary
from employee1 e

--fecth to display if the salary is higher, lower or same as previous emp id

select e.*,
	lag(salary,1,'No value') over(partition by dept_name order by emp_id) as Pre_emp_salary,
		case when e.salary > lag(salary,1,'no value') over(partition by dept_name order by emp_id) then 'Higher than previous emp_id'
			when e.salary < lag(salary,1,'no value') over(partition by dept_name order by emp_id) then 'Lower than previous emp_id'
			when e.salary = lag(salary,1,'no value') over(partition by dept_name order by emp_id) then 'Same as previous emp_id'
			end as salary_range
from employee1 e

select e.*,
lag(salary,2,1) over(partition by dept_name order by emp_id) as Pre_emp_salary
from employee1 e

select e.*,
lead(salary) over(partition by dept_name order by emp_id) as next_emp_salary
from employee1 e

select e.*,
lead(salary,3,'no value') over(partition by dept_name order by emp_id) as next_emp_salary
from employee1 e

--CTE Common table expression 
--With clause

create table CTE(
emp_id int,
emp_name varchar(20),
salary int
)

Insert into CTE values(101,'devi',40000),(102,'Babu',50000),(103,'Sid',60000),(104,'sana',70000),(105,'alice',80000),(106,'jimmy',90000)

select * from CTE

--employees who earn more than average salary of all emp

select *
from CTE where salary > (select avg(salary) from CTE)

with average_salary (avg_sal) as
 (select avg(salary) from CTE)
select *
from CTE C, average_salary av
where C.salary > av.avg_sal



