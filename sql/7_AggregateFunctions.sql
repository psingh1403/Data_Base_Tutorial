-- Aggregate Functions: -------------
-- SQL Aggregate Functions are used to perform calculations on multiple rows of data and return a single summarized result. These functions are
-- typically used with theGROUP BY clause to organize data into groups, where we can then perform calculations like summing, averaging, or
-- counting. Aggregate functions allow you to make sense of large datasets by collapsing them into meaningful summaries.

-- Key Features of SQL Aggregate Functions:
-- Operate on groups of rows: They work on a set of rows and return a single value.
-- Ignore NULLs: Most aggregate functions ignore NULL values, except for COUNT(*).
-- Used with GROUP BY: To perform calculations on grouped data, you often use aggregate functions with GROUP BY.
-- Can be combined with other SQL clauses: Aggregate functions can be used alongside HAVING, ORDER BY, and other SQL clauses to filter or sort
-- results.

-- Commonly Used SQL Aggregate Functions:
-- 1. Count(): The COUNT() function returns the number of rows that match a given condition or are present in a column.
-- COUNT(*): Counts all rows.
-- COUNT(column_name): Counts non-NULL values in the specified column.
-- COUNT(DISTINCT column_name): Counts unique non-NULL values in the column.

-- Examples:
-- Total number of records in the table
SELECT COUNT(*) AS TotalRecords FROM Employee;

-- Count of non-NULL salaries
SELECT COUNT(Salary) AS NonNullSalaries FROM Employee;

-- Count of unique non-NULL salaries
SELECT COUNT(DISTINCT Salary) AS UniqueSalaries FROM Employee;

-- Count Rows That Match a Condition Using COUNT() with CASE WHEN:
SELECT COUNT(
        CASE
            WHEN Age > 30 THEN 1
            ELSE NULL
        END
    ) AS Adults
FROM Customers;

-- Count Rows in Groups Using COUNT() with GROUP BY:
SELECT Country, COUNT(*) AS CustomerCount
FROM Customers
GROUP BY
    Country;

-- Filter Groups Using COUNT() with GROUP BY and HAVING:
SELECT Country, COUNT(*) AS CustomerCount
FROM Customers
GROUP BY
    Country
HAVING
    COUNT(*) > 2;

-- Avoid Complex COUNT Queries for Large Tables::
SELECT COUNT(*)
FROM Customers
WHERE (
        Country = 'Spain'
        OR Country = 'France'
    )
    AND Age > 30
    AND City = 'Barcelona';

-- 2. SUM(): The SUM() function calculates the total sum of a numeric column.
-- SUM(column_name): Returns the total sum of all non-NULL values in a column.

-- Examples:
-- Calculate the total salary
SELECT SUM(Salary) AS TotalSalary FROM Employee;

-- Calculate the sum of unique salaries
SELECT SUM(DISTINCT Salary) AS DistinctSalarySum FROM Employee;

-- Using SUM() with an Expression:
SELECT SUM(Price * Quantity) AS TotalRevenue FROM Sales;

-- Using SUM() with GROUP BY:
SELECT Department, SUM(Salary) AS DepartmentSalary
FROM Employees
GROUP BY
    Department;

-- Using SUM() with DISTINCT:
SELECT SUM(DISTINCT Price) AS TotalDistinctPrice FROM Products;

-- Using SUM() with HAVING:
SELECT Department, SUM(Salary) AS DepartmentSalary
FROM Employees
GROUP BY
    Department
HAVING
    SUM(Salary) > 200,
    000;

-- Use with Indexes: When summing a large dataset, it’s important to have indexes on the columns you’re filtering by, such as dates or categories.
-- This will improve the performance of your query.
-- Use GROUP BY to Categorize Data: The SUM() function works perfectly with GROUP BY. It helps you summarize data efficiently by different
-- categories like departments or regions.
-- Avoid Summing Non-Numeric Values: Ensure that the column you are summing contains only numeric values. Summing non-numeric values can result
-- in errors.
-- Consider Using Aliases: Always use aliases for SUM() results for better readability and clarity in your output.

-- 3. AVG(): The AVG() function calculates the average of a numeric column. It divides the sum of the column by the number of non-NULL rows.
-- AVG(column_name): Returns the average of the non-NULL values in the column.

CREATE TABLE student_scores (
    student_id INT,
    subject VARCHAR(50),
    score INT
);

INSERT INTO
    student_scores (student_id, subject, score)
VALUES (1, 'Math', 85),
    (2, 'Science', 78),
    (3, 'English', 92),
    (4, 'Math', 90),
    (5, 'Science', 82),
    (6, 'English', 88),
    (7, 'Math', 75),
    (8, 'Science', 80),
    (9, 'English', 85);

-- Examples:
-- Calculate the average salary
SELECT AVG(Salary) AS AverageSalary FROM Employee;

-- Average of distinct salaries
SELECT AVG(DISTINCT Salary) AS DistinctAvgSalary FROM Employee;

SELECT subject, AVG(score) AS average_score FROM student_scores
GROUP BY subject;

-- Calculating Overall Average Score:
SELECT AVG(score) AS overall_average_score FROM student_scores;

-- Calculating Average Score for a Specific Subject:
SELECT AVG(score) AS average_science_score FROM student_scores
WHERE subject = 'Science';

-- Handling NULL Values: AVG() function by default ignore NULL values when calculating the total. However, they have to be careful in how they 
-- interpret the results of the study, especially when missing values are relevant to your study.
-- Data Type Compatibility: Make sure the function of AVG() is applied to the column that contains numbers as the values. The usage of it beyond 
-- numerical columns will result in erroneous results hence.
-- Precision and Rounding: Since rounding is used in different cases, you can either keep the result of the AVG() function as it is, or you may 
-- round it to a specific number of decimal places so that the result is clear and consistent

-- 4. MIN() and MAX(): The MIN() and MAX() functions return the smallest and largest values, respectively, from a column.
-- MIN(column_name): Returns the minimum value.
-- MAX(column_name): Returns the maximum value.

-- Examples:
-- Find the highest salary
SELECT MAX(Salary) AS HighestSalary FROM Employee;

-- Find the lowest salary
SELECT MIN(Salary) AS LowestSalary FROM Employee;

-- 1. Count the Total Number of Employees:
SELECT COUNT(*) AS TotalEmployees FROM Employee;

-- 2. Calculate the Total Salary:
SELECT SUM(Salary) AS TotalSalary FROM Employee;

-- 3. Find the Average Salary:
SELECT AVG(Salary) AS AverageSalary FROM Employee;

-- 4. Find the Highest and Lowest Salary:
SELECT MAX(Salary) AS HighestSalary FROM Employee;

-- Using Aggregate Functions with GROUP BY:
-- Example: Total Salary by Each Employee:
SELECT Name, SUM(Salary) AS TotalSalary FROM Employee GROUP BY Name;

-- Using HAVING with Aggregate Functions:
-- Example: Find Employees with Salary Greater Than 600:
SELECT Name, SUM(Salary) AS TotalSalary
FROM Employee
GROUP BY
    Name
HAVING
    SUM(Salary) > 600;

-- Aggregate functions in SQL operate on a group of values and return a single result.
-- They are often used with the GROUP BY clause to summarize the grouped data.
-- Aggregate function operates on non-NULL values only (except COUNT).
-- Commonly used aggregate functions are – MIN(), MAX(), COUNT(), AVG(), and SUM().

