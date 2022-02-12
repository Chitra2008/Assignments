--Oracle UNIQUE index

create unique index members_email_i
on members(email);

--By having this members_email_i index, you cannot have two rows with the same value in the email column.

INSERT INTO members(first_name, last_name, gender, dob, email)
VALUES('Pegpa','Elce','F',DATE '1990-01-02','pelce0@trellian.com');
-- this will give error 

--Oracle UNIQUE index, Primary Key constraint, and Unique constraint

CREATE TABLE t1 (
    pk1 INT PRIMARY KEY,
    c1 INT
);

SELECT 
    index_name, 
    index_type, 
    visibility, 
    status 
FROM 
    all_indexes
WHERE 
    table_name = 'T1';
    
    
--as can be seen clearly from the output, the SYS_C008369
--  unique index was created automatically with the , generated name

--To specify the na,e for primary key column , 
-- you can use the unique index as shown 

CREATE TABLE T2
(
    PK2 INT PRIMARY KEY
        USING INDEX 
        (
        CREATE INDEX T1_PK1_I ON T2 (PK2)
        ),
        C2 INT
);  

SELECT 
    index_name, 
    index_type, 
    visibility, 
    status 
FROM 
    all_indexes
WHERE 
    table_name = 'T2';


commit;