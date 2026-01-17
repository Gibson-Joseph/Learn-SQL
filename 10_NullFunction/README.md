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

### IS NULL | IS NOT NULL use case:

- Filtering the data.
- Finding the "unmatched rows" between two tables. (LEFT ANTI JOIN | RIGHT ANTI JOIN)

### NULL Vs Empty string Vs Blank space

- NULL (null) -> I don't know what the value is. It is unknown.
- EMPTY STRING ("")-> I know the value, it is nothing. So the empty string is a STRING value which has ZERO CHARACTERS. This is total different than the NULLs.
- BLANK SPACE (" ")-> The blank space is a string, but the size is not zero like empty string. We're going to have a size of how many spaces you have entered. We know the value, it is string. And the character of that is going to be space.

### Data Policy 1:

Replaceing empty string and blank space with NULL during data preparation before 'inserting' into a database to optimize storage and performance.

### Data Policy 2:

Replacing empty strings, blank space, Null with default value during data preparation before using it in 'reporting' to improve readiblity and resuce confusion.
