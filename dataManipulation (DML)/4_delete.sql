-- DELETE
-- If we use delete SQL going to go and start removing already existing rows inside your table.
--===============
-- SYNTAX
-- DELETE FROM <table_name> WHERE <condition>
--===============
-- NOTE: Always use WHERE to avoid DELETING all rows unintentionally.
--===============
-- Delete all customers with an ID greater than 5
--===============
DELETE FROM customers
where id > 5;
-- CAUTION: Without a WHERE, all rows will be updated!!
--===============
-- Delete all data from the persons table
--===============
DELETE FROM persons;
-- TRUNCATE: Clear the whole table at once without checking or logging
-- TRUNCATE is exactly like DELETE FROM persons, it's going to go and make the WHOLE TABLE EMPTY, but it is way faster than DELETE. If you have large tables, the DELETE command going to be really slow because with the DELETE there is lot of things happening behind the scenes. There is like logs and protocols. But if you are using the TRUNCATE, the database going to skip all those extra stuff, and it's going to be very fast.
TRUNCATE TABLE persons