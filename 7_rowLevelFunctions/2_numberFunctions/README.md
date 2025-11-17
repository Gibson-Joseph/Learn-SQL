# 📘 Number Functions in SQL (PostgreSQL)

Number (numeric) functions are built-in SQL functions used to perform **mathematical operations** on numeric columns or values.
These functions work **row by row**, meaning the function is applied to each row returned by the query.

---

## 📚 Table of Contents

1. ABS(#abs)
2. CEIL / CEILING
3. FLOOR
4. ROUND
5. POWER
6. SQRT
7. MOD
8. RANDOM

---

## 1. **ABS**

Returns the **absolute (positive)** value of a number.

### ✔ Syntax

```sql
SELECT ABS(number);
```

### ✔ Example

```sql
SELECT ABS(-10);   -- 10
SELECT ABS(25);    -- 25
```

---

## 2. **CEIL / CEILING**

Rounds a number **up to the nearest integer**.

### ✔ Syntax

```sql
SELECT CEIL(number);
```

### ✔ Example

```sql
SELECT CEIL(4.2);   -- 5
SELECT CEILING(7.01); -- 8
```

---

## 3. **FLOOR**

Rounds a number **down to the nearest integer**.

### ✔ Syntax

```sql
SELECT FLOOR(number);
```

### ✔ Example

```sql
SELECT FLOOR(4.9);   -- 4
SELECT FLOOR(7.01);  -- 7
```

---

## 4. **ROUND**

Rounds a number to a **specified number of decimal places**.

### ✔ Syntax

```sql
SELECT ROUND(number, decimal_places);
```

### ✔ Example

```sql
SELECT ROUND(4.567, 2);  -- 4.57
SELECT ROUND(12.3456, 0); -- 12
```

---

## 5. **POWER**

Returns a number raised to a specified power.

### ✔ Syntax

```sql
SELECT POWER(base, exponent);
```

### ✔ Example

```sql
SELECT POWER(2, 3);   -- 8
SELECT POWER(5, 2);   -- 25
```

---

## 6. **SQRT**

Returns the **square root** of a number.

### ✔ Syntax

```sql
SELECT SQRT(number);
```

### ✔ Example

```sql
SELECT SQRT(25);  -- 5
SELECT SQRT(81);  -- 9
```

---

## 7. **MOD**

Returns the **remainder** of a division (useful for odd/even checks).

### ✔ Syntax

```sql
SELECT MOD(a, b);
```

### ✔ Example

```sql
SELECT MOD(10, 3); -- 1
SELECT MOD(9, 2);  -- 1  (Odd)
```

---

## 8. **RANDOM**

Returns a **random number between 0 and 1**.

### ✔ Syntax

```sql
SELECT RANDOM();
```

### ✔ Example

```sql
SELECT RANDOM();
-- Example output: 0.548734
```

---

### 🎯 Summary Table

| Function        | Description         | Example         | Output |
| --------------- | ------------------- | --------------- | ------ |
| **ABS(x)**      | Absolute value      | ABS(-5)         | 5      |
| **CEIL(x)**     | Round up            | CEIL(4.2)       | 5      |
| **FLOOR(x)**    | Round down          | FLOOR(7.9)      | 7      |
| **ROUND(x, n)** | Round to n decimals | ROUND(5.678, 2) | 5.68   |
| **POWER(x, y)** | x raised to y       | POWER(3, 2)     | 9      |
| **SQRT(x)**     | Square root         | SQRT(49)        | 7      |
| **MOD(x, y)**   | Remainder           | MOD(10, 3)      | 1      |
| **RANDOM()**    | Random 0–1          | RANDOM()        | varies |
