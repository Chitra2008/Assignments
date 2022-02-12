--ORACLE SYNONYMS

-- create aliases for schema objects such as tables, views,
-- materialized views, sequences, procedures, and stored function.

--SYSNTAX

--CREATE [OR REPLACE] [PUBLIC] SYNONYM schema.synonym_name
--FOR schema.object;

select * from c##aduser.emp; --as all the privileges are given to the aduser in asgr schema, it can access all the tables
select * from c##aduser.member;  --"table or view does not exist" bicuz , it is in another schema called practice

select * from c##aduser.branch;
create public synonym syn_branch for c##aduser.branch;      --Synonym SYN_BRANCH created.
select * from syn_branch;           --synonyms allow you to change complicated and lengthy names by simplified aliases.

create table INFO
(
eid int,
ename varchar(7)
);

insert into info values (1,'Monica');
insert into info values (2,'Joey');
insert into info values (3,'Phoebe');
insert into info values (4,'Ross');

select * from info;

select * from c##aduser.info;

--CREATING SYNONYM

create public synonym syn_info for c##aduser.info;      --Synonym SYN_INFO created.
select * from syn_info;

--INSERTING INTO SYNONYM
INSERT INTO syn_info  values (5, 'Rachel');

drop synonym syn_info force ;










