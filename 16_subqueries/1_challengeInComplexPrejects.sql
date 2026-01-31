-- Challenges in Complex Projectes.
-- Ref: https://www.udemy.com/course/the-complete-sql-bootcamp-30-hours-go-from-zero-to-hero/learn/lecture/45589369#overview
---
--To see the database metadata
SELECT *
FROM INFORMATION_SCHEMA.COLUMNS;
---
SELECT DISTINCT TABLE_NAME
FROM INFORMATION_SCHEMA.COLUMNS;