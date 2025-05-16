-- NOT NULL Constraint: -------------
-- The NOT NULL constraint is used to enforce that a column in a table must always contain a value; it cannot contain a NULL value. By default,
-- columns in SQL can hold NULL values, meaning they can have no data. However, for certain columns—such as IDs, names, or any required
-- fields—you may want to enforce the rule that no NULL values can be inserted.

-- This constraint is similar to a primary key constraint in that both prevent NULL values. However, they are different in their purpose and
-- application. A primary key uniquely identifies each record in a table, while the NOT NULL constraint simply ensures that a column cannot
-- have empty or undefined values.

-- Key Points:
-- NOT NULL is used to enforce mandatory fields.
-- It prevents NULL values from being inserted or updated.
-- It is applicable at the column level.
-- It can be used during table creation or modification (with the ALTER command).

-- Syntax:
-- CREATE TABLE table_Name(column1 data_type(size) NOT NULL, column2 data_type(size) NOT NULL, ....);

-- SQL NOT NULL on CREATE a Table:
CREATE TABLE Emp (
    EmpID INT NOT NULL PRIMARY KEY,
    Name VARCHAR(50),
    Country VARCHAR(50),
    Age int(2),
    Salary int(10)
);

-- SQL NOT NULL on ALTER  Table:
ALTER TABLE Emp modify Name Varchar(50) NOT NULL;

-- Advantages of Using the NOT NULL Constraint:
-- Prevents Data Gaps: With NOT NULL, you avoid incomplete or missing data, which is crucial for accurate data analysis.
-- Enforces Business Logic: Often, business rules require certain fields to be mandatory. For example, an employee record must have an employee
-- ID, name, and department.
-- Improves Data Integrity: By preventing null entries, you ensure that critical data is always present, improving overall database reliability.

-- PRIMARY KEY in SQL: -------------
-- PRIMARY KEY in SQL is a column (or group of columns) that uniquely identifies the records in that table. A primary key must contain unique
-- values and can not have any NULL value.

-- There can only be one primary key in a table, but that primary key can consist of one or more columns. When there are two or more columns in
-- the primary key it is called a composite key.

-- A primary key automatically has a UNIQUE constraint defined on it, and it ensures that there are no duplicate or NULL values in that column.

-- SQL PRIMARY KEY Properties:
-- No duplicate values are allowed, i.e. The column assigned as the primary key should have UNIQUE values only.
-- NO NULL values are present in the Primary key column. Hence there is a Mandatory value in the column having the Primary key.
-- Only one primary key per table exists although the Primary key may have multiple columns.
-- No new row can be inserted with the already existing primary key.
-- Primary keys can be classified into two categories Simple primary key that consists of one column and composite primary key that consists of
-- Multiple column.
-- Defined in CREATE TABLE or ALTER TABLE statement.

-- Syntax
-- 1. Using CREATE TABLE Statement.
-- 2. Using ALTER TABLE Statement.

-- SQL PRIMARY KEY with CREATE TABLE
-- CREATE TABLE table_name (
--  column1 datatype constraint,
--  column2 datatype constraint,
--  …,
--  CONSTRAINT pk_constraint_name PRIMARY KEY (column1, column2, …)
-- );

-- SQL PRIMARY KEY with ALTER TABLE:
-- ALTER TABLE table_name ADD CONSTRAINT constraint_name PRIMARY KEY (column1, column2, … column_n);

-- Examples:
CREATE TABLE Persons (
    PersonID int NOT NULL PRIMARY KEY,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int
);

-- Verify SQL Primary key creation:
INSERT INTO
    Persons
VALUES (1, "Thakur", "Aditya", 22),
    (1, "Kumar", "Shubham", 21);

-- Error: UNIQUE constraint failed: Persons.PersonID

-- Add PRIMARY KEY to a Table Example:
CREATE TABLE Persons (
    PersonID int,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int
);

-- This query will add primary key to ‘Persons’ table
ALTER TABLE Persons ADD CONSTRAINT PK_Person PRIMARY KEY (PersonID);

-- Important Points About SQL PRIMARY KEY:
-- A primary key is a column or a set of columns in a table that uniquely identifies each row.
-- It ensures data integrity by preventing duplicate records and null values.
-- A primary key can be defined on a single column (simple primary key) or multiple columns (composite primary key).
-- Creating a primary key automatically creates a unique index on the key column(s), improving query performance.
-- Establishing relationships between tables using SQL primary key and foreign key improve database design, reduce data redundancy, and improve
-- data consistency.

-- Benefits of Using Primary Keys:
-- Data Integrity: The primary key enforces data integrity by ensuring each record is unique.
-- Efficient Querying: Since a primary key automatically creates an index, querying for records by the primary key is faster.
-- Referential Integrity: Primary keys are used to establish relationships between tables (via foreign keys), ensuring consistency across
-- related data.

-- Common Issues and Best Practices:
-- Avoid NULL values: Always ensure that the columns involved in the primary key do not accept NULL values.
-- Choose meaningful primary keys: If possible, choose a primary key that naturally fits the data and serves as a meaningful identifier, like an
-- ID field.
-- Composite Keys: Be cautious when using composite keys. While they are useful in some scenarios, they can make queries more complex. If
-- possible, use a simple key or generate an artificial primary key (like an ID).
-- Changing Primary Keys: Once a primary key is established, changing it can be difficult because of the interdependencies with other tables
-- (foreign key constraints). Always plan ahead when designing your database schema.

-- FOREIGN KEY: -------------
-- A FOREIGN KEY is a column or set of columns in one table that references the primary key columns of another table. This creates a relationship
-- between the two tables, ensuring that the child table (which contains the foreign key) can only have values that exist in the parent table’s
-- primary key column(s).

-- The table containing the foreign key is called the foreign table (or child table), and the table that the foreign key references is called the
-- primary table (or parent table).

-- The primary purpose of a foreign key is to maintain referential integrity, ensuring that the relationship between tables is consistent and that
-- invalid data does not enter the system.

-- Syntax:
-- SQL FOREIGN KEY on CREATE TABLE:
-- CREATE TABLE table_name (
--   column1 datatype,
--   column2 datatype,
--   …,
--   CONSTRAINT fk_constraint_name FOREIGN KEY (column1, column2, …) REFERENCES parent_table(column1, column2, …)
-- );

-- SQL FOREIGN KEY on ALTER TABLE:
-- ALTER TABLE table_name ADD CONSTRAINT fk_constraint_name FOREIGN KEY (column1, column2, …)
-- REFERENCES parent_table(column1, column2, …);

-- Foreign Key Constraint Example:
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50) NOT NULL
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderNumber INT NOT NULL,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID)
);

INSERT INTO
    Customers (CustomerID, CustomerName)
VALUES (1, 'John'),
    (2, 'Jane'),
    (3, 'Bob');

INSERT INTO
    Orders (
        OrderID,
        OrderNumber,
        CustomerID
    )
VALUES (1, 101, 1),
    (2, 102, 2),
    (3, 103, 3);

-- A FOREIGN KEY is a field (or collection of fields) in one table, that refers to the PRIMARY KEY in another table.
-- The table containing the foreign key is called the child table, and the table containing the candidate key is called the referenced or
-- parent table.
-- A table can have multiple FOREIGN KEY constraints.
-- When defining a FOREIGN KEY constraint, you can specify what happens when a referenced row in the parent table is deleted or updated. This
-- is done using the ON DELETE and ON UPDATE clauses followed by the CASCADE, SET NULL, or NO ACTION option.
-- The FOREIGN KEY constraint in SQL is used to maintain the referential integrity of data within the database.

-- Composite Key: -------------
-- A composite key is a primary key that is made up of more than one column to uniquely identify records in a table. Unlike a single-column
-- primary key, a composite key combines two or more columns to ensure uniqueness. While any of the individual columns in a composite key
-- might not be unique on their own, together they form a unique combination that can uniquely identify each row in the table.

-- Key Points to Remember:
-- A composite key is formed from multiple columns.
-- It ensures uniqueness when the combined values of the columns are considered together.
-- None of the columns involved in a composite key can be NULL.
-- The composite key helps in tables where single columns cannot guarantee uniqueness, but a combination of columns can.

-- Creating a table with a composite key:
CREATE TABLE student (
    rollNumber INT,
    name VARCHAR(30),
    class VARCHAR(30),
    section VARCHAR(1),
    mobile VARCHAR(10),
    PRIMARY KEY (rollNumber, mobile)
);

-- When to Use a Composite Key:
-- A single column cannot uniquely identify a row, but a combination of columns can.
-- You need to enforce a relationship between two or more attributes.
-- You want to maintain data integrity by ensuring that the combination of columns remains unique.

-- UNIQUE Constraint: -------------
-- The SQL UNIQUE constraint ensures that all values in a column or a set of columns are different from one another. It can be applied to one or
-- more columns in a table. When applied, the database will reject any insert or update operation that would create a duplicate value in the
-- specified column(s).

-- The UNIQUE constraint allows NULL values, and multiple NULL values are allowed in a column with a UNIQUE constraint because NULL is considered
-- a distinct value in SQL. However, this behavior is different from the PRIMARY KEY constraint, where NULL values are not allowed, as a primary
-- key must uniquely identify each row and cannot have missing or undefined values.

-- Important Points:
-- Evaluates to true on an empty subquery.
-- Returns true only if there are unique tuples present as the output of the sub-query (two tuples are unique if the value of any attribute of
-- the two tuples differs).
-- Returns true if the sub-query has two duplicate rows with at least one attribute as NULL.

-- Syntax:
-- CREATE TABLE table_name (
--  column1 datatype UNIQUE,
--  column2 datatype,
--  …
-- );

-- Creating a Table with UNIQUE Constraints:
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Country VARCHAR(50)
);

-- Using UNIQUE with Multiple Columns:
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    OrderDate DATE,
    UNIQUE (CustomerID, ProductID)
);

-- Checking for Unique Values Using Subqueries:
SELECT CustomerID
FROM Orders
WHERE
    UNIQUE (
        SELECT OrderID
        FROM OrderDetails
        WHERE
            Orders.CustomerID = OrderDetails.CustomerID
    );

-- Important Points About SQL UNIQUE Constraint:
-- Prevents Duplicate Values: The UNIQUE constraint ensures that no two rows have the same value in the specified column(s).
-- Works with NULL Values: Unlike the PRIMARY KEY, the UNIQUE constraint allows multiple NULL values, as SQL treats NULL as a distinct value.
-- Can Be Applied to One or More Columns: The UNIQUE constraint can be applied to a single column or a combination of columns.
-- Does Not Automatically Create an Index: Although UNIQUE guarantees no duplicate values, it doesn’t automatically create an index (but most
-- databases create an index behind the scenes for performance reasons).
-- Can Be Applied Using ALTER TABLE: You can add or remove the UNIQUE constraint on an existing table using ALTER TABLE.

-- ALTERNATE KEY: -------------
-- Alternate Key is any candidate key not selected as the primary key. So, while a table may have multiple candidate keys (sets of columns that
-- could uniquely identify rows), only one of them is designated as the Primary Key. The rest of these candidate keys become Alternate Keys.

-- In other words, we can define the Alternate key as the set of Candidate Keys other than the Primary Key. There can be many Candidate Keys for a
-- given table, and out of all these, the Database Administrator selects only one as the Primary Key. Hence, the other Candidate Keys that are not
-- used as a Primary Key are the "Alternate Keys."

-- Some important points about Alternate Keys are as follows:
-- A Primary Key can't be an Alternate Key. For a table with a single Candidate Key which has to be the Primary Key will not contain any
-- Alternate Key.
-- A Foreign Key can't be an Alternate Key as it is only used to reference another table.
-- The alternate Key should be unique.
-- An Alternate Key can be a set of a single attribute or multiple attributes.
-- It can be NULL as well.

-- Differences Between Primary Key and Alternate Key:
-- Primary Key:
-- Must be unique.
-- Cannot contain NULL values.
-- Used to identify each row uniquely.
-- The selected candidate key.
-- One primary key per table.

-- Alternate Key:
-- Must be unique.
-- Can contain NULL values.
-- An alternate option for uniqueness.
-- Other candidate keys not selected as primary.
-- Multiple alternate keys possible.

-- CHECK Constraint: -------------
-- The CHECK constraint in SQL is used to limit the range or set of values that can be inserted into a column. It ensures that the data entered
-- into a column meets a certain condition or rule. The CHECK constraint can be applied to a column when the table is created or altered. If any
-- data being inserted or updated violates the CHECK condition, the database will return an error and the operation will be prevented.

-- Syntax:
-- CREATE TABLE table_name (
--     column1 datatype,
--     column2 datatype CHECK (condition),
--     ...
-- );

-- Key Points About the CHECK Constraint:
-- Domain Integrity: It ensures that the values in a column meet specified conditions, thus helping maintain valid data in the database.
-- Used with CREATE or ALTER: The CHECK constraint can be defined when creating a table or added to an existing table.
-- Can Be Combined with Other Constraints: You can use CHECK along with other constraints like PRIMARY KEY, FOREIGN KEY, and NOT NULL to define
-- more comprehensive rules for the table data.
-- Row-level Constraints: Unlike column-level constraints that affect individual columns, a CHECK constraint can apply to multiple columns at
-- once if needed.

-- Example 1: Applying CHECK on a Single Column:
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT CHECK (
        Age >= 18
        AND Age <= 120
    )
);

-- Valid insert
INSERT INTO
    Customers (CustomerID, Name, Age)
VALUES (1, 'John Doe', 25);

-- Invalid insert
INSERT INTO
    Customers (CustomerID, Name, Age)
VALUES (2, 'Jane Smith', 15);
-- This will fail due to the CHECK constraint

-- Example 2: CHECK Constraint with Multiple Columns
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Salary DECIMAL(10, 2),
    CHECK (
        Age >= 18
        AND Salary > 0
    )
);

-- Valid insert
INSERT INTO
    Employee (EmployeeID, Name, Age, Salary)
VALUES (1, 'Alice Johnson', 30, 50000);

-- Invalid insert (age < 18)
INSERT INTO
    Employee (EmployeeID, Name, Age, Salary)
VALUES (2, 'Bob Lee', 16, 45000);
-- This will fail due to the CHECK constraint

-- Adding a CHECK Constraint with ALTER TABLE:
ALTER TABLE Employee
ADD CONSTRAINT chk_salary CHECK (Salary >= 30000);

-- DEFAULT Constraint: -------------
-- The DEFAULT constraint in SQL is used to provide a default value for a column when no value is specified during an INSERT operation. If a
-- column has a DEFAULT constraint and no value is explicitly provided during the insertion of a record, the database will automatically insert
-- the default value defined for that column.

-- Syntax:
-- CREATE TABLE table_name (
--     column1 datatype DEFAULT default_value,
--     column2 datatype DEFAULT default_value,
--     ...
-- );

-- Key Points About the DEFAULT Constraint:
-- Automatic Value Insertion: The DEFAULT constraint ensures that if a value is not supplied during insertion, a pre-defined default value is used.
-- Simplifies Data Entry: It simplifies data entry when certain fields often have common or default values.
-- Optional in SQL: The DEFAULT constraint is optional. Not all columns require a default value.
-- Can Be Applied to Any Data Type: It can be applied to any data type, including numbers, dates, and strings.
-- Not Applicable to NULL: You cannot use the DEFAULT constraint to assign NULL as a default value. For null values, you can either omit the
-- value or explicitly specify NULL.

-- Using the DEFAULT Constraint during Table Creation:
CREATE TABLE Geeks (
    ID INT NOT NULL,
    Name VARCHAR(255),
    Age INT,
    Location VARCHAR(255) DEFAULT 'Noida'
);

-- Explicit value
INSERT INTO
    Geeks (ID, Name, Age, Location)
VALUES (4, 'Mira', 23, 'Delhi');

-- Using the DEFAULT constraint
INSERT INTO Geeks (ID, Name, Age, Location) VALUES (5, 'Hema', 27);

-- Explicit value again
INSERT INTO
    Geeks (ID, Name, Age, Location)
VALUES (6, 'Neha', 25, 'Delhi');

-- Using DEFAULT constraint again
INSERT INTO
    Geeks (ID, Name, Age, Location)
VALUES (7, 'Khushi', 26, DEFAULT);

-- Dropping the DEFAULT Constraint:
-- ALTER TABLE tablename ALTER COLUMN columnname DROP DEFAULT;

ALTER TABLE Geeks ALTER COLUMN Location DROP DEFAULT;