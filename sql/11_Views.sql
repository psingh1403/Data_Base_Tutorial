-- CREATE VIEW Statement: -------------
-- The SQL CREATE VIEW statement is the central idea used to create a virtual table that does not store data itself but rather provides a dynamic
-- representation of data obtained from one or more underlying tables. This arrangement lets users simplify intricate queries, improve security,
-- and make abstracted data structures easy to access and manipulate.

-- Syntax:
-- CREATE VIEW view_name AS
-- SELECT column1, column2, ...
-- FROM table_name
-- WHERE condition;

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price INT
);

-- Insert data into the table
INSERT INTO
    products (
        product_id,
        product_name,
        price
    )
VALUES (1, 'Laptop', 800),
    (2, 'Smartphone', 600),
    (3, 'Tablet', 120),
    (4, 'Headphones', 80),
    (5, 'Monitor', 200);

Select * from products;

-- Creating a Simple View:
CREATE VIEW expensive_products AS
SELECT product_id, product_name, price
FROM products
WHERE
    price > 600;

Select * from expensive_products;

-- Creating a Joined View:
CREATE VIEW employee_department_info AS
SELECT e.employee_id, e.first_name, e.last_name, d.department_name
FROM employees e
    JOIN departments d ON e.department_id = d.department_id;

-- How to Update a View in SQL: -------------
-- Updating a view in SQL means modifying the data it shows. However, not all views can be updated instantly. Views with complex queries, like
-- those with joins, subqueries, or aggregate functions, may not be directly updatable.

-- There are two ways to update a view: using the UPDATE keyword or using the CREATE OR REPLACE keyword

-- 1. The UPDATE keyword is used to update the view without changing the schema of the table. Update keyword will be used to update the
-- values of the attributes.
-- CREATE OR REPLACE keyword is used to update the view where the schema of the the view can also be changed. As the name suggests, if the
-- view is not present it will get created. If view is present then view will get Replaced.

-- Examples of Updating a View:

-- 1. Updating View Using IN Operator:
UPDATE view1 SET Marks = 50 where Roll_no in (3, 5);

-- 2. Updating View Using Arithmetic Operation:
UPDATE view1 SET Marks = Marks * 0.95;

-- 3. Updating View Using Aggregate Function:
CREATE OR REPLACE VIEW view1 AS
SELECT Subject, SUM(Marks) AS TotalMarks
FROM Student
GROUP BY
    Subject;

-- 4. Updating View Using Subqueries:
CREATE OR REPLACE VIEW view1 AS
SELECT Name, (
        SELECT SUM(Marks)
        FROM Student s
        WHERE
            s.Subject = Student.Subject
    ) AS TotalMarks
FROM Student;

-- Advantages Of View:
-- Data Access: View helps to restrict the data access and can be used to display the required information from the table without creating a
-- new table
-- Storage Capacity: View takes very little space to store data.
-- Usability: View is used to present the data in Proper format as compared to the data present in the tables.
-- Consistency: A view represents the database's consistent structure and if the original tables are restructured or changed.
-- Query simplicity: Data can be easily presented in structured format from various tables into a single table only.

-- Rename View: -------------
-- Reflecting Updated Business Requirements: As business logic or data structures change, renaming views to match the updated terminology ensures
-- clarity and relevance.
-- Improving Database Schema Organization: Renaming views can help maintain consistency and improve the organization of the database schema,
-- which is critical for efficient data retrieval and management.
-- Preserving Dependencies: Renaming a view preserves all its dependencies (like permissions, related views, and stored procedures), making
-- it a safer option than dropping and recreating the view.

-- How to Rename a View in SQL:
-- Using sp_rename in SQL Server.
-- Using the CREATE OR REPLACE VIEW command to create a new view with the desired name and drop the old one in databases like MySQL,
-- PostgreSQL, and others.

-- Syntax: EXEC sp_rename 'old_view_name', 'new_view_name';

-- Example 1: Renaming a View in SQL Server:
EXEC sp_rename 'sales_report', 'monthly_sales_report';

-- Renaming a View in MySQL and Other Databases:
-- Steps to Rename a View in MySQL:
-- 1. Create a new view with the new name:

-- CREATE VIEW new_view_name AS
-- SELECT column1, column2, ...
-- FROM old_view_name;

-- 2. Drop the old view:
-- DROP VIEW old_view_name;

-- Example 2: Renaming a View in MySQL:
-- 1. Create the it_employees View

CREATE VIEW it_employees AS
SELECT name
FROM employees
WHERE
    department_id = 1;

-- 2. Rename the it_employees View:
CREATE VIEW employee AS
SELECT name
FROM employees
WHERE
    department_id = 1;

-- 3. Drop the Old it_employees View
DROP VIEW it_employees;

-- Why and When Should You Use DROP VIEW?
-- Outdated Views: If a view is no longer relevant because the underlying data structure has changed or the view is based on obsolete 
-- requirements, it’s a good idea to drop it to keep the database clean.
-- Performance Optimization: Removing unnecessary views can help optimize query performance and maintain database health.
-- Security: Views may sometimes expose sensitive data or provide too much access. Dropping a view when it's no longer needed helps maintain 
-- the principle of least privilege.
-- Database Maintenance: As our database grows, managing views becomes critical. Keeping only the necessary views can improve overall 
-- maintainability.

