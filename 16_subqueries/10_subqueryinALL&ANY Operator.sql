-- Subquery using ALL & ANY Operator.
/*
 ANY Operator 
 - Checks if a value matches ANY value within a list.
 - Used to check if value is true for AT LEAST one of the values in a list.
 
 ALL Operator
 - Checks if a value matches ALL values within a list.
 
 SYNTAX:
 SELECT column1, column2, ...
 FROM table1
 WHERE column < ALL ( SELECT column1 FROM table2 WHERE condition );
 
 (Or)
 
 SELECT column1, column2, ...
 FROM table1
 WHERE column < ANY ( SELECT column1 FROM table2 WHERE condition );
 */
--================================
-- Find female employess whose salaries are greater than the salries of any male employess.
--================================
SELECT *
FROM sales.employees
WHERE gender = 'F'
    AND salary > ANY (
        SELECT salary
        FROM sales.employees
        WHERE gender = 'M'
    );
--================================
-- Find the female employees whose salries are greater than the salries of all male employees.
--================================
SELECT *
FROM sales.employees
WHERE gender = 'F'
    AND salary > ALL (
        SELECT salary
        FROM sales.employees
        WHERE gender = 'M'
    );