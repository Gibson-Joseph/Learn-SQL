-- Static (Fixed) Values
-- What if we don't want query the data inside our tables, we would like to show value from the one that is writing the qyery.
/*
 What “Static (Fixed) Values” Means
 
 1. In SQL, static (or fixed) values refer to hardcoded values that you include directly in your query instead of coming from a column or variable.
 
 2. They don’t depend on the data in your table — they stay the same no matter what’s in your database.
 */
SELECT 123;
SELECT 123 as static_number;
-- So in query we can add value from us. Not only selecting data from the queries but of course you can go and mix stuff.
--So we can have like in one query data from teh databse and static data from us.
SELECT id,
    'Static vlaue' as static_value,
    first_name,
    'New customer' AS customer_type
FROM customers;