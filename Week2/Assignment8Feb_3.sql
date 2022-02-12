-- FUNCTION BASED INDEX


create index members_last_name_i
on members(last_name);

select * from members
where last_name = 'Sans';

select * from members
where last_name = 'SANS';  --there is no record

--However, if you use a function on the indexed column last_name as follows:

select * from members 
where UPPER(last_name) = 'SANS';

explain plan for
select * from members 
where UPPER(last_name) = 'SANS';

select plan_table_output
from table(dbms_xplan.display());


--To encounter this, Oracle introduced function-based indexes.

--A function-based index calculates the result of a function that
--involves one or more columns and stores that result in the index.

--Oracle function-based index example

create index members_last_name_fi
on members (UPPER(last_name));

explain plan for
select * from members 
where UPPER(last_name) = 'SANS';

select plan_table_output
from table(dbms_xplan.display());

--A function-based index helps you perform more flexible sorts.
--For example, the index expression can call  UPPER() and LOWER()
--functions for case-insensitive sorts or NLSSORT() function for 
--linguistic-based sorts.


