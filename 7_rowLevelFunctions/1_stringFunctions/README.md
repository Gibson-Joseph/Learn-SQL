# 📘 README.md — String Functions in SQL

## ⭐ String Functions

String functions are used to **manipulate**, **transform**, **extract**, and **format** text values in SQL.
They operate **row by row** and return **one output for each row**.

String functions help us to:
✔ Clean text
✔ Convert text format
✔ Extract specific characters
✔ Combine multiple strings
✔ Measure string length

---

# 📂 Common String Functions

---

## 1️⃣ **UPPER()**

Converts text to **uppercase**.

### Example:

```sql
SELECT UPPER(firstname) AS upper_name
FROM customers;
```

---

## 2️⃣ **LOWER()**

Converts text to **lowercase**.

### Example:

```sql
SELECT LOWER(email) AS email_lower
FROM users;
```

---

## 3️⃣ **INITCAP()** _(PostgreSQL)_

Converts the first letter of each word to uppercase.

### Example:

```sql
SELECT INITCAP(fullname)
FROM employees;
```

---

## 4️⃣ **CONCAT()**

Joins two or more strings into one.

### Example:

```sql
SELECT CONCAT(firstname, ' ', lastname) AS full_name
FROM customers;
```

---

## 5️⃣ **|| (String Concatenation Operator)**

Another way to join strings.

### Example:

```sql
SELECT firstname || ' - ' || city AS customer_details
FROM customers;
```

---

## 6️⃣ **SUBSTRING()**

Extracts part of a string.

### Syntax:

```sql
SUBSTRING(string FROM start FOR length)
```

### Example:

```sql
SELECT SUBSTRING(email FROM 1 FOR 5) AS first_5_chars
FROM customers;
```

---

## 7️⃣ **LEFT() & RIGHT()**

Extract characters from the **left** or **right** side.

### Example:

```sql
SELECT LEFT(phone, 3) AS country_code,
       RIGHT(phone, 4) AS last_digits
FROM contacts;
```

---

## 8️⃣ **LENGTH()**

Returns the number of characters in a string.

### Example:

```sql
SELECT LENGTH(firstname) AS name_length
FROM customers;
```

---

## 9️⃣ **TRIM(), LTRIM(), RTRIM()**

Removes spaces or characters from the left/right/both sides.

### Examples:

```sql
SELECT TRIM('   SQL   ') AS trimmed;       -- "SQL"
SELECT LTRIM('---ABC', '-') AS ltrimmed;   -- "ABC"
SELECT RTRIM('ABC***', '*') AS rtrimmed;   -- "ABC"
```

---

## 🔟 **REPLACE()**

Replaces part of a string with another text.

### Example:

```sql
SELECT REPLACE('Hello World', 'World', 'SQL');
-- "Hello SQL"
```

---

## 1️⃣1️⃣ **POSITION()**

Finds the position of a substring inside a string.

### Example:

```sql
SELECT POSITION('@' IN email) AS at_index
FROM customers;
```

---

## 1️⃣2️⃣ **REVERSE()**

Reverses a string (PostgreSQL).

### Example:

```sql
SELECT REVERSE('SQL');
-- "LQS"
```

---

# 🧩 Combined Example

```sql
SELECT
    INITCAP(firstname || ' ' || lastname) AS proper_name,
    LOWER(email) AS normalized_email,
    LEFT(phone, 3) AS country_code,
    LENGTH(city) AS city_length,
    SUBSTRING(email FROM 1 FOR POSITION('@' IN email)-1) AS email_username
FROM customers;
```

---

# ⭐ Summary

String functions help us to:

- Format text
- Combine multiple strings
- Extract specific characters
- Clean unnecessary spaces
- Count the length of strings
- Standardize data for search or reporting

These functions operate **row by row** and return a **single value per row**.
