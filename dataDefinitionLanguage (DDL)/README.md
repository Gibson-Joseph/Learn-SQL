## 🧩 What is DDL?

**DDL (Data Definition Language)** refers to the part of SQL used to **define, modify, or delete the structure** of database objects — such as **tables, schemas, views, or indexes**.

> DDL commands **change the design (structure)** of your database, not the actual data inside it.

---

## 🧱 Common DDL Commands

| Command    | Description                                                               |
| ---------- | ------------------------------------------------------------------------- |
| `CREATE`   | Used to **create** database objects (table, database, view, etc.)         |
| `ALTER`    | Used to **modify** existing objects (add or remove columns, rename, etc.) |
| `DROP`     | Used to **delete** objects completely from the database                   |
| `TRUNCATE` | Used to **delete all data** from a table (but keep the structure)         |
| `RENAME`   | Used to **rename** a table or column (supported differently in some DBs)  |

---

## 🧠 1. `CREATE` – Create Objects

### 🧱 Example: Create a Table

```sql
CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

🟢 **Explanation:**

- `CREATE TABLE` defines a new table.
- Each column is defined with a **name** and **data type**.
- Constraints like `PRIMARY KEY`, `UNIQUE`, and `NOT NULL` control data rules.

---

## 🧠 2. `ALTER` – Modify Table Structure

### ➕ Add a Column

```sql
ALTER TABLE customers ADD COLUMN phone VARCHAR(15);
```

### ✏️ Rename a Column

```sql
ALTER TABLE customers RENAME COLUMN name TO customer_name;
```

### ❌ Drop a Column

```sql
ALTER TABLE customers DROP COLUMN email;
```

---

## 🧠 3. `DROP` – Delete Objects

```sql
DROP TABLE customers;
```

🟡 **Warning:**
This removes the **entire table and all its data permanently**.

---

## 🧠 4. `TRUNCATE` – Delete All Data, Keep Structure

```sql
TRUNCATE TABLE customers;
```

🟢 The table remains, but all rows are gone.
It’s faster than `DELETE FROM customers;`

---

## 🧠 5. `RENAME` – Rename a Table

```sql
ALTER TABLE customers RENAME TO clients;
```

---

## 🧩 Summary Table

| DDL Command  | Purpose                           | Example                                 |
| ------------ | --------------------------------- | --------------------------------------- |
| **CREATE**   | Creates a new table or object     | `CREATE TABLE users (...);`             |
| **ALTER**    | Modifies an existing structure    | `ALTER TABLE users ADD COLUMN age INT;` |
| **DROP**     | Deletes a table/object completely | `DROP TABLE users;`                     |
| **TRUNCATE** | Removes all data from a table     | `TRUNCATE TABLE users;`                 |
| **RENAME**   | Renames an existing table         | `ALTER TABLE users RENAME TO members;`  |

---

## ⚙️ DDL vs DML

| Type    | Meaning                    | Affects                | Example Commands               |
| ------- | -------------------------- | ---------------------- | ------------------------------ |
| **DDL** | Data Definition Language   | **Structure**          | CREATE, ALTER, DROP, TRUNCATE  |
| **DML** | Data Manipulation Language | **Data inside tables** | SELECT, INSERT, UPDATE, DELETE |

---

## 🧠 Example: Full Lifecycle

```sql
-- 1️⃣ Create table
CREATE TABLE employees (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50),
  role VARCHAR(50)
);

-- 2️⃣ Alter table
ALTER TABLE employees ADD COLUMN salary NUMERIC;

-- 3️⃣ Truncate table (delete all data)
TRUNCATE TABLE employees;

-- 4️⃣ Drop table (delete structure)
DROP TABLE employees;
```
