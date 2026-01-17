# NULL Functions

## What is NULL?

NULL means nothing, unknown!
NULL is not equal to anything!

    - NULL is snot zero
    - NULL is not empty string
    - NULL is not blank space

And NULL is simply nothing.
It tells us there is no value and it is missing.

## NULL functions:

### To manipulate value:

- ISNULL -->> SQL server specific. Not available in Postgres
- COALESCE
- NULLIF

They are really helpful in order to manipulate the data inside our databases.

### To check values:

- IS NULL
- IS NOT NULL

So in the output we are getting a boolean true or false.

---

### ISNULL | COALESCE use case:

- Handle the NULL before doing data aggregations.
- Handle the NULLS before doing Mathematical Operations.
- Handle the NULL before joining the tables. (little bit advance use case)
- Hanlde the NULL before sorting data. -> Postgres will automatically handle this.

### NULLIF use case:

- Preveinting the error of "dividing by zero".
