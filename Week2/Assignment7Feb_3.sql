--Inline View in Oracle


--A) simple Oracle inline view example
select
*
from
(
    select
    empno, ename, job, sal
    from
    emp
    order by
    empno
)
where 
rownum <= 10;


--B) Inline view joins with a table example

select
    ename, dname
from
    emp e, dept d
where e.deptno = d.deptno
order by dname;

--C) LATERAL inline view example

select
dname,
branchname
from
dept d,
lateral(select * from branch b where b.branchno = d.branchno)
order by
dname;


















