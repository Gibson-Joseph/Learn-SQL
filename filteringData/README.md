# 📘 SQL WHERE Clause Operators

The `WHERE` clause in SQL is used to **filter data** based on specific conditions.  
It allows you to return only the rows that meet your criteria.

---

## 1️⃣ Comparison Operators

Comparison operators are used to compare column values with constants or other columns.

| Operator     | Description              | Example                    | Result                                    |
| ------------ | ------------------------ | -------------------------- | ----------------------------------------- |
| `=`          | Equal to                 | `WHERE age = 25`           | Returns rows where age is 25              |
| `!=` or `<>` | Not equal to             | `WHERE country != 'India'` | Returns rows where country is not India   |
| `>`          | Greater than             | `WHERE score > 80`         | Returns rows where score is more than 80  |
| `<`          | Less than                | `WHERE price < 100`        | Returns rows where price is less than 100 |
| `>=`         | Greater than or equal to | `WHERE age >= 18`          | Returns rows where age is 18 or older     |
| `<=`         | Less than or equal to    | `WHERE marks <= 60`        | Returns rows where marks are 60 or below  |

---

## 2️⃣ Logical Operators

Logical operators combine multiple conditions in a `WHERE` clause.

| Operator | Description                                    | Example                                   | Result                 |
| -------- | ---------------------------------------------- | ----------------------------------------- | ---------------------- |
| `AND`    | Returns rows when **both** conditions are true | `WHERE country = 'India' AND age > 18`    | India & above 18       |
| `OR`     | Returns rows when **any** condition is true    | `WHERE city = 'Delhi' OR city = 'Mumbai'` | Either Delhi or Mumbai |
| `NOT`    | Reverses a condition                           | `WHERE NOT country = 'USA'`               | All except USA         |

🧩 **Tip:** You can group conditions using parentheses:

```sql
WHERE (country = 'India' AND age > 18) OR city = 'New York';
```

---

## 3️⃣ Range Operator

Used to filter results within a specific range.

| Operator                  | Description                                         | Example                               | Result                |
| ------------------------- | --------------------------------------------------- | ------------------------------------- | --------------------- |
| `BETWEEN ... AND ...`     | Checks if a value is between two values (inclusive) | `WHERE age BETWEEN 18 AND 30`         | Ages from 18 to 30    |
| `NOT BETWEEN ... AND ...` | Excludes values in a range                          | `WHERE price NOT BETWEEN 100 AND 500` | Price outside 100–500 |

---

## 4️⃣ Membership Operators

Used to check if a value matches **any value in a list**.

| Operator | Description                   | Example                                     | Result                         |
| -------- | ----------------------------- | ------------------------------------------- | ------------------------------ |
| `IN`     | Matches any value in a list   | `WHERE country IN ('India', 'USA', 'UK')`   | Matches one of these countries |
| `NOT IN` | Excludes all values in a list | `WHERE department NOT IN ('HR', 'Finance')` | Excludes HR & Finance          |

🧩 **Tip:** You can even use a subquery inside `IN`:

```sql
WHERE id IN (SELECT user_id FROM orders);
```

---

## 5️⃣ Search Operator

Used to match patterns in string data.

| Operator   | Description                 | Example                              | Result                            |
| ---------- | --------------------------- | ------------------------------------ | --------------------------------- |
| `LIKE`     | Matches a specific pattern  | `WHERE name LIKE 'A%'`               | Names starting with A             |
| `NOT LIKE` | Excludes a specific pattern | `WHERE email NOT LIKE '%@gmail.com'` | Emails not ending with @gmail.com |

### 🔤 Wildcards with LIKE

| Symbol | Meaning                         | Example                  |
| ------ | ------------------------------- | ------------------------ |
| `%`    | Matches zero or more characters | `'A%'` → A, Alex, Andrew |
| `_`    | Matches exactly one character   | `'A_'` → Al, An, Ab      |

---

## 🧠 Example: Combining Operators

```sql
SELECT name, age, country
FROM customers
WHERE country IN ('India', 'USA')
  AND age BETWEEN 18 AND 35
  AND name LIKE 'A%'
ORDER BY age ASC;
```

➡ Returns customers:

- from India or USA
- aged between 18 and 35
- whose names start with “A”

---

## ✅ Summary

| Category       | Operator Examples    |
| -------------- | -------------------- |
| **Comparison** | =, !=, >, <, >=, <=  |
| **Logical**    | AND, OR, NOT         |
| **Range**      | BETWEEN, NOT BETWEEN |
| **Membership** | IN, NOT IN           |
| **Search**     | LIKE, NOT LIKE       |

---
