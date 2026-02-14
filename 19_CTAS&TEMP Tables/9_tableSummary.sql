-- Table Summary
/*
 Tables in database are like spreadsheet or grid that contains columns and rows. And your actual data are stored in these tables. 
 And we have learned there are two types of tables.
 1. Permanent tables.
 2. Tmporary tables.
 
 permanent tables: Its lives in the atabase forever, as long as you don't drop them.
 Tmporary tables: It has short lifetime, they will be dropped from the database once you end the session.
 
 Now we have learned as well there are two methods no how to create tables in databases.
 1. CREATE/INSERT
 2. CTAS
 
 CREATE/INSERT
 --  So the first method is the classical method where you CREATE a table from the scratch, and then you go and INSERT your data, So we call it CREATE, INSERT. So we create something from scratch.
 
 CTAS:
 --  The second method is the CTAS Create Table As Select, this one can create as well a brand new table but based on reslult SQL query. So this type is done with only one step, but it alwasy needs another existing table.
 
 
 CTAS Use Case:
 -- CTAS is that to ensure the perormance is fast enough at the end of the users or your reporting system. So we use CTAS instead of VEWEs, if the logic of the VIEW is very complex and takes a lot of time to be executed in the database.
 -- CTAS is that we can go and persist a snapshot of the data in order to analyze a bug and data quality issue, and to ensure that we ahve the exact data in order to find a solution for the bug and the issue.
 
 
 -- We have learned as well that we can use TMPORARY tables in orer to store intemedaite results ina temporary storage, and the main advantage of that temporary table is that the database automatically drops all the temporary tables when the session ends, And that's because for you, the intemediate results are not that important to live long time.
 */