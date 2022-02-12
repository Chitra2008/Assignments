--ORACLe fetch



select 
dname, sal
from emp 
inner join dept
using (deptno)
order by sal desc
fetch next 5 rows only;

--A) Top N rows example

select
ename,dname,sal,job
from emp
inner join dept
using(deptno)
order by
sal
fetch next 10 rows only;

--B) WITH TIES example

select
ename,dname,sal,job
from emp
inner join dept
using(deptno)
order by
sal
fetch next 10 rows with ties;

--C) Limit by percentage of rows example

select
ename,dname,sal,job
from emp
inner join dept
using(deptno)
order by
sal
fetch first 43 percent rows only;


--OFFSET example
select
ename,dname,sal,job
from emp
inner join dept
using(deptno)
order by
sal
OFFSET 10 ROWS 
FETCH NEXT 10 ROWS ONLY;

