-- SQL CREATE DATABASE: ---------------
-- The CREATE DATABASE Command is used to create a new database within a SQL based Database Management System (DBMS) such as MySQL, PostgreSQL, 
-- or SQL Server. A database acts as a container where all your data tables, views, stored procedures, and more are stored.

-- Syntex: CREATE DATABASE database_name;
CREATE DATABASE GeeksForGeeks;

-- How to Verify if Your Database Was Created:
SHOW DATABASES;

-- Switching to Your New Database (USE Command):
USE GeeksForGeeks;

-- Deleting a Database (DROP DATABASE):
DROP DATABASE GeeksForGeeks;

-- Database Already Exists:
CREATE DATABASE IF NOT EXISTS GeeksForGeeks;

DROP DATABASE IF EXISTS GeeksForGeeks;

-- Query to Rename Database: --------------

-- To change the name of a database in SQL, use the syntax:
-- ALTER DATABASE [current_database_name] MODIFY NAME = [new_database_name];

-- To rename a database in MySQL use the query:
-- RENAME DATABASE [current_database_name] TO [new_database_name];

-- Example:
CREATE DATABASE Test;
SHOW DATABASES;

USE test;
ALTER DATABASE test RENAME TO example;

-- SQL Select Database: -------------
CREATE DATABASE GeeksforGeeks;
USE GeeksforGeeks;

-- How to Query Data from the Selected Database:
-- 1. Basic SELECT Statement:
SELECT * FROM employees;

-- 2. Selecting Specific Columns:
SELECT name, age FROM employees;

-- 3. Filtering Results with WHERE:
SELECT name, age FROM employees WHERE age >= 35;

-- 4. Sorting Results with ORDER BY:
SELECT name, age FROM employees ORDER BY age DESC;

-- 5. Limiting Results with LIMIT Clause: The LIMIT clause restricts the number of rows returned.
SELECT name, salary FROM employees ORDER BY salary DESC LIMIT 3;

-- 6. Aggregating Data with GROUP BY and Aggregation Functions: The GROUP BY clause groups rows that have the same values into summary rows, 
-- often used with aggregation functions like AVG, COUNT, MAX, MIN, and SUM.
SELECT department, AVG(salary) AS average_salary FROM employees GROUP BY department;