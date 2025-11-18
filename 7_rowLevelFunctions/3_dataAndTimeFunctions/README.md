# 📘 Date & Time Functions in SQL (PostgreSQL)

### _Row-Level Functions Explained in Detail_

Date & Time functions help you **extract**, **manipulate**, and **calculate** values related to dates, times, and timestamps.
These are **row-level functions**, meaning they apply **to every row** the query processes.

Example:

```sql
SELECT CURRENT_DATE, CURRENT_TIME, CURRENT_TIMESTAMP;
```

Each row gets its own evaluated result.

---

# 🧭 Why Date & Time Functions Matter?

You use date & time functions when you need to:

- Get today’s date or time
- Extract YEAR, MONTH, DAY from a date
- Add or subtract time
- Calculate age or duration
- Truncate a timestamp (useful in dashboards & reports)

PostgreSQL offers powerful date & time tools that make these operations very easy.

---

# 📚 Table of Contents

### **A. Extracting Date/Time Values**

1. CURRENT_DATE
2. CURRENT_TIME
3. CURRENT_TIMESTAMP
4. EXTRACT
5. DATE_PART

### **B. Manipulating Dates**

6. AGE
7. NOW
8. MAKE_DATE
9. MAKE_TIMESTAMP

### **C. Adding & Subtracting Intervals**

10. INTERVAL
11. Adding Interval
12. Subtracting Interval

### **D. Date Calculations**

13. DATE_TRUNC
14. JUSTIFY_INTERVAL

### **E. Casting & Conversions**

15. TO_CHAR
16. TO_DATE
17. TO_TIMESTAMP

### **F. Useful Real-World Examples**

---

# ------------------------------------------------

# 🅐 Extracting Date/Time Values

# ------------------------------------------------

## 1. **CURRENT_DATE**

Returns today's date.

```sql
SELECT CURRENT_DATE;
```

📤 **Output**

```
2025-11-17
```

**Use cases**
✔ Report generation
✔ Logging
✔ Validity checks

---

## 2. **CURRENT_TIME**

Returns system time with timezone.

```sql
SELECT CURRENT_TIME;
```

📤 Output:

```
18:42:58.234987+05:30
```

---

## 3. **CURRENT_TIMESTAMP**

Returns **date + time + timezone**.

```sql
SELECT CURRENT_TIMESTAMP;
```

📤 Example:

```
2025-11-17 18:43:50.34456+05:30
```

---

## 4. **EXTRACT**

Extracts a component (year, month, day, hour…).

```sql
SELECT EXTRACT(YEAR FROM CURRENT_DATE);
SELECT EXTRACT(MONTH FROM NOW());
```

📤 Example Outputs:

```
2025
11
```

---

## 5. **DATE_PART**

Same as EXTRACT, but string syntax.

```sql
SELECT DATE_PART('day', CURRENT_TIMESTAMP);
```

📤 Output:

```
17
```

---

# ------------------------------------------------

# 🅑 Manipulating Dates

# ------------------------------------------------

## 6. **AGE**

Calculates the difference between two dates.

```sql
SELECT AGE('2025-11-17', '2020-01-01');
```

📤 Output:

```
5 years 10 mons 16 days
```

**Real use cases**

- Age of a user
- Tenure of employees
- Time since last login

---

## 7. **NOW**

Returns current timestamp.

```sql
SELECT NOW();
```

Equivalent to `CURRENT_TIMESTAMP`.

---

## 8. **MAKE_DATE**

Constructs a date from integers.

```sql
SELECT MAKE_DATE(2025, 11, 17);
```

📤 Output:

```
2025-11-17
```

---

## 9. **MAKE_TIMESTAMP**

Creates a full timestamp.

```sql
SELECT MAKE_TIMESTAMP(2025, 11, 17, 10, 30, 00);
```

📤 Output:

```
2025-11-17 10:30:00
```

---

# ------------------------------------------------

# 🅒 Adding & Subtracting Intervals

# ------------------------------------------------

## 10. **INTERVAL**

A time duration (days, months, hours, etc.)

Examples:

```sql
INTERVAL '1 day'
INTERVAL '2 hours'
INTERVAL '3 months'
```

---

## 11. **Add Interval**

```sql
SELECT CURRENT_DATE + INTERVAL '7 days';
```

---

## 12. **Subtract Interval**

```sql
SELECT CURRENT_DATE - INTERVAL '1 month';
```

---

# ------------------------------------------------

# 🅓 Date Calculations

# ------------------------------------------------

## 13. **DATE_TRUNC**

Truncates a timestamp to a specific unit.

```sql
SELECT DATE_TRUNC('month', NOW());
```

📤 Output:

```
2025-11-01 00:00:00
```

Useful for:

- Monthly reports
- Hourly analytics
- Weekly summaries

---

## 14. **JUSTIFY_INTERVAL**

Normalizes weird intervals.

```sql
SELECT JUSTIFY_INTERVAL(INTERVAL '30 days');
```

📤 Output:

```
1 mon
```

---

# ------------------------------------------------

# 🅔 Casting & Conversions

# ------------------------------------------------

## 15. **TO_CHAR**

Convert a date or time into formatted text.

```sql
SELECT TO_CHAR(NOW(), 'DD-Mon-YYYY');
```

📤 Output:

```
17-Nov-2025
```

---

## 16. **TO_DATE**

Converts text → date.

```sql
SELECT TO_DATE('17-11-2025', 'DD-MM-YYYY');
```

---

## 17. **TO_TIMESTAMP**

Converts text → timestamp.

```sql
SELECT TO_TIMESTAMP('2025-11-17 18:45', 'YYYY-MM-DD HH24:MI');
```

---

# ------------------------------------------------

# 🅕 Real-World Use Cases

# ------------------------------------------------

### 1. **Find today’s birthdays**

```sql
SELECT name
FROM employees
WHERE EXTRACT(MONTH FROM dob) = EXTRACT(MONTH FROM CURRENT_DATE)
  AND EXTRACT(DAY FROM dob) = EXTRACT(DAY FROM CURRENT_DATE);
```

---

### 2. **Find users who haven't logged in for 30 days**

```sql
SELECT *
FROM users
WHERE last_login < NOW() - INTERVAL '30 days';
```

---

### 3. **Group orders by month**

```sql
SELECT DATE_TRUNC('month', order_date) AS month,
       COUNT(*)
FROM orders
GROUP BY month
ORDER BY month;
```

---

### 4. **Calculate employee age**

```sql
SELECT name, AGE(dob) AS age
FROM employees;
```

---

# ------------------------------------------------

# ✔ Summary Table

# ------------------------------------------------

| Function          | Purpose             | Example                     |
| ----------------- | ------------------- | --------------------------- |
| CURRENT_DATE      | Today’s date        | `2025-11-17`                |
| CURRENT_TIME      | Time only           | `18:45:00`                  |
| CURRENT_TIMESTAMP | Full date/time      | `2025-11-17 18:45:00`       |
| EXTRACT           | Extract parts       | `EXTRACT(YEAR FROM NOW())`  |
| DATE_PART         | Same as EXTRACT     | `DATE_PART('month', NOW())` |
| AGE               | Difference in dates | `AGE(dob)`                  |
| NOW               | Current timestamp   | `NOW()`                     |
| MAKE_DATE         | Create date         | `MAKE_DATE(2025,11,17)`     |
| INTERVAL          | Duration            | `'1 day'`                   |
| DATE_TRUNC        | Truncate            | `DATE_TRUNC('day', NOW())`  |
| TO_CHAR           | Format date         | `TO_CHAR(NOW(), 'YYYY')`    |
| TO_DATE           | String → date       | `TO_DATE('17-11-2025')`     |
| TO_TIMESTAMP      | String → timestamp  | `TO_TIMESTAMP(...)`         |
