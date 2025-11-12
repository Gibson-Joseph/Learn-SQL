This is one of the **core parts of SQL**, and it’s what you’ll use most often when working with data.

---

## 🧩 What is DML?

**DML (Data Manipulation Language)** is used to **work with the data stored in your tables** — not the structure (that’s DDL).

👉 In simple words:

> DML is for **adding, reading, updating, and deleting** data inside tables.

---

## 🧱 Main DML Commands

| Command  | Description                            |
| -------- | -------------------------------------- |
| `INSERT` | Adds new data (rows) to a table        |
| `SELECT` | Retrieves data from one or more tables |
| `UPDATE` | Modifies existing data in a table      |
| `DELETE` | Removes data from a table              |

---

## 🧠 1. `INSERT` – Add New Data

```sql
INSERT INTO customers (name, email)
VALUES ('Gibbs', 'gibbs@example.com');
```

🟢 **Explanation:**

- Adds one new record to the `customers` table.
- Columns and values must match in number and order.

### ➕ Insert Multiple Rows

```sql
INSERT INTO customers (name, email)
VALUES
  ('Alice', 'alice@gmail.com'),
  ('Bob', 'bob@yahoo.com');
```

---

## 🧠 2. `SELECT` – Retrieve Data

```sql
SELECT * FROM customers;
```

🟢 **Explanation:**

- `*` selects all columns.
- To select specific columns:

```sql
SELECT name, email FROM customers;
```

### ➕ Add Conditions

```sql
SELECT * FROM customers WHERE name = 'Gibbs';
```

---

## 🧠 3. `UPDATE` – Modify Data

```sql
UPDATE customers
SET email = 'newemail@example.com'
WHERE name = 'Gibbs';
```

🟢 **Explanation:**

- Changes existing data.
- Always use a **WHERE** clause to avoid updating all rows accidentally.

---

## 🧠 4. `DELETE` – Remove Data

```sql
DELETE FROM customers WHERE name = 'Bob';
```

🟢 **Explanation:**

- Removes specific rows.
- Without `WHERE`, it deletes _everything_ from the table!

### ⚠️ Example (Dangerous)

```sql
DELETE FROM customers;
```

This removes **all data** but keeps the table structure.

---

## 🧩 Summary Table

| DML Command | Action               | Example                                 |
| ----------- | -------------------- | --------------------------------------- |
| **INSERT**  | Add data             | `INSERT INTO users (...) VALUES (...);` |
| **SELECT**  | Read data            | `SELECT * FROM users;`                  |
| **UPDATE**  | Change existing data | `UPDATE users SET ... WHERE ...;`       |
| **DELETE**  | Remove data          | `DELETE FROM users WHERE ...;`          |

---

## 🧠 Example: Full DML Workflow

```sql
-- 1️⃣ Insert data
INSERT INTO employees (name, role, salary)
VALUES ('Alice', 'Engineer', 50000);

-- 2️⃣ Retrieve data
SELECT * FROM employees;

-- 3️⃣ Update salary
UPDATE employees
SET salary = 55000
WHERE name = 'Alice';

-- 4️⃣ Delete data
DELETE FROM employees
WHERE name = 'Alice';
```

---

## ⚙️ DML vs DDL (Quick Recap)

| Type    | Full Form                  | Focus                 | Example Commands               |
| ------- | -------------------------- | --------------------- | ------------------------------ |
| **DDL** | Data Definition Language   | Defines **structure** | CREATE, ALTER, DROP            |
| **DML** | Data Manipulation Language | Manages **data**      | SELECT, INSERT, UPDATE, DELETE |

---

## 🧠 Tip:

DML changes can often be **rolled back** (undone) if your database supports transactions — unlike DDL changes, which are usually permanent.
