create table Student(
id int,
fname varchar(10),
lname varchar(20)
)

Insert into Student values(1,'devi','ramasamy')
insert into student values(2,'Sid','Babu')

select * from Student

create table Marks(
id int,
subject varchar(10),
scores int
)

Insert into Marks values(1,'Java',90)
Insert into Marks values(1,'SQL',80)
Insert into Marks values(2,'Java',95)

Insert into marks values(2,'SQL',78)

select * from marks

show tables
select * from student as S join marks as M on s.id=m.id

select s.fname,m.subject,m.scores from student as s left outer join marks as m on s.id=m.id
where subject='Java'

select s.fname,m.subject,m.scores from student as s right outer join marks as m on s.id=m.id
where subject='Java'
create table employee(
id int primary key,
fname varchar(20)
)
Create table scores(
sid int,
sub varchar(10),
marks int,
foreign key (sid) references employee(id)
)
Insert into employee values(1,'devi'),(2,'Babu'),(3,'sahana')
Insert into scores values(1,'Maths',90),(2,'science',85),(3,'English',70)
Insert into scores values(1,'science',100)

select * from employee
select * from scores

select e.id,e.fname,s.sub,s.marks from employee as E join scores as S 
on E.id=S.sid

select e.id,e.fname,s.sub,s.marks from employee as E left outer join scores as S 
on E.id=S.sid
select e.id,e.fname,s.sub,s.marks from employee as E right outer join scores as S 
on E.id=S.sid
where sub='science'

--cross join
select e.id,e.fname,s.sub,s.marks from employee as E cross join scores as S 

--self join
