-- CRUD Operations: ------------

-- SELECT Statement: ----------
-- The SELECT statement in SQL is used to fetch or retrieve data from a database. It allows users to access the data and retrieve specific
-- data based on specific conditions. We can fetch either the entire table or according to some specified rules. The data returned is stored
-- in a result table. With the SELECT clause of a SELECT command statement, we specify the columns that we want to be displayed in the
-- query result.

-- Syntax: SELECT column1,column2…. FROM table_name;

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    LastName VARCHAR(50),
    Country VARCHAR(50),
    Age int(2),
    Phone varchar(10)
);

-- Insert some sample data into the Customers table
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
        '7648593456'
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

-- Select All Columns:
SELECT * FROM Customer;

-- Select Specific Columns:
SELECT CustomerName, LastName FROM Customer;

-- SELECT Statement with WHERE Clause:
SELECT CustomerName FROM Customer where Age = '21';

-- SELECT with GROUP BY Clause:
SELECT COUNT(item), Customer_id FROM Orders GROUP BY order_id;

-- INSERT INTO Statement: ------------
-- The SQL INSERT INTO statement is used to add new rows of data to a table in a database. It’s one of the core commands in SQL and is commonly
-- used to populate tables with data. There are two main ways to use the INSERT INTO statement by specifying the columns and values explicitly
-- or by inserting values for all columns without specifying them.

-- 1. Inserting Data into All Columns (Simple Method):
-- INSERT INTO table_name VALUES(value1, value2, value);

CREATE DATABASE StudentDB;

USE StudentDB;

CREATE TABLE Student (
    ROLL_NO INT PRIMARY KEY,
    NAME VARCHAR(50),
    ADDRESS VARCHAR(100),
    PHONE VARCHAR(15),
    AGE INT
);

INSERT INTO
    Student (
        ROLL_NO,
        NAME,
        ADDRESS,
        PHONE,
        AGE
    )
VALUES (
        1,
        'Ram',
        'Delhi',
        'XXXXXXXXXX',
        18
    ),
    (
        2,
        'Ramesh',
        'Gurgaon',
        'XXXXXXXXXX',
        18
    ),
    (
        3,
        'Sujit',
        'Rohtak',
        'XXXXXXXXXX',
        20
    ),
    (
        4,
        'Suresh',
        'Rohtak',
        'XXXXXXXXXX',
        18
    );

INSERT INTO
    Student
VALUES (
        '5',
        'HARSH',
        'WEST BENGAL',
        'XXXXXXXXXX',
        '19'
    );

-- 2. Inserting Data into Specific Columns (Flexible Method):
-- INSERT INTO table_name(column1, column2, column3) VALUES( value1, value2, value);

INSERT INTO Student (ROLL_NO, NAME, Age) VALUES ('5', "PRATIK", 19);

-- Important Points About SQL INSERT INTO Statement:
-- Multiple Inserts: You can insert multiple rows at once by separating each set of values with commas. This reduces the number of queries you
-- need to run.
-- NULL Values: If you don’t insert data into a column, it will typically be set to NULL unless the column has a default value.
-- Order of Columns: When using the simple INSERT INTO syntax without specifying column names, the values must be in the exact same order as the
-- columns are defined in the table.
-- Default Values: Columns not mentioned in the INSERT INTO statement will be filled with their default values (often NULL).
-- Efficiency: Inserting multiple rows at once is much more efficient than doing it one by one.

-- Inserting Data Using Transactions:
BEGIN TRANSACTION;

INSERT INTO
    Customers (
        CustomerID,
        CustomerName,
        ContactName,
        Country
    )
VALUES (
        5,
        'Sarah White',
        'John White',
        'Canada'
    );

INSERT INTO
    Customers (
        CustomerID,
        CustomerName,
        ContactName,
        Country
    )
VALUES (
        6,
        'Mohamed Ibrahim',
        'Ahmed Ibrahim',
        'UAE'
    );

-- If any error occurs, the transaction will be rolled back

COMMIT;

-- UPDATE Statement: ----------
-- The UPDATE statement in SQL is used to modify the data of an existing record in a database table. We can update single or multiple columns in
-- a single query using the UPDATE statement as per our requirement. Whether you need to correct data, change values based on certain conditions,
-- or update multiple fields simultaneously, the UPDATE statement provides a simple yet effective way to perform these operations.

-- key points about UPDATE statement:
-- Modify Specific Data: The UPDATE statement can be used to change specific data in one or more columns for rows that meet a certain condition.
-- Target Specific Rows: You can control which rows to update by using the WHERE clause. If you omit the WHERE clause, all rows in the table will
-- be updated, so it’s important to use this clause carefully to avoid unintended changes.
-- Single or Multiple Columns: The UPDATE statement allows you to modify one or more columns at a time. This makes it versatile when you need to
-- update multiple pieces of information for the same record.
-- Efficiency: Using UPDATE is more efficient than deleting and re-inserting data because it directly modifies the existing record without
-- affecting other rows in the table.
-- Data Integrity: The UPDATE statement helps maintain data integrity by allowing you to fix errors or modify data without needing to remove and
-- re-add records, ensuring that related data remains consistent.

-- Syntax: UPDATE table_name SET column1 = value1, column2 = value2,… WHERE condition;

-- Note: In the above query the SET statement is used to set new values to the particular column and the WHERE clause is used to select the rows
-- for which the columns are needed to be updated. If we have not used the WHERE clause then the columns in all the rows will be updated. So the
-- WHERE clause is used to choose the particular rows.

-- Update Single Column Using UPDATE Statement:
UPDATE Customer SET CustomerName = 'Nitin' WHERE Age = 22;

-- Updating Multiple Columns using UPDATE Statement:
UPDATE Customer
SET
    CustomerName = 'Satyam',
    Country = 'USA'
WHERE
    CustomerID = 1;

-- Omitting WHERE Clause in UPDATE Statement:
UPDATE Customer SET CustomerName = 'Shubham';

-- Optimizing Your SQL UPDATE Queries:
-- Avoid frequent updates: Constantly updating rows can slow down performance. Batch updates or consider using a database trigger to handle
-- automatic updates.
-- Index relevant columns: Ensure that columns in the WHERE clause (such as CustomerID) are indexed. This will improve the speed of the update
-- operation.

-- Important Points About SQL UPDATE Statement:
-- 1. Always use the WHERE clause: The most important point when using the UPDATE statement is to always include a WHERE clause unless you
-- genuinely intend to update all rows.
-- 2. Check your data before updating: Run a SELECT query to view the data you want to update before executing the UPDATE statement. This helps
-- avoid accidental data modifications.
SELECT * FROM Customer WHERE Age = 22;

-- 3. Use transactions for critical updates: When performing updates in a production environment, consider using transactions. Transactions
-- allow you to commit or roll back changes as needed.
BEGIN TRANSACTION;

UPDATE Customer SET CustomerName = 'John' WHERE CustomerID = 3;

COMMIT;
-- Use ROLLBACK to undo if necessary

-- 4. Test on a small dataset first: If you’re uncertain about the impact of your UPDATE, test it on a small subset of data to ensure the
-- changes are as expected.

-- DELETE Statement: -------------
-- The SQL DELETE statement removes one or more rows from a database table based on a condition specified in the WHERE clause. It’s a DML
-- (Data Manipulation Language) operation that modifies the data within the table without altering its structure.

-- Syntax: DELETE FROM table_name WHERE some_condition;

-- Deleting Single Record:
DELETE FROM GFG_Employees WHERE NAME = 'Rithvik';

-- Deleting Multiple Records:
DELETE FROM GFG_Employees WHERE department = 'Development';

-- Delete All Records from a Table:
DELETE FROM GFG_Employees;
-- Or
DELETE * FROM GFG_Employees;

-- Rolling Back DELETE Operations: Since the DELETE statement is a DML operation, it can be rolled back when executed in a statement. If you
-- accidentally delete records or need to repeat the process, you can use the ROLLBACK command.

START TRANSACTION;

DELETE FROM GFG_Employees WHERE department = 'Development';
-- If needed, you can rollback the deletion
ROLLBACK;

-- Best Practices for Using SQL DELETE:
-- Use Transactions: Wrap DELETE statements in transactions to provide an option to roll back changes if necessary. This ensures data integrity.
-- Always Use a WHERE Clause: Avoid deleting all rows by accident. Always filter records using a WHERE clause to specify which rows to delete.
-- Omitting the WHERE clause will delete all records.
-- Backup Data: Before performing large deletions, ensure that you have a backup of the data to avoid irreversible loss.
-- Test on Development Server: Always test your DELETE queries on a development or staging environment to ensure they produce the desired
-- result before executing them on a live database.
-- Optimize Deletions: For large datasets, delete records in batches to reduce performance impact and avoid long-running queries.
-- Use Caution When Deleting Data: Be extra cautious when deleting records from sensitive or production databases. Always verify the condition
-- in the WHERE clause to ensure you’re deleting the right data.

-- Delete Duplicate Rows: ---------------
-- What Are Duplicate Rows: Duplicate rows are records in a database that have identical values in one or more columns. These rows often arise
-- due to issues like multiple imports, user errors, or missing constraints like primary keys or unique indexes. SQL query to delete duplicate
-- rows typically involves identifying duplicates using functions like ROW_NUMBER() or COUNT() and making sure that only one copy of each
-- record is kept in the table. If not handled properly, duplicates can lead to:

-- Inaccurate Data Reporting: Reports may contain false information.
-- Storage Waste: Redundant records consume unnecessary space.
-- Decreased Query Performance: Queries on large tables with duplicates may perform poorly.

-- Why You Should Remove Duplicate Rows:
-- Data Integrity: Duplicates can distort reports and analyses, leading to incorrect insights.
-- Optimal Performance: Redundant data can slow down queries, especially when dealing with large datasets.
-- Efficient Storage: Removing duplicates helps optimize storage usage, keeping your database lean.

CREATE TABLE DETAILS (
    SN INT IDENTITY (1, 1) PRIMARY KEY,
    EMPNAME VARCHAR(25) NOT NULL,
    DEPT VARCHAR(20) NOT NULL,
    CONTACTNO BIGINT NOT NULL,
    CITY VARCHAR(15) NOT NULL
);

INSERT INTO
    DETAILS (
        EMPNAME,
        DEPT,
        CONTACTNO,
        CITY
    )
VALUES (
        'VISHAL',
        'SALES',
        9193458625,
        'GAZIABAD'
    ),
    (
        'VIPIN',
        'MANAGER',
        7352158944,
        'BAREILLY'
    ),
    (
        'ROHIT',
        'IT',
        7830246946,
        'KANPUR'
    ),
    (
        'RAHUL',
        'MARKETING',
        9635688441,
        'MEERUT'
    ),
    (
        'SANJAY',
        'SALES',
        9149335694,
        'MORADABAD'
    ),
    (
        'VIPIN',
        'MANAGER',
        7352158944,
        'BAREILLY'
    ),
    (
        'VISHAL',
        'SALES',
        9193458625,
        'GAZIABAD'
    ),
    (
        'AMAN',
        'IT',
        78359941265,
        'RAMPUR'
    );

-- How to Identify Duplicate Rows:
SELECT EMPNAME, DEPT, CONTACTNO, CITY, COUNT(*)
FROM DETAILS
GROUP BY
    EMPNAME,
    DEPT,
    CONTACTNO,
    CITY
HAVING
    COUNT(*) > 1;

-- Best Practices to Prevent Duplicates: While identifying and removing duplicates is essential, preventing them is even better. Here are some
-- best practices to ensure that duplicates don’t enter your database in the first place:
-- Use Primary Keys or Unique Constraints: These ensure that each record is unique, preventing accidental duplication.
-- Data Validation: Implement validation rules in your application to prevent duplicate entries.
-- Indexing: Create unique indexes on columns that must remain unique, like contact numbers or email addresses.
-- Regular Data Cleaning: Periodically run data-cleaning queries to identify and remove any newly inserted duplicates.