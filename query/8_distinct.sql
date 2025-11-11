--===============================
-- DISTINCT
--===============================
/*
 We can use the DISTINCT after the SELECT
 DISTINCT is going to help us to remove the duplicates in our data. DISTINCT make sure that each value appears only once in the results.
 */
--===============================
--Syntax 
--===============================
/*
 SELECT DISTINCT
 col
 from Table
 */
--===============================
--flow 
--===============================
/*
 1. From tabl
 2. Select col
 3. Distinct - It make sure each value happens only once
 */
--===============================
-- Return Unique list of all countries 
--===============================
SELECT DISTINCT country
from customers