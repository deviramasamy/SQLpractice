use classicmodels
show tables
--Logical operators
select customernumber,customername from customers
where customernumber>=112 and customername='Signal gift stores'

select customernumber,customername from customers
where customernumber>=112 or customername='Signal gift stores'

select customernumber,customername from customers
where customernumber in (103,112,119)

select customernumber,customername from customers
where customernumber between 103 and 120

select customernumber,customername from customers
where customername like 'c_r%'

select * from customers
where customername like regexp '[a-c]'

select customername, customernumber from customers
where customerName regexp '[A-C]' 

--aggregate function-Max,Min,sum,count,avg

select max(creditlimit) as Max, country from customers
group by country

select count(creditlimit) as max, country from customers
group by country having country in ('USA','France','UK')
order by max asc

--string functions
select upper(customername) from customers
select lower(customername) from customers
select length(customername) as length from customers
select trim(customername) as length from customers
select upper('Rupali')
select substr('Hello',1,3)

--date functions

select now()
select adddate('2023-01-26 14:14:48', interval 1 month) as date
select adddate('2023-01-26 14:14:48', interval 1 hour) as date
select adddate(adddate('2023-01-26 14:14:48', interval 1 hour), interval 1 month) as date

--Joins

--Inner join

select * from products
select * from productlines

select p.productcode, pl.textdescription, pl.productline from products as p join productlines as pl
on p.productline=pl.productline
order by p.productcode asc

--Outer join
select p.productcode, pl.textdescription,pl.productline from products as p  left outer join productlines as pl
on p.productline=pl.productline
order by p.productcode asc
select p.productcode, pl.textdescription,pl.productline from products as p  right outer join productlines as pl
on p.productline=pl.productline
order by p.productcode asc

select p.productcode, pl.textdescription,pl.productline from products as p  
right outer join productlines as pl
on p.productline=pl.productline

select p.productcode, pl.textdescription,pl.productline from products as p  
left outer join productlines as pl
on p.productline=pl.productline
where pl.productline is null

--Self join
select * from employees

select e1.employeenumber,e1.lastname,e2.employeenumber,e2.lastname
from employees e1 join employees e2
where e1.employeenumber =1056
on e1.employeenumber = e2.reportsto

--Sub Query- Query within query-Inner query is independant of outer query

select * from employees where officecode=7
(select officecode from offices where country='UK')

--corelated subquery- your Inner query is dependant on the outer query. For every inner query the outer query is executed

select productname,buyprice from products p1 where buyprice >
(select avg(buyprice) from products where productline=p1.productline)

--Window function
Ranking and Dense-Rank function

select customername,creditlimit,
dense_rank() over (order by creditlimit desc) as 'denserank'
from customers
where denserank=2

--CTE-Common Table expression































