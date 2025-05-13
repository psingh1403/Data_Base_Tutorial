-- CREATE TABLE Statement: The CREATE TABLE command in SQL is used to define a new table within a database. A table’s structure, including
-- column names, data types, and constraints like NOT NULL, PRIMARY KEY, and CHECK, are defined when it is created in SQL. Whether we are creating
-- tables for storing customer information, product catalogs, or employee records, the CREATE TABLE statement is our starting point. The CREATE
-- TABLE command is a crucial tool for database administration because of these limitations, which help in ensuring data integrity.

-- Syntax:
-- CREATE table table_name
-- (
-- Column1 datatype (size),
-- column2 datatype (size),
-- .
-- .
-- columnN datatype(size)
-- );

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    LastName VARCHAR(50),
    Country VARCHAR(50),
    Age INT CHECK (
        Age >= 0
        AND Age <= 99
    ),
    Phone int(10)
);

-- Inserting Data into the Newly Created Table:

INSERT INTO
    Customer (
        CustomerID,
        CustomerName,
        LastName,
        Country,
        Age,
        Phone
    )
VALUES (
        1,
        'Shubham',
        'Thakur',
        'India',
        '23',
        'xxxxxxxxxx'
    ),
    (
        2,
        'Aman ',
        'Chopra',
        'Australia',
        '21',
        'xxxxxxxxxx'
    ),
    (
        3,
        'Naveen',
        'Tulasi',
        'Sri lanka',
        '24',
        'xxxxxxxxxx'
    ),
    (
        4,
        'Aditya',
        'Arpan',
        'Austria',
        '21',
        'xxxxxxxxxx'
    ),
    (
        5,
        'Nishant. Salchichas S.A.',
        'Jain',
        'Spain',
        '22',
        'xxxxxxxxxx'
    );

-- Create Table From Another Table:
CREATE TABLE SubTable AS
SELECT CustomerID, CustomerName
FROM customer;

-- Important Points About SQL CREATE TABLE Statement:
-- 1. Adding Constraints: The CREATE TABLE statement can also define constraints like NOT NULL, UNIQUE, and DEFAULT. Example: Age INT NOT NULL
-- 2. Handling Table Existence: If you attempt to create a table that already exists, SQL will throw an error. To avoid this, you can use the IF
-- NOT EXISTS clause.
-- CREATE TABLE IF NOT EXISTS Customer (...);

-- 3. Data Types and Sizes: Always define appropriate data types for each column (e.g., VARCHAR(50) for names and INT for IDs) to optimize
-- performance and storage.
-- 4. Viewing Table Structure: After creating a table, use the following command to view the structure of your table:
-- DESC table_name;

-- 5. Modifying Table Structure: If you need to change the table’s structure after creation (e.g., renaming a column, adding a new column), use
-- the ALTER TABLE statement.

-- DROP TABLE: -------------
DROP TABLE categories;

-- Important Points About SQL DROP TABLE:
-- 1. The SQL DROP TABLE statement is used to delete tables in a database, along with all associated data, indexes, triggers, constraints and
-- permission specifications.
-- 2. The table will be permanently disable, so use this query with caution.
-- 3. Use DROP TABLE IF EXISTS query to prevent errors when dropping a table that does not exist. This command ensures that the drop operation
-- only occurs if the table exists in the database.

-- DROP TABLE IF EXISTS categories;

-- 5. The DROP TABLE statement can be used to drop temporary tables by including the TEMPORARY keyword.
DROP TEMPORARY TABLE temp_table_name;

6. To verify if a table is dropped, you can use the SHOW TABLES (MySQL) or SELECT * FROM INFORMATION_SCHEMA.TABLES (SQL Server, PostgreSQL) commands.

SHOW TABLES;

SELECT * FROM INFORMATION_SCHEMA.TABLES;

-- RENAME TABLE: -------------
-- Syntex: RENAME TABLE old_table_name TO new_table_name;

RENAME TABLE Customers TO Clients;

-- Renaming a Table in SQL Server:
-- Syntax: EXEC sp_rename 'old_table_name', 'new_table_name';

EXEC sp_rename 'maths', 'Workers';

-- DROP and TRUNCATE in SQL: ------------

-- Syntax: DROP object object_name;

-- 1. DROP Table: To delete an entire table, including its data and structure:
-- Syntax: DROP TABLE table_name;

-- 2. DROP database: To delete an entire database and all of its associated tables:
-- Syntax: DROP DATABASE database_name;

-- What is SQL TRUNCATE Command?
-- The TRUNCATE command is a Data Definition Language(DDL) action that removes all rows from a table but preserves the structure of the table
-- for future use. Although TRUNCATE is similar to the DELETE command (without the WHERE clause), it is much faster because it bypasses
-- certain integrity constraints and locks. It was officially introduced in the SQL:2008 standard.

TRUNCATE TABLE table_name;

-- Key Differences Between DROP and TRUNCATE:
-- DROP:
-- Completely removes both the data and the table structure.
-- Deletes both data and table definition.
-- Non-recoverable; once dropped, the table cannot be restored (unless you have backups).
-- Does not activate triggers associated with the table.
-- Slower due to data and structural removal.
-- Used when you want to completely remove a table or database.

-- TRUNCATE:
-- Removes all rows but preserves the table structure.
-- Deletes only the data, not the table structure.
-- Can be rolled back if used in a transaction (if supported by the DBMS).
-- Does not activate DELETE triggers.
-- Faster, especially for large datasets.
-- Used to quickly remove all rows from a table but keep the structure for future use.

-- SQL Cloning or Copying a Table: ------------
-- SQL Cloning is an operation that means making a copy of a table. It's like taking a photocopy of a document. This copy can include both the
-- table’s structure (column names, data types, constraints) and optionally its data. The clone table is independent of the original and can be
-- used for testing, backups, or analysis without affecting the original table.

-- Cloning a table in SQL means making a duplicate copy of an existing table. It's like making a backup so that we can experiment or work with
-- the data without affecting the original table. This saves our the time and effort of creating a completely new table and re-entering all
-- the same data. Cloning can be done with or without data:
-- With Data: The clone table includes the structure and rows of the original table.
-- Without Data: Only the structure of the original table is copied.

-- Real-Life Scenario Example: Imagine we are developing a library management system. If we want to test new features without risking changes to
-- the production table, we can create a clone of the original table for safe experimentation.

-- Methods for Cloning Tables in SQL: There are three different methods to create a clone table in SQL:
-- 1. Simple Cloning.
-- 2. Deep Cloning.
-- 3. Shallow Cloning.

-- Step 1: Create the Original Table:
CREATE TABLE STUDENT (
    student_id int NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    roll_no varchar(255) NOT NULL UNIQUE,
    PRIMARY KEY (student_id)
);

INSERT INTO
    STUDENT (student_id, name, roll_no)
VALUES (1, 'Ritwik Dalmia', 'S100'),
    (2, 'Rohan Singh', 'S200'),
    (3, 'Mohan Singh', 'S300');

SELECT * from STUDENT;

-- 1. Simple Cloning: The clone table creates a copy of the original table’s structure and data, but constraints like primary keys, unique keys,
-- and auto-increment properties are not preserved.

-- Syntax: CREATE TABLE clone_table SELECT * FROM original_table;

-- Example:
CREATE TABLE STUDENT_COPY SELECT * FROM STUDENT;

SELECT * FROM STUDENT_COPY;

-- Drawback Of Simple Cloning: Simple cloning in SQL lacks preservation of unique constraints and auto-increment properties, potentially
-- leading to data integrity issues. Mitigation involves manually reapplying constraints and resetting auto-increment settings. Consider
-- alternative cloning methods for better results.

-- 2. Shallow Cloning: Shallow cloning is the method in which the clone table gets the same structure as the original table but it does not
-- inherits or copy the data from the original table. In other words, we will have the empty table including indices such as primary key,
-- unique key, and auto_increment. It also preserves constraints like primary keys and unique keys.

-- Syntax: CREATE TABLE clone_table  LIKE original_table;

-- Example:
CREATE TABLE STUDENT_SHALLOW_CLONE LIKE STUDENT;

SELECT * FROM STUDENT_SHALLOW_CLONE;

INSERT INTO
    STUDENT_SHALLOW_CLONE (name, roll_no)
VALUES ('Ritwik Dalmia', 'S100'),
    ('Rohan Singh', 'S200'),
    ('Mohan Singh', 'S300');

-- 3. Deep Cloning: This method is widely used for creating the clone tables in SQL as it inherits all the properties of original table 
-- including indices such as primary key, unique, and auto_increment as well as inherits the existing data from the original table.

-- Syntax: CREATE TABLE clone_table LIKE original_table;
-- INSERT INTO clone_table SELECT * FROM original_table;

-- Example:
CREATE TABLE STUDENT_DEEP_CLONE LIKE STUDENT;
INSERT INTO STUDENT_DEEP_CLONE SELECT * FROM STUDENT;
SELECT * FROM STUDENT_DEEP_CLONE;

-- The output of the "STUDENT_DEEP_CLONE" is exactly the same as the "STUDENT" table. We can add new entries to the deep clone table to confirm 
-- the preservation of constraints:

INSERT INTO STUDENT_DEEP_CLONE (name,roll_no) VALUES ('mohini roy', 'S400'), ('surbhi roy', 'S500');
SELECT * FROM STUDENT_DEEP_CLONE;

-- What Are Temporary Tables in SQL: -----------
-- A temporary table in SQL is a special type of table that is created and stored in the system’s temporary database (such as TempDB in SQL 
-- Server). This table is primarily used to store and generate important mediation results when executing a query, stored procedure, or session.

-- Temporary tables are automatically deleted when the session or transaction that created them ends, making them perfect for temporary or 
-- intermediate data storage. They are particularly useful in situations where you need to perform calculations or data transformations without 
-- changing the permanent database structure.

-- Syntax:
CREATE TABLE #EmpDetails (id INT, name VARCHAR(25));

INSERT INTO #EmpDetails VALUES (01, 'Lalit'), (02, 'Atharva');

SELECT * FROM #EmpDetails;

-- Types of Temporary Tables in SQL: There are 2 types of Temporary Tables: Local Temporary Table, and Global Temporary Table.

-- Local Temporary Table: A Local Temp Table is available only for the session that has created it. It is automatically dropped (deleted) when 
-- the connection that has created it, is closed. To create Local Temporary Table Single “#” is used as the prefix of a table name. Also, the 
-- user can drop this temporary table by using the “DROP TABLE #EmpDetails” query. There will be Random Numbers are appended to the Name of 
-- Table Name. If the Temporary Table is created inside the stored procedure, it get dropped automatically upon the completion of stored 
-- procedure execution.

-- Example:
CREATE PROCEDURE ProcTemp 
AS
BEGIN
CREATE TABLE #EmpDetails
INSERT INTO #EmpDetails VALUES ( 01, 'Lalit'), ( 02, 'Atharva')
SELECT * FROM #EmpDetails
END
EXECUTE ProcTemp;

-- Global Temporary Table: To create a Global Temporary Table, add the “##” symbol before the table name.

-- Example:
CREATE TABLE ##EmpDetails (id INT, name VARCHAR(25));

-- Global Temporary Tables are visible to all connections and Dropped when the last connection referencing the table is closed. Global Table 
-- Name must have an Unique Table Name. There will be no random Numbers suffixed at the end of the Table Name.

-- Differences Between Local and Global Temporary Tables: 
-- Local Temporary Table:
-- # (Single hash).
-- Only the session that created it.
-- Automatically dropped when the session ends.
-- Only the creating session can access it.
-- Session-specific data storage.

-- Global Temporary Table:
-- ## (Double hash)
-- Available to all sessions.
-- Dropped when the last connection referencing the table ends.
-- All sessions can access it.
-- Shared temporary data storage for multiple sessions

-- SQL ALTER TABLE: ------------
-- The ALTER TABLE statement in SQL is used to modify an existing table structure in a database without losing any data. It allows you to add, 
-- remove, or modify columns, change data types, or apply constraints to improve data integrity and ensure that the table meets evolving business 
-- requirements. It allows for structural changes like adding new columns, modifying existing ones, deleting columns, and renaming columns 
-- within a table. To alter/modify the table use the ALTER TABLE syntax:

-- Syntax:
-- ALTER TABLE table_name [ADD | DROP | MODIFY] column_name datatype;

-- Common Use Cases for SQL ALTER TABLE:
-- 1. ADD: To add a new column to the table: 
-- Syntex: ALTER TABLE table_name ADD column_name datatype;

ALTER TABLE student ADD Email varchar(255);
ALTER TABLE Student ADD (AGE int,COURSE varchar(40));

-- 2. MODIFY/ALTER: To change the data type of an existing column:
-- Syntex: ALTER TABLE table_name MODIFY COLUMN column_name datatype;

ALTER TABLE Student MODIFY COURSE varchar(20);

-- 3. DROP: To delete an existing column from the table:
-- Syntex: ALTER TABLE table_name DROP COLUMN column_name;

ALTER TABLE student DROP COLUMN Email;

-- 4. RENAME COLUMN: To rename an existing column: 
-- Syntex: ALTER TABLE table_name RENAME COLUMN old_name TO new_name;

-- 5. RENAME TO – To rename the table itself:
-- Syntex: ALTER TABLE table_name RENAME TO new_table_name;
