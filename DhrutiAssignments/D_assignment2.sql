set serveroutput on;
--1) Create a Package and do the following tasks

CREATE OR REPLACE PACKAGE cp_pkg AS

--2) Write a PL/SQL explicit cursor that will display customer name,
--total billing amount and their category based on their billing amount.
--Insert the Resultant Data in some Other Customer_Purchase Tbl
--	< 100 Category A
--	>= 100 and < 1000 Category B
--	>= 1000 and <=10000 Category C

create table Customer_Purchase (

   cp_name VARCHAR2(50) NOT NULL,
   cp_total_bill NUMBER NOT NULL,
   cp_category VARCHAR2(1) NOT NULL
);

declare
    cname customer.cust_name%type;
    bill product.prod_price%type;
    cursor c1 is select 
        cust_name, sum(prod_price)
         from
        product y join purchase z
        on y.prod_id = z.prod_id
        join customer x
        on x.cust_id = z.cust_id
        group by
        cust_name;
begin
    open c1;
    loop
        fetch c1 into cname,bill;
        exit when c1%notfound;
        
        if(bill < 100) then
            insert into Customer_Purchase values (cname, bill,'A');
        ELSIF (bill >= 100 and bill < 1000) then
            insert into Customer_Purchase values (cname, bill,'B');
         ELSIF (bill >= 1000 and bill <=10000) then
            insert into Customer_Purchase values (cname, bill,'C');
        end if;
        
    end loop;
    close c1;
end;
/

--select * from Customer_Purchase;
--truncate table   Customer_Purchase;


--3) Create a Trigger that will Auto-populate the data in History table when anything is inserted or updated in Customer_Purchase Tbl with created timestamp

    create table history (action varchar2(50) not null, Date_Time TIMESTAMP(1));
--    drop  table history;

    CREATE OR REPLACE TRIGGER cust_purchase_trigger
    AFTER 
    INSERT OR UPDATE  
    ON Customer_Purchase
    FOR EACH ROW    
    DECLARE
       action varchar2(50);
    BEGIN
       action := CASE  
             WHEN INSERTING THEN 'INSERT'
             WHEN UPDATING THEN 'UPDATE'
             WHEN DELETING THEN 'DELETE'
       END;
         insert into history values (action, systimestamp(1));
    END;
/


insert into customer_purchase values('MMM',40,'A');
SELECT * FROM history;
    

--4) PL/SQL Function to find item which has minimum price in a table

    create or replace function find_min
    return varchar2
    is
        item product.prod_name%type;
        min_price product.prod_price%type;
    begin
        select
          prod_name, prod_price
        into item, min_price
        from product
        where
            prod_price = (select min(prod_price) from product);
        return item;
    end;
    
    
declare
    v_ok varchar2(50);
 begin
    v_ok := find_min;
    DBMS_OUTPUT.PUT_LINE(v_ok);
end;

    
--5) Create Index for Customer_Purchase Tbl

    CREATE INDEX cNameIndex 
    ON Customer_Purchase(cp_name);

    SELECT 
    index_name, 
    index_type, 
    visibility, 
    status 
    FROM 
        all_indexes
    WHERE 
        table_name = 'Customer_Purchase';

--6) Write a Stored Procedure to find the total purchase for 
--each customer and total sale of each product using this table and
--insert these values in two other tables.

--  CREATING TABLE FOR TOTAL PURCAHSE
CREATE TABLE totalpurchase (CustomerId Number, TotalPurchase Number);

--  CREATING TABLE FOR TOTAL SALE
CREATE TABLE totalsale (ProductID Number, TotalSale Number);


CREATE OR REPLACE PROCEDURE find_sale_purchase AS

xcid number;
xpurchase number;

ypid number;
ytotalsale number;


CURSOR c1 IS
SELECT cust_id, sum(prod_price) as ccost from
product y join purchase z
on y.prod_id = z.prod_id
join customer x
on x.cust_id = z.cust_id
group by
cust_id;

CURSOR c2 IS
select x.prod_id, (count(pr_id) * prod_price) as pcost 
from purchase x join product y on x.prod_id = y.prod_id
group by x.prod_id, prod_price;

TOTAL_PURCHASE number:=0;
TOTAL_SALE number:=0;
BEGIN


    open c1;
    loop
        fetch c1 into xcid, xpurchase;
        exit when c1%notfound;
        insert into totalpurchase values (xcid, xpurchase);
    end loop;
    close c1;
    
    open c2;
    loop
        fetch c2 into ypid, ytotalsale;
        exit when c2%notfound;
        insert into totalsale values (ypid, ytotalsale);
    end loop;
    close c2;

END;


end cp_pkg;


