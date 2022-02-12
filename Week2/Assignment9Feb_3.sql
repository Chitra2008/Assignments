--CREATING SEQUENCE

create sequence eid
increment by 1
maxvalue 1000
minvalue 1
cache 20;

create table emps (
empid number primary key,
ename varchar(15) not null);


insert into emps values (eid.nextval, 'Monica');
insert into emps values (eid.nextval, 'Chandler');
insert into emps values (eid.nextval, 'Ross');
insert into emps values (eid.nextval, 'Rachel');
insert into emps values (eid.nextval, 'Joey');
insert into emps values (eid.nextval, 'Phoebe');

select * from emps;

alter sequence eid maxvalue 1002;

drop sequence eid;
