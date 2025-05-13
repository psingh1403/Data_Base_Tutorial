-- Clauses: -------------

-- WHERE Clause: ------------
-- The SQL WHERE clause is used to specify a condition while fetching or modifying data in a database. It filters the rows that
-- are affected by the SELECT, UPDATE, DELETE, or INSERT operations. The condition can range from simple comparisons to complex expressions,
-- enabling precise targeting of the data.

-- Syntax: SELECT column1,column2 FROM table_name WHERE column_name operator value;

CREATE TABLE Emp1 (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    Country VARCHAR(50),
    Age int(2),
    mob int(10)
);

-- Insert some sample data into the Customers table
INSERT INTO
    Emp1 (
        EmpID,
        Name,
        Country,
        Age,
        mob
    )
VALUES (
        1,
        'Shubham',
        'India',
        '23',
        '738479734'
    ),
    (
        2,
        'Aman ',
        'Australia',
        '21',
        '436789555'
    ),
    (
        3,
        'Naveen',
        'Sri lanka',
        '24',
        '34873847'
    ),
    (
        4,
        'Aditya',
        'Austria',
        '21',
        '328440934'
    ),
    (
        5,
        'Nishant',
        'Spain',
        '22',
        '73248679'
    );

-- Where Clause with Logical Operators:
SELECT * FROM Emp1 WHERE Age = 24;

SELECT EmpID, Name, Country FROM Emp1 WHERE Age > 21;

-- Where Clause with BETWEEN Operator:
-- SELECT column1, column2 FROM table_name WHERE column_name BETWEEN value1 AND value2;

SELECT * FROM Emp1 WHERE Age BETWEEN 22 AND 24;

-- Where Clause with LIKE Operator:
-- Syntax: SELECT column1, column2 FROM table_name WHERE column_name LIKE pattern;

-- Note: The character(s) in the pattern is case-insensitive.

SELECT * FROM Emp1 WHERE Name LIKE 'S%';

SELECT * FROM Emp1 WHERE Name LIKE '%M%';

-- Where Clause with IN Operator:
-- Syntax: SELECT column1, column2 FROM table_name WHERE column_name IN (value1, value2, ..);

SELECT Name FROM Emp1 WHERE Age IN (21, 23);

-- WITH Clause: ------------
-- The SQL WITH clause is used to define temporary tables or result sets within a query. These temporary relations also known as
-- Common Table Expressions (CTEs), act like virtual tables that exist only during the execution of the query. We can use these temporary tables
-- multiple times in the main query, making it easier to manage and reuse complex logic without repeating the same subquery.

-- This method also helps in performance optimization, as the query planner can optimize the reuse of intermediate results instead of re-executing
-- the same complex subqueries multiple times.

-- Why Use the WITH Clause?
-- Improves Readability: By breaking down complex queries into smaller, more manageable parts.
-- Enhances Maintainability: Makes it easier to debug and modify your queries.
-- Optimizes Performance: Reduces redundancy and ensures that temporary results are only calculated once.

-- Syntax:
-- WITH temporaryTable (averageValue) AS (SELECT AVG (Attr1) FROM Table)
-- SELECT Attr1 FROM Table, temporaryTable WHERE Table.Attr1 > temporaryTable.averageValue;

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Salary INT
);

-- Insert the data
INSERT INTO
    Employees (EmployeeID, Name, Salary)
VALUES (100011, 'Smith', 50000),
    (100022, 'Bill', 94000),
    (100027, 'Sam', 70550),
    (100845, 'Walden', 80000),
    (115585, 'Erik', 60000),
    (1100070, 'Kate', 69000);

-- Finding Employees with Above-Average Salary:
WITH
    temporaryTable (averageValue) AS (
        SELECT AVG(Salary)
        FROM Employees
    )
SELECT EmployeeID, Name, Salary
FROM Employees, temporaryTable
WHERE
    Employees.Salary > temporaryTable.averageValue;

-- Explanation:
-- Temporary Table (CTE): We calculate the average salary using the WITH clause and store it in a temporary table called averageSalary.
-- Main Query: The main query then compares each employee’s salary against the calculated average and returns the employees whose salaries are
-- above the average.
-- The average salary of all employees is 70591. Therefore, all employees whose salary is more than the obtained average lies in the output
-- relation.

-- Key Benefits of Using the WITH Clause
-- 1. Improved Readability: The WITH clause breaks down complex queries into simpler parts, making it easier to follow the logic.
-- 2. Reusable Subqueries: If you need to reference the same subquery multiple times in your query, the WITH clause saves you from repeating
-- the same code.
-- 3. Performance Optimization: By storing intermediate results, SQL databases can optimize the execution of queries, potentially improving
-- performance.
-- 4. Easy Debugging: Since each CTE is defined separately, it’s easier to test and debug different parts of the query without affecting the
-- main logic.

-- Important Things to Remember About the SQL WITH Clause
-- 1. Temporary Lifetime: The temporary tables (CTEs) defined in the WITH clause only exist during the execution of the query. Once the query
-- is finished, they are discarded.
-- 2. Nested WITH Clauses: You can define multiple CTEs in a single query, and they can reference each other.
-- Example:
-- WITH CTE1 AS (...), CTE2 AS (...)
-- SELECT * FROM CTE1, CTE2;

-- 3. Performance Consideration: While the WITH clause is excellent for readability and maintainability, it can sometimes be less efficient in
-- cases where the temporary result set is large. Always check the execution plan to ensure you’re optimizing your queries correctly.

-- HAVING Clause: ------------
-- The HAVING clause is used to filter the result of the GROUP BY statement based on the specified conditions. It allows filtering grouped data
-- using Boolean conditions (AND, OR). It was introduced because the WHERE clause cannot be used with aggregate functions. Similar to WHERE
-- clause, it helps apply conditions but specifically works with grouped data. When we need to filter aggregated results, the HAVING clause
-- is the appropriate choice.

-- Key Features of the HAVING Clause:
-- Used to filter grouped data based on aggregate functions.
-- Works with Boolean conditions (AND, OR
-- Cannot be used without GROUP BY unless an aggregate function is present.
-- Must be placed after the GROUP BY clause and before the ORDER BY clause (if used).
-- Helps generate summary reports from large datasets.

-- Syntax:
-- SELECT column_name, AGGREGATE_FUNCTION(column_name)
-- FROM table_name GROUP BY column_name HAVING condition;

-- Create the Employee table with appropriate data types
CREATE TABLE Employ (
    EmployeeId int,
    Name varchar(50),
    Gender varchar(10),
    Salary int,
    Department varchar(20),
    Experience int -- Changed to int for years of experience
);

-- Insert multiple rows into the Employee table in a single query
INSERT INTO
    Employ (
        EmployeeId,
        Name,
        Gender,
        Salary,
        Department,
        Experience
    )
VALUES (
        5,
        'Priya Sharma',
        'Female',
        45000,
        'IT',
        2
    ),
    (
        6,
        'Rahul Patel',
        'Male',
        65000,
        'Sales',
        5
    ),
    (
        7,
        'Nisha Gupta',
        'Female',
        55000,
        'Marketing',
        4
    ),
    (
        8,
        'Vikram Singh',
        'Male',
        75000,
        'Finance',
        7
    ),
    (
        9,
        'Aarti Desai',
        'Female',
        50000,
        'IT',
        3
    );

SELECT * FROM Employ;

-- Example 1 : Using HAVING to Filter Aggregated Results:
SELECT Department, sum(Salary) as Salary FROM Employ GROUP BY department;

SELECT Department, sum(Salary) as Salary FROM Employ
GROUP BY department HAVING SUM(Salary) >= 50000;

-- Example 2: Using HAVING with Multiple Conditions:
SELECT Department, SUM(Salary) AS Total_Salary, AVG(Salary) AS Average_Salary
FROM Employ GROUP BY Department HAVING SUM(Salary) >= 50000 AND AVG(Salary) > 55000;

-- Example 3: Using HAVING with COUNT():
SELECT Department, COUNT(EmployeeId) AS Employee_Count FROM Employee
GROUP BY Department HAVING COUNT(EmployeeId) >= 2;

-- Example 4: Using HAVING with AVG():
SELECT Department, AVG(Salary) AS Average_Salary FROM Employee
GROUP BY Department HAVING AVG(Salary) > 50000;


-- Having vs WHERE:
-- Having:
-- In the HAVING clause it will check the condition in group of a row.
-- HAVING clause can only be used with aggregate function.
-- Priority Wise HAVING Clause is executed after Group By.

-- Where:
-- In the WHERE condition it will check or execute at each row individual.
-- The WHERE Clause cannot be used with aggregate function like Having
-- Priority Wise WHERE is executed before Group By.

-- ORDER BY: ------------
-- The ORDER BY statement in SQL is used to sort the fetched data in either ascending or descending according to one or more columns. It is very 
-- useful to present data in a structured manner.

-- SQL ORDER BY default mode is sorting data into ascending order. To sort data in descending order use the DESC keyword with ORDER BY clause.

-- Syntax: SELECT * FROM table_name ORDER BY column_name ASC | DESC

-- Example 1: Sort According To a Single Column using ORDER BY Clause:
SELECT * FROM students ORDER BY ROLL_NO DESC;

-- Example 2: Sort According To Multiple Columns using ORDER BY Clause:
SELECT * FROM students ORDER BY age DESC , name ASC;

-- Note: ASC is the default value for the ORDER BY clause. So, if we don’t specify anything after the column name in the ORDER BY clause, the 
-- output will be sorted in ascending order by default. 

-- Sorting By Column Number (instead of name):
-- Syntax: ORDER BY Column_Number asc/desc

-- Example of Sorting By Column Number:
SELECT Roll_no, Name, Address FROM studentinfo ORDER BY 1;

-- ORDER BY 1 means sorting values according to first column in the SELECT statement.

-- Important Points About ORDER BY Clause in SQL:
-- The ORDER BY clause in SQL is used to sort the result set of a SELECT statement based on specified columns.
-- It is essential for organizing query results and presenting data in a structured manner.
-- It can sort data in either ascending (ASC) or descending (DESC) order.
-- Multiple columns can be specified for sorting, allowing for more complex sorting criteria.
-- We can use ORDER BY with WHERE clause, GROUP BY clause, and HAVING clause.

-- GROUP BY Clause: ------------
-- The GROUP BY statement in SQL is used to arrange identical data into groups based on specified columns. If a particular column has the same
-- values in multiple rows, the GROUP BY clause will group these rows together. It’s commonly used with aggregate functions to calculate totals
-- or averages per group. Key Points About GROUP BY:
-- GROUP BY clause is used with the SELECT statement.
-- In the query, the GROUP BY clause is placed after the WHERE clause.
-- In the query, the GROUP BY clause is placed before the ORDER BY clause if used.
-- In the query, the GROUP BY clause is placed before the Having clause.
-- Place condition in the having clause.

-- Syntax:
-- SELECT column1, function_name(column2) FROM table_name GROUP BY column1, column2;

CREATE TABLE emp (
    emp_no INT PRIMARY KEY,
    name VARCHAR(50),
    sal DECIMAL(10, 2),
    age INT
);

INSERT INTO
    emp (emp_no, name, sal, age)
VALUES (1, 'Aarav', 50000.00, 25),
    (2, 'Aditi', 60000.50, 30),
    (3, 'Aarav', 75000.75, 35),
    (4, 'Anjali', 45000.25, 28),
    (5, 'Chetan', 80000.00, 32),
    (6, 'Divya', 65000.00, 27),
    (7, 'Gaurav', 55000.50, 29),
    (8, 'Divya', 72000.75, 31),
    (9, 'Gaurav', 48000.25, 26),
    (10, 'Divya', 83000.00, 33);

SELECT * from emp;

SELECT name, SUM(sal) FROM emp GROUP BY name;

-- Group By Multiple Columns:
SELECT SUBJECT, YEAR, Count(*) FROM Student GROUP BY SUBJECT, YEAR;

-- HAVING Clause in GROUP BY Clause:
-- We know that the WHERE clause is used to place conditions on columns but what if we want to place conditions on groups? This is where the
-- HAVING clause comes into use. We can use the HAVING clause to place conditions to decide which group will be part of the final result set.
-- Also, we can not use aggregate functions like SUM(), COUNT(), etc. with the WHERE clause. So we have to use the HAVING clause if we want
-- to use any of these functions in the conditions.

-- SELECT column1, function_name(column2) FROM table_name WHERE condition
-- GROUP BY column1, column2 HAVING condition ORDER BY column1, column2;

SELECT NAME, SUM(sal) FROM Emp GROUP BY name HAVING SUM(sal) > 50000;

-- LIMIT Clause: ------------
-- The SQL LIMIT clause is used to control maximum number of records returned by a query. It is commonly used for limiting query results when
-- only a subset of the data is required, such as for pagination, filtering top values, or analyzing a smaller portion of a large table. This can
-- be particularly useful for tasks like:
-- Paginating results (e.g., showing 10 results per page).
-- Retrieving top records (e.g., the top 5 highest-rated products).
-- Sampling data (e.g., getting a random sample of rows for analysis).

-- Syntax:
-- SELECT column1, column2, … FROM table_name WHERE condition
-- ORDER BY column LIMIT [offset,] row_count;

-- Example 1: Basic LIMIT Usage:
SELECT * FROM student LIMIT 3;

-- Example 2: LIMIT with ORDER BY Clause:
SELECT * FROM Student ORDER BY Grade DESC LIMIT 3;

-- LIMIT with OFFSET: The OFFSET clause allows us to skip a specified number of rows before starting to return the results. OFFSET can only be
-- used with the ORDER BY clause. It cannot be used on its own. It’s particularly helpful for pagination, where we might want to show different
-- “pages” of results from a larger dataset. OFFSET value must be greater than or equal to zero. It cannot be negative, else returns an error.

-- Syntax:
-- SELECT * FROM table_name ORDER BY column_name LIMIT X OFFSET Y;
-- OR
-- SELECT * FROM table_name ORDER BY column_name LIMIT Y,X;

-- X → Number of rows to return.
-- Y → Number of rows to skip.

-- Example: Skipping First 2 Rows & Fetching 2 Rows
SELECT * FROM Student ORDER BY age LIMIT 2 OFFSET 2;

-- Using LIMIT to Get the nth Highest or Lowest Value:
-- Syntax: SELECT column_list FROM table_name ORDER BY expression LIMIT n-1, 1;

-- Fetching the 3rd Highest Age:
SELECT age FROM Student ORDER BY age LIMIT 2, 1;

-- Restrictions on the LIMIT clause:
-- With regard to defining a view
-- The use of nested SELECT statements
-- Except for subqueries with table expressions specified in the FROM clause.
-- Embedded SELECT statements are used as expressions in a singleton SELECT (where max = 1) within an SPL routine where embedded SELECT statements
-- are used as expressions.

-- Important Points About SQL LIMIT:
-- The LIMIT clause is used to set an upper limit on the number of tuples returned by SQL.
-- It is important to note that this clause is not supported by all SQL versions.
-- The LIMIT clause can also be specified using the SQL 2008 OFFSET/FETCH FIRST clauses.
-- The limit/offset expressions must be a non-negative integer.

-- DISTINCT Keyword: ------------
-- The distinct keyword is used in conjunction with the select keyword. It is helpful when there is a need to avoid duplicate values present
-- in any specific columns/table. When we use distinct keywords only the unique values are fetched.

-- Syntax: SELECT DISTINCT column1, column2 FROM table_name;

-- NOTE: If a distinct keyword is used with multiple columns, the distinct combination is displayed in the result set.

use practice;

CREATE TABLE students (
    ROLL_NO INT,
    NAME VARCHAR(50),
    ADDRESS VARCHAR(100),
    PHONE VARCHAR(20),
    AGE INT
);

INSERT INTO
    students (
        ROLL_NO,
        NAME,
        ADDRESS,
        PHONE,
        AGE
    )
VALUES (
        1,
        'Shubham Kumar',
        '123 Main Street, Bangalore',
        '9876543210',
        23
    ),
    (
        2,
        'Shreya Gupta',
        '456 Park Road, Mumbai',
        '9876543211',
        23
    ),
    (
        3,
        'Naveen Singh',
        '789 Market Lane, Delhi',
        '9876543212',
        26
    ),
    (
        4,
        'Aman Chopra',
        '246 Forest Avenue, Kolkata',
        '9876543213',
        22
    ),
    (
        5,
        'Aditya Patel',
        '7898 Ocean Drive, Chennai',
        '9876543214',
        27
    ),
    (
        6,
        'Avdeep Desai',
        '34 River View, Hyderabad',
        '9876543215',
        24
    ),
    (
        7,
        'Shubham Kumar',
        '123 Main Street, Bangalore',
        '9876543210',
        23
    ), -- Duplicate
    (
        8,
        'Shreya Gupta',
        '456 Park Road, Mumbai',
        '9876543211',
        23
    ), -- Duplicate
    (
        9,
        'Naveen Singh',
        '789 Market Lane, Delhi',
        '9876543212',
        26
    ), -- Duplicate
    (
        10,
        'Aditya Patel',
        '7898 Ocean Drive, Chennai',
        '9876543214',
        27
    ), -- Duplicate
    (
        11,
        'Aman Chopra',
        '246 Forest Avenue, Kolkata',
        '9876543213',
        22
    ), -- Duplicate
    (
        12,
        'Avdeep Desai',
        '34 River View, Hyderabad',
        '9876543215',
        24
    );
-- Duplicate

-- Example 1: Fetch Unique Names from the NAME Field.
SELECT DISTINCT NAME FROM students;

-- Example 2: Fetching Unique Combinations of Multiple Columns
SELECT DISTINCT NAME, AGE FROM students;

-- Example 3: Using DISTINCT with the ORDER BY Clause
SELECT DISTINCT AGE FROM students ORDER BY AGE;

-- Example 4: Using DISTINCT with Aggregate Functions (e.g., COUNT())
SELECT COUNT(DISTINCT ROLL_NO) FROM Students;

-- How the DISTINCT Clause Handles NULL Values:
-- In SQL, the DISTINCT keyword treats NULL as a unique value. If NULL appears in a column, it will be counted as a distinct value.

INSERT INTO
    students (
        ROLL_NO,
        NAME,
        ADDRESS,
        PHONE,
        AGE
    )
VALUES (
        13,
        'John Doe',
        '123 Unknown Street',
        '9876543216',
        NULL
    );

SELECT DISTINCT AGE FROM students;

-- FETCH in SQL: ------------
-- The SQL FETCH command is used to retrieve a subset of rows from a result set, typically after applying an ORDER BY clause and specifying an
-- OFFSET to define the starting point. It is commonly used in pagination scenarios where you want to retrieve a limited number of rows at a
-- time, such as top records, specific ranges, or sequential data fetching.

-- With FETCH the OFFSET clause is mandatory. You are not allowed to use, ORDER BY … FETCH.
-- You are not allowed to combine TOP with OFFSET and FETCH.
-- The OFFSET/FETCH row count expression can only be any arithmetic, constant, or parameter expression that will return an integer value.
-- With the OFFSET and FETCH clause, the ORDER BY is mandatory to be used.

-- Syntax:
-- SELECT column_name(s) FROM table_name ORDER BY column_name OFFSET start_row_number ROWS
-- FETCH NEXT number_of_rows ROWS ONLY;

CREATE TABLE MarkList (
    id int,
    name varchar(20),
    mathematics int,
    physics int,
    chemistry int
);

INSERT INTO
    MarkList
VALUES (501, 'Surya', 99, 97, 85),
    (502, 'Charan', 99, 93, 88),
    (503, 'Sravan', 91, 98, 94),
    (504, 'Ram', 92, 99, 82),
    (505, 'Aryan', 94, 99, 88),
    (506, 'Sathwik', 91, 88, 91),
    (507, 'Madhav', 90, 97, 89);

SELECT id, name, (
        mathematics + physics + chemistry
    ) AS total
FROM MarkList
ORDER BY (
        mathematics + physics + chemistry
    ) DESC
OFFSET
    0 ROWS FETCH NEXT 3 ROWS ONLY;

-- So, the SQL FETCH command is used to retrieve selected rows from a table sequentially. It’s handy to use when you want to select a limited
-- number of rows from an ordered set, like top 3, top 10, or bottom 3, etc.

-- Performance Considerations:
-- While using FETCH can be very useful for limiting result sets, consider the following best practices:
-- Ensure proper indexing: When using ORDER BY, make sure the columns involved in sorting are indexed for faster query execution.
-- Use in pagination: It’s common to use FETCH in paginated APIs or web applications to display data in chunks (e.g., 10 rows per page).

-- Restrictions with SQL FETCH:
-- Mandatory ORDER BY: When using OFFSET and FETCH, the ORDER BY clause is required to ensure a consistent, predictable order of rows.
-- Cannot be used with TOP: You cannot combine TOP with OFFSET and FETCH. Both mechanisms serve the same purpose of limiting rows, but they
-- should not be mixed in the same query.
-- Arithmetical Expressions: The number of rows specified in FETCH NEXT must be an integer expression (constant, arithmetic, or parameterized).

-- SQL Aliases: -------------
-- Aliases are the temporary names given to tables or columns for the purpose of a particular SQL query. It is used when the name of a column or
-- table is used other than its original name, but the modified name is only temporary.
-- Aliases are created to make table or column names more readable.
-- The renaming is just a temporary change and the table name does not change in the original database.
-- Aliases are useful when table or column names are big or not very readable.
-- These are preferred when there is more than one table involved in a query.

-- Syntax: SELECT column_name AS alias_name FROM table_name;

-- Column Alias for Renaming a Column:
SELECT CustomerID AS id FROM Customer;

-- Table Alias for Joining Tables:
SELECT c1.CustomerName, c1.Country
FROM Customer AS c1, Customer AS c2
WHERE
    c1.Age = c2.Age
    AND c1.Country = c2.Country;

-- Combining Column and Table Aliases:
SELECT c.CustomerName AS Name, c.Country AS Location
FROM Customer AS c
WHERE
    c.Age >= 21;

-- Advantages of SQL Aliases:
-- Readability: Aliases make long or complex table/column names more readable and concise.
-- Simplification: Aliases reduce the verbosity of SQL queries, especially in joins or complex calculations.
-- Clearer Results: Aliases help clarify what data is being returned, especially when performing aggregations or combining multiple tables.
-- Avoid Name Conflicts: Aliases prevent naming conflicts, especially when columns in multiple tables share the same name.
