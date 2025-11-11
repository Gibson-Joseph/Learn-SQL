````markdown
# 📘 SQL Basics — Beginner Guide

This guide will help you understand the most common SQL keywords:
`SELECT`, `DISTINCT`, `LIMIT`, `FROM`, `WHERE`, `ORDER BY`, `GROUP BY`, and `HAVING`.

---

## 🧠 What is SQL?

**SQL (Structured Query Language)** is a language used to **communicate with databases**.  
It helps you **read**, **filter**, **sort**, and **summarize** data.

You can think of it like asking questions to your database.

Example:

> “Show me the list of customers who live in India and spent more than ₹1000.”

---

## 🧩 1. SELECT — Choose What You Want to See

The `SELECT` statement tells SQL **which columns** you want to view.

```sql
SELECT name, country, amount
FROM customers;
```
````

🗣️ Meaning: “Show me the name, country, and amount from the customers table.”

---

## 🗂️ 2. DISTINCT — Remove Duplicate Values

If you only want **unique values** (no repeats), use `DISTINCT`.

```sql
SELECT DISTINCT country
FROM customers;
```

🗣️ Meaning: “Show me each country only once.”

---

## 🔢 3. LIMIT — Control How Many Rows Are Displayed

`LIMIT` helps you show **only a few rows** from your results.

```sql
SELECT *
FROM customers
LIMIT 5;
```

🗣️ Meaning: “Show me only the first 5 customers.”

> ⚠️ **Note:** In Microsoft SQL Server, use `TOP 5` instead of `LIMIT 5`.

---

## 🏷️ 4. FROM — Tell SQL Where to Look

The `FROM` clause tells SQL **which table** the data comes from.

```sql
SELECT name
FROM customers;
```

🗣️ Meaning: “Look inside the `customers` table.”

---

## 🔍 5. WHERE — Filter Your Data

`WHERE` helps you get **specific data** by applying conditions.

```sql
SELECT *
FROM customers
WHERE country = 'India';
```

🗣️ Meaning: “Show customers who are from India.”

You can also combine conditions:

```sql
WHERE city = 'Bangalore' AND amount > 1000;
WHERE age BETWEEN 18 AND 30;
WHERE name LIKE 'A%'; -- names starting with A
```

---

## 📊 6. ORDER BY — Sort the Results

Sorts your data either **ascending (ASC)** or **descending (DESC)**.

```sql
SELECT name, amount
FROM customers
ORDER BY amount DESC;
```

🗣️ Meaning: “Sort customers by amount from highest to lowest.”

---

## 🧮 7. GROUP BY — Combine Similar Data

`GROUP BY` lets you **group rows** that have the same value and **calculate totals or averages**.

```sql
SELECT country, SUM(amount) AS total_spent
FROM customers
GROUP BY country;
```

🗣️ Meaning: “Group all customers by country and show how much each country spent.”

> Common aggregate functions:
>
> - `SUM()` → Adds up numbers
> - `AVG()` → Finds average
> - `COUNT()` → Counts rows
> - `MAX()` → Finds largest value
> - `MIN()` → Finds smallest value

---

## ⚙️ 8. HAVING — Filter Grouped Data

After grouping data, you can filter it using `HAVING`.

```sql
SELECT country, SUM(amount) AS total_spent
FROM customers
GROUP BY country
HAVING SUM(amount) > 5000;
```

🗣️ Meaning: “Show only countries where the total spent is more than ₹5000.”

---

## 🧾 Order of Execution

When SQL runs a query, it follows this order:

```
1. FROM       → choose table
2. WHERE      → filter rows
3. GROUP BY   → group data
4. HAVING     → filter grouped data
5. SELECT     → choose columns
6. ORDER BY   → sort results
7. LIMIT      → restrict output
```

---

## 🧩 Full Example Query

```sql
SELECT country, SUM(amount) AS total_spent
FROM customers
WHERE city = 'Bangalore'
GROUP BY country
HAVING SUM(amount) > 5000
ORDER BY total_spent DESC
LIMIT 3;
```

### 💬 Explanation

> “From the `customers` table, find each country’s total spending for customers in **Bangalore**,
> show only those with total spending **over ₹5000**,
> sort by total spending **highest to lowest**,
> and show only the **top 3** countries.”

---

## 🧱 Example Data

| id  | name  | country | city      | amount |
| --- | ----- | ------- | --------- | -----: |
| 1   | Raj   | India   | Bangalore |   3000 |
| 2   | Meena | India   | Delhi     |   2000 |
| 3   | John  | USA     | New York  |   6000 |
| 4   | Aisha | UAE     | Dubai     |   4000 |
| 5   | Arjun | India   | Bangalore |   4000 |
| 6   | Sara  | USA     | Boston    |   2000 |

You can use this table to test the above queries.

---

## ✅ Summary

| Keyword    | What It Does                      | Example                     |
| ---------- | --------------------------------- | --------------------------- |
| `SELECT`   | Pick which columns to show        | `SELECT name, country`      |
| `DISTINCT` | Show only unique values           | `SELECT DISTINCT country`   |
| `LIMIT`    | Limit how many rows you see       | `LIMIT 5`                   |
| `FROM`     | Choose the table to get data from | `FROM customers`            |
| `WHERE`    | Filter data before grouping       | `WHERE amount > 1000`       |
| `GROUP BY` | Group rows to summarize data      | `GROUP BY country`          |
| `HAVING`   | Filter grouped results            | `HAVING SUM(amount) > 5000` |
| `ORDER BY` | Sort data (ASC or DESC)           | `ORDER BY amount DESC`      |

---
