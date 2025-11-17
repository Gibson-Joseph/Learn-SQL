## ⭐ Row-Level Functions

Row-Level Functions (also called **Scalar Functions** or **Single-Row Functions**) operate on **each row individually** and return **one value per row**.
These functions help us **transform**, **format**, and **calculate** data **row by row**.

> **These functions help us to modify or compute values for each row in the result.**

---

## 📂 Types of Row-Level Functions

---

## 1️⃣ String Functions

Used to manipulate text values.

| Function      | Description               | Example                            |
| ------------- | ------------------------- | ---------------------------------- |
| `UPPER()`     | Convert text to uppercase | `UPPER(firstname)`                 |
| `LOWER()`     | Convert text to lowercase | `LOWER(email)`                     |
| `CONCAT()`    | Join two strings          | `CONCAT(firstname, ' ', lastname)` |
| `SUBSTRING()` | Extract part of a string  | `SUBSTRING(email FROM 1 FOR 5)`    |
| `LENGTH()`    | Get string length         | `LENGTH(address)`                  |

### Example

```sql
SELECT firstname, UPPER(lastname), LENGTH(firstname)
FROM customers;
```

---

## 2️⃣ Numeric Functions

Used to perform mathematical operations.

| Function  | Description                 | Example           |
| --------- | --------------------------- | ----------------- |
| `ABS()`   | Returns absolute value      | `ABS(-10)`        |
| `ROUND()` | Round number to decimals    | `ROUND(price, 2)` |
| `CEIL()`  | Round up to nearest integer | `CEIL(10.3)`      |
| `FLOOR()` | Round down                  | `FLOOR(10.9)`     |
| `POWER()` | Exponential calculation     | `POWER(2, 3)`     |

### Example

```sql
SELECT price, ROUND(price, 0), FLOOR(price), CEIL(price)
FROM products;
```

---

## 3️⃣ Date & Time Functions

Used to extract or format date/time values.

| Function       | Description           | Example                         |
| -------------- | --------------------- | ------------------------------- |
| `CURRENT_DATE` | Today's date          | —                               |
| `NOW()`        | Current date & time   | —                               |
| `EXTRACT()`    | Extract parts of date | `EXTRACT(YEAR FROM order_date)` |
| `AGE()`        | Calculate difference  | `AGE(NOW(), dob)`               |

### Example

```sql
SELECT order_date,
       EXTRACT(YEAR FROM order_date) AS year,
       EXTRACT(MONTH FROM order_date) AS month
FROM orders;
```

---

## 4️⃣ Conversion Functions

Convert values between different data types.

| Function      | Description                | Example                              |
| ------------- | -------------------------- | ------------------------------------ |
| `CAST()`      | Convert data type          | `CAST(score AS INTEGER)`             |
| `TO_CHAR()`   | Convert date/number → text | `TO_CHAR(order_date, 'DD-Mon-YYYY')` |
| `TO_NUMBER()` | Convert text → number      | `TO_NUMBER('120', '999')`            |

### Example

```sql
SELECT order_date,
       TO_CHAR(order_date, 'DD/MM/YYYY') AS formatted_date
FROM orders;
```

---

## ⭐ Why Do We Use Row-Level Functions?

Row-level functions help us:

✔ Format text
✔ Format dates
✔ Perform arithmetic calculations
✔ Convert data types
✔ Clean and transform data
✔ Extract useful information

> These functions **operate per row** and return **one value per row**, making them essential in SQL querying.

---

## 🧩 Combined Example

```sql
SELECT
    UPPER(firstname) AS first_name,
    CONCAT(firstname, ' ', lastname) AS full_name,
    ROUND(salary * 1.10, 2) AS salary_after_hike,
    EXTRACT(YEAR FROM dob) AS birth_year
FROM employees;
```

---

## 📌 Summary

Row-Level Functions help us to:

- Transform data
- Format output
- Compute values
- Extract useful details
- Prepare data for reports or dashboards

They work **row-by-row** and return a **single value per row**.
