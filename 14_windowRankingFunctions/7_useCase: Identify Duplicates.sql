-- Use Case: Identify Duplicates
-- Identify and remove duplicate rows to improve data qulity.
--====================================
-- Identify duplicate rows in the table 'Orders Archive' and return a clean result without any duplicates.
--====================================
SELECT *
FROM (
        SELECT ROW_NUMBER() OVER(
                PARTITION BY orderid
                ORDER BY creationtime DESC
            ) rn,
            *
        FROM sales.ordersarchive
    ) t
WHERE rn = 1;