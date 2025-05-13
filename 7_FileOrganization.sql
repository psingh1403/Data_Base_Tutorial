-- File Organization: ---------------

-- A database consists of a huge amount of data. The data is grouped within a table in RDBMS, and each table has related records. A user can 
-- see that the data is stored in the form of tables, but in actuality, this huge amount of data is stored in physical memory in the form of files. 

-- What is a File?
-- A file is named a collection of related information that is recorded on secondary storage such as magnetic disks, magnetic tapes, and 
-- optical disks. 

-- What is File Organization?
-- File Organization refers to the logical relationships among various records that constitute the file, particularly with respect to 
-- the means of identification and access to any specific record. In simple terms, Storing the files in a certain order is called File 
-- Organization. File Structure refers to the format of the label and data blocks and of any logical control record. 

-- The Objective of File Organization:
-- It helps in the faster selection of records i.e. it makes the process faster.
-- Different Operations like inserting, deleting, and updating different records are faster and easier.
-- It prevents us from inserting duplicate records via various operations.
-- It helps in storing the records or the data very efficiently at a minimal cost.

-- Types of File Organizations: Various methods have been introduced to Organize files. These particular methods have advantages and disadvantages 
-- on the basis of access or selection. Thus it is all upon the programmer to decide the best-suited file Organization method according to his 
-- requirements. 

-- Some types of File Organizations are: 
-- Sequential File Organization.
-- Heap File Organization
-- Hash File Organization
-- B+ Tree File Organization
-- Clustered File Organization
-- ISAM (Indexed Sequential Access Method)

-- Sequential File Organization: --------------
-- The easiest method for file Organization is the Sequential method. In this method, the file is stored one after another in a sequential 
-- manner. There are two ways to implement this method:

-- 1. Pile File Method: This method is quite simple, in which we store the records in a sequence i.e. one after the other in the order in which 
-- they are inserted into the tables. 

-- Insertion of the new record: Let the R1, R3, and so on up to R5 and R4 be four records in the sequence. Here, records are nothing but a row 
-- in any table. Suppose a new record R2 has to be inserted in the sequence, then it is simply placed at the end of the file. 

-- 2. Sorted File Method: In this method, As the name itself suggests whenever a new record has to be inserted, it is always inserted in a 
-- sorted (ascending or descending) manner. The sorting of records may be based on any primary key or any other key. 
-- Insertion of the new record: Let us assume that there is a preexisting sorted sequence of four records R1, R3, and so on up to R7 and R8. 
-- Suppose a new record R2 has to be inserted in the sequence, then it will be inserted at the end of the file and then it will sort the sequence. 

-- Advantages of  Sequential File Organization:
-- Fast and efficient method for huge amounts of data.
-- Simple design.
-- Files can be easily stored inmagnetic tapes i.e. cheaper storage mechanism.

-- Disadvantages of  Sequential File Organization:
-- Time wastage as we cannot jump on a particular record that is required, but we have to move in a sequential manner which takes our time.
-- The sorted file method is inefficient as it takes time and space for sorting records.

-- Heap File Organization: --------------
-- Heap File Organization works with data blocks. In this method, records are inserted at the end of the file, into the data blocks. No Sorting 
-- or Ordering is required in this method. If a data block is full, the new record is stored in some other block, Here the other data block need 
-- not be the very next data block, but it can be any block in the memory. It is the responsibility of DBMS to store and manage the new records. 

-- Insertion of the new record: Suppose we have four records in the heap R1, R5, R6, R4, and R3, and suppose a new record R2 has to be inserted 
-- in the heap then, since the last data block i.e data block 3 is full it will be inserted in any of the data blocks selected by the DBMS, let’s 
-- say data block 1.

-- If we want to search, delete or update data in the heap file Organization we will traverse the data from the beginning of the file till we get 
-- the requested record. Thus if the database is very huge, searching, deleting, or updating the record will take a lot of time.

-- Advantages of Heap File Organization:
-- Fetching and retrieving records is faster than sequential records but only in the case of small databases.
-- When there is a huge number of data that needs to be loaded into thedatabase at a time, then this method of file Organization is best suited.

-- Disadvantages of Heap File Organization:
-- The problem of unused memory blocks.
-- Inefficient for larger databases.

-- Hashing in DBMS: --------------
-- Hashing in DBMS is a technique to quickly locate a data record in a database irrespective of the size of the database. For larger databases 
-- containing thousands and millions of records, the indexing data structure technique becomes very inefficient because searching a specific 
-- record through indexing will consume more time. This doesn't align with the goals of DBMS, especially when performance and data retrieval 
-- time are minimized. So, to counter this problem hashing technique is used.

-- What is Hashing?
-- The hashing technique utilizes an auxiliary hash table to store the data records using a hash function. There are 2 key components in hashing:
-- Hash Table: A hash table is an array or data structure and its size is determined by the total volume of data records present in the database. 
-- Each memory location in a hash table is called a 'bucket' or hash indice and stores a data record's exact location and can be accessed through 
-- a hash function.
-- Bucket: A bucket is a memory location (index) in the hash table that stores the data record. These buckets generally store a disk block which 
-- further stores multiple records. It is also known as the hash index.
-- Hash Function: A hash function is a mathematical equation or algorithm that takes one data record's primary key as input and computes the 
-- hash index as output.

-- Hash Function:
-- A hash function is a mathematical algorithm that computes the index or the location where the current data record is to be stored in the 
-- hash table so that it can be accessed efficiently later. This hash function is the most crucial component that determines the speed of 
-- fetching data.

-- Working of Hash Function: The hash function generates a hash index through the primary key of the data record.
-- Now, there are 2 possibilities:
-- 1. The hash index generated isn't already occupied by any other value. So, the address of the data record will be stored here.
-- 2. The hash index generated is already occupied by some other value. This is called collision so to counter this, a collision resolution 
-- technique will be applied.
-- 3. Now whenever we query a specific record, the hash function will be applied and returns the data record comparatively faster than indexing 
-- because we can directly reach the exact location of the data record through the hash function rather than searching through indices one by one.

-- Types of Hashing in DBMS:
-- 1. Static Hashing: In static hashing, the hash function always generates the same bucket's address. For example, if we have a data record 
-- for employee_id = 107, the hash function is mod-5 which is - H(x) % 5, where x = id. Then the operation will take place like this:
-- H(106) % 5 = 1.

-- This indicates that the data record should be placed or searched in the 1st bucket (or 1st hash index) in the hash table.

-- Properties:
-- Data Buckets: The number of buckets in memory remains constant. The size of the hash table is decided initially and it may also implement 
-- chaining that will allow handling some collision issues though, it's only a slight optimization and may not prove worthy if the database 
-- size keeps fluctuating.
-- Hash function: It uses the simplest hash function to map the data records to its appropriate bucket. It is generally modulo-hash function
-- Efficient for known data size: It's very efficient in terms when we know the data size and its distribution in the database.
-- It is inefficient and inaccurate when the data size dynamically varies because we have limited space and the hash function always generates 
-- the same value for every specific input. When the data size fluctuates very often it's not at all useful because collision will keep happening 
-- and it will result in problems like - bucket skew, insufficient buckets etc.

-- To resolve this problem of bucket overflow, techniques such as - chaining and open addressing are used. Here's a brief info on both:

-- 1. Chaining: Chaining is a mechanism in which the hash table is implemented using an array of type nodes, where each bucket is of node type 
-- and can contain a long chain of linked lists to store the data records. So, even if a hash function generates the same value for any data 
-- record it can still be stored in a bucket by adding a new node.

-- However, this will give rise to the problem bucket skew that is, if the hash function keeps generating the same value again and again then 
-- the hashing will become inefficient as the remaining data buckets will stay unoccupied or store minimal data.

-- 2. Open Addressing/Closed Hashing: This is also called closed hashing this aims to solve the problem of collision by looking out for the 
-- next empty slot available which can store data. It uses techniques like linear probing, quadratic probing, double hashing, etc.

-- 2. Dynamic Hashing: Dynamic hashing is also known as extendible hashing, used to handle database that frequently changes data sets. This 
-- method offers us a way to add and remove data buckets on demand dynamically. This way as the number of data records varies, the buckets 
-- will also grow and shrink in size periodically whenever a change is made.

-- Properties of Dynamic Hashing:
-- The buckets will vary in size dynamically periodically as changes are made offering more flexibility in making any change.
-- Dynamic Hashing aids in improving overall performance by minimizing or completely preventing collisions.
-- It has the following major components: Data bucket, Flexible hash function, and directories
-- A flexible hash function means that it will generate more dynamic values and will keep changing periodically asserting to the requirements of 
-- the database.
-- Directories are containers that store the pointer to buckets. If bucket overflow or bucket skew-like problems happen to occur, then bucket 
-- splitting is done to maintain efficient retrieval time of data records. Each directory will have a directory id.
-- Global Depth: It is defined as the number of bits in each directory id. The more the number of records, the more bits are there.

-- B+ Tree, as the name suggests, uses a tree-like structure to store records in a File. It uses the concept of Key indexing where the primary 
-- key is used to sort the records. For each primary key, an index value is generated and mapped with the record. An index of a record is the 
-- address of the record in the file. 

-- B+ Tree is very similar to a binary search tree, with the only difference being that instead of just two children, it can have more than two. 
-- All the information is stored in a leaf node and the intermediate nodes act as a pointer to the leaf nodes. The information in leaf nodes 
-- always remains a sorted sequential linked list. 

-- Advantages of B+ Tree File Organization:
-- Tree traversal is easier and faster.
-- Searching becomes easy as all records are stored only in leaf nodes and are sorted in sequentially linked lists.
-- There is no restriction on B+ tree size. It may grow/shrink as the size of the data increases/decreases.

-- Disadvantages of B+ Tree File Organization:
-- Inefficient for static tables.

-- Cluster File Organization:
-- In Cluster file organization, two or more related tables/records are stored within the same file known as clusters. These files will have two 
-- or more tables in the same data block and the key attributes which are used to map these tables together are stored only once. 

-- Types of Cluster File Organization: There are two ways to implement this method.
-- Indexed Clusters: In Indexed clustering, the records are grouped based on the cluster key and stored together. The above-mentioned example of 
-- the Employee and Department relationship is an example of an Indexed Cluster where the records are based on the Department ID.
-- Hash Clusters: This is very much similar to an indexed cluster with the only difference that instead of storing the records based on cluster 
-- key, we generate a hash key value and store the records with the same hash key value.

-- Advantages of Cluster File Organization:
-- It is basically used when multiple tables have to be joined with the same joining condition.
-- It gives the best output when the cardinality is 1:m.

-- Disadvantages of Cluster File Organization:
-- It gives a low performance in the case of a large database.
-- In the case of a 1:1 cardinality, it becomes ineffective.

-- ISAM (Indexed Sequential Access Method):
-- A combination of sequential and indexed methods. Data is stored sequentially, but an index is maintained for faster access. Think of it like 
-- having a bookmark in a book that guides you to specific pages.

-- Advantages of ISAM:
-- Faster retrieval compared to pure sequential methods.
-- Suitable for applications with a mix of sequential and random access.

-- Disadvantages of ISAM:
-- Index maintenance can add overhead in terms of storage and update operations.
-- Not as efficient as fully indexed methods for random access.

