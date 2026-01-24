# CASE WHEN Statement (SQL)

## 📌 Overview

The `CASE WHEN` statement in SQL is used to add **conditional logic** inside a query.
It works like an **if–else** statement and allows you to return different values based on conditions.

`CASE` is commonly used for:

- Categorizing data
- Creating derived columns
- Conditional aggregations
- Replacing complex `IF` logic

---

## 🧠 Syntax

### 1️⃣ Simple CASE

Used when you want to compare **one column/expression** against multiple values.

```sql
CASE column_name
  WHEN value1 THEN result1
  WHEN value2 THEN result2
  ELSE default_result
END
```

### Example

```sql
SELECT
  order_id,
  CASE status
    WHEN 'P' THEN 'Pending'
    WHEN 'S' THEN 'Shipped'
    WHEN 'C' THEN 'Cancelled'
    ELSE 'Unknown'
  END AS order_status
FROM orders;
```

---

### 2️⃣ Searched CASE (Most Common)

Used when each condition is a **boolean expression**.

```sql
CASE
  WHEN condition1 THEN result1
  WHEN condition2 THEN result2
  ELSE default_result
END
```

### Example

```sql
SELECT
  customer_id,
  CASE
    WHEN total_spent >= 10000 THEN 'Platinum'
    WHEN total_spent >= 5000 THEN 'Gold'
    WHEN total_spent >= 1000 THEN 'Silver'
    ELSE 'Bronze'
  END AS customer_category
FROM customers;
```

---

## 🔢 Using CASE with Numbers

```sql
SELECT
  product_name,
  price,
  CASE
    WHEN price < 100 THEN 'Cheap'
    WHEN price BETWEEN 100 AND 500 THEN 'Affordable'
    ELSE 'Expensive'
  END AS price_range
FROM products;
```

---

## 📊 CASE with Aggregate Functions

### Conditional COUNT

```sql
SELECT
  COUNT(CASE WHEN status = 'Completed' THEN 1 END) AS completed_orders,
  COUNT(CASE WHEN status = 'Cancelled' THEN 1 END) AS cancelled_orders
FROM orders;
```

### Conditional SUM

```sql
SELECT
  SUM(
    CASE
      WHEN status = 'Completed' THEN amount
      ELSE 0
    END
  ) AS total_completed_amount
FROM orders;
```

⚠️ **Important:**
Always return `0` instead of `NULL` in `SUM`, otherwise results may be incorrect.

---

## 🧩 CASE with NULL Handling

```sql
SELECT
  employee_name,
  CASE
    WHEN bonus IS NULL THEN 0
    ELSE bonus
  END AS bonus_amount
FROM employees;
```

👉 Alternative (simpler):

```sql
COALESCE(bonus, 0)
```

---

## 🔀 CASE in ORDER BY

```sql
SELECT *
FROM employees
ORDER BY
  CASE
    WHEN role = 'Manager' THEN 1
    WHEN role = 'Lead' THEN 2
    ELSE 3
  END;
```

---

## 🔍 CASE in WHERE Clause

```sql
SELECT *
FROM orders
WHERE
  CASE
    WHEN status = 'Cancelled' THEN 0
    ELSE 1
  END = 1;
```

⚠️ This works, but **avoid it if possible**—it can hurt performance. Prefer direct conditions.

---

## ❗ Rules & Best Practices

✅ `CASE` always ends with `END`
✅ `ELSE` is optional, but recommended
✅ Return values should be of **compatible data types**
❌ `CASE` is **not a loop**
❌ Don’t overuse it in `WHERE` clauses

---

## 🚀 Real-World Use Cases

- Customer segmentation
- Status mapping
- Conditional metrics in reports
- Business rules inside queries
- Data cleanup and transformation

---
