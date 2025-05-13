-- AND Operator: -------------
-- The SQL AND operator is used to filter records that meet all specified conditions in a WHERE clause. This logical operator returns a
-- record only when all conditions connected by AND are TRUE. If any of the conditions are FALSE, the record will not be included in the
-- result set.

-- Syntax:
-- SELECT column1, column2, ...
-- FROM table_name
-- WHERE condition1 AND condition2 AND condition3 ...;

-- 1. Get all customers from Spain whose names start with 'G':
SELECT *
FROM Customers
WHERE
    Country = 'Spain'
    AND CustomerName LIKE 'G%';

-- AND vs OR Operators:
-- When we use the AND operator, all conditions must be TRUE for the record to be included in the result set. On the other hand, the OR
-- operator only requires one condition to be TRUE for a record to be returned.
-- AND operator: Displays records if all conditions are TRUE.
-- OR operator: Displays records if any condition is TRUE.

-- 1. AND Condition (Both Conditions Must Be True):
SELECT *
FROM Customers
WHERE
    Country = 'Spain'
    AND (
        CustomerName LIKE 'G%'
        OR CustomerName LIKE 'R%'
    );

-- 2. OR Condition (Any Condition Can Be True):
SELECT *
FROM Customers
WHERE
    Country = 'Spain'
    AND CustomerName LIKE 'G%'
    OR CustomerName LIKE 'R%';

-- OR Operator: -------------
-- The SQL OR operator is used to combine two or more conditions in a WHERE clause. It returns TRUE if any of the conditions in the clause
-- are satisfied. This allows us to broaden the criteria for a query, ensuring that we capture all records that match at least one of
-- the conditions.

-- Syntax:
-- SELECT column1, column2, ... FROM table_name
-- WHERE condition1 OR condition2 OR condition3 ...;

-- Example 1: Customers from Spain or Germany:
SELECT *
FROM Customers
WHERE
    Country = 'Spain'
    OR Country = 'Germany';

-- Example 2: Customers with Salary over $80,000 or from New York City:
SELECT
    first_name,
    last_name,
    department,
    city,
    salary
FROM employees
WHERE
    city = 'New York'
    OR salary > 80000;

-- Using the OR Operator in INSERT Statements:
-- Example 3: Insert Employee Record if Department is HR or Salary is above $60,000

INSERT INTO
    employees (
        employee_id,
        first_name,
        last_name,
        department,
        salary,
        city
    )
SELECT 49, 'Anna', 'Johnson', 'HR', 62000, 'New York'
WHERE
    'HR' = 'HR'
    OR 62000 > 60000;

-- Update Salary for Employees in Finance or Chicago:
UPDATE employees
SET
    salary = salary * 1.1
WHERE
    department = 'Finance'
    OR city = 'Chicago';

-- Delete Employees from Chicago or Earning $60,000:
DELETE FROM employees WHERE city = 'Chicago' OR salary = 60000;

-- Performance Considerations of SQL OR Queries:
-- 1. Full Table Scans: When using the OR operator on large datasets without proper indexing, the database may perform a full table scan, which
-- can slow down the query. To mitigate this, you should index the columns involved in the OR conditions.

-- 2. Complex Condition Evaluation: Using multiple conditions with OR can result in slower queries, especially when the conditions are complex or
-- the data set is large. One approach to improve performance is to break down complex queries into smaller subqueries or use the UNION operator.

-- 3. Redundant Conditions: Adding unnecessary OR conditions can significantly reduce query performance as the database engine must evaluate
-- each condition. Keep your queries simple and ensure only relevant conditions are included.

-- Alternatives to the OR Operator:
-- 1. Using the UNION Operator:
SELECT
    first_name,
    last_name,
    department,
    city
FROM employees
WHERE
    department = 'IT'
UNION
SELECT
    first_name,
    last_name,
    department,
    city
FROM employees
WHERE
    city = 'New York';

-- 2. Using CASE Statements:
SELECT
    first_name,
    last_name,
    CASE
        WHEN department = 'IT' THEN 'Tech'
        WHEN city = 'New York' THEN 'NYC'
        ELSE 'Other'
    END AS category
FROM employees;

-- LIKE Operator: -------------
-- SQL LIKE operator is used with the WHERE clause to search for a specified pattern in a column. LIKE operator finds and returns the rows that
-- fit in the given pattern.

-- LIKE operator is case-insensitive by default in most database systems. This means that if you search for "apple" using the LIKE operator, it
-- will return results that include "Apple", "APPLE", "aPpLe", and so on.

-- Syntax:
-- SELECT column1, column2, ... FROM table_name
-- WHERE column_name LIKE pattern;

SELECT * FROM products WHERE name LIKE BINARY 'apple%'

-- Wildcard Characters with the SQL LIKE Operator:
-- Wildcards are used with the LIKE operator to search for specific patterns in strings. Wildcard characters substitute one or more characters
-- in the string. There are four wildcard characters in SQL:
-- % (Percent): Represents zero or more characters.
-- _ (Underscore): Represents a single character.
-- [] (Square Brackets): Represents any single character within brackets.
-- - (Hyphen): Specify a range of characters inside brackets.

-- 'a%'	    Match strings that start with 'a'.
-- '%a'	    Match strings with end with 'a'.
-- 'a%t'	Match strings that contain the start with 'a' and end with 't'.
-- '%wow%'	Match strings that contain the substring 'wow' in them at any position.
-- '_wow%'	Match strings that contain the substring 'wow' in them at the second position.
-- '_a%'	Match strings that contain 'a' at the second position.
-- 'a_ _%'	Match strings that start with 'a and contain at least 2 more characters.

CREATE TABLE Supplier (
    SupplierID CHAR(2) PRIMARY KEY,
    Name VARCHAR(50),
    Address VARCHAR(100)
);

INSERT INTO
    Supplier (SupplierID, Name, Address)
VALUES (
        'S1',
        'Paragon Suppliers',
        '21-3, Okhla, Delhi'
    ),
    (
        'S2',
        'Mango Nation',
        '21, Faridabad, Haryana'
    ),
    (
        'S3',
        'Canadian Biz',
        '6/7, Okhla Phase II, Delhi'
    ),
    (
        'S4',
        'Caravan Traders',
        '2-A, Pitampura, Delhi'
    ),
    (
        'S5',
        'Harish and Sons',
        'Gurgaon, NCR'
    ),
    (
        'S6',
        'Om Suppliers',
        '2/1, Faridabad, Haryana'
    );

-- Example 1 : Match Names Starting with 'Ca':
SELECT SupplierID, Name, Address FROM Supplier WHERE Name LIKE 'Ca%';

-- Example 2: Match Addresses Containing 'Okhla':
SELECT * FROM Supplier WHERE Address LIKE '%Okhla%';

-- Example 3: Match Names Where 'ango' Appears in the Second Position:
SELECT SupplierID, Name, Address
FROM Supplier
WHERE
    Name LIKE '_ango%';

-- Example 4: Using LIKE with AND for Complex Conditions:
SELECT SupplierID, Name, Address
FROM Supplier
WHERE
    Address LIKE '%Delhi%'
    AND Name LIKE 'C%';

-- LIKE operator is used to search for specific patterns in a column.
-- It is mostly used with WHERE clause for finding or filtering specific data.
-- Like Operator is case-insensitive by default, to make it case sensitive, we can use BINARY keyword.
-- LIKE operator has 4 wild cards, which we can use with LIKE operator to specify the filter. The wild cards are: %,_,[] and -.

-- IN Operator: -------------
-- The IN Operator in SQL is used to specify multiple values/sub-queries in the WHERE clause. It provides an easy way to handle multiple
-- OR conditions.

-- Note: If any of the conditions are passed using the IN operator, they will be considered true.

-- Syntax:
-- SELECT column_name FROM table_name
-- WHERE condition IN (condition_value1, condition_value2 .....);

-- Example 1: Basic Use of the IN Operator:
SELECT Fname, Lname
FROM employee
WHERE
    Address IN ('Delhi', 'Himachal');

-- Example 2: SQL IN and NOT IN Operators:
SELECT Fname FROM employee WHERE Address NOT IN('Delhi', 'Lucknow');

SELECT * FROM employee WHERE Ssn IN ( SELECT Ssn FROM manager );

-- The SQL IN operator allows you to specify multiple values in a WHERE clause.
-- It checks if a specified value matches any value in a list.
-- It simplifies querying for records that match multiple criteria without needing to use multiple OR conditions.
-- The syntax is straightforward: WHERE column_name IN (value1, value2, ...).
-- It is commonly used with SELECT, INSERT, UPDATE, and DELETE statements for filtering or updating data based on multiple values.
-- Using the IN operator can make SQL queries more concise and readable.

-- SQL NOT Operator: -------------
-- The SQL NOT operator is used to reverse the boolean result of a condition in SQL. It helps in retrieving records that do not match a
-- specific condition. It is mostly used to specify what should not be included in the results table.

-- Syntax: SELECT column1, colomn2, … FROM table_name WHERE NOT condition;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    City VARCHAR(50),
    PostalCode VARCHAR(10),
    Country VARCHAR(50)
);

INSERT INTO
    Customers (
        CustomerID,
        CustomerName,
        City,
        PostalCode,
        Country
    )
VALUES (
        1,
        'John Wick',
        'New York',
        '1248',
        'USA'
    ),
    (
        2,
        'Around the Horn',
        'London',
        'WA1 1DP',
        'UK'
    ),
    (
        3,
        'Rohan',
        'New Delhi',
        '100084',
        'India'
    );

-- Using SQL NOT to Exclude a Specific Value:
SELECT * FROM Customers WHERE NOT Country = 'UK';

-- Using SQL NOT with IN Operator:
SELECT * FROM Customers WHERE NOT Country IN ('USA', 'UK');

-- Using SQL NOT with LIKE Operator:
SELECT * FROM Customers WHERE NOT CustomerName LIKE 'R%';

-- Using SQL NOT with NULL Values:
SELECT * FROM Customers WHERE NOT PostalCode IS NULL;

-- NOT operator returns opposite results or negative results. It negates boolean condition in the WHERE clause.
-- It is used to exclude specific data from the result set.
-- It can also be combined with other operators like- LIKE, BETWEEN, and IN.

-- NOT EQUAL Operator: -------------
-- NOT EQUAL Operator in SQL is used to compare two values and return if they are not equal. This operator returns boolean values. If given
-- expressions are equal, the operator returns false otherwise true. If any one expression is NULL, it will return NULL.

-- It performs type conversion when expressions are of different data types, for example, 5!= "Five".

-- Note: <> and != perform the same operation i.e. check inequality. The only difference between <> and != is that <> follows
-- the ISO standard but != does not. So it is recommended to use <> for NOT EQUAL Operator.

-- Syntax: SELECT * FROM table_name WHERE column_name != value;

-- SQL NOT EQUAL Operator For String:
SELECT * FROM students WHERE name != 'Harsh';

-- Note: The NOT EQUAL comparison is case-sensitive for strings. Meaning "geeks" and "GEEKS" are two different strings for NOT EQUAL operator.

-- SQL NOT EQUAL Operator with Multiple Condition:
SELECT *
FROM geeksforgeeks
WHERE
    contest_score != 98
    AND rank != 3
    AND coding_streak >= 100;

-- SQL NOT EQUAL Operator with GROUP BY Clause:
SELECT rank, COUNT(*) as count_score
FROM geeksforgeeks
WHERE
    contest_score <> 100
GROUP BY
    rank;

-- SQL NOT EQUAL Operator is a comparison operator denoted as != or <>. It returns boolean values i.e. True or False.
-- It returns False when the compared expressions are equal otherwise it returns True.
-- We use this operator with the WHERE clause.
-- We can use this operator for integers and strings-based logical reasoning. It is case-sensitive for string comparisons.
-- We can put multiple conditions using the AND or OR operator.

-- IS NULL Operator: -------------
-- The IS NULL operator is used to check if a column contains a NULL value. If a column value is NULL, the operator returns TRUE; otherwise, it
-- returns FALSE. It's commonly used in WHERE clauses to filter rows that contain NULL values in specific columns.

-- Syntax: SELECT * FROM table_name WHERE column_name IS NULL;

-- Note: A NULL value is different from a Zero Value and Blank Spaces. A field that has NULL value means the field was left blank.

CREATE TABLE geeksforgeeks (
    user_id int PRIMARY KEY,
    name varchar(100),
    problems_solved int,
    coding_score int,
    email varchar(100)
);

INSERT INTO
    geeksforgeeks (
        user_id,
        name,
        problems_solved,
        coding_score,
        email
    )
VALUES (
        101,
        'Vishu',
        20,
        100,
        'example1@gamil.com'
    ),
    (102, 'Sumit', 19, 99, NULL),
    (
        103,
        'Neeraj',
        18,
        98,
        'example2@gamil.com'
    ),
    (104, 'Aayush', 17, 97, NULL),
    (
        105,
        'Harsh',
        16,
        NULL,
        'example3@gamil.com'
    ),
    (
        106,
        'Rahul',
        15,
        NULL,
        'example4@gamil.com'
    ),
    (107, 'Vivek', 14, 90, NULL);

SELECT * FROM geeksforgeeks;

-- IS NULL with WHERE clause:
SELECT * FROM geeksforgeeks WHERE email IS NULL;

-- IS NULL Operator on Multiple Columns:
SELECT *
FROM geeksforgeeks
WHERE
    email IS NULL
    OR coding_score IS NULL;

-- IS NULL with COUNT() Function:
SELECT COUNT(*) AS count_empty_coding_score
FROM students
WHERE
    coding_score IS NULL;

-- SQl IS NULL is used to detect any rows that contain a NULL value in its column.
-- IS NULL operator is mostly used with WHERE clause in SQL.
-- We can use IS NULL operator on multiple columns using OR operator.
-- Using COUNT function we can count total number of NULL values in SQL.
-- We can UPDATE or DELETE the NULL values, after filtering them with IS NULL operator.

-- UNION Operator: -------------
-- The SQL UNION operator combines the results of two or more SELECT statements into one result set. By default, UNION removes duplicate rows,
-- ensuring that the result set contains only distinct records.

-- Rules for SQL UNION:
-- Each table used within UNION must have the same number of columns.
-- The columns must have the same data types.
-- The columns in each table must be in the same order.

-- Syntax:
-- SELECT columnnames FROM table1
-- UNION
-- SELECT columnnames FROM table2;

-- UNION operator provides unique values by default. To find duplicate values, use UNION ALL.

-- Note: SQL UNION and UNION ALL difference is that UNION operator removes duplicate rows from results set and UNION ALL operator retains all
-- rows, including duplicate.

-- Examples of SQL UNION:
CREATE TABLE Emp2 (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    Country VARCHAR(50),
    Age int(2),
    mob int(10)
);
-- Insert some sample data into the Customers table
INSERT INTO
    Emp2 (
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

SELECT * FROM Emp2;

CREATE TABLE Emp3 (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    Country VARCHAR(50),
    Age int(2),
    mob int(10)
);
-- Insert some sample data into the Customers table
INSERT INTO
    Emp3 (
        EmpID,
        Name,
        Country,
        Age,
        mob
    )
VALUES (
        1,
        'Tommy',
        'England',
        '23',
        '738985734'
    ),
    (
        2,
        'Allen',
        'France',
        '21',
        '43678055'
    ),
    (
        3,
        'Nancy',
        'India',
        '24',
        '34873847'
    ),
    (
        4,
        'Adi',
        'Ireland',
        '21',
        '320254934'
    ),
    (
        5,
        'Sandy',
        'Spain',
        '22',
        '70248679'
    );

SELECT * FROM Emp3;

-- SQL UNION Operator:
SELECT Country FROM Emp1
UNION
SELECT Country FROM Emp2
ORDER BY Country;

-- SQL UNION ALL:
SELECT Country FROM Emp1 
UNION ALL
SELECT Country FROM Emp2 
ORDER BY Country;

-- SQL UNION ALL with WHERE:
SELECT Country, Name FROM Emp1
WHERE Name='Aditya'
UNION ALL
SELECT Country, Name FROM Emp2
WHERE Country='Ireland'
ORDER BY Country;

-- The SQL UNION operator combines the result sets of two or more SELECT queries.
-- UNION returns unique rows, eliminating duplicate entries from the result set.
-- UNION ALL includes all rows, including duplicate rows.
-- Columns in the result set must be in the same order and have the same data types.
-- UNION is useful for aggregating data from multiple tables or applying different filters to data from the same table.

-- UNION ALL Operator: -------------
-- The SQL UNION ALL command combines the result of two or more SELECT statements in SQL.
-- For performing the UNION ALL operation, it is necessary that both the SELECT statements should have an equal number of columns/fields, 
-- otherwise, the resulting expression will result in an error.

-- Syntax: SELECT columns FROM table1
-- UNION ALL
-- SELECT columns FROM table2;

-- Single Field With Same Name:
SELECT NAME FROM STUDENTS
UNION ALL
SELECT NAME FROM TRIP_DETAIL;

-- Different Field Names:
SELECT ROLL_NO AS Identifier FROM STUDENTS
UNION ALL
SELECT ROLL_NO AS Identifier FROM TRIP_DETAIL;

-- UNION ALL command helps us to combine results of two or more SELECT statements from different tables.
-- The UNION ALL command includes the duplicate records from the SELECT statements whereas the UNION command does not include duplicate records 
-- otherwise both the commands are same.
-- For performing the UNION ALL operation, it is necessary that both the SELECT statements should have equal number of columns otherwise the 
-- resulting expression will result in an error.

-- SQL UNION All vs UNION:
-- UNION ALL:
-- Includes all duplicates.
-- Faster, as it doesn't check for duplicates.
-- When duplicates are acceptable or needed.
-- SELECT columns FROM table1 UNION ALL SELECT columns FROM table2;
-- Generally lower, since no extra processing for duplicates.
-- Combined rows from all SELECT statements, including duplicates.
-- Useful for large datasets where performance is critical and duplicates are acceptable.

-- UNION:
-- Removes duplicate records.
-- Slower, as it needs to eliminate duplicates.
-- When duplicates need to be removed.
-- SELECT columns FROM table1 UNION SELECT columns FROM table2;
-- Higher, due to additional steps for duplicate removal
-- Combined rows from all SELECT statements, without duplicates
-- Useful when data integrity requires unique records in the result set

