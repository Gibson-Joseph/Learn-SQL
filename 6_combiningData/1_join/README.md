# 📘 Combining Data Using JOIN in SQL

_A Complete, Beginner-Friendly Guide_

When working with relational databases like PostgreSQL, MySQL, SQL Server, or Oracle, data is usually split across many tables.
To get meaningful results, we must **combine data**.

## SQL provides the **JOIN** clause to connect rows across tables using a **relationship** (usually matching keys).

# 📌 Why Do We Use JOIN?

Because we follow **Normalization** — storing data in separate tables to avoid duplication.
Example:

- Customers → stored in `customers`
- Orders → stored in `orders`
- Payments → stored in `payments`

JOIN helps us fetch **combined** information like:

> "Show each customer with their orders"
> "Show each order with its payment details"
> "Show all customers even if they never ordered"

---

# 🧩 How JOIN Works

JOIN combines tables using:

1. The table names
2. A **join condition** using `ON`
3. A common key between the tables

Example general syntax:

```sql
SELECT columns
FROM table1
JOIN table2
ON table1.common_column = table2.common_column;
```

---

# 🗂 Example Tables

### **customers**

| customer_id | name  | city    |
| ----------- | ----- | ------- |
| 1           | Gibbs | Mumbai  |
| 2           | Alex  | Chennai |
| 3           | Sara  | Delhi   |

### **orders**

| order_id | customer_id | amount |
| -------- | ----------- | ------ |
| 101      | 1           | 500    |
| 102      | 2           | 800    |
| 103      | 2           | 300    |

---

# 🔗 Types of JOINs (Explained With Diagrams)

---

## 1️⃣ INNER JOIN

### 📌 Returns only **matching rows** from both tables.

This is the **most commonly used** join.

### Diagram

```
Table A ●———● Table B
Only overlapping (matching) rows
```

### Query

```sql
SELECT c.name, o.amount
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;
```

### Output

Shows only customers who have made orders.

| name  | amount |
| ----- | ------ |
| Gibbs | 500    |
| Alex  | 800    |
| Alex  | 300    |

---

## 2️⃣ LEFT JOIN (LEFT OUTER JOIN)

### 📌 Returns all rows from the **left table**, even if no match exists.

### Diagram

```
Left table ●●●●●
Right table ●●
Result: All from left, matching from right
```

### Query

```sql
SELECT c.name, o.amount
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;
```

### Output

Sara has no orders → amount is `NULL`.

| name  | amount |
| ----- | ------ |
| Gibbs | 500    |
| Alex  | 800    |
| Alex  | 300    |
| Sara  | NULL   |

---

## 3️⃣ RIGHT JOIN (RIGHT OUTER JOIN)

### 📌 Returns all rows from the **right table**, even if no match exists.

### Diagram

```
Left table ●●
Right table ●●●●●
Result: All from right, matching from left
```

### Query

```sql
SELECT c.name, o.amount
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;
```

### Output

Every order is shown, even if the customer is missing.

---

## 4️⃣ FULL OUTER JOIN

### 📌 Returns **all rows from both tables** — matched and unmatched.

### Diagram

```
Full left + overlapping + full right
```

### Query

```sql
SELECT c.name, o.amount
FROM customers c
FULL OUTER JOIN orders o
ON c.customer_id = o.customer_id;
```

✔ Shows EVERYTHING from both tables.
Unmatched values are filled with **NULL**.

---

## 5️⃣ CROSS JOIN

### 📌 Produces **every possible combination** of rows.

If table A has 3 rows and table B has 2 rows → result is **6 rows**.

### Query

```sql
SELECT *
FROM customers
CROSS JOIN orders;
```

⚠️ Be careful: result grows very fast.

---

## 6️⃣ SELF JOIN

### 📌 A table joined with itself.

Used when a table has a relationship inside itself.

Example: employees with the same manager

```sql
SELECT e1.name AS employee, e2.name AS colleague
FROM employees e1
JOIN employees e2
ON e1.manager_id = e2.manager_id;
```

---

# 🏷️ JOIN Conditions

### Most common join conditions:

### 1. **Equality JOIN (most common)**

```sql
ON table1.col = table2.col
```

### 2. **Using multiple conditions**

```sql
ON a.customer_id = b.customer_id
AND a.status = b.status
```

### 3. **Using non-equal join**

```sql
ON a.amount > b.amount
```

---

# 🔥 Advanced JOIN Examples

---

## 📌 Joining More Than Two Tables

```sql
SELECT c.name, o.amount, p.payment_date
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN payments p ON o.order_id = p.order_id;
```

---

## 📌 Filtering results with WHERE + JOIN

```sql
SELECT c.name, o.amount
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.amount > 500;
```

---

## 📌 Using Aliases

Aliases make queries cleaner:

```sql
SELECT c.name, o.amount
FROM customers AS c
JOIN orders AS o
ON c.customer_id = o.customer_id;
```

---

# ⚠️ Common Mistakes (and Fixes)

### ❌ Mistake 1: Missing ON condition → Cross join happens

```sql
SELECT *
FROM customers, orders;
```

### ✔ Fix

Always write:

```sql
FROM customers
JOIN orders ON ...
```

---

### ❌ Mistake 2: Using WHERE instead of JOIN

Old style SQL:

```sql
SELECT *
FROM customers, orders
WHERE customers.customer_id = orders.customer_id;
```

✔ Works, but **not recommended**.

---

### ❌ Mistake 3: Confusing LEFT JOIN and INNER JOIN

LEFT JOIN keeps **all left rows**
INNER JOIN keeps **only matching rows**

---

### ❌ Mistake 4: Ambiguous column names

```sql
SELECT customer_id FROM customers JOIN orders;
```

❌ Error: Which `customer_id`?

✔ Fix using table alias:

```sql
SELECT customers.customer_id
```

or

```sql
SELECT c.customer_id
```

---

# 🧠 Real-World analogies

### INNER JOIN = People who appear in both Class A and Class B

### LEFT JOIN = All students from Class A + only matching from Class B

### RIGHT JOIN = All students from Class B + matching from Class A

### FULL JOIN = Everyone from both classes

### CROSS JOIN = Every student from Class A paired with every student from Class B

### SELF JOIN = A student comparing with themselves or classmates

---

# 🎉 Summary

| JOIN Type | What It Returns               |
| --------- | ----------------------------- |
| INNER     | Only matching rows            |
| LEFT      | All left rows + matches       |
| RIGHT     | All right rows + matches      |
| FULL      | All rows from both tables     |
| CROSS     | All combinations              |
| SELF      | Same table joined with itself |

JOIN is one of the **most powerful SQL concepts** — mastering it is essential to becoming a strong backend or full-stack developer.

---
