# Combining Data Using SQL **Set Operators**

SQL provides **set operators** to combine the result sets of two queries.
These operators **help us combine rows** from multiple queries into a single output.

They work **vertically**, stacking rows — unlike JOINs, which work **horizontally**, combining columns.

Set operators follow mathematical set rules.

---

## 📌 **Rules for Set Operators**

Before using any set operator:

1. **Each SELECT must have the same number of columns**
2. **Columns must be in the same order**
3. **Column data types must be compatible**
4. **SET operator can be used almost in all clauses: WHERE | JOIN | GROUP BY | HAVING**
5. **The column names(Column Aliases) in the result set are determined by the column names specified in the first query**
6. **Only the final SELECT can end with ORDER BY**
   (or wrap the whole thing in a subquery).

Example structure:

```sql
SELECT column1, column2 FROM tableA
<SET OPERATOR>
SELECT column1, column2 FROM tableB;
```

---

# 1. **UNION**

### ✅ Returns **distinct rows only**

Duplicates are removed automatically.

### ✨ Use when:

- You want to merge two result sets **without duplicates**.
- Best when deduplication is required.

### 📊 Visual:

```
Set A + Set B (duplicates removed)
```

### 🧪 Example:

```sql
SELECT firstname FROM customers_domestic
UNION
SELECT firstname FROM customers_international;
```

This returns unique first names across both tables.

---

# 2. **UNION ALL**

### ✅ Returns **all rows**, including duplicates

Faster than UNION, because it **does not remove duplicates**.

### ✨ Use when:

- You want **full merged data** with duplicates.
- Performance is important.

### 📊 Visual:

```
All rows from A + All rows from B (duplicates included)
```

### 🧪 Example:

```sql
SELECT firstname FROM customers_domestic
UNION ALL
SELECT firstname FROM customers_international;
```

---

# 3. **EXCEPT**

(Equivalent to **MINUS** in Oracle)

### ✅ Returns rows from **Query A that do NOT exist in Query B**

### ✨ Use when:

- You need to find what is **missing**, **removed**, or **exclusive** to a dataset.

### 📊 Visual:

```
A - B (only rows unique to A)
```

### 🧪 Example:

```sql
SELECT customerid FROM customers_2024
EXCEPT
SELECT customerid FROM customers_2025;
```

Meaning:
Customers **present in 2024 but not in 2025**.

---

# 4. **INTERSECT**

### ✅ Returns **only rows common** to both result sets.

### ✨ Use when:

- You need to find the **overlap** between two datasets.

### 📊 Visual:

```
A ∩ B (common rows)
```

### 🧪 Example:

```sql
SELECT email FROM newsletter_list
INTERSECT
SELECT email FROM registered_users;
```

Result:
Emails that appear **in both lists**.

---

# 🔥 Comparisons Summary Table

| Operator      | Removes Duplicates | Purpose              | Example Meaning               |
| ------------- | ------------------ | -------------------- | ----------------------------- |
| **UNION**     | ✔ Yes              | Merge unique results | Unique names from both tables |
| **UNION ALL** | ✖ No               | Merge all results    | All rows including duplicates |
| **EXCEPT**    | ✔ Yes              | A minus B            | Rows only in first query      |
| **INTERSECT** | ✔ Yes              | A ∩ B                | Rows common to both           |

---

# 📘 Best Practices

### ✔ 1. Use **UNION ALL** unless you _specifically_ need duplicates removed

It is faster and avoids unnecessary sorting.

### ✔ 2. Always check column order and datatype compatibility

Example of a mistake:

```sql
SELECT id, name FROM t1
UNION
SELECT name, id FROM t2; -- ❌ Wrong order
```

### ✔ 3. Use ORDER BY at the end:

```sql
SELECT firstname FROM a
UNION
SELECT firstname FROM b
ORDER BY firstname;
```

### ✔ 4. When comparing large datasets, EXCEPT and INTERSECT are faster than using NOT IN or EXISTS.

---

# 📦 Full Example

### Find unique passengers who either booked online OR at the counter:

```sql
SELECT passport_no, name FROM online_bookings
UNION
SELECT passport_no, name FROM counter_bookings;
```

### Find passengers who booked at BOTH places:

```sql
SELECT passport_no FROM online_bookings
INTERSECT
SELECT passport_no FROM counter_bookings;
```

### Passengers who booked online but NOT at the counter:

```sql
SELECT passport_no FROM online_bookings
EXCEPT
SELECT passport_no FROM counter_bookings;
```

---

# 📝 Conclusion

Set operators are powerful tools for combining and comparing datasets.
They help you:

- Merge results (UNION / UNION ALL)
- Compare differences (EXCEPT)
- Find common records (INTERSECT)
