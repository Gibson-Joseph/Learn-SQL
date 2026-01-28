-- Window AVG
/*
 MIN - Returns the lowest value within a window.
 MAX - Returns the highest value withing a window.
 */
--=======================  
-- Find the highest and lowest sales of all orders
-- Find the highest and lowest sales for each product
-- Additionally provide details such order id, order date
--=======================
SELECT orderid,
    orderid,
    productid,
    sales,
    MIN(sales) OVER() min_sale,
    MAX(sales) OVER() max_sale,
    MIN(sales) OVER(PARTITION BY productid) min_sale_by_product,
    MAX(sales) OVER(PARTITION BY productid) max_sale_by_product
from sales.orders;
--=======================
-- Show the employees who have the highest salries
--=======================
SELECT *
FROM (
        SELECT *,
            MAX(salary) OVER() highest_salary
        from sales.employees
    ) t
WHERE salary = t.highest_salary;
--=======================
-- Caculate the deviation of each sale from both the minimun and maximum sales amounts.
--=======================
SELECT orderid,
    orderdate,
    productid,
    sales,
    MIN(sales) OVER() min_sale_by_product,
    MAX(sales) OVER() max_sale_by_product,
    sales - MIN(sales) OVER() deviation_form_min,
    MAX(sales) OVER() - sales deviation_form_max
from sales.orders;