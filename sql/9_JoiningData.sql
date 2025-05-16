-- What is SQL Join: -----------
-- An SQL JOIN clause is used to query and access data from multiple tables by establishing logical relationships between them. It can access
-- data from multiple tables simultaneously using common key values shared across different tables. We can use SQL JOIN with multiple tables.
-- It can also be paired with other clauses, the most popular use will be using JOIN with WHERE clause to filter data retrieval.

-- Before diving into the specifics, let's visualize how each join type operates:
-- INNER JOIN: Returns only the rows where there is a match in both tables.
-- LEFT JOIN (LEFT OUTER JOIN): Returns all rows from the left table, and the matched rows from the right table. If there's no match, NULL
-- values are returned for columns from the right table.
-- RIGHT JOIN (RIGHT OUTER JOIN): Returns all rows from the right table, and the matched rows from the left table. If there's no match, NULL
-- values are returned for columns from the left table.
-- FULL JOIN (FULL OUTER JOIN): Returns all rows when there is a match in one of the tables. If there's no match, NULL values are returned
-- for columns from the table without a match.

-- 1. SQL INNER JOIN: The INNER JOIN keyword selects all rows from both the tables as long as the condition is satisfied. This keyword will
-- create the result-set by combining all rows from both the tables where the condition satisfies i.e value of the common field will be the same.

-- Syntax:
-- SELECT table1.column1, table1.column2, table2.column1,....
-- FROM table1
-- INNER JOIN table2 ON
-- table1.matching_column = table2.matching_column;

-- Note: We can also write JOIN instead of INNER JOIN. JOIN is same as INNER JOIN.

-- Example of INNER JOIN:
-- Consider the two tables, Student and StudentCourse, which share a common column ROLL_NO. Using SQL JOINS, we can combine data from these tables
-- based on their relationship, allowing us to retrieve meaningful information like student details along with their enrolled courses.

SELECT StudentCourse.COURSE_ID, Student.NAME, Student.AGE
FROM Student
    INNER JOIN StudentCourse ON Student.ROLL_NO = StudentCourse.ROLL_NO;

-- 2. SQL LEFT JOIN: A LEFT JOIN returns all rows from the left table, along with matching rows from the right table. If there is no match,
-- NULL values are returned for columns from the right table. LEFT JOIN is also known as LEFT OUTER JOIN.

-- Syntax:
-- SELECT table1.column1,table1.column2,table2.column1,....
-- FROM table1
-- LEFT JOIN table2
-- ON table1.matching_column = table2.matching_column;

-- Note: We can also use LEFT OUTER JOIN instead of LEFT JOIN, both are the same.

SELECT Student.NAME, StudentCourse.COURSE_ID
FROM Student
    LEFT JOIN StudentCourse ON StudentCourse.ROLL_NO = Student.ROLL_NO;

-- Examples of SQL LEFT JOIN:
CREATE TABLE Emp_two (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    Country VARCHAR(50),
    Age INT,
    Salary INT,
    department_id INT
);

INSERT INTO
    Emp_two (
        EmpID,
        Name,
        Country,
        Age,
        Salary,
        department_id
    )
VALUES (
        1,
        'Shubham',
        'India',
        23,
        30000,
        101
    ),
    (
        2,
        'Aman',
        'Australia',
        21,
        45000,
        102
    ),
    (
        3,
        'Naveen',
        'Sri Lanka',
        24,
        40000,
        103
    ),
    (
        4,
        'Aditya',
        'Austria',
        21,
        35000,
        104
    ),
    (
        5,
        'Nishant',
        'Spain',
        22,
        25000,
        101
    );

-- Department Table:

CREATE TABLE department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    department_head VARCHAR(50),
    location VARCHAR(50)
);

INSERT INTO
    department (
        department_id,
        department_name,
        department_head,
        location
    )
VALUES (
        101,
        'Sales',
        'Sarah',
        'New York'
    ),
    (
        102,
        'Marketing',
        'Jay',
        'London'
    ),
    (
        103,
        'Finance',
        'Lavish',
        'San Francisco'
    ),
    (
        104,
        'Engineering',
        'Kabir',
        'Bangalore'
    );

SELECT * FROM department;

-- Example 1: Performing a LEFT JOIN:
SELECT Emp_two.EmpID, Emp_two.Name, department.department_name, department.department_head, department.location
FROM Emp_two
    LEFT JOIN department ON Emp_two.department_id = department.department_id;

-- Example 2: SQL LEFT JOIN with WHERE Clause:
SELECT e.EmpID, e.Name, d.department_name, d.department_head, d.location
FROM Emp_two e
    LEFT JOIN department d ON e.department_id = d.department_id
WHERE
    d.location = 'Bangalore';

-- Example 3: SQL LEFT JOIN as Aliases:
SELECT e.EmpID, e.Name, d.department_name, d.department_head, d.location
FROM Emp e
    LEFT JOIN department d ON e.department_id = d.department_id;

-- Important Points About SQL LEFT JOIN:
-- LEFT JOIN in SQL returns all records from the left table and matching records from the right table.
-- NULL values are included for unmatched records on the right side.
-- LEFT JOIN is used to combine data based on related columns.
-- Aliases can simplify queries with long table names.
-- LEFT JOIN with WHERE clause is used for filtering records.

-- 3. SQL RIGHT JOIN: RIGHT JOIN returns all the rows of the table on the right side of the join and matching rows for the table on the left
-- side of the join. It is very similar to LEFT JOIN for the rows for which there is no matching row on the left side, the result-set will
-- contain null. RIGHT JOIN is also known as RIGHT OUTER JOIN.

-- Syntax:
-- SELECT table1.column1, table1.column2, table2.column1,....
-- FROM table1
-- RIGHT JOIN table2
-- ON table1.matching_column = table2.matching_column;

-- Note: We can also use RIGHT OUTER JOIN instead of RIGHT JOIN, both are the same.

SELECT Student.NAME, StudentCourse.COURSE_ID
FROM Student
    RIGHT JOIN StudentCourse ON StudentCourse.ROLL_NO = Student.ROLL_NO;

-- Applications of SQL RIGHT JOIN:
-- Merging Data: Allows to merge data from different tables in database.
-- Ensuring Completeness: A RIGHT JOIN ensures that all records from the right table are included in the result, even if there are no
-- corresponding matches in the left table
-- Handling Missing Values: Allows to look for missing values in one of the table. For example, combining customer and orders table allows to look
-- at customers and their orders.
-- Analyzing Relationships: Useful in finding patterns and relations between data.

-- Important Points About SQL RIGHT JOIN:
-- Right JOIN allows to join two table, keeping all the data or right table and only matching data of left table.
-- Right JOIN is a type of outer join in SQL.
-- It allows us to deal with missing values in database and also helps in analyzing relationships between data.
-- Simplifies queries by eliminating the need for complex conditional logic using CASE statements.

-- 4. SQL FULL JOIN: FULL JOIN creates the result-set by combining results of both LEFT JOIN and RIGHT JOIN. The result-set will contain all the
-- rows from both tables. For the rows for which there is no matching, the result-set will contain NULL values.

-- Syntax:
-- SELECT table1.column1,table1.column2,table2.column1,....
-- FROM table1
-- FULL JOIN table2
-- ON table1.matching_column = table2.matching_column;

SELECT Student.NAME, StudentCourse.COURSE_ID
FROM Student FULL
    JOIN StudentCourse ON StudentCourse.ROLL_NO = Student.ROLL_NO;

-- Example 1: Joining Multiple Tables with Full Join:
SELECT b.BOOK_ID, b.BOOK_NAME, a.AUTHOR_NAME, p.PUBLISHER_NAME
FROM
    Books b FULL
    JOIN Authors a ON b.BOOK_ID = a.AUTHOR_ID FULL
    JOIN Publishers p ON b.BOOK_ID = p.PUBLISHER_ID;

-- Example 2: Full Join with WHERE Clause:
SELECT b.BOOK_ID, b.BOOK_NAME, a.AUTHOR_NAME, p.PUBLISHER_NAME
FROM
    Books b FULL
    JOIN Authors a ON b.BOOK_ID = a.AUTHOR_ID FULL
    JOIN Publishers p ON b.BOOK_ID = p.PUBLISHER_ID
WHERE
    b.BOOK_NAME LIKE '%Sharma%';

-- 5. SQL Natural Join (?): Natural join can join tables based on the common columns in the tables being joined. A natural join returns all rows
-- by matching values in common columns having same name and data type of columns and that column should be present in both tables.

-- Both table must have at least one common column with same column name and same data type.
-- The two table are joined using Cross join.
-- DBMS will look for a common column with same name and data type. Tuples having exactly same values in common columns are kept in result.

-- Outer Join: Outer Join ensures that all rows from one or both tables are included in the result, even if there is no match in the other
-- table. It is particularly useful when you need to show all records from one table, including those that don't have a match in the other table.

-- Types of Outer Joins:
-- 1. LEFT OUTER JOIN (or LEFT JOIN).
-- 2. RIGHT OUTER JOIN (or RIGHT JOIN).
-- 3. FULL OUTER JOIN.

-- LEFT OUTER JOIN (or LEFT JOIN): The LEFT OUTER JOIN (referred to as LEFT JOIN) returns all rows from the left table, and the matching rows
-- from the right table. If there is no match, the result will include NULL values for columns from the right table.

-- Syntax:
-- SELECT table1.column1, table1.column2, table2.column1, ...
-- FROM table1
-- LEFT JOIN table2
-- ON table1.matching_column = table2.matching_column;

SELECT Employees.Name, Employees.DepartmentID, Departments.DepartmentName
FROM Employees
    LEFT JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;

-- RIGHT OUTER JOIN (RIGHT JOIN): The RIGHT OUTER JOIN (often called RIGHT JOIN) returns all rows from the right table, and the matching rows
-- from the left table. If there is no match, the result will include NULL values for columns from the left table.

-- Syntax:
-- SELECT table1.column1, table1.column2, table2.column1, ...
-- FROM table1
-- RIGHT JOIN table2
-- ON table1.matching_column = table2.matching_column;

SELECT Employees.Name, Employees.DepartmentID, Departments.DepartmentName
FROM Employees
    RIGHT JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;

-- FULL OUTER JOIN: The FULL OUTER JOIN returns all rows when there is a match in either the left or right table. If there is no match, the
-- result will include NULL for the missing side of the table. Essentially, it combines the results of both LEFT JOIN and RIGHT JOIN.

-- Syntax:
-- SELECT table1.column1, table1.column2, table2.column1, ...
-- FROM table1
-- FULL JOIN table2
-- ON table1.matching_column = table2.matching_column;

SELECT Employees.Name, Employees.DepartmentID, Departments.DepartmentName
FROM Employees FULL
    JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;

-- When to Use SQL Outer Joins:
-- Incomplete Data: When you need to include all records from one table even if there is no match in the other table. For example, when retrieving
-- all employees and their assigned departments, including employees without departments.
-- Data Integrity Issues: When working with datasets that might have missing or incomplete relationships, outer joins can help ensure you don’t
-- miss out on important records.
-- Reporting and Analysis: When generating reports that need to show all records, regardless of matching conditions, such as when summarizing
-- employee data alongside department data.
-- Data Merging: When merging datasets from different sources where some records might not have corresponding matches.

-- CROSS JOIN: Cross Join in SQL produces a result set that contains the cartesian product of two or more tables. Cross join is also called a
-- Cartesian Join. When CROSS JOIN is used with a WHERE clause, it behaves like INNER JOIN, filtering the results based on specific conditions.
-- CROSS JOIN is the best choice when we need to match each row of one table to every other row of another table. It is helpful in many applicati
-- ons where we need to obtain paired combinations of records.

-- Syntax:
-- SELECT * FROM table1 CROSS JOIN table2;

-- Examples of SQL CROSS JOIN:
-- Example 1: CROSS JOIN:
SELECT * FROM CUSTOMER CROSS JOIN ORDERS;

-- Important Points About CROSS JOIN:
-- CROSS JOIN performs the cross-product of records from two or more joined tables.
-- It is used when we want every possible combination of rows to be present in a database's tables.
-- SQL CROSS JOIN with condition of WHERE Clause operates as an INNER JOIN; when used without one, it produces the cartesian product of all the
-- rows from all the tables provided in the SQL query.
-- CROSS JOIN is different from other join types like INNER JOIN, LEFT JOIN, and RIGHT JOIN, as it does not require a matching condition between
-- the tables.

-- SQL Self Join: A Self Join is simply a regular join operation where a table is joined with itself. This allows us to compare rows within the
-- same table, which is particularly useful when working with hierarchical data or when comparing related rows from a single table.

-- For example, a Self Join can help us retrieve employee-manager relationships, where each employee in the table has a reference to their
-- manager's ID.

-- Syntax:
-- SELECT columns FROM table AS alias1
-- JOIN table AS alias2 ON alias1.column = alias2.column;

-- SQL Self Join to Retrieve Employees and Their Managers:
SELECT
    e.employee_name AS employee,
    m.employee_name AS managerFROM GFGemployees AS e
    JOIN GFGemployees AS m ON e.manager_id = m.employee_id;

-- Applications of SQL Self Join:
-- Hierarchical Data: Self joins are particularly useful when working with hierarchical data such as organizational structures, where each
-- employee has a manager.
-- Finding Relationships: Self joins can be used to find relationships within the same table, such as identifying employees with similar attributes
-- or roles.
-- Data Comparison: Self joins allow comparing records within the same table based on specific conditions, like comparing sales figures of
-- employees working in the same department.

-- UPDATE with JOIN: The UPDATE with JOIN statement enables us to modify records in a table using a JOIN operation. It combines data from two or
-- more tables based on a matching condition (e.g., INNER JOIN, LEFT JOIN) and updates the specified columns in one table. SQL UPDATE JOIN could
-- be used to update one table using another table and join condition.

-- Syntax:
-- UPDATE target_table
-- SET target_table.column_name = source_table.column_name,
--     target_table.column_name2 = source_table.column_name2
-- FROM target_table
-- INNER JOIN source_table
-- ON target_table.column_name = source_table.column_name
-- WHERE condition;

-- Example:
UPDATE Geeks1
SET
    col2 = Geeks2.col2,
    col3 = Geeks2.col3
FROM Geeks1
    INNER JOIN Geeks2 ON Geeks1.col1 = Geeks2.col1
WHERE
    Geeks1.col1 IN (21, 31);

-- SQL UPDATE with JOIN Using LEFT JOIN:
-- Sometimes you may need to update records in the target table even if there is no match in the source table. In such cases, we can use LEFT JOIN.

-- Syntax:
-- UPDATE target_table
-- SET target_table.column_name = source_table.column_name
-- FROM target_table
-- LEFT JOIN source_table
-- ON target_table.column_name = source_table.column_name;

-- Example:
UPDATE Geeks1
SET
    col2 = ISNULL(Geeks2.col2, 0)
FROM Geeks1
    LEFT JOIN Geeks2 ON Geeks1.col1 = Geeks2.col1;

-- DELETE JOIN: The DELETE JOIN operation in SQL delete rows from a table while considering conditions that involve another table. By combining
-- DELETE with JOIN, we can efficiently manage related data across tables. This method allows us to join two or more tables and delete rows from
-- the primary table that meet specific criteria, ensuring that the integrity of related data is maintained while removing unnecessary or
-- outdated information.

-- While we can join multiple tables in the FROM clause, we can only specify one table in the DELETE clause. This means that although multiple
-- tables can be used to define conditions for deletion, the rows can only be deleted from a single, explicitly stated table.

-- Key Features of DELETE JOIN:
-- Deletes rows from one primary table based on conditions set by joining additional tables.
-- Only one table is listed explicitly in the DELETE clause.
-- Ensures efficient data management and integrity across relational tables.
-- Uses INNER JOIN, LEFT JOIN, or USING clauses to match data between tables.
-- Can target specific rows using the WHERE clause.

-- Syntax:
-- DELETE table1  FROM table1 JOIN table2
-- ON table1.attribute_name = table2.attribute_name
-- WHERE condition

DELETE library_books
FROM library_books
    JOIN students ON students.student_id = library_books.lib_id
WHERE
    lib_id = 1001
SELECT *
FROM library_books

-- Important Points about DELETE JOIN:
-- DELETE JOIN allows to delete rows from a table based on condition involving another table.
-- We cannot delete from multiple tables in a single DELETE JOIN query.
-- We can only specify one table in the DELETE clause, even if multiple tables are joined in the FROM clause.
-- If a record is deleted from a table, related records in other table will be deleted too.