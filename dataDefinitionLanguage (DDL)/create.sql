-- CREATE
--define structure of your data
/*
 Create a new table called persons with columns: id, person_name, birth_data, and phone
 */
--======================================
-- (column_name data_type constraint) 
--======================================
DROP table if EXISTS persons;
CREATE TABLE persons(
    id INT not NULL,
    person_name VARCHAR(50) not NULL,
    birth_date DATE,
    phone VARCHAR(50) not NULL,
    CONSTRAINT pk_persons primary key (id)
);
-- Now the last thing in each database table we should has a primary key in order to make sure this table has an integrity and maybe as well ocnnectable to other tables.
-- This create table is never return data but its changing the structure of your database. Its not about retriving any data and so on.
SELECT *
from persons