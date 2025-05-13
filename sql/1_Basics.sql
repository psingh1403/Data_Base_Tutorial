-- SQL is a Structured query language used to access and manipulate data in databases. SQL stands for Structured Query Language. We can
-- create, update, delete, and retrieve data in databases like MySQL, Oracle, PostgreSQL, etc. Overall, SQL is a query language that
-- communicates with databases.

-- What is SQL: Data is at the core of every application, and SQL (Structured Query Language) manages and interacts with this data. Whether
-- we’re handling a small user database or analyzing terabytes of sales records, SQL allows efficient querying, updating, and management of
-- relational databases.

-- When data needs to be retrieved from a database, SQL is used to construct and send the request. The Database Management System (DBMS)
-- processes the SQL query, retrieves the requested data, and returns it to the user or application. Instead of specifying step-by-step
-- procedures, SQL statements describe what data should be retrieved, organized, or modified, allowing the DBMS to handle how the operations
-- are executed efficiently.

-- Components of a SQL System:
-- Databases: Databases are structured collections of data organized into tables, rows, and columns. Databases serve as repositories for storing
-- information efficiently and provide a way to manage and access data.
-- Tables: Tables are the fundamental building blocks of a database, consisting of rows (records) and columns (attributes or fields). Tables
-- ensure data integrity and consistency by defining the structure and relationships of the stored information.
-- Queries: Queries are SQL commands used to interact with databases. They enable users to retrieve, update, insert, or delete data from tables,
-- allowing for efficient data manipulation and retrieval.
-- Constraints: Constraints are rules applied to tables to maintain data integrity. Constraints define conditions that data must meet to be
-- stored in the database, ensuring accuracy and consistency.
-- Stored Procedures: Stored procedures are pre-compiled SQL statements stored in the database. Stored procedures can accept parameters, execute
-- complex operations, and return results, enhancing efficiency, reusability, and security in database management.
-- Transactions: Transactions are groups of SQL statements that are executed as a single unit of work. Transactions ensure data consistency and
-- integrity by allowing for the rollback of changes if any part of the transaction fails.

-- Some other important components include:
-- Data Types
-- Indexes
-- Views
-- Security and Permissions
-- Joins

-- SQL Injection is a cyberattack where malicious SQL queries are injected into input fields to manipulate a database, enabling unauthorized
-- access, data modification, or corruption. Using parameterized queries and input validation helps prevent such attacks.

-- What are the Characteristics of SQL:
-- User-Friendly and Accessible: SQL is designed for a broad range of users, including those with minimal programming experience, making it
-- approachable for non-technical individuals.
-- Declarative Language: As a non-procedural language, SQL allows users to specify what data is needed rather than how to retrieve it, focusing on
-- the desired results rather than the retrieval process.
-- Efficient Database Management: SQL enables the creation, modification, and management of databases efficiently, saving time and simplifying
-- complex database operations.
-- Standardized Language: Based on ANSI (American National Standards Institute) and ISO (International Organization for Standardization) standards,
-- SQL ensures consistency and stability across various database management systems (DBMS).
-- Command Structure: SQL does not require a continuation character for multi-line queries, allowing flexibility in writing commands across one or
-- multiple lines.
-- Execution Mechanism: Queries are executed using a termination character (e.g., a semicolon ;), enabling immediate and accurate command processing.
-- Built-in Functionality: SQL includes a rich set of built-in functions for data manipulation, aggregation, and formatting, empowering users to
-- handle diverse data-processing needs effectively.

-- How SQL Works: Structured Query Language (SQL) operates on a server machine, where it processes database queries and returns results
-- efficiently. Below are the key software components involved in the SQL execution process.

-- Input: The process begins when a user submits an SQL query through a database interface or application. This query typically specifies the
-- desired operation, such as data retrieval, insertion, updating, or deletion.
-- Parsing: The query is passed to the query processor, which breaks it into smaller units called tokens. These tokens represent keywords,
-- table names, column names, and other elements of the query. The processor then validates the syntax against SQL standards and the database
-- schema to ensure the query is well-formed and executable.
-- Optimization: After parsing, the query is handed to the optimizer, which evaluates multiple ways to execute the query. The optimizer
-- considers factors like indexes, table statistics, and available resources to generate the most efficient execution plan. This step ensures
-- that the query runs with minimal resource consumption and maximum performance.
-- Execution: The execution engine follows the plan provided by the optimizer. It interacts with the storage engine, which retrieves, manipulates,
-- or updates the required data from the database tables. During this step, SQL statements like SELECT, INSERT, UPDATE, or DELETE are translated
-- into actions performed on the underlying data.
-- Output: Once the execution engine processes the query, the result is formatted and returned to the user. Depending on the query type, the
-- output could be a result set (for SELECT queries) or an acknowledgment of the operation (for INSERT, UPDATE, or DELETE queries).

-- Rules for Writing SQL Queries:
-- Statement Termination: Every SQL statement ends with a semicolon (;), signaling the DBMS to execute the command.
-- Case Insensitivity: SQL keywords (e.g., SELECT, INSERT) are case-insensitive, but database names and column names may be case-sensitive
-- depending on the DBMS.
-- Whitespace Flexibility: SQL statements can span multiple lines, but keywords and identifiers must be separated by at least one space.
-- Unique Identifiers: Reserved words (e.g., SELECT, FROM) cannot be used as table or column names unless enclosed in double quotes (“) or
-- backticks (`), depending on the DBMS.
-- Comments: Comments enhance readability:
-- Single-line comments: —
-- Multi-line comments: /* … */
-- Data Integrity: Constraints like NOT NULL, UNIQUE, and PRIMARY KEY must be defined correctly to maintain data consistency.
-- String Literals: String values must be enclosed in single quotes (‘).
-- Valid Identifiers: Table and column names must:
-- Begin with an alphabetic character.
-- Contain up to 30 characters.
-- Avoid special characters except underscores (_).

-- What are SQL Commands?
-- Structured Query Language (SQL) commands are standardized instructions used by developers to interact with data stored in relational
-- databases. These commands allow for the creation, manipulation, retrieval, and control of data, as well as database structures. SQL commands
-- are categorized based on their specific functionalities:

-- 1. Data Definition Language: These commands are used to define the structure of database objects by creating, altering, and dropping the
-- database objects. Based on the needs of the business, database engineers create and modify database objects using DDL. The CREATE command,
-- for instance, is used by the database engineer to create database objects like tables, views, and indexes.

-- CREATE: Creates a new table, a view on a table, or some other object in the database.
-- ALTER: Modifies an existing database object, such as a table.
-- DROP: Deletes an entire table, a view of a table, or other objects in the database.

-- 2. Data Manipulation Language: A relational database can be updated with new data using data manipulation language (DML) statements. The INSERT
-- command, for instance, is used by an application to add a new record to the database.

-- INSERT: Creates a record.
-- UPDATE: Modifies records.
-- DELETE: Deletes records.

-- 3. Data Query Language: Data retrieval instructions are written in the data query language (DQL), which is used to access relational
-- databases. The SELECT command is used by software programs to filter and return particular results from a SQL table.

-- 4. Data Control language: DCL commands manage user access to the database by granting or revoking permissions. Database administrators use DCL
-- to enforce security and control access to database objects.

-- GRANT: Gives a privilege to the user.
-- REVOKE: Takes back privileges granted by the user.

-- 5. Transaction Control Language: TCL commands manage transactions in relational databases, ensuring data integrity and consistency. These
-- commands are used to commit changes or roll back operations in case of errors.

-- COMMIT: Saves all changes made during the current transaction on a permanent basis. Some databases provide an auto-commit feature, which
-- can be configured using settings.
-- ROLLBACK: Reverts changes made during the current transaction, ensuring no unwanted changes are saved.
-- SAVEPOINT: Sets a point within a transaction to which changes can be rolled back, allowing partial rollbacks

-- Benefits of SQL:
-- Efficiency: SQL is designed to handle complex queries and large datasets with optimal performance, making data retrieval and manipulation
-- seamless.
-- Standardization: As an ANSI and ISO standard language, SQL provides a universal method to interact with relational databases across platforms.
-- Scalability: SQL supports databases ranging from small-scale applications to enterprise-level systems, ensuring smooth operations regardless
-- of size.
-- Flexibility: SQL can be extended with procedural programming (e.g., PL/SQL, T-SQL) to build complex business logic and custom functions.

-- Limitations of SQL:
-- Complexity in Advanced Operations: Advanced functionalities such as indexing, query optimization, and performance tuning require in-depth
-- technical knowledge.
-- Scalability Concerns: SQL performs best with structured data; handling unstructured data or massive distributed systems can pose challenges.
-- Platform-Specific Variations: While SQL is standardized, many databases implement unique extensions, leading to portability and compatibility
-- issues.

-- SQL Use Cases:
-- E-Commerce: Manage customer orders, product catalogs, and inventory.
-- Healthcare: Maintain patient records and appointment schedules.
-- Banking: Analyze transaction histories and generate financial reports.
-- Web Development: Power dynamic websites with user-specific content.
-- Machine Learning and Data Science: Combine SQL databases with tools like Python, R, and TensorFlow to streamline machine learning workflows.

-- SQL Data Types: -----------
-- SQL Data Types are very important in relational databases. It ensures that data is stored efficiently and accurately. Data types define the
-- type of value a column can hold, such as numbers, text, or dates. Understanding SQL Data Types is critical for database administrators,
-- developers, and data analysts to design robust databases and optimize performance.

-- Why SQL Data Types Matter: SQL data types are essential for designing relational databases, as they determine how data is stored, managed,
-- and interacted with. Choosing the right data type ensures:
-- Data Integrity: Prevents invalid data from being entered into the database (e.g., storing text in a numeric column).
-- Efficient Storage: Reduces storage costs by allocating only the necessary space for data.
-- Query Performance: Improves query performance by enabling faster indexing and search operations.
-- Application Compatibility: Ensures smooth interaction between the database and applications by enforcing consistency in data handling.

-- SQL data types are broadly categorized into several groups:
-- Numeric Data Types
-- Character and String Data Types
-- Date and Time Data Types
-- Binary Data Types
-- Boolean Data Types
-- Special Data Types

-- 1. Numeric Data Types: Numeric data types are fundamental to database design and are used to store numbers, whether they are integers, decimals,
-- or floating-point numbers. These data types allow for mathematical operations like addition, subtraction, multiplication, and division, which
-- makes them essential for managing financial, scientific, and analytical data.

-- BIGINT
-- INT
-- SMALLINT
-- TINYINT
-- DECIMAL
-- NUMERIC
-- MONEY
-- SMALLMONEY

-- Approximate Numeric Datatype: These types are used to store approximate values, such as scientific measurements or large ranges of data that
-- don’t need exact precision.

-- FLOAT:	Approximate numeric values
-- REAL:	Similar to FLOAT, but with less precision

-- 2. Character and String Data Types: Character data types are used to store text or character-based data. The choice between fixed-length and
-- variable-length data types depends on the nature of your data.

-- Char: The maximum length of 8000 characters.(Fixed-Length non-Unicode Characters).
-- Varchar: The maximum length of 8000 characters.(Variable-Length non-Unicode Characters).
-- Varchar(max): The maximum length of 231 characters(SQL Server 2005 only).(Variable Length non-Unicode data).
-- Text: The maximum length of 2,127,483,647 characters(Variable Length non-Unicode data).

-- Unicode Character String Data Types: Unicode data types are used to store characters from any language, supporting a wider variety of
-- characters. These are given in below table.

-- Nchar: The maximum length of 4000 characters(Fixed-Length Unicode Characters)
-- Nvarchar: The maximum length of 4000 characters.(Variable-Length Unicode Characters)
-- Nvarchar(max): The maximum length of 231 characters(SQL Server 2005 only).(Variable Length Unicode data)

-- 3. Date and Time Data Type: SQL provides several data types for storing date and time information. They are essential for managing timestamps,
-- events, and time-based queries.

-- DATE: stores the data of date (year, month, day), 3 Bytes.
-- TIME: stores the data of time (hour, minute,second), 3 Bytes
-- DATETIME: store both the data and time (year, month, day, hour, minute, second), 8 Bytes.

-- 4. Binary Data Types in SQL: Binary data types are used to store binary data such as images, videos, or other file types. These include:

-- Binary
-- VarBinary
-- Image

-- 5. Boolean Data Type in SQL: The BOOLEAN data types are used to store logical values, typically TRUE or FALSE. It’s commonly used for flag
-- fields or binary conditions.

-- BOOLEAN	Stores a logical value (TRUE/FALSE).

-- SQL Operators: -----------
-- SQL operators are symbols or keywords used to perform operations on data in SQL queries. These operations can include mathematical
-- calculations, data comparisons, logical manipulations, other data-processing tasks. Operators help in filtering, calculating, and updating
-- data in databases, making them crucial for query optimization and accurate data management.

-- Types of SQL Operators:
-- 1. Arithmetic Operator.
-- 2. Comparison Operator.
-- 3. Logical Operator.
-- 4. Bitwise Operators.
-- 5. Compound Operators.
-- 6. Special Operators.

-- 1. Arithmetic Operator:
-- + : The addition is used to perform an addition operation on the data values.
-- - : This operator is used for the subtraction of the data values.
-- / : This operator works with the ‘ALL’ keyword and it calculates division operations.
-- * : This operator is used for multiplying data values.
-- % : Modulus is used to get the remainder when data is divided by another.

-- Examples:
SELECT
    employee_id,
    employee_name,
    salary,
    salary + 100 AS "salary + 100"
FROM addition;

SELECT
    employee_id,
    employee_name,
    salary,
    salary - 100 AS "salary - 100"
FROM subtraction;

SELECT emp_salary, emp_salary * 1.05 AS "Revised Salary"
FROM employee;

-- 2. Comparison Operator:
-- =	Equal to.
-- >	Greater than.
-- <	Less than.
-- >=	Greater than equal to.
-- <=	Less than equal to.
-- <>	Not equal to.

-- Examples:
SELECT * FROM MATHS WHERE MARKS = 50;

SELECT * FROM MATHS WHERE MARKS > 60;

SELECT * FROM MATHS WHERE MARKS < 40;

SELECT * FROM MATHS WHERE MARKS >= 80;

SELECT * FROM MATHS WHERE MARKS <= 30;

SELECT * FROM MATHS WHERE MARKS <> 70;

-- 3. Logical Operator:
-- AND: Logical AND compares two Booleans as expressions and returns true when both expressions are true.
-- Syntex: SELECT * FROM table_name WHERE condition1 AND condition2 AND …conditionN;

SELECT * FROM Student WHERE Age = 18 AND ADDRESS = 'Delhi';

-- OR: Logical OR compares two Booleans as expressions and returns true when one of the expressions is true.
-- Syntex: SELECT * FROM table_name WHERE condition1 OR condition2 OR… conditionN;

SELECT * FROM Student WHERE NAME = 'Ram' OR NAME = 'SUJIT';

-- Combining AND and OR Operators in SQL: Combining AND and OR Operators in SQL allows the creation of complex conditions in queries. This
-- helps in filtering data on multiple conditions.

-- Syntax:
-- SELECT * FROM table_name WHERE condition1 AND (condition2 OR condition3);

SELECT *
FROM Student
WHERE
    Age = 18
    AND (
        NAME = 'Ram'
        OR NAME = 'RAMESH'
    );

-- The SQL AND operator is used to combine multiple conditions, where all the conditions must be true for the row to be included in the result set.
-- The OR operator is used to combine multiple conditions, where at least one of the conditions must be true for the row to be included in the
-- result set.
-- Any kind of condition, including equality, inequality, comparison, and logical operators, can be utilized with the AND and OR operators.
-- The AND operator is more important than the OR operator. In other words, when both are used in the same SQL statement, the AND operator
-- will be executed first. To change the order of evaluation, parentheses can be used.
-- You can employ the AND and OR operators inside of other conditions because they can both be nested.

-- NOT: Not takes a single Boolean as an argument and change its value from false to true or from true to false.

-- SELECT * FROM employee WHERE emp_city = 'Allahabad' AND emp_country = 'India';

SELECT * FROM Customers WHERE NOT Country = 'UK';

SELECT * FROM Customers WHERE NOT Country IN ('USA', 'UK');

SELECT * FROM Customers WHERE NOT CustomerName LIKE 'R%';

SELECT *
FROM Customers
WHERE
    NOT Country = 'USA'
    AND NOT Country = 'UK';

-- Key TakeAways About NOT Operator:
-- NOT operator returns opposite results or negative results. It negates boolean condition in the WHERE clause.
-- It is used to exclude specific data from the result set.
-- It can also be combined with other operators like- LIKE, BETWEEN, and IN.

-- 4. Bitwise Operators:
-- & : Bitwise AND operator.
-- | : Bitwise OR operator.
-- ^ : Bitwise XOR (exclusive OR) operator.
-- ~ : Bitwise NOT (complement) operator.
-- << : Left shift operator.
-- >> : Right shift operator.

-- 5. Compound Operators:
-- += : Add and assign.
-- -= : Subtract and assign.
-- *= : Multiply and assign.
-- /= : Divide and assign.
-- %= : Modulo and assign.
-- &= : Bitwise AND and assign.
-- ^= : Bitwise XOR and assign.
-- |= : Bitwise OR and assign.

-- 6. Special Operators:
-- ALL : ALL is used to select all records of a SELECT STATEMENT. It compares a value to every value in a list of results from a query. The ALL
-- must be preceded by the comparison operators and evaluated to TRUE if the query returns no rows.

-- Syntax:
-- SELECT column_name(s) FROM table_name WHERE column_name comparison_operator ALL (SELECT column_name FROM table_name WHERE condition(s));

-- Retrieve all product names from the Products table.
SELECT ALL ProductName FROM Products WHERE TRUE;

-- Retrieve product names if all records in the OrderDetails table have a quantity of 6 or 2.
SELECT ProductName
FROM Products
WHERE
    ProductID = ALL (
        SELECT ProductID
        FROM OrderDetails
        WHERE
            Quantity = 6
            OR Quantity = 2
    );

-- Find the OrderIDs where the maximum quantity in the order exceeds the average quantity of all orders.
SELECT OrderID
FROM OrderDetails
GROUP BY
    OrderID
HAVING
    MAX(Quantity) > ALL (
        SELECT AVG(Quantity)
        FROM OrderDetails
        GROUP BY
            OrderID
    );

-- ANY	: ANY compares a value to each value in a list of results from a query and evaluates to true if the result of an inner query contains at
-- least one row.

-- Syntax:
-- SELECT column_name(s) FROM table_name WHERE column_name comparison_operator ANY
-- (SELECT column_name FROM table_name WHERE condition(s));

-- Find distinct category IDs of products that appear in the OrderDetails table.
SELECT DISTINCT
    CategoryID
FROM Products
WHERE
    ProductID = ANY (
        SELECT ProductID
        FROM OrderDetails
    );

-- Find product names with a quantity of 9 in the OrderDetails table.
SELECT ProductName
FROM Products
WHERE
    ProductID = ANY (
        SELECT ProductID
        FROM OrderDetails
        WHERE
            Quantity = 9
    );

-- Differences Between SQL ALL and ANY:
-- ALL requires that the condition be true for every value in the subquery result, while ANY only needs the condition to be true for at least one
-- value in the subquery.
-- ALL is used when you want to compare a value against all values in the subquery, while ANY is useful when you want to compare a value against
-- any one of the values.

-- BETWEEN	: The SQL BETWEEN operator tests an expression against a range. The range consists of a beginning, followed by an AND keyword and an
-- end expression.

SELECT Name FROM Emp WHERE Salary BETWEEN 30000 AND 45000;

SELECT Name FROM Emp where Age BETWEEN '22' AND '24';

-- IN : The IN operator checks a value within a set of values separated by commas and retrieves the rows from the table that match.

-- Syntax:
-- SELECT column_name(s) FROM table_name WHERE column_name IN (list_of_values);

SELECT Name FROM Emp WHERE Salary IN (30000, 40000, 25000);

SELECT Name FROM Emp WHERE Salary NOT IN(25000, 30000);

-- Difference Between BETWEEN and IN:
-- BETWEEN:
-- Tests if a value falls within a specified range (inclusive).
-- column BETWEEN value1 AND value
-- Numbers, dates, or text values.
-- Used for checking values within a range (e.g., 1 to 10).
-- Salary BETWEEN 30000 AND 45000.
-- Salary NOT BETWEEN 30000 AND 45000
-- Efficient for continuous ranges.

-- IN:
-- Tests if a value matches any value in a specified list.
-- column IN (value1, value2, ...)
-- Numbers, dates, text, or a list of values.
-- Used for checking if a value is in a list (e.g., 1, 5, 10).
-- Salary IN (30000, 40000, 25000)
-- Salary NOT IN (25000, 30000)
-- Efficient for non-sequential values or when checking multiple conditions.

-- EXISTS : The EXISTS checks the existence of a result of a subquery. The EXISTS subquery tests whether a subquery fetches at least one row.
-- When no data is returned then this operator returns ‘FALSE’.

-- Syntax:
-- SELECT column_name(s) FROM table_name WHERE EXISTS
-- (SELECT column_name(s) FROM subquery_table WHERE condition);

-- Using EXISTS with SELECT:
SELECT fname, lname
FROM Customers
WHERE
    EXISTS (
        SELECT *
        FROM Orders
        WHERE
            Customers.customer_id = Orders.c_id
    );

-- Using NOT with EXISTS:
SELECT lname, fname
FROM Customers
WHERE
    NOT EXISTS (
        SELECT *
        FROM Orders
        WHERE
            Customers.customer_id = Orders.c_id
    );

-- When to Use SQL EXISTS:
-- Checking Data Existence: You can use EXISTS to check if related data exists in another table before performing an action (e.g., selecting,
-- updating, deleting).
-- Performance: EXISTS is often more efficient than using IN when dealing with large datasets, as it stops searching once a match is found.
-- Correlated Subqueries: EXISTS is ideal for correlated subqueries, where the subquery refers to the outer query’s values.

-- Differences Between EXISTS and IN:
-- EXISTS is used for checking the existence of rows, while IN checks if a value matches any value from a list or subquery result.
-- EXISTS is more efficient when the subquery results in a large number of rows.
-- IN works well for small datasets or static lists of values.

-- SOME : SOME operator evaluates the condition between the outer and inner tables and evaluates to true if the final result returns any one
-- row. If not, then it evaluates to false.

-- Syntax:
-- SELECT column_name(s) FROM table_name WHERE expression comparison_operator SOME (subquery)

select name
from instructor
where
    Salary > some (
        select Salary
        from instructor
        where
            dept = 'Computer Science'
    );

-- UNIQUE : The UNIQUE operator searches every unique row of a specified table.

-- Query: SELECT * FROM employee WHERE emp_id BETWEEN 101 AND 104;

-- SQL Commands | DDL, DQL, DML, DCL and TCL Commands: -----------
-- SQL commands are the fundamental building blocks for communicating with a database management system (DBMS). It is used to interact with
-- the database with some operations. It is also used to perform specific tasks, functions, and queries of data. SQL can perform various tasks
-- like creating a table, adding data to tables, dropping the table, modifying the table, set permission for users.

-- SQL Commands are mainly categorized into five categories:
-- DDL: Data Definition Language.
-- DQL: Data Query Language.
-- DML: Data Manipulation Language.
-- DCL: Data Control Language.
-- TCL: Transaction Control Language.

-- 1. DDL – Data Definition Language: DDL or Data Definition Language actually consists of the SQL commands that can be used for defining,
-- altering, and deleting database structures such as tables, indexes, and schemas. It simply deals with descriptions of the database schema
-- and is used to create and modify the structure of database objects in the database

-- CREATE: Create database or its objects (table, index, function, views, store procedure, and triggers).
-- CREATE TABLE table_name (column1 data_type, column2 data_type, ...);

-- DROP: Delete objects from the database.
-- DROP TABLE table_name;

-- ALTER: Alter the structure of the database.
-- ALTER TABLE table_name ADD COLUMN column_name data_type;

-- TRUNCATE: Remove all records from a table, including all spaces allocated for the records are removed.
-- TRUNCATE TABLE table_name;

-- COMMENT: Add comments to the data dictionary.
-- COMMENT 'comment_text' ON TABLE table_name;

-- RENAME: Rename an object existing in the database.
-- RENAME TABLE old_table_name TO new_table_name;

-- Example:
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    hire_date DATE
);

-- 2. DQL – Data Query Language: DQL statements are used for performing queries on the data within schema objects. The purpose of the DQL Command
-- is to get some schema relation based on the query passed to it. This command allows getting the data out of the database to perform operations
-- with it. When a SELECT is fired against a table or tables the result is compiled into a further temporary table, which is displayed or perhaps
-- received by the program.

-- SELECT: It is used to retrieve data from the database.
-- Example: SELECT column1, column2, ... FROM table_name WHERE condition;

-- Example:
SELECT first_name, last_name, hire_date
FROM employees
WHERE
    department = 'Sales'
ORDER BY hire_date DESC;

-- 3. DML (Data Manipulation Language): The SQL commands that deal with the manipulation of data present in the database belong to DML or Data
-- Manipulation Language and this includes most of the SQL statements. It is the component of the SQL statement that controls access to data
-- and to the database. Basically, DCL statements are grouped with DML statements.

-- INSERT: Insert data into a table.
-- INSERT INTO table_name (column1, column2, ...) VALUES (value1, value2, ...);

-- UPDATE: Update existing data within a table.
-- UPDATE table_name SET column1 = value1, column2 = value2 WHERE condition;

-- DELETE: Delete records from a database table.
-- DELETE FROM table_name WHERE condition;

-- LOCK: Table control concurrency.
-- LOCK TABLE table_name IN lock_mode;

-- CALL: Call a PL/SQL or JAVA subprogram.
-- CALL procedure_name(arguments);

-- EXPLAIN PLAN: Describe the access path to data.
-- EXPLAIN PLAN FOR SELECT * FROM table_name;

-- 4. DCL – Data Control Language:
-- DCL (Data Control Language) includes commands such as GRANT and REVOKE which mainly deal with the rights, permissions, and other controls
-- of the database system. These commands are used to control access to data in the database by granting or revoking permissions.

-- GRANT: Assigns new privileges to a user account, allowing access to specific database objects, actions, or functions.
-- GRANT privilege_type [(column_list)] ON [object_type] object_name TO user [WITH GRANT OPTION];

-- REVOKE: Removes previously granted privileges from a user account, taking away their access to certain database objects or actions.
-- REVOKE [GRANT OPTION FOR] privilege_type [(column_list)] ON [object_type] object_name FROM user [CASCADE];

-- Example of DCL:
GRANT SELECT, UPDATE ON employees TO user_name;

-- 5. TCL – Transaction Control Language:
-- Transactions group a set of tasks into a single execution unit. Each transaction begins with a specific task and ends when all the tasks in
-- the group are successfully completed. If any of the tasks fail, the transaction fails. Therefore, a transaction has only two results: success
-- or failure.

-- BEGIN TRANSACTION: Starts a new transaction.
-- BEGIN TRANSACTION [transaction_name];

-- COMMIT: Saves all changes made during the transaction.
-- COMMIT;

-- ROLLBACK: Undoes all changes made during the transaction.
-- ROLLBACK;

-- SAVEPOINT: Creates a savepoint within the current transaction.
-- SAVEPOINT savepoint_name;

-- Example:
BEGIN TRANSACTION;

UPDATE employees
SET
    department = 'Marketing'
WHERE
    department = 'Sales';

SAVEPOINT before_update;

UPDATE employees SET department = 'IT' WHERE department = 'HR';

ROLLBACK TO SAVEPOINT before_update;

COMMIT;

-- Most Important SQL Commands:
-- SELECT: Retrieves data from one or more tables.
-- INSERT: Adds new rows (records) to a table.
-- UPDATE: Modifies existing data in a table.
-- DELETE: Removes specific rows from a table.
-- CREATE TABLE: Creates a new table in the database.
-- ALTER TABLE: Modifies the structure of an existing table (e.g., add or remove columns).
-- DROP TABLE: Permanently deletes a table and its data.
-- TRUNCATE TABLE: Removes all rows from a table but keeps its structure intact.
-- WHERE: Filters records based on a condition.
-- ORDER BY: Sorts the result set in ascending or descending order.
-- GROUP BY: Groups rows that have the same values in specified columns.
-- HAVING: Filters grouped data (used with GROUP BY).
-- JOIN: Combines rows from two or more tables based on a related column.
-- DISTINCT: Removes duplicate values from the result set.
-- IN / BETWEEN / LIKE: Used for advanced filtering conditions.
-- UNION: Combines the result of two or more SELECT queries.
-- GRANT: Gives user privileges or permissions.
-- REVOKE: Removes user privileges.
-- COMMIT: Saves all changes made in the current transaction.
-- ROLLBACK: Undoes changes if something goes wrong in a transaction.
-- SAVEPOINT: Sets a point in a transaction to roll back to if needed.