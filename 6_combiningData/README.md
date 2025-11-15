# ✅ **Difference Between JOINs and SETs in SQL**

SQL gives you **two major ways** to combine data:

1. **JOINs** → Combine rows **horizontally**
2. **SET operations** → Combine rows **vertically**

Let’s break them down.

---

# 🔵 **1. JOINs (Horizontal combination)**

JOINs are used to bring columns from **multiple tables** into a **single row** based on a relationship.

### 👉 Think of JOIN like “attaching additional columns”.

### Example

Combine customers with their orders:

```sql
SELECT c.customer_id, c.name, o.order_id, o.amount
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id;
```

### ✔ JOIN Key Points

- Adds **more columns**
- Matches rows using **keys** (like ID)
- Used when tables are **related**
- Produces **wider** results

### Types of JOINs

| Type           | Meaning                              |
| -------------- | ------------------------------------ |
| **INNER JOIN** | Only matching rows                   |
| **LEFT JOIN**  | All left table + matching from right |
| **RIGHT JOIN** | All right table + matching from left |
| **FULL JOIN**  | All rows from both tables            |
| **CROSS JOIN** | Cartesian product (all combinations) |

---

# 🔴 **2. SET operations (Vertical combination)**

SET operations stack rows **on top of each other**.

### 👉 Think of SET like “attaching more rows”.

### Examples

Combine results from two SELECT queries:

```sql
SELECT name FROM customers
UNION
SELECT name FROM suppliers;
```

### ✔ SET Operation Key Points

- Adds **more rows**
- Queries must have **same number of columns**
- Columns must have **compatible data types**
- Produces **taller** results

### Types of SET operations

| Operation     | Meaning                             |
| ------------- | ----------------------------------- |
| **UNION**     | Combines rows, removes duplicates   |
| **UNION ALL** | Combines rows, keeps duplicates     |
| **INTERSECT** | Only common rows                    |
| **EXCEPT**    | Rows from first query not in second |

---

# 🧠 **Quick Visual Difference**

### JOIN (horizontal merge)

```
Table A: (3 columns)
Table B: (2 columns)

Result: 5 columns
```

### SET (vertical merge)

```
Query 1: 3 columns
Query 2: 3 columns

Result: still 3 columns, more rows
```

---

# 🎯 **When to use what?**

| Use JOIN when                                  | Use SET when                                            |
| ---------------------------------------------- | ------------------------------------------------------- |
| You want **related data** from multiple tables | You want to **merge results from two separate queries** |
| Tables have keys (IDs)                         | Queries return similar columns                          |
| You want extra **columns**                     | You want extra **rows**                                 |
| Example: customers + orders                    | Example: list of names from multiple tables             |

---

# 🟢 **Super Simple Example to Remember**

### JOIN = “Bring matching columns side-by-side”

### SET = “Stack rows on top of each other”
