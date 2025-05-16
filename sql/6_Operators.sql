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
SELECT Country
FROM Emp1
UNION
SELECT Country
FROM Emp2
ORDER BY Country;

-- SQL UNION ALL:
SELECT Country
FROM Emp1
UNION ALL
SELECT Country
FROM Emp2
ORDER BY Country;

-- SQL UNION ALL with WHERE:
SELECT Country, Name
FROM Emp1
WHERE
    Name = 'Aditya'
UNION ALL
SELECT Country, Name
FROM Emp2
WHERE
    Country = 'Ireland'
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
SELECT NAME FROM STUDENTS UNION ALL SELECT NAME FROM TRIP_DETAIL;

-- Different Field Names:
SELECT ROLL_NO AS Identifier
FROM STUDENTS
UNION ALL
SELECT ROLL_NO AS Identifier
FROM TRIP_DETAIL;

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

-- SQL EXCEPT: -------------
-- The SQL EXCEPT operator allows you to return the rows that exist in the first result set but not in the second. It is useful for finding records
-- in one table that do not have corresponding records in another table.

-- Syntax:
-- SELECT column_name(s) FROM table1
-- EXCEPT
-- SELECT column_name(s) FROM table2;

-- Note: The two SELECT queries must return the same number of columns and the data types must be compatible.

CREATE TABLE Students_tab (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Course VARCHAR(100)
);

-- Insert Data into Students Table
INSERT INTO
    Students_tab (StudentID, Name, Course)
VALUES (1, 'Rohan', 'DBMS'),
    (2, 'Kevin', 'OS'),
    (3, 'Mansi', 'DBMS'),
    (4, 'Mansi', 'ADA'),
    (5, 'Rekha', 'ADA'),
    (6, 'Megha', 'OS');

CREATE TABLE TA (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Course VARCHAR(100)
);

-- Insert Data into TA Table
INSERT INTO
    TA (StudentID, Name, Course)
VALUES (1, 'Kevin', 'TOC'),
    (2, 'Sita', 'IP'),
    (3, 'Manik', 'AP'),
    (4, 'Rekha', 'SNS');

-- Filter Student:
SELECT Name FROM Students_tab EXCEPT SELECT Name FROM TA;

-- Retaining Duplicates with EXCEPTALL: By default, EXCEPT removes duplicates from the result set. To retain duplicates, you can use EXCEPT
-- ALL instead.

SELECT Name FROM Students_tab EXCEPT ALL SELECT Name FROM TA;

-- SQL EXCEPT vs. SQL NOT IN:
-- EXCEPT:
-- Removes duplicates from the result.
-- Generally more efficient for large datasets as it processes only the required rows.
-- When you need to find rows that exist in one result set but not the other.
-- Not supported by MySQL.

-- NOT IN:
-- Retains duplicates in the result.
-- May be slower for large datasets, especially when checking multiple conditions.
-- When you need to check a specific column’s values against a list.
-- Supported by most SQL databases.

-- EXCEPT returns rows from the first result set that are not in the second result set.
-- EXCEPT automatically removes duplicates, while EXCEPT ALL retains duplicates.
-- EXCEPT requires both queries to have the same number of columns and compatible data types.
-- EXCEPT is not supported in MySQL, while NOT IN can be used as an alternative.
-- Use EXCEPT when you need to exclude certain rows efficiently from the first result set, especially in larger datasets.

-- BETWEEN Operator: -------------
-- The SQL BETWEEN operator is used to filter the result set within a specified range.
-- It can be applied to numeric, date, and text columns.
-- The BETWEEN operator is inclusive, meaning it includes the start and end values in the result set.

-- Syntax:
-- SELECT column_name(s) FROM table_name
-- WHERE column_name BETWEEN value1 AND value2;

-- NOT BETWEEN Text Values:

SELECT FirstName, LastName
FROM Employees
WHERE
    LastName NOT BETWEEN 'B' AND 'S';

--  BETWEEN Dates:
SELECT FirstName, LastName, HireDate
FROM Employees
WHERE
    HireDate BETWEEN '2020-01-01' AND '2021-12-31';

-- NOT BETWEEN:
SELECT FirstName, LastName, Age
FROM Employees
WHERE
    Age NOT BETWEEN 30 AND 40;

-- BETWEEN with IN:
SELECT FirstName, LastName, Salary
FROM Employees
WHERE
    Salary BETWEEN 50000 AND 70000
    AND FirstName IN ('John', 'Sue', 'Tom');

-- ALL Operator: -------------
-- The ALL operator is used to compare a value with all the values returned by a subquery. The condition will be evaluated to TRUE if the value
-- meets the specified condition for every value in the result set of the subquery.
-- The ALL must be preceded by comparison operators and evaluates true if all of the subqueries values meet the condition.
-- ALL is used with SELECT, WHERE, and HAVING statements.

-- Syntax:
-- SELECT column_name(s) FROM table_name
-- WHERE column_name comparison_operator ALL
-- (SELECT column_name FROM table_name WHERE condition(s));

-- Retrieve all product names from the Products table:
SELECT ALL ProductName FROM Products WHERE TRUE;

-- Retrieve product names if all records in the OrderDetails table have a quantity of 6 or 2:
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

-- Find the OrderIDs where the maximum quantity in the order exceeds the average quantity of all orders:
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

-- ANY Operator: -------------
-- ANY compares a value to each value in a list or results from a query and evaluates to true if the result of an inner query contains at least
-- one row.
-- ANY return true if any of the subqueries values meet the condition.
-- ANY must be preceded by comparison operators.

-- Syntax:
-- SELECT column_name(s) FROM table_name
-- WHERE column_name comparison_operator ANY
-- (SELECT column_name FROM table_name WHERE condition(s));

-- Find distinct category IDs of products that appear in the OrderDetails table:
SELECT DISTINCT
    CategoryID
FROM Products
WHERE
    ProductID = ANY (
        SELECT ProductID
        FROM OrderDetails
    );

-- Find product names with a quantity of 9 in the OrderDetails table:
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

-- SQL INTERSECT: -------------
-- The INTERSECT clause in SQL is used to combine two SELECT statements but the dataset returned by the INTERSECT statement will be the
-- intersection of the data sets of the two SELECT statements. In simple words, the INTERSECT statement will return only those rows that will be
-- common to both of the SELECT statements.

-- The INTERSECT operator is a set operation in SQL, similar to UNION and EXCEPT. While UNION combines results from two queries and removes
-- duplicates, INTERSECT returns only the records that exist in both queries, ensuring uniqueness.

-- Key Characteristics of SQL INTERSECT:
-- Returns only the common rows between two result sets.
-- Ensures uniqueness by automatically removing duplicate rows.
-- Requires that both SELECT statements have the same number of columns.
-- The data types of corresponding columns in both queries must be compatible.

-- Syntax:
-- SELECT column1 , column2 …. FROM table1 WHERE condition
-- INTERSECT
-- SELECT column1 , column2 …. FROM table2 WHERE condition

-- Basic INTERSECT Query:
SELECT CustomerID
FROM Customers INTERSECT
SELECT CustomerID
FROM Orders;

-- Using INTERSECT with BETWEEN Operator:
SELECT CustomerID
FROM Customers
WHERE
    CustomerID BETWEEN 3 AND 8  INTERSECT
SELECT CustomerID
FROM Orders;

-- Column Count & Data Types: Both SELECT statements must have the same number of columns with compatible data types.
-- Performance Considerations: INTERSECT can be slower on large datasets as it performs row-by-row comparison. Indexing can help optimize
-- performance.
-- NULL Handling: Unlike comparison operators, INTERSECT treats NULL values as equal, meaning if both queries return a row with NULL, it will
-- be included in the result.
-- Alternative Approach: In cases where INTERSECT is not supported (e.g., MySQL), you can achieve the same result usingINNER JOIN.

-- SQL EXISTS: -------------
-- The EXISTS condition is primarily used to check the existence of rows returned by a subquery. It’s commonly used in scenarios where you need to
-- check if a record exists in a related table, and you want to perform an action based on that result.

-- Syntax:
-- SELECT column_name(s) FROM table_name
-- WHERE EXISTS (SELECT column_name(s) FROM subquery_table WHERE condition);

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

-- Using EXISTS condition with DELETE statement:
DELETE FROM Orders
WHERE
    EXISTS (
        SELECT *
        FROM customers
        WHERE
            Customers.customer_id = Orders.c_id
            AND Customers.lname = 'Mehra'
    );

-- Using EXISTS condition with UPDATE statement:
UPDATE Customers
SET
    lname = 'Kumari'
WHERE
    EXISTS (
        SELECT *
        FROM Customers
        WHERE
            customer_id = 401
    );

-- Checking Data Existence: You can use EXISTS to check if related data exists in another table before performing an action (e.g., selecting,
-- updating, deleting).
-- Performance: EXISTS is often more efficient than using IN when dealing with large datasets, as it stops searching once a match is found.
-- Correlated Subqueries: EXISTS is ideal for correlated subqueries, where the subquery refers to the outer query’s values.

-- Differences Between EXISTS and IN:
-- EXISTS is used for checking the existence of rows, while IN checks if a value matches any value from a list or subquery result.
-- EXISTS is more efficient when the subquery results in a large number of rows.
-- IN works well for small datasets or static lists of values.

-- CASE Statement in SQL: -------------
-- The CASE statement in SQL is a conditional expression that allows you to perform conditional logic within a query.
-- It is commonly used to create new columns based on conditional logic, provide custom values, or control query outputs based on certain conditions.
-- If no condition is true then the ELSE part will be executed. If there is no ELSE part then it returns NULL.

-- Syntax:
-- CASE case_value
-- WHEN condition THEN result1
-- WHEN condition THEN result2
-- …
-- Else result
-- END CASE;

CREATE TABLE Customer_demo (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    LastName VARCHAR(50),
    Country VARCHAR(50),
    Age int(2),
    Phone varchar(10)
);
-- Insert some sample data into the Customers table
INSERT INTO
    Customer_demo (
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

-- Simple CASE Expression:
SELECT
    CustomerName,
    Age,
    CASE
        WHEN Country = "India" THEN 'Indian'
        ELSE 'Foreign'
    END AS Nationality
FROM Customer;

-- SQL CASE When Multiple Conditions:
SELECT
    CustomerName,
    Age,
    CASE
        WHEN Age > 22 THEN 'The Age is greater than 22'
        WHEN Age = 21 THEN 'The Age is 21'
        ELSE 'The Age is over 30'
    END AS QuantityText
FROM Customer;

-- CASE Statement With ORDER BY Clause:
SELECT CustomerName, Country
FROM Customer
ORDER BY (
        CASE
            WHEN Country IS "India" THEN Country
            ELSE Age
        END
    );

-- The SQL CASE statement is a conditional expression that allows for the execution of different queries based on specified conditions.
-- There should always be a SELECT in the CASE statement.
-- END ELSE is an optional component but WHEN THEN these cases must be included in the CASE statement.
-- We can make any conditional statement using any conditional operator (like WHERE ) between WHEN and THEN. This includes stringing together 
-- multiple conditional statements using AND and OR.
-- We can include multiple WHEN statements and an ELSE statement to counter with unaddressed conditions.

