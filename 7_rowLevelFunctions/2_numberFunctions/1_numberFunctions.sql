/*
 ROUND
 Rounds a number to a specified number of decimal places.
 */
SELECT 3.516,
    ROUND(3.516, 2) AS round_2,
    ROUND(3.516, 1) AS round_1,
    ROUND(3.516, 0) AS round_0;
----------------------------------------------------
/*
 ABS
 Returns the absolute (positive) value of a number.
 Returns the absolute (positive) value of a number, removing any regative sign.
 */
SELECT -10,
    ABS(-10),
    ABS(10);
----------------------------------------------------
/*
 CEIL
 Rounds a number UP to the nearest integer.
 */
SELECT 3.25,
    CEIL(3.35);
----------------------------------------------------
/*
 FLOOR 
 Rounds a number DOWN to the nearest integer.
 */
SELECT 3.75,
    FLOOR(3.75);
----------------------------------------------------
/*
 RANDOM 
 -- Returns a random number between 0 and 1.
 */
SELECT ROUND(RANDOM());