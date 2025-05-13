-- Indexing in Databases: ----------------
-- Indexing improves database performance by minimizing the number of disc visits required to fulfill a query. It is a data structure technique 
-- used to locate and quickly access data in databases. Several database fields are used to generate indexes. The main key or candidate key of 
-- the table is duplicated in the first column, which is the Search key. To speed up data retrieval, the values are also kept in sorted order. 
-- It should be highlighted that sorting the data is not required. The second column is the Data Reference or Pointer which contains a set of 
-- pointers holding the address of the disk block where that particular key value can be found.

-- Attributes of Indexing:
-- Access Types: This refers to the type of access such as value-based search, range access, etc.
-- Access Time: It refers to the time needed to find a particular data element or set of elements.
-- Insertion Time: It refers to the time taken to find the appropriate space and insert new data.
-- Deletion Time: Time taken to find an item and delete it as well as update the index structure.
-- Space Overhead: It refers to the additional space required by the index.

-- Sequential File Organization or Ordered Index File:

-- Dense Index:
-- For every search key value in the data file, there is an index record.
-- This record contains the search key and also a reference to the first data record with that search key value.

-- Sparse Index:
-- The index record appears only for a few items in the data file. Each item points to a block as shown.
-- To locate a record, we find the index record with the largest search key value less than or equal to the search key value we are looking for.
-- We start at that record pointed to by the index record, and proceed along with the pointers in the file (that is, sequentially) until we find 
-- the desired record.
-- Number of Accesses required=log₂(n)+1, (here n=number of blocks acquired by index file)

-- Hash File Organization:
-- Clustered Indexing: When more than two records are stored in the same file this type of storing is known as cluster indexing. By using cluster 
-- indexing we can reduce the cost of searching reason being multiple records related to the same thing are stored in one place and it also gives 
-- the frequent joining of more than two tables (records). 
-- The clustering index is defined on an ordered data file. The data file is ordered on a non-key field. In some cases, the index is created on 
-- non-primary key columns which may not be unique for each record. In such cases, in order to identify the records faster, we will group two or 
-- more columns together to get the unique values and create an index out of them. This method is known as the clustering index. Essentially, 
-- records with similar properties are grouped together, and indexes for these groupings are formed. 
-- Students studying each semester, for example, are grouped together. First-semester students, second-semester students, third-semester students, 
-- and so on are categorized.

-- Primary Indexing: This is a type of Clustered Indexing wherein the data is sorted according to the search key and the primary key of the 
-- database table is used to create the index. It is a default format of indexing where it induces sequential file organization. As primary keys 
-- are unique and are stored in a sorted manner, the performance of the searching operation is quite efficient. 

-- Non-clustered or Secondary Indexing: A non-clustered index just tells us where the data lies, i.e. it gives us a list of virtual pointers or 
-- references to the location where the data is actually stored. Data is not physically stored in the order of the index. Instead, data is 
-- present in leaf nodes. For eg. the contents page of a book. Each entry gives us the page number or location of the information stored. The 
-- actual data here(information on each page of the book) is not organized but we have an ordered reference(contents page) to where the data 
-- points actually lie. We can have only dense ordering in the non-clustered index as sparse ordering is not possible because data is not 
-- physically organized accordingly. 
-- It requires more time as compared to the clustered index because some amount of extra work is done in order to extract the data by further 
-- following the pointer. In the case of a clustered index, data is directly present in front of the index.

-- Multilevel Indexing: With the growth of the size of the database, indices also grow. As the index is stored in the main memory, a single-level 
-- index might become too large a size to store with multiple disk accesses. The multilevel indexing segregates the main block into various 
-- smaller blocks so that the same can be stored in a single block. The outer blocks are divided into inner blocks which in turn are pointed 
-- to the data blocks. This can be easily stored in the main memory with fewer overheads.  

-- Advantages of Indexing:
-- Improved Query Performance: Indexing enables faster data retrieval from the database. The database may rapidly discover rows that match a 
-- specific value or collection of values by generating an index on a column, minimizing the amount of time it takes to perform a query.
-- Efficient Data Access: Indexing can enhance data access efficiency by lowering the amount of disk I/O required to retrieve data. The database 
-- can maintain the data pages for frequently visited columns in memory by generating an index on those columns, decreasing the requirement to 
-- read from disk.
-- Optimized Data Sorting: Indexing can also improve the performance of sorting operations. By creating an index on the columns used for sorting, 
-- the database can avoid sorting the entire table and instead sort only the relevant rows.
-- Consistent Data Performance: Indexing can assist ensure that the database performs consistently even as the amount of data in the database rises. 
-- Without indexing, queries may take longer to run as the number of rows in the table grows, while indexing maintains a roughly consistent speed.
-- By ensuring that only unique values are inserted into columns that have been indexed as unique, indexing can also be utilized to ensure the 
-- integrity of data. This avoids storing duplicate data in the database, which might lead to issues when performing queries or reports.
-- Overall, indexing in databases provides significant benefits for improving query performance, efficient data access, optimized data sorting, 
-- consistent data performance, and enforced data integrity

-- Disadvantages of Indexing:
-- Indexing necessitates more storage space to hold the index data structure, which might increase the total size of the database.
-- Increased database maintenance overhead: Indexes must be maintained as data is added, destroyed, or modified in the table, which might raise 
-- database maintenance overhead.
-- Indexing can reduce insert and update performance since the index data structure must be updated each time data is modified.
-- Choosing an index can be difficult: It can be challenging to choose the right indexes for a specific query or application and may call for a 
-- detailed examination of the data and access patterns.

-- Features of Indexing:
-- The development of data structures, such as B-trees or hash tables, that provide quick access to certain data items is known as indexing. The 
-- data structures themselves are built on the values of the indexed columns, which are utilized to quickly find the data objects.
-- The most important columns for indexing columns are selected based on how frequently they are used and the sorts of queries they are subjected 
-- to. The cardinality, selectivity, and uniqueness of the indexing columns can be taken into account.
-- There are several different index types used by databases, including primary, secondary, clustered, and non-clustered indexes. Based on the 
-- particular needs of the database system, each form of index offers benefits and drawbacks.
-- For the database system to function at its best, periodic index maintenance is required. According to changes in the data and usage patterns, 
-- maintenance work involves building, updating, and removing indexes.
-- Database query optimization involves indexing, which is essential. The query optimizer utilizes the indexes to choose the best execution 
-- strategy for a particular query based on the cost of accessing the data and the selectivity of the indexing columns.
-- Databases make use of a range of indexing strategies, including covering indexes, index-only scans, and partial indexes. These techniques 
-- maximize the utilization of indexes for particular types of queries and data access.
-- When non-contiguous data blocks are stored in an index, it can result in index fragmentation, which makes the index less effective. Regular 
-- index maintenance, such as defragmentation and reorganization, can decrease fragmentation.

-- Introduction of B-Tree: ----------------
-- A B-Tree is a specialized m-way tree designed to optimize data access, especially on disk-based storage systems.
-- In a B-Tree of order m, each node can have up to m children and m-1 keys, allowing it to efficiently manage large datasets.
-- The value of m is decided based on disk block and key sizes.
-- One of the standout features of a B-Tree is its ability to store a significant number of keys within a single node, including large key values. 
-- It significantly reduces the tree’s height, hence reducing costly disk operations.
-- B Trees allow faster data retrieval and updates, making them an ideal choice for systems requiring efficient and scalable data management. 
-- By maintaining a balanced structure at all times,
-- B-Trees deliver consistent and efficient performance for critical operations such as search, insertion, and deletion.

-- Properties of a B-Tree: A B Tree of order m can be defined as an m-way search tree which satisfies the following properties:
-- All leaf nodes of a B tree are at the same level, i.e. they have the same depth (height of the tree).
-- The keys of each node of a B tree (in case of multiple keys), should be stored in the ascending order.
-- In a B tree, all non-leaf nodes (except root node) should have at least m/2 children.
-- All nodes (except root node) should have at least m/2 - 1 keys.
-- If the root node is a leaf node (only node in the tree), then it will have no children and will have at least one key. If the root node is a 
-- non-leaf node, then it will have at least 2 children and at least one key.
-- A non-leaf node with n-1 key values should have n non NULL children.

-- Need of a B-Tree: The B-Tree data structure is essential for several reasons:
-- Improved Performance Over M-way Trees: While M-way trees can be either balanced or skewed, B-Trees are always self-balanced. This 
-- self-balancing property ensures fewer levels in the tree, significantly reducing access time compared to M-way trees. This makes B-Trees 
-- particularly suitable for external storage systems where faster data retrieval is crucial.
-- Optimized for Large Datasets: B-Trees are designed to handle millions of records efficiently. Their reduced height and balanced structure 
-- enable faster sequential access to data and simplify operations like insertion and deletion. This ensures efficient management of large 
-- datasets while maintaining an ordered structure.

-- Search Operation in B-Tree: Searching a B-Tree is similar to searching a binary tree. The algorithm is similar and goes with recursion. At 
-- each level, the search is optimized as if the key value is not present in the range of the parent then the key is present in another branch. 
-- As these values limit the search they are also known as limiting values or separation values. If we reach a leaf node and don’t find the 
-- desired key then it will display NULL.

-- Algorithm for Searching an Element in a B-Tree:
-- class Node {
--     int n;
--     int[] key = new int[MAX_KEYS];
--     Node[] child = new Node[MAX_CHILDREN];
--     boolean leaf;
-- }

-- Node BtreeSearch(Node x, int k) {
--     int i = 0;
--     while (i < x.n && k > x.key[i]) {
--         i++;
--     }
--     if (i < x.n && k == x.key[i]) {
--         return x;
--     }
--     if (x.leaf) {
--         return null;
--     }
--     return BtreeSearch(x.child[i], k);
-- }

-- Applications of B-Trees:
-- It is used in large databases to access data stored on the disk
-- Searching for data in a data set can be achieved in significantly less time using the B-Tree
-- With the indexing feature, multilevel indexing can be achieved.
-- Most of the servers also use the B-tree approach.
-- B-Trees are used in CAD systems to organize and search geometric data.
-- B-Trees are also used in other areas such as natural language processing, computer networks, and cryptography.

-- Advantages of B-Trees:
-- B-Trees have a guaranteed time complexity of O(log n) for basic operations like insertion, deletion, and searching, which makes them suitable 
-- for large data sets and real-time applications.
-- B-Trees are self-balancing.
-- High-concurrency and high-throughput.
-- Efficient storage utilization.

-- Disadvantages of B-Trees:
-- B-Trees are based on disk-based data structures and can have a high disk usage.
-- Not the best for all cases.
-- For small datasets, the search time in a B-Tree might be slower compared to a binary search tree, as each node may contain multiple keys.

-- Introduction of B+ Tree: ----------------
-- B+ Tree is a variation of the B-tree data structure. In a B+ tree, data pointers are stored only at the leaf nodes of the tree. In this 
-- tree structure of a leaf node differs from the structure of internal nodes. The leaf nodes have an entry for every value of the search field, 
-- along with a data pointer to the record (or to the block that contains this record). The leaf nodes of the B+ tree are linked together to 
-- provide ordered access to the search field to the records. Internal nodes of a B+ tree are used to guide the search. Some search field values 
-- from the leaf nodes are repeated in the internal nodes of the B+ tree.

-- Features of B+ Trees:
-- Balanced: B+ Trees are self-balancing, which means that as data is added or removed from the tree, it automatically adjusts itself to maintain 
-- a balanced structure. This ensures that the search time remains relatively constant, regardless of the size of the tree.
-- Multi-level: B+ Trees are multi-level data structures, with a root node at the top and one or more levels of internal nodes below it. The 
-- leaf nodes at the bottom level contain the actual data.
-- Ordered: B+ Trees maintain the order of the keys in the tree, which makes it easy to perform range queries and other operations that require 
-- sorted data.
-- Fan-out: B+ Trees have a high fan-out, which means that each node can have many child nodes. This reduces the height of the tree and 
-- increases the efficiency of searching and indexing operations.
-- Cache-friendly: B+ Trees are designed to be cache-friendly, which means that they can take advantage of the caching mechanisms in modern 
-- computer architectures to improve performance.
-- Disk-oriented: B+ Trees are often used for disk-based storage systems because they are efficient at storing and retrieving data from disk.

-- Why Use B+ Tree?
-- B+ Trees are the best choice for storage systems with sluggish data access because they minimize I/O operations while facilitating efficient 
-- disc access.
-- B+ Trees are a good choice for database systems and applications needing quick data retrieval because of their balanced structure, which 
-- guarantees predictable performance for a variety of activities and facilitates effective range-based queries.

-- Difference Between B+ Tree and B Tree:
-- B+ Tree:
-- Separate leaf nodes for data storage and internal nodes for indexing.
-- Leaf nodes form a linked list for efficient range-based queries.
-- Higher order (more keys).
-- Typically allows key duplication in leaf nodes.
-- Better disk access due to sequential reads in a linked list structure.
-- Database systems, file systems, where range queries are common.
-- Better performance for range queries and bulk data retrieval.
-- Requires more memory for internal nodes.

-- B Tree:
-- Nodes store both keys and data values.
-- Leaf nodes do not form a linked list.
-- Lower order (fewer keys).
-- Usually does not allow key duplication.
-- More disk I/O due to non-sequential reads in internal nodes.
-- In-memory data structures, databases, general-purpose use.
-- Balanced performance for search, insert, and delete operations.
-- Requires less memory as keys and values are stored in the same node.

-- Structure of B+ Trees: B+ Trees contain two types of nodes:
-- Internal Nodes: Internal Nodes are the nodes that are present in at least n/2 record pointers, but not in the root node,
-- Leaf Nodes: Leaf Nodes are the nodes that have n pointers.

-- The Structure of the Internal Nodes of a B+ Tree of Order ‘a’ is as Follows:
-- Each internal node is of the form: <P1, K1, P2, K2, ….., Pc-1, Kc-1, Pc> where c <= a and each Pi is a tree pointer (i.e points to another 
-- node of the tree) and, each Ki is a key-value (see diagram-I for reference).
-- Every internal node has : K1 < K2 < …. < Kc-1
-- For each search field value ‘X’ in the sub-tree pointed at by Pi, the following condition holds: Ki-1 < X <= Ki, for 1 < I < c and, Ki-1 < X, 
-- for i = c (See diagram I for reference)
-- Each internal node has at most ‘aa tree pointers.
-- The root node has, at least two tree pointers, while the other internal nodes have at least \ceil(a/2) tree pointers each.
-- If an internal node has ‘c’ pointers, c <= a, then it has ‘c – 1’ key values.

-- The Structure of the Leaf Nodes of a B+ Tree of Order ‘b’ is as Follows:
-- Each leaf node is of the form: <<K1, D1>, <K2, D2>, ….., <Kc-1, Dc-1>, Pnext> where c <= b and each Di is a data pointer (i.e points to 
-- actual record in the disk whose key value is Ki or to a disk file block containing that record) and, each Ki is a key value and, Pnext 
-- points to next leaf node in the B+ tree (see diagram II for reference).
-- Every leaf node has : K1 < K2 < …. < Kc-1, c <= b
-- Each leaf node has at least \ceil(b/2) values.
-- All leaf nodes are at the same level.

-- Advantages of B+Trees:
-- A B+ tree with ‘l’ levels can store more entries in its internal nodes compared to a B-tree having the same ‘l’ levels. This accentuates the 
-- significant improvement made to the search time for any given key. Having lesser levels and the presence of Pnext pointers imply that the B+ 
-- trees is very quick and efficient in accessing records from disks. 
-- Data stored in a B+ tree can be accessed both sequentially and directly.
-- It takes an equal number of disk accesses to fetch records.
-- B+ trees have redundant search keys, and storing search keys repeatedly is not possible. 

-- Disadvantages of B+ Trees:
-- The major drawback of B-tree is the difficulty of traversing the keys sequentially. The B+ tree retains the rapid random access property of 
-- the B-tree while also allowing rapid sequential access.

-- Application of B+ Trees:
-- Multilevel Indexing.
-- Faster operations on the tree (insertion, deletion, search).
-- Database indexing.

-- Bitmap Indexing in DBMS: ------------
-- Bitmap Indexing is a data indexing technique used in database management systems (DBMS) to improve the performance of read-only queries that 
-- involve large datasets. It involves creating a bitmap index, which is a data structure that represents the presence or absence of data values 
-- in a table or column.

-- In a bitmap index, each distinct value in a column is assigned a bit vector that represents the presence or absence of that value in each row 
-- of the table. The bit vector contains one bit for each row in the table, where a set bit indicates the presence of the corresponding value in 
-- the row, and a cleared bit indicates the absence of the value.

-- Bitmap Index Structure:
-- A bitmap is the combination of two words: bit and map. A bit can be termed as the smallest unit of data in a computer and a map can be termed 
-- as a way of organizing things.

-- Bit: A bit is a basic unit of information used in computing that can have only one of two values either 0 or 1. The two values of a binary 
-- digit can also be interpreted as logical values true/false or Yes/No.
-- Bitmap Indexing is a special type of database indexing that uses bitmaps. This technique is used for huge databases when the column is of 
-- low cardinality and these columns are most frequently used in the query. 
-- Bitmap indexing is a data structure used in database management systems (DBMS) to efficiently represent and query large datasets with many 
-- attributes (columns). Bitmap indexes use a compact binary representation to store the occurrence of each value or combination of values in 
-- each attribute, allowing for fast, set-based operations.

-- Features of Bitmap Indexing in DBMS:
-- Space efficiency: Bitmap indexes are highly space-efficient because they use a compact binary representation to store the occurrence of each 
-- value or combination of values in each attribute. This makes them especially useful for large datasets with many attributes.
-- Fast query processing: Bitmap indexes can be used to quickly answer complex queries involving multiple attributes using set-based operations 
-- such as AND, OR, and NOT. This allows for fast query processing and reduces the need for full table scans.
-- Low maintenance overhead: Bitmap indexes require relatively low maintenance overhead because they can be updated incrementally as data changes. 
-- This makes them especially useful for applications where the data is frequently updated.
-- Flexibility: Bitmap indexes can be used for both numerical and categorical data types, and can also be used to index text data using techniques 
-- such as term frequency-inverse document frequency (TF-IDF).
-- Reduced I/O overhead: Bitmap indexes can be used to avoid expensive I/O operations by using a compressed representation of the data. This 
-- reduces the amount of data that needs to be read from the disk, improving query performance.
-- Ideal Choice: Bitmap indexing is a powerful technique for efficiently querying large datasets with many attributes. It’s compact representation 
-- and set-based operations make it an ideal choice for data warehousing and other applications where fast query processing is critical.

-- Applications of Bitmap Indexing in DBMS:
-- Fast queries on large datasets: Bitmap indexing is particularly useful for fast queries on large datasets. When querying a table with a bitmap 
-- index, the database engine can quickly determine which rows satisfy the query by performing a bitwise operation on the corresponding bitmaps. 
-- This can greatly reduce query execution time, especially for queries that involve multiple columns or complex conditions.
-- Efficient range queries: Bitmap indexing can also be used for efficient range queries on numeric or date columns. The bitmap for a range of 
-- values can be constructed by performing bitwise operations on the bitmaps for individual values. This allows the database engine to quickly 
-- identify all rows that fall within a given range.
-- Space efficiency: Bitmap indexing can be more space-efficient than other indexing techniques, especially for columns with a small number of 
-- distinct values. For example, a column with only two distinct values (such as gender) can be represented using a single bitmap, while other 
-- indexing techniques would require multiple index entries.
-- Multi-dimensional indexing: Bitmap indexing can be used for multi-dimensional indexing by creating a bitmap for each dimension. The bitmaps 
-- can then be combined using bitwise operations to identify rows that satisfy a query with multiple conditions.
-- Data warehousing applications: Bitmap indexing is commonly used in data warehousing applications where the focus is on fast query performance. 
-- In these applications, tables often have large numbers of columns with a relatively small number of distinct values, making bitmap indexing a 
-- particularly effective technique.

-- What is the Need for Bitmap Indexing?
-- The need for Bitmap Indexing will be clear through the below-given example:
-- For example, Let us say that a company holds an employee table with entries like EmpNo, EmpName, Job, New_Emp, and salary. Let us assume that 
-- the employees are hired once a year, therefore the table will be updated very less and will remain static most of the time. But the columns 
-- will be frequently used in queries to retrieve data like: No. of female employees in the company etc. In this case, we need a file organization 
-- method that should be fast enough to give quick results. But any of the traditional file organization methods are not that fast, therefore we 
-- switch to a better method of storing and retrieving data known as Bitmap Indexing. 

-- Bitmap indexing can be used to improve the performance of queries that involve complex logical operations, such as AND, OR, and NOT. The logical 
-- operations are performed on the bit vectors, which can be efficiently combined using bitwise operators.

-- Bitmap indexing is particularly useful for datasets with low cardinality columns, where each value appears in a large number of rows. It is 
-- also useful for read-only queries that involve aggregations, such as counting or summing values, as the bit vectors can be quickly scanned to 
-- retrieve the required data.

-- How Bitmap Indexing is Done?
-- In the above example of table employee, we can see that the column New_Emp has only two values Yes and No based upon the fact that the employee 
-- is new to the company or not. Similarly let us assume that the Job of the Employees is divided into 4 categories only i.e Manager, Analyst, 
-- Clerk, and Salesman. Such columns are called columns with low cardinality. Even though these columns have fewer unique values, they can be 
-- queried very often. 

-- Bit: A bit is a basic unit of information used in computing that can have only one of two values either 0 or 1. The two values of a binary 
-- digit can also be interpreted as logical values true/false or yes/no. 

-- In Bitmap Indexing these bits are used to represent the unique values in those low cardinality columns. This technique of storing the low 
-- cardinality rows in the form of bits is called bitmap indices. 

-- Bitmap Indexing in SQL: The syntax for creating a bitmap index in SQL is given below.
-- CREATE BITMAP INDEX Index_Name ON Table_Name (Column_Name);

-- For the above example of the employee table, the bitmap index on column New_Emp will be created as follows: 
-- CREATE BITMAP INDEX index_New_Emp ON Employee (New_Emp);

-- Advantages of Bitmap Indexing:
-- Efficiency in terms of insertion deletion and updation.
-- Faster retrieval of records.

-- Disadvantages of Bitmap Indexing:
-- Only suitable for large tables.
-- Bitmap Indexing is time-consuming.

-- Inverted Index: ------------
-- An Inverted Index is a data structure used in information retrieval systems to efficiently retrieve documents or web pages containing a 
-- specific term or set of terms. In an inverted index, the index is organized by terms (words), and each term points to a list of documents 
-- or web pages that contain that term.

-- Inverted indexes are widely used in search engines, database systems, and other applications where efficient text search is required. They 
-- are especially useful for large collections of documents, where searching through all the documents would be prohibitively slow.

-- An inverted index is an index data structure storing a mapping from content, such as words or numbers, to its locations in a document or a 
-- set of documents. In simple words, it is a hashmap-like data structure that directs you from a word to a document or a web page.

-- There are two types of inverted indexes:
-- Record-Level Inverted Index: Record Level Inverted Index contains a list of references to documents for each word.
-- Word-Level Inverted Index: Word Level Inverted Index additionally contains the positions of each word within a document. The latter form 
-- offers more functionality but needs more processing power and space to be created.

-- Steps to Build an Inverted Index:
-- Fetch the Document: Removing of Stop Words: Stop words are the most occurring and useless words in documents like “I”, “the”, “we”, “is”, and “an”.
-- Stemming of Root Word: Whenever I want to search for “cat”, I want to see a document that has information about it. But the word present in 
-- the document is called “cats” or “catty” instead of “cat”. To relate both words, I’ll chop some part of every word I read so that I could 
-- get the “root word”. There are standard tools for performing this like “Porter’s Stemmer”.
-- Record Document IDs: If the word is already present add a reference of the document to index else creates a new entry. Add additional 
-- information like the frequency of the word, location of the word, etc.

-- Advantages of Inverted Index:
-- The inverted index is to allow fast full-text searches, at a cost of increased processing when a document is added to the database.
-- It is easy to develop.
-- It is the most popular data structure used in document retrieval systems, used on a large scale for example in search engines.

-- Disadvantages of Inverted Index:
-- Large storage overhead and high maintenance costs on updating, deleting, and inserting.
-- Instead of retrieving the data in decreasing order of expected usefulness, the records are retrieved in the order in which they occur 
-- in the inverted lists.

-- Features of Inverted Indexes:
-- Efficient search: Inverted indexes allow for efficient searching of large volumes of text-based data. By indexing every term in every 
-- document, the index can quickly identify all documents that contain a given search term or phrase, significantly reducing search time.
-- Fast updates: Inverted indexes can be updated quickly and efficiently as new content is added to the system. This allows for near-real-time 
-- indexing and searching for new content.
-- Flexibility: Inverted indexes can be customized to suit the needs of different types of information retrieval systems. For example, they can 
-- be configured to handle different types of queries, such as Boolean queries or proximity queries.
-- Compression: Inverted indexes can be compressed to reduce storage requirements. Various techniques such as delta encoding, gamma encoding, 
-- variable byte encoding, etc. can be used to compress the posting list efficiently.
-- Support for stemming and synonym expansion: Inverted indexes can be configured to support stemming and synonym expansion, which can improve 
-- the accuracy and relevance of search results. Stemming is the process of reducing words to their base or root form, while synonym expansion 
-- involves mapping different words that have similar meanings to a common term.
-- Support for multiple languages: Inverted indexes can support multiple languages, allowing users to search for content in different languages 
-- using the same system.

-- SQL Queries on Clustered and Non-Clustered Indexes:
-- Indexes in SQL play a pivotal role in enhancing database performance by enabling efficient data retrieval without scanning the entire table. 
-- The two primary types of indexes Clustered Index and Non-Clustered Index serve distinct purposes in optimizing query performance.

-- What are Indexes in SQL: 
-- Indexing in SQL is similar to the index page in a book, they allow the database to quickly locate data without scanning the entire table. 
-- Without indexing, SQL Server performs a full table scan, which can be time-consuming for large datasets. By creating indexes, SQL Server 
-- optimizes query execution, reducing retrieval time. In the same way, a table’s index allows us to locate the exact data without scanning 
-- the whole table.

-- Key Benefits of Indexing:
-- Faster SELECT queries.
-- Efficient data access for UPDATE, DELETE, and JOIN operations.
-- Minimizes disk I/O operations.

-- Types of Indexes in SQL:
-- 1. Clustered index.
-- 2. Non-clustered index.

-- Clustered Index: A clustered index is the type of indexing that establishes a physical sorting order of rows. The data rows are stored 
-- directly in the order of the indexed column(s). Each table can have only one clustered index because it dictates the data’s physical 
-- storage. A clustered index is like a Dictionary in which the sorting order is alphabetical and there is no separate index page. 

-- Suppose we have a table Student_info which contains ROLL_NO as a primary key, then the clustered index which is self-created on that 
-- primary key will sort the Student_info table as per ROLL_NO.

-- Example: Creating a Clustered Index: 

-- CREATE TABLE Student_info
-- (
-- ROLL_NO int(10) primary key,
-- NAME varchar(20),
-- DEPARTMENT varchar(20),
-- );
-- INSERT INTO Student_info values(1410110405, 'H Agarwal', 'CSE');
-- INSERT INTO Student_info values(1410110404, 'S Samadder', 'CSE');
-- INSERT INTO Student_info values(1410110403, 'MD Irfan', 'CSE'); 

-- SELECT * FROM Student_info;

-- Dropping and Creating a Custom Clustered Index:
-- If we want to create a Clustered index on another column, first we have to remove the primary key, and then we can remove the previous 
-- index. Note that defining a column as a primary key makes that column the Clustered Index of that table.

-- To create a clustered index on a different column:
-- Remove the existing primary key (if any).
-- Drop the previous clustered index. 

-- Syntax:
-- DROP INDEX table_name.index_name;

-- CREATE CLUSTERED INDEX IX_table_name_column_name ON table_name (column_name ASC);

-- Example:
-- CREATE CLUSTERED INDEX IX_Student_info_NAME ON Student_info (NAME ASC);

-- Non-Clustered Index: 
-- Non-Clustered index is an index structure separate from the data stored in a table that reorders one or more selected columns. The 
-- non-clustered index is created to improve the performance of frequently used queries not covered by a clustered index. It’s like a textbook, 
-- the index page is created separately at the beginning of that book.

-- Example: Creating a Non-Clustered Index
-- CREATE TABLE Student_info
-- (
-- ROLL_NO int(10),
-- NAME varchar(20),
-- DEPARTMENT varchar(20),
-- );

-- INSERT INTO Student_info values(1410110405, 'H Agarwal', 'CSE');
-- INSERT INTO Student_info values(1410110404, 'S Samadder', 'CSE');
-- INSERT INTO Student_info values(1410110403, 'MD Irfan', 'CSE');

-- SELECT * FROM Student_info;

-- Syntax: create NonClustered index IX_table_name_column_name on table_name (column_name ASC) 

-- We will create a Non-Clustered Index on the NAME column to improve query performance when searching by name. Here is the SQL Query for the same
-- Query: create NonClustered index IX_Student_info_NAME on Student_info (NAME ASC)

-- Differences between Clustered and Non-clustered Index:
-- Clustered Index:
-- Determines the physical order of data in the table.
-- Only one per table.
-- The index is the table; data rows are stored in the index order.
-- Optimized for range queries and ordered data retrieval.
-- Default	If no clustered index is specified, the primary key usually becomes the clustered index.
-- Less flexible due to the single ordering constraint.
-- Ideal for tables where data is frequently retrieved in a sorted order or requires range queries.

-- Non-Clustered Index:
-- Does not affect the physical order of data.
-- Multiple indexes can be created on a table.
-- The index is a separate structure with pointers to data rows.
-- Useful for quick lookups and searches on non-primary key columns.
-- Can be created on any column, not necessarily a primary key.
-- More flexible as multiple non-clustered indexes can be created.
-- Ideal for optimizing search queries on columns that are not the primary key or clustered index.

-- Optimizing Queries with Clustered and Non-Clustered Indexes: --------------

-- 1. SELECT Queries with WHERE Clause:
-- Clustered Index: When executing a SELECT query with a WHERE clause on a table with a Clustered Index, the database engine uses the index to 
-- directly locate rows matching the condition, minimizing disk I/O.

-- Example:
-- Create a table with a clustered index on ROLL_NO
-- CREATE TABLE Student_info (
--     ROLL_NO INT PRIMARY KEY,
--     NAME VARCHAR(20),
--     DEPARTMENT VARCHAR(20)
-- );

-- INSERT INTO Student_info VALUES
-- (1410110405, 'H Agarwal', 'CSE'),
-- (1410110404, 'S Samadder', 'CSE'),
-- (1410110403, 'MD Irfan', 'CSE');

-- Query using the clustered index
-- SELECT * 
-- FROM Student_info
-- WHERE ROLL_NO = 1410110404;

-- Non-Clustered Index: If a Non-Clustered Index is created on the NAME column, the query optimizer uses the index to locate matching 
-- rows efficiently.

-- Example:
-- Create a non-clustered index on NAME
-- CREATE NONCLUSTERED INDEX IX_Student_info_NAME ON Student_info (NAME ASC);

-- Query using the non-clustered index
-- SELECT * FROM Student_info WHERE NAME = 'H Agarwal';

