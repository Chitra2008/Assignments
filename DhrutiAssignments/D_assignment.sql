set serveroutput on;
--CREATING CUSTOMER TABLE

create sequence cid
increment by 1
maxvalue 1000
minvalue 101
cache 20;

--drop sequence cid;
--drop table customer;

create table customer
(
    cust_id number primary key,
    cust_no number not null,
    cust_name varchar(60) not null,
    contact varchar(10),
    dob Date,
    address varchar(255)
);

insert into customer values(cid.nextval, 14324742, 'ELENA', '8744000198', to_date('10-05-2000','dd-mm-yyyy'), '103 HARRIE');
insert into customer values(cid.nextval, 14569877, 'DAMON', '9887010198', to_date('02-04-2003','dd-mm-yyyy'), '1095 HIGHWAY');
insert into customer values(cid.nextval, 14898029, 'STEFAN', '9781500198', to_date('21-08-2004','dd-mm-yyyy'), 'BIRMOERSTRAAT 34');
insert into customer values(cid.nextval, 15432147, 'CAROLINE', '8684000198', to_date('14-02-2005','dd-mm-yyyy'), '44 PRINCESS');
insert into customer values(cid.nextval, 18543489, 'KLAUS', '9882900198', to_date('14-07-2005','dd-mm-yyyy'), 'RUA DONA');
insert into customer values(cid.nextval, 19783482, 'SAROJINI', '9086046198', to_date('22-05-2006','dd-mm-yyyy'), '5063 RICHMOND');
insert into customer values(cid.nextval, 19876078, 'AMISHA', '8576000198', to_date('18-12-2001','dd-mm-yyyy'), '356 CLEMENTI');
insert into customer values(cid.nextval, 26422096, 'BENZO', '8941000198', to_date('01-11-2002','dd-mm-yyyy'), '191 LOWER');
insert into customer values(cid.nextval, 26984578, 'JEREMI', '9088100198', to_date('16-09-2002','dd-mm-yyyy'), 'ETCHUJMA');
insert into customer values(cid.nextval, 27654351, 'AAROHI', '9093100198', to_date('15-03-2007','dd-mm-yyyy'), '5609 RIO');

--#########################################################################################

--CREATING PRODUCT TABLE
--drop sequence prid;
--drop table product;

create sequence prid
increment by 1
maxvalue 1000
minvalue 1
cache 20;

create table product 
(
    prod_id number primary key,
    prod_no number not null,
    prod_name varchar(60) not null,
    prod_desc varchar(300),
    prod_price number
);

INSERT INTO PRODUCT VALUES(prid.nextval, 10, 'PEN', 'AAA',1000);
INSERT INTO PRODUCT VALUES(prid.nextval, 20, 'RING', 'BBB', 300);
INSERT INTO PRODUCT VALUES(prid.nextval, 30, 'FRAME', 'CCC', 700);
INSERT INTO PRODUCT VALUES(prid.nextval, 40, 'PAPER', 'DDD', 500);
INSERT INTO PRODUCT VALUES(prid.nextval, 50, 'WATCH', 'EEE', 3500);
INSERT INTO PRODUCT VALUES(prid.nextval, 10, 'BOTTLE', 'FFF',1000);
INSERT INTO PRODUCT VALUES(prid.nextval, 20, 'CHAIR', 'GGG', 2100);
INSERT INTO PRODUCT VALUES(prid.nextval, 30, 'ALMARI', 'JJJ', 4500);
INSERT INTO PRODUCT VALUES(prid.nextval, 40, 'CHAIN', 'MMMM', 540);
INSERT INTO PRODUCT VALUES(prid.nextval, 50, 'BOOK', 'ZZZZ', 50);


--################################################################################################

--CREATING PURCHASE TABLE

create sequence pid
increment by 1
maxvalue 10000
minvalue 7081
cache 20;

--drop sequence pid;
--drop table purchase;

create table purchase  
(
    pr_id number primary key,
    pr_name varchar(60),
    cust_id	number CONSTRAINT FK_purchase_custid REFERENCES customer,
    prod_id	number CONSTRAINT FK_purchase_prod_id REFERENCES product	
);

INSERT INTO Purchase VALUES (pid.nextval, 'Gizmo', 102, 1);
INSERT INTO Purchase VALUES (pid.nextval, 'SingleTouch', 104, 2);
INSERT INTO Purchase VALUES (pid.nextval, 'MultiTouch', 102, 5);
INSERT INTO Purchase VALUES (pid.nextval, 'Gizmo', 107, 4);
INSERT INTO Purchase VALUES (pid.nextval, 'Powergizmo', 108, 3);
INSERT INTO Purchase VALUES (pid.nextval, 'SingleTouch', 105, 1);
INSERT INTO Purchase VALUES (pid.nextval, 'MultiTouch', 104, 10);
INSERT INTO Purchase VALUES (pid.nextval, 'Powergizmo', 104, 3);
INSERT INTO Purchase VALUES (pid.nextval, 'SingleTouch', 105, 6);
INSERT INTO Purchase VALUES (pid.nextval, 'MultiTouch', 103, 4);
INSERT INTO Purchase VALUES (pid.nextval, 'MultiTouch', 108, 10);
INSERT INTO Purchase VALUES (pid.nextval, 'Powergizmo', 101, 5);
INSERT INTO Purchase VALUES (pid.nextval, 'SingleTouch', 106, 3);
INSERT INTO Purchase VALUES (pid.nextval, 'MultiTouch', 109, 2);

select * from customer;
select * from  product;
select * from  purchase;


--#################################################################################
--Select distinct customers from the table

select distinct * from customer;

--#################################################################################
--List the customer with the product which they bought
--customer name - product name

select 
cust_name, prod_name
from
product join purchase 
using (prod_id)
join customer 
using(cust_id)
order by cust_name;

--#################################################################################
--List the customers with the total Amount which they have to pay at billing 
--counter(sort the data in Ascending order of Billing Amount)
select 
cust_name, sum(prod_price)
from
product y join purchase z
on y.prod_id = z.prod_id
join customer x
on x.cust_id = z.cust_id
group by
cust_name
ORDER BY
sum(prod_price)
;


--#################################################################################
--List the customers whose age is more than 18 years.

SELECT cust_name , 
    FLOOR(MONTHS_BETWEEN(to_date(SYSDATE),to_date(dob))/12)
     AS "Age"
FROM customer
where 
FLOOR(MONTHS_BETWEEN(to_date(SYSDATE),to_date(dob))/12) > 18;

--#################################################################################
--List the customers who has not bought any product from the store.


select cust_name
from customer
where 
cust_name not in (select 
cust_name
from
product join purchase 
using (prod_id)
join customer 
using(cust_id))
order by cust_name;
--#################################################################################

--Find the customers whose billing amount is between  2000 to 5000.

select 
cust_name, sum(prod_price)
from
product y join purchase z
on y.prod_id = z.prod_id
join customer x
on x.cust_id = z.cust_id
group by
cust_name
--having 
--sum(prod_price) between 2000 AND 5000
;


--#################################################################################

--List the products which are not purchased by anyone.

select
prod_name,prod_id
from product
where prod_id not in
(
select 
y.prod_id
from
product y join purchase z
on y.prod_id = z.prod_id
join customer x
on x.cust_id = z.cust_id
)
ORDER BY
PROD_ID;
--#################################################################################

--List the products, increased their price by 25% 

select 
prod_name, prod_price, prod_price + (prod_price*.25) increasal 
from
product ;


--#################################################################################

--find those products whose name start with 'A' and six characters in length.

select prod_name, length(prod_name) as length
from 
product
where
prod_name like 'A%'
and
length(prod_name) = 6;


--#################################################################################

--find those customers whose name ends with 'I' and third character must be 'R'.

select *
from customer
where
cust_name like '__R%I'
;

--#################################################################################

--Perform join on 3 tables and display all the columns

select 
x.*, y.*, z.pr_id, z.pr_name
from
product y join purchase z
on y.prod_id = z.prod_id
join customer x
on x.cust_id = z.cust_id;


--###################################################################################3



