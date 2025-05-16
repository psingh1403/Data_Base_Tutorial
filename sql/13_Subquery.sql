-- subqueries are one of the most powerful and flexible tools for writing efficient queries. A subquery is essentially a query nested within
-- another query, allowing users to perform operations that depend on the results of another query. This makes it invaluable for tasks such
-- as filtering, calculating aggregates, or even modifying data dynamically.

-- Subquery: In SQL, a subquery can be defined as a query embedded within another query. It is often used in the WHERE, HAVING, or FROM clauses
-- of a statement. Subqueries are commonly used with SELECT, UPDATE, INSERT, and DELETE statements to achieve complex filtering and data
-- manipulation. They are an essential tool when we need to perform operations like:
-- Filtering: Getting specific records based on conditions derived from another query.
-- Aggregating: Performing aggregate functions like SUM, COUNT, or AVG based on subquery results.
-- Updating: Dynamically updating records based on values from other tables.
-- Deleting: Deleting records from one table using criteria based on another.

-- While there is no universal syntax for subqueries, they are commonly used in SELECT statements as follows. This general syntax allows the
-- outer query to use the results of the inner subquery for filtering or other operations.

-- Syntax:
-- SELECT column_name
-- FROM table_name
-- WHERE column_name expression operator
-- (SELECT column_name FROM table_name WHERE ...);

-- Key Characteristics of Subqueries:
-- Nested Structure: A subquery is executed within the context of an outer query.
-- Parentheses: Subqueries must always be enclosed in parentheses ().
-- Comparison Operators: Subqueries can be used with operators like =, >, <, IN, NOT IN, LIKE, etc.
-- Single-Row vs. Multi-Row Subqueries: Subqueries may return a single value (e.g., a single row) or multiple values. Depending on the result,
-- different SQL constructs may be required.

-- Common SQL Clauses for Subqueries: Subqueries are frequently used in specific SQL clauses to achieve more complex results. Here are the
-- common clauses where subqueries are used:
-- 1. WHERE Clause: Subqueries in the WHERE clause help filter data based on the results of another query. For example, you can filter
-- records based on values returned by a subquery.
-- 2. FROM Clause: Subqueries can be used in the FROM clause to treat the result of the subquery as a derived table or temporary table that
-- can be joined with other tables.
-- 3. HAVING Clause: Subqueries in the HAVING clause allow you to filter aggregated data after performing group operations.

-- Types of Subqueries:
-- Single-Row Subquery: Returns a single value (row). Useful with comparison operators like =, >, <.
-- Multi-Row Subquery: Returns multiple values (rows). Useful with operators like IN, ANY, ALL.
-- Correlated Subquery: Refers to columns from the outer query in the subquery. Unlike regular subqueries, the subquery depends on the outer
-- query for its values.
-- Non-Correlated Subquery: Does not refer to the outer query and can be executed independently.

-- Examples of Using SQL Subqueries:
-- Example 1: Fetching Data Using Subquery in WHERE Clause:
SELECT NAME, LOCATION, PHONE_NUMBER
FROM DATABASE
WHERE
    ROLL_NO IN (
        SELECT ROLL_NO
        FROM STUDENT
        WHERE
            SECTION = 'A'
    );

-- Using Subquery with INSERT:
INSERT INTO Student1 SELECT * FROM Student2;

-- Using Subquery with DELETE:
DELETE FROM Student2
WHERE
    ROLL_NO IN (
        SELECT ROLL_NO
        FROM Student1
        WHERE
            LOCATION = 'chennai'
    );

-- Example 4: Using Subquery with UPDATE:
UPDATE Student2
SET
    NAME = 'geeks'
WHERE
    LOCATION IN (
        SELECT LOCATION
        FROM Student1
        WHERE
            NAME IN ('Raju', 'Ravi')
    );

-- Tips for Writing Efficient Subqueries:
-- While subqueries are powerful, here are some best practices to ensure your queries are efficient and maintainable:
-- Avoid Nested Subqueries When Possible: Too many nested subqueries can slow down performance. Consider using JOIN operations if applicable.
-- Use EXISTS Instead of IN for Better Performance: When dealing with large datasets, EXISTS can sometimes be more efficient than IN,
-- especially when the subquery returns a large result set.
-- Use Aliases for Clarity: When using subqueries in the FROM clause, always use aliases to make your query more readable and maintainable.
-- Test with Different Scenarios: Always test your subqueries in different environments (e.g., development vs. production) to ensure they
-- perform well.

-- Correlated Subqueries: A correlated subquery is a subquery in SQL that refers to values from the outer query. The key difference between a
-- correlated subquery and a regular subquery is that a correlated subquery is evaluated for each row processed by the outer query. This makes
-- it dynamic, as it can return different results for each row depending on the values of the outer query.

-- Key characteristics:
-- Row-by-Row Evaluation: The subquery is executed once for each row in the outer query.
-- Dynamic and Dependent: The inner query uses values from the outer query, making it dependent on the outer query.
-- Used for Complex Filtering: Correlated subqueries are commonly used for row-specific filtering, ranking, or calculations based on other
-- related data.

-- Syntax:
-- SELECT column1, column2, ....
-- FROM table1 outer
-- WHERE column1 operator
--     (SELECT column1, column2
--         FROM table2
--         WHERE expr1 = outer.expr2);

-- A correlated subquery is one way of reading every row in a table and comparing values in each row against related data. It is used whenever
-- a subquery must return a different result or set of results for each candidate row considered by the main query. In other words, we can use
-- a correlated subquery to answer a multipart question whose answer depends on the value in each row processed by the parent statement.

-- Nested Subqueries Versus Correlated Subqueries
-- With a normal nested subquery, the inner SELECT query runs first and executes once, returning values to be used by the main query. A correlated
-- subquery, however, executes once for each candidate row considered by the outer query. In other words, the inner query is driven by the
-- outer query.

-- 1. Fetching Data Based on Row-Specific Conditions:
SELECT last_name, salary, department_id
FROM employees outer
WHERE
    salary > (
        SELECT AVG(salary)
        FROM employees
        WHERE
            department_id = outer.department_id
        group by
            department_id
    );

-- 2. Using Correlated Subqueries with UPDATE:
UPDATE employees e
SET
    salary = (
        SELECT AVG(salary)
        FROM employees
        WHERE
            department_id = e.department_id
    )
WHERE
    department_id = 101;

-- 3. Using Correlated Subqueries with DELETE:
-- DELETE FROM table1 alias1
-- WHERE column1 operator
--     (SELECT expression
--     FROM table2 alias2
--     WHERE alias1.column = alias2.column);

-- Nested Queries in SQL:
-- A nested query (also called a subquery) is a query embedded within another SQL query. The result of the inner query is used by the outer query
-- to perform further operations. Nested queries are commonly used for performing calculations, filtering data, or joining datasets indirectly
-- without explicitly using joins.

-- Key Characteristics of Nested Queries:
-- The inner query runs first, providing data for the outer query.
-- The output query uses the results of the inner query for comparison or as input.
-- Nested queries are particularly useful for breaking down complex problems into smaller, manageable parts, making it easier to retrieve
-- specific results from large datasets.

-- Types of Nested Queries in SQL: There are two primary types of nested queries in SQL, Independent Nested Queries and Correlated Nested Queries.
-- Each type has its own use case and benefits depending on the complexity of the task at hand.

-- Independent Nested Queries: In an independent nested query, the execution of the inner query is independent of the outer query. The inner
-- query runs first, and its result is used directly by the outer query. Operators like IN, NOT IN, ANY, and ALL are commonly used with
-- independent nested query.

-- Example 1: Using IN:
-- In this Example we will find the S_IDs of students who are enrolled in the courses ‘DSA’ or ‘DBMS’. We can break the query into two parts:

-- Step 1: Find the C_IDs of the courses:
-- This query retrieves the IDs of the courses named 'DSA' or 'DBMS' from the COURSE table.

SELECT C_ID FROM COURSE WHERE C_NAME IN ('DSA', 'DBMS');

-- Step 2: Use the result of Step 1 to find the corresponding S_IDs:
-- The inner query finds the course IDs, and the outer query retrieves the student IDs associated with those courses from the STUDENT_COURSE table

SELECT S_ID
FROM STUDENT_COURSE
WHERE
    C_ID IN (
        SELECT C_ID
        FROM COURSE
        WHERE
            C_NAME IN ('DSA', 'DBMS')
    );

-- Correlated Nested Queries: In correlated nested queries, the inner query depends on the outer query for its execution. For each row processed
-- by the outer query, the inner query is executed. This means the inner query references columns from the outer query. The EXISTS keyword is
-- often used with correlated queries.

-- Example 2: Using EXISTS:
-- In this Example, we will find the names of students who are enrolled in the course with C_ID = 'C1':

SELECT S_NAME
FROM STUDENT S
WHERE
    EXISTS (
        SELECT 1
        FROM STUDENT_COURSE SC
        WHERE
            S.S_ID = SC.S_ID
            AND SC.C_ID = 'C1'
    );

-- Common SQL Operators for Nested Queries:
-- 1. IN Operator: The IN operator is used to check whether a column value matches any value in a list of values returned by a subquery. This
-- operator simplifies queries by avoiding the need for multiple OR conditions.

SELECT S_NAME
FROM STUDENT
WHERE
    S_ID IN (
        SELECT S_ID
        FROM STUDENT_COURSE
        WHERE
            C_ID IN (
                SELECT C_ID
                FROM COURSE
                WHERE
                    C_NAME IN ('DSA', 'DBMS')
            )
    );
-- 2. NOT IN Operator: The NOT IN operator excludes rows based on a set of values from a subquery. It is particularly useful for filtering out
-- unwanted results. This operator helps identify records that do not match the conditions defined in the subquery.

SELECT S_ID
FROM STUDENT
WHERE
    S_ID NOT IN(
        SELECT S_ID
        FROM STUDENT_COURSE
        WHERE
            C_ID IN (
                SELECT C_ID
                FROM COURSE
                WHERE
                    C_NAME IN ('DSA', 'DBMS')
            )
    );

-- 3. EXISTS Operator: The EXISTS operator checks for the existence of rows in a subquery. It returns true if the subquery produces any rows, 
-- making it efficient for conditional checks. This operator is often used to test for relationships between tables.

SELECT S_NAME FROM STUDENT S
WHERE EXISTS (
  SELECT 1 FROM STUDENT_COURSE SC
  WHERE S.S_ID = SC.S_ID AND SC.C_ID = 'C1'
);
-- 4. ANY and ALL Operators:
-- ANY: Compares a value with any value returned by the subquery.
-- ALL: Compares a value with all values returned by the subquery.

-- Example using ANY:

SELECT S_NAME FROM STUDENT
WHERE S_AGE > ANY (
  SELECT S_AGE FROM STUDENT WHERE S_ADDRESS = 'DELHI'
);

-- Example using ALL:

SELECT S_NAME FROM STUDENT
WHERE S_AGE > ALL (
  SELECT S_AGE FROM STUDENT WHERE S_ADDRESS = 'DELHI'
);

-- Why Use Nested Queries?
-- You need to retrieve data based on the results of another query.
-- You want to perform filtering or aggregation without using joins.
-- You need to break down complex operations into smaller steps.

-- Advantages of Nested Queries:
-- Simplifies complex queries: Nested queries allow us to divide complicated SQL tasks into smaller, more manageable parts. This modular approach 
-- makes queries easier to write, debug, and maintain.
-- Enhances flexibility: By enabling the use of results from one query within another, nested queries allow dynamic filtering and indirect joins, 
-- which can simplify query logic.
-- Supports advanced analysis: Nested queries empower developers to perform operations like conditional aggregation, subsetting, and customized 
-- calculations, making them ideal for sophisticated data analysis tasks.
-- Improves readability: When properly written, nested queries can make complex operations more intuitive by encapsulating logic within inner queries.

-- Best Practices for Using Nested Queries:
-- Optimize independent queries: Use independent nested queries whenever possible, as they are easier to execute and debug. Ensure that inner 
-- queries are optimized for performance by adding appropriate indexes.
-- Prefer joins for simple queries: For cases where nested queries add unnecessary complexity, consider using joins instead. Joins are typically 
-- faster and more readable for straightforward relationships.
-- Avoid deep nesting: Limit the levels of nesting in queries to improve performance and maintain readability. Deeply nested queries can be 
-- computationally expensive and difficult to debug.
-- Use EXISTS and IN wisely: Choose the appropriate operator based on the scenario. Use EXISTS for checking existence and IN for comparing with a 
-- list of values.
-- Test query performance: Analyze the execution plan of our queries to identify bottlenecks and improve efficiency. Rewrite queries where 
-- necessary to enhance performance.
-- Maintain clarity: Use meaningful table aliases and comments to ensure that nested queries remain understandable to other developers or your 
-- future self.