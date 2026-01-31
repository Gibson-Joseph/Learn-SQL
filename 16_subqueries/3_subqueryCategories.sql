-- Subquery Categories.
/*
 In subqury, there are many different types and categories. 
 
 1. There is manly two types of subqueries.
 - 1. Non-Correlalated subquery - That means the subquery is independtent from the main query.
 - 2. Correlated subquery - It's exactly the opposite, this subquery cannot depend on the main query.
 
 2. Now there is another group on how to group up the subqueries depeding on the result type. So that means the subquery has different output and result.
 - 1. Scalar subquery - It returns only one single value.
 - 2. Row subquery - It can return multipe rows.
 - 3. Table subquery - It returns multiple rows as well as multiple columns.
 
 3. Location and Clauses. So we are describing here where the subquery is going to be use within the main query. So we can use it in different locations and clauses like the SELECT Clause or we can use it FROM Cluase or we can use it before JOINing tables and we can use it in order to filter the data in the WHERE cluase.
 
 And in the WHERE Cluase, there are two different sets of operators. We can use the subquery together with the COMPARISION OPERATORS, the less(<), greater(>), equal(=) and so on. And we can use it in the LOGICAL OPERATOR like IN, ANY, ALL and EXISTS
 
 Location | Clauses:
 1. SELECT
 2. FROM
 3. JOIN
 4. WHERE
 - 1. Comparison Operator
 - 2. Logical Operator
 */