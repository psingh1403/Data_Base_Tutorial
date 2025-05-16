-- What Are Indexes in SQL?
-- An index in SQL is a schema object that improves the speed of data retrieval operations on a table. It works by creating a separate data
-- structure that provides pointers to the rows in a table, making it faster to look up rows based on specific column values. Indexes act as
-- a table of contents for a database, allowing the server to locate data quickly and efficiently, reducing disk I/O operations.

-- Benefits of Indexes:
-- Faster Queries: Speeds up SELECT and JOIN operations.
-- Lower Disk I/O: Reduces the load on your database by limiting the amount of data scanned.
-- Better Performance on Large Tables: Essential when working with millions of records.

-- Creating an Index: Creating an index allows us to define a quick access path to data. SQL indexes can be applied to one or more columns and
-- can be either unique or non-unique. Unique indexes ensure that no duplicate values are entered in the indexed columns, while non-unique
-- indexes simply speed up queries without enforcing uniqueness. You can create:

-- Single-column indexes: For basic queries
-- Multi-column indexes: For queries using multiple filters
-- Unique indexes: To ensure data uniqueness

-- Syntax:
-- CREATE INDEX index
-- ON TABLE column;

-- Example:
CREATE INDEX idx_product_id ON Sales (product_id);

-- Retrieve Data Using the Index:
SELECT * FROM STUDENTS USE INDEX (idx);

-- Multi - Column Indexes: If queries often use more than one column in conditions, we can create a multi-column index for better performance.

-- Syntax:
-- CREATE INDEX index ON TABLE (column1, column2,.....);

-- Example:
CREATE INDEX idx_product_quantity ON Sales (product_id, quantity);

-- Unique Indexes: A SQL Unique Index is a database constraint that ensures the values in the indexed column(s) are unique across all rows in
-- a table. It can be applied to one or more columns, ensuring data integrity by preventing duplicate values. Unique indexes can be created for
-- both single columns and combinations of multiple columns. Additionally, they automatically exclude NULL values if multiple rows contain NULL
-- in the indexed columns, further maintaining data consistency.

-- Key Characteristics of SQL Unique Index:
-- If a unique index is created on a single column, all rows in that column must be unique.
-- If the unique index is created on multiple columns, the combination of values in these columns must be unique.
-- A unique index cannot be created on a column if duplicate values already exist.
-- Unique indexes improve query performance by optimizing data retrieval.

-- Syntax: CREATE UNIQUE INDEX index_name ON table_name (column_name);

-- Example:
CREATE UNIQUE INDEX idx_unique_employee_id ON Employees (employee_id);

-- Examples of SQL Unique Index:
CREATE TABLE CUSTOMERS_Index_Table (
    ID INT NOT NULL,
    NAME VARCHAR(15) NOT NULL,
    AGE INT NOT NULL,
    ADDRESS VARCHAR(25),
    SALARY DECIMAL(10, 4),
    PRIMARY KEY (ID)
);

INSERT INTO
    CUSTOMERS_Index_Table
VALUES (
        1,
        'Ramesh',
        32,
        'Ahmedabad',
        2000
    ),
    (
        2,
        'Khilan',
        25,
        'Delhi',
        1500
    ),
    (
        3,
        'Kaushik',
        23,
        'Kota',
        2000
    ),
    (
        4,
        'Chaitali',
        26,
        'Mumbai',
        6500
    ),
    (
        5,
        'Hardik',
        27,
        'Bhopal',
        8500
    ),
    (
        6,
        'Komal',
        22,
        'Hyderabad',
        9000
    ),
    (
        7,
        'Muffy',
        24,
        'Indore',
        5500
    );

-- Creating a Unique Index on a Single Column:
CREATE UNIQUE INDEX UNIQUE_NAME ON CUSTOMERS_Index_Table (NAME);

-- Creating a Unique Index on Multiple Columns:
CREATE UNIQUE INDEX MUL_UNIQUE_INDEX ON CUSTOMERS_Index_Table (NAME, AGE);

-- Attempting to Create a Unique Index on a Column with Duplicate Values:
CREATE UNIQUE INDEX UNIQUE_SALARY ON CUSTOMERS_Index_Table (SALARY);

-- Verifying Indexes in a Table:
SHOW INDEX FROM CUSTOMERS_Index_Table;

-- Removing an Index: If an index is no longer needed, it can be removed to improve write performance or save storage space. As indexes can slow
-- down operations like INSERT, UPDATE, and DELETE due to the overhead of maintaining them, dropping unnecessary indexes can improve overall
-- database efficiency. The DROP INDEX command is used for this purpose.

-- Syntax: DROP INDEX index;

-- 1. DROP INDEX in MS Access:
-- DROP INDEX index_name ON table_name;

-- 2. DROP INDEX in SQL Server:
-- DROP INDEX table_name.index_name;

-- 3. DROP INDEX in MySQL:
-- ALTER TABLE table_name DROP INDEX index_name;

-- SQL DROP INDEX with IF EXISTS:
DROP INDEX IF EXISTS EMP ON EMPLOYEE;

-- SQL DROP INDEX with ALTER TABLE:
ALTER TABLE EMPLOYEE DROP INDEX EMP;

-- Altering an Index: If an index requires adjustments, such as reorganizing or rebuilding, it can be altered without affecting the data. This
-- is useful for optimizing index performance as tables grow larger.

-- Syntax: ALTER INDEX IndexName ON TableName REBUILD;

-- Confirming and Viewing Indexes: We can view all the indexes in a database to understand which ones are in use and confirm their structure.
-- Syntax: SELECT * from USER_INDEXES;

-- Renaming an Index: In some cases, renaming an index might be necessary for clarity or consistency. While SQL doesn't directly support
-- renaming indexes, we can use a combination of commands to achieve this.

-- Syntax: EXEC sp_rename 'old_index_name', 'new_index_name', 'INDEX';

-- How to View Indexes in SQL:
-- The SHOW INDEXES statement is used to display detailed information about the indexes present in a specific table. This information includes the
-- index name, columns involved, whether the index allows duplicates, and other important details. It helps database administrators analyze the
-- existing indexes and determine if any indexes need optimization or removal.

-- MySQL: SHOW INDEXES FROM table_name;

-- SQL Server: SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID('table_name');

-- When Should Indexes Be Created:
-- Indexes can significantly improve query performance, but they should be used judiciously. The following scenarios warrant creating indexes:
-- Wide Range of Values: Indexes are helpful when a column has a wide range of values, such as product IDs or customer names, as they speed up
-- search operations.
-- Non-NULL Values: Columns that don’t contain many NULL values are ideal candidates for indexing, as NULLs complicate the indexing process.
-- Frequent Query Conditions: Indexes should be created on columns frequently used in WHERE clauses or as part of a join condition.

-- When Should Indexes Be Avoided:
-- While indexes enhance performance, they may not always be beneficial, especially in certain situations:
-- Small Tables: Indexes are not needed for small tables as queries will likely perform well without them.
-- Infrequent Query Use: If a column is rarely used in queries, indexing it will only add overhead.
-- Frequently Updated Columns: Avoid indexing columns that are frequently updated, as the index will need to be updated with each change,
-- adding overhead.

-- Why SQL Indexing is Important:
-- Indexing in SQL is a critical feature for optimizing query performance, especially for large datasets. Here are some common scenarios where
-- indexing proves beneficial:
-- Large Data Tables: SQL queries on tables with millions of rows can significantly slow down due to full table scans. Indexes provide a faster
-- alternative by allowing quick access to relevant rows.
-- Join Optimization: Indexes on columns used for joining tables (such as foreign keys) improve the performance of complex joins.
-- Search Operations: Queries that search for specific values in a column can be sped up with indexes, reducing the time required to perform lookups.
-- However, it is essential to be mindful of the storage cost and performance tradeoffs associated with indexes. Over-indexing can lead to
-- unnecessary overhead, while under-indexing may slow down data retrieval

-- Create the orders Table:
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10, 2),
    PRIMARY KEY (order_id),
    INDEX idx_customer_id (customer_id), -- Regular index on customer_id
    UNIQUE INDEX unique_order_date (order_date), -- Unique index on order_date
    INDEX invisible_index (total_amount) INVISIBLE, -- Invisible index on total_amount
    INDEX composite_index (customer_id, order_date) COMMENT 'By customer and order date' -- Composite index on multiple columns
);

SHOW INDEXES FROM orders;

-- Differences Between Clustered and Non-Clustered Index: -----------
-- Clustered Index:
-- Faster for range-based queries and sorting.
-- Requires less memory for operations.
-- The clustered index stores data in the table itself.
-- A table can have only one clustered index.
-- The clustered index can store data on the disk.
-- Stores pointers to the data blocks, not the data itself.
-- Leaf nodes contain the actual data itself.
-- Defines the physical order of the rows in the table.
-- The data is physically reordered to match the index.
-- Primary keys are by default clustered indexes.
-- Typically larger, especially for large primary clustered indexes.
-- Ideal for range queries and sorting.
-- A clustered index directly impacts the table's physical storage order.

-- Non-Clustered Index:
-- Slower for range-based queries but faster for specific lookups.
-- Requires more memory due to additional index structure.
-- The non-clustered index stores data separately from the table.
-- A table can have multiple non-clustered indexes.
-- The non-clustered index stores the index structure (B-tree) on disk with pointers to the data pages.
-- Stores both the indexed value and a pointer to the actual row in a separate data page.
-- Leaf nodes contain indexed columns and pointers to data.
-- Defines the logical order of data in the index, not the table.
-- The logical order does not match the physical order of rows.
-- Composite keys used with unique constraints are non-clustered.
-- Smaller than clustered indexes, especially when composite.
-- Suitable for optimizing lookups and queries on non-primary columns.
-- A non-clustered index does not affect the physical storage order of the table.