-- What is Data: Data is a collection of a distinct small unit of information. It can be used in a variety of forms like
-- text, numbers, media, bytes, etc. it can be stored in pieces of paper or electronic memory, etc.

-- What is Database: A database is an organized collection of data, so that it can be easily accessed and managed.
-- You can organize data into tables, rows, columns, and index it to make it easier to find relevant information.
-- Database handlers create a database in such a way that only one set of software program provides access of data to all the users.
-- The main purpose of the database is to operate a large amount of information by storing, retrieving, and managing data.

-- A database is a collection of data that is organized and stored in a structured format, allowing for easy access, manipulation,
-- and analysis of the data. Databases can be used to store a wide variety of data, including financial records, customer information,
-- inventory records, and more. There are many different types of databases, including relational databases, object-oriented databases,
-- and NoSQL databases, and they can be used in a variety of applications, such as data warehousing, online transaction processing, and more.

-- There are many databases available like MySQL, Sybase, Oracle, MongoDB, Informix, PostgreSQL, SQL Server, etc.
-- Modern databases are managed by the database management system (DBMS).

-- SQL or Structured Query Language is used to operate on the data stored in a database. SQL depends on relational
-- algebra and tuple relational calculus.

-- Types of Databases:
-- 1. Hierarchical Databases: A hierarchical database is a type of database that uses a hierarchical model to organize data. In a
-- hierarchical database, data is organized into a tree-like structure, with each record represented as a node in the tree. Each
-- node is connected to one or more child nodes, and each child node can have its own set of child nodes, creating a hierarchy of nodes.
-- In a hierarchical database, each node in the hierarchy can have only one parent node, and the relationship between nodes is
-- one-to-many. This means that a parent node can have multiple child nodes, but a child node can only have one parent node.

-- 2. Network Database: A network database uses a network model to organize data. In a network database, data is organized into
-- a series of interconnected records, with each record representing an entity and the relationships between the entities represented
-- as lines connecting the records.
-- Each record in this type of database can have multiple parent and child records, creating a complex web of relationships
-- between the data. This allows for a more flexible and expressive data model than hierarchical databases, which have a more
-- rigid one-to-many relationship between parent and child nodes.

-- 3. Object-Oriented Databases: In an object-oriented database, data is organized into objects, which are self-contained entities that
-- contain both data and the methods that operate on that data. Object-oriented databases are designed to support the creation and
-- management of complex data structures, and they are often used in applications that require the manipulation of large amounts of
-- structured and semi-structured data.

-- 4. Relational Databases: These are the most widely used type of databases, and they store data in tables that are related to each
-- other through common keys or indexes. Examples of relational databases include MySQL, Oracle, and Microsoft SQL Server.

-- Properties of Relational Database: There are following four commonly known properties of a relational model known as ACID properties,
-- A means Atomicity: This ensures the data operation will complete either with success or with failure. It follows the 'all or nothing'
-- strategy. For example, a transaction will either be committed or will abort.
-- C means Consistency: If we perform any operation over the data, its value before and after the operation should be preserved.
-- For example, the account balance before and after the transaction should be correct, i.e., it should remain conserved.
-- I means Isolation: There can be concurrent users for accessing data at the same time from the database. Thus, isolation between
-- the data should remain isolated. For example, when multiple transactions occur at the same time, one transaction effects should not
-- be visible to the other transactions in the database.
-- D means Durability: It ensures that once it completes the operation and commits the data, data changes should remain permanent.

-- 5. NoSQL Databases: These databases are designed to handle large amounts of unstructured or semi-structured data, and they do not
-- use the traditional table-based relational database model. Instead, they use a variety of data models, such as key-value pairs,
-- documents, and graphs, to store data. Examples of NoSQL databases include MongoDB, Cassandra, and Couchbase.

-- 6. Centralized Database: A centralized database is a database that is stored on a central server and can be accessed by multiple users
-- over a network. The central server acts as a hub for the database, and all users access the same copy of the database. This database
-- is commonly used in organizations to store and manage data that is shared by multiple users or departments.

-- Advantages of Centralized Database:
-- It has decreased the risk of data management, i.e., manipulation of data will not affect the core data.
-- Data consistency is maintained as it manages data in a central repository.
-- It provides better data quality, which enables organizations to establish data standards.
-- It is less costly because fewer vendors are required to handle the data sets.
-- Disadvantages of Centralized Database:
-- The size of the centralized database is large, which increases the response time for fetching the data.
-- It is not easy to update such an extensive database system.
-- If any server failure occurs, entire data will be lost, which could be a huge loss.

-- 7. Distributed Database: A distributed database is stored and managed across multiple servers, rather than on a single central server.
-- It is designed to provide faster access to data and to improve the scalability and reliability of the database. In a distributed
-- database, data is divided into smaller chunks and stored on multiple servers, with each server responsible for storing and managing
-- a portion of the data.

-- 8. Cloud Database: A cloud database is stored and managed on a cloud computing platform, rather than on a local server or device.
-- Cloud databases are accessed over the internet and can be used by multiple users or applications, providing a flexible and scalable
-- way to store and manage data. Cloud databases can be used for a wide range of applications, including web and mobile applications,
-- data warehousing, and more.

-- 9. Personal Database: A personal database is designed to store and manage data for a single individual or small group of users.
-- They are typically smaller in scale and scope than enterprise databases, which are used by larger organizations to store and manage
-- data for a large number of users. You can use personal databases to store and manage a wide range of data, including financial
-- records, contact information, personal notes, and more.

-- 10. Enterprise Database: Large organizations or enterprises use this database for managing a massive amount of data. It helps
-- organizations to increase and improve their efficiency. Such a database allows simultaneous access to users.

-- Advantages of Enterprise Database:
-- Multi processes are supportable over the Enterprise database.
-- It allows executing parallel queries on the system.

-- 11. Document/JSON Database: A document database, also known as a JSON (JavaScript Object Notation) database, is a type of NoSQL database
-- that is designed to store and manage semi-structured data in the form of documents. Document databases use a document-oriented model,
-- which means that data is stored as a collection of documents, rather than in a tabular structure like a traditional relational database.
-- In a document database, each document is a self-contained entity that contains both data and the associated metadata.

-- Database Components: There are several components that are typically included in a database management system (DBMS):
-- a). Data: The data stored in the database, which may include structured, semi-structured, or unstructured data.
-- b). Schema: The structure and organization of the data in the database, including the tables, columns, data types, and relationships
-- between the data.
-- c). Query language: A language or interface that is used to retrieve and manipulate data in the database. SQL (Structured Query
-- Language) is the most commonly used query language for relational databases.
-- d). Indexes: Data structures that are used to improve the performance of queries and searches in the database.
-- e). Transactions: A mechanism for ensuring the consistency and integrity of the data in the database, by allowing multiple operations
-- to be grouped together and either committed or rolled back as a single unit.
-- f). Users: The individuals or application programs that access and manipulate the data in the database.
-- g). Security: Tools and mechanisms for controlling access to the data and protecting it from unauthorized access or tampering.
-- h). Backup and recovery: Tools and procedures for protecting the data during a failure or disaster.
-- i). Performance monitoring: Tools and techniques for monitoring the performance and usage of the database and identifying and
-- resolving any issues.

-- What is a Database Management System (DBMS)?
-- A database management system (DBMS) is software that is designed to store, manage, and retrieve data from a database. The DBMS serves as
-- the intermediary between the database and the users or application programs that need to access the data.

-- It is responsible for managing the data in the database, including storing and organizing it, enforcing data integrity, and providing
-- access to the data for users and application programs. It also provides tools and interfaces for creating, modifying, and querying the
-- data in the database.

-- Many different types of DBMSs are available, including relational database management systems, object-oriented database management
-- systems, and NoSQL database management systems. The most appropriate type of DBMS will depend on the specific needs and requirements
-- of the application.

-- Advantages and Disadvantages of DBMS:

-- What is RDBMS (Relational Database Management System): All modern database management systems like SQL, MS SQL Server, IBM DB2,
-- ORACLE, My-SQL, and Microsoft Access are based on RDBMS.
-- It is called Relational Database Management System (RDBMS) because it is based on the relational model introduced by E.F. Codd.

-- How it works: Data is represented in terms of tuples (rows) in RDBMS.
-- A relational database is the most commonly used database. It contains several tables, and each table has its primary key.
-- Due to a collection of an organized set of tables, data can be accessed easily in RDBMS.

-- What is table/Relation: Everything in a relational database is stored in the form of relations. The RDBMS database uses tables to store
-- data. A table is a collection of related data entries and contains rows and columns to store data. Each table represents some real-world
-- objects such as person, place, or event about which information is collected. The organized collection of data into a relational table
-- is known as the logical view of the database.

-- Properties of a Relation:
-- Each relation has a unique name by which it is identified in the database.
-- Relation does not contain duplicate tuples.
-- The tuples of a relation have no specific order.
-- All attributes in a relation are atomic, i.e., each cell of a relation contains exactly one value.

-- What is a row or record: A row of a table is also called a record or tuple. It contains the specific information of each entry in
-- the table. It is a horizontal entity in the table. For example, The above table contains 5 records.

-- Properties of a row:
-- No two tuples are identical to each other in all their entries.
-- All tuples of the relation have the same format and the same number of entries.
-- The order of the tuple is irrelevant. They are identified by their content, not by their position.

-- What is a column/attribute: A column is a vertical entity in the table which contains all information associated with a specific field
-- in a table. For example, "name" is a column in the above table which contains all information about a student's name.

-- Properties of an Attribute:
-- Every attribute of a relation must have a name.
-- Null values are permitted for the attributes.
-- Default values can be specified for an attribute automatically inserted if no other value is specified for an attribute.
-- Attributes that uniquely identify each tuple of a relation are the primary key.

-- What is data item/Cells: The smallest unit of data in the table is the individual data item. It is stored at the intersection of
-- tuples and attributes.

-- Properties of data items:
-- Data items are atomic.
-- The data items for an attribute should be drawn from the same domain.

-- Degree: The total number of attributes that comprise a relation is known as the degree of the table.

-- Cardinality: The total number of tuples at any one time in a relation is known as the table's cardinality. The relation whose cardinality
-- is 0 is called an empty table.

-- Domain: The domain refers to the possible values each attribute can contain. It can be specified using standard data types such as
-- integers, floating numbers, etc. For example, An attribute entitled Marital_Status may be limited to married or unmarried values.

-- NULL Values: The NULL value of the table specifies that the field has been left blank during record creation. It is different from the
-- value filled with zero or a field that contains space.

-- Data Integrity: There are the following categories of data integrity exist with each RDBMS:
-- Entity integrity: It specifies that there should be no duplicate rows in a table.
-- Domain integrity: It enforces valid entries for a given column by restricting the type, the format, or the range of values.
-- Referential integrity: specifies that rows cannot be deleted, which are used by other records.
-- User-defined integrity: It enforces some specific business rules defined by users. These rules are different from the entity, domain,
-- or referential integrity.

-- Difference between DBMS and RDBMS: -------------

-- DBMS:
-- DBMS applications store data as file.
-- In DBMS, data is generally stored in either a hierarchical form or a navigational form.
-- Normalization is not present in DBMS.
-- DBMS does not apply any security with regards to data manipulation.
-- DBMS uses file system to store data, so there will be no relation between the tables.
-- DBMS has to provide some uniform methods to access the stored information.
-- DBMS does not support distributed database.
-- DBMS is meant to be for small organization and deal with small data. it supports single user.
-- Examples of DBMS are file systems, xml etc.

-- RDBMS:
-- RDBMS applications store data in a tabular form.
-- In RDBMS, the tables have an identifier called primary key and the data values are stored in the form of tables.
-- Normalization is present in RDBMS.
-- RDBMS defines the integrity constraint for the purpose of ACID (Atomocity, Consistency, Isolation and Durability) property.
-- in RDBMS, data values are stored in the form of tables, so a relationship between these data values will be stored in the form of a
-- table as well.
-- RDBMS system supports a tabular structure of the data and a relationship between them to access the stored information.
-- RDBMS supports distributed database.
-- RDBMS is designed to handle large amount of data. it supports multiple users.
-- Example of RDBMS are mysql, postgre, sql server, oracle etc.

-- Difference between File System and DBMS: -------------
-- DBMS Approach:
-- DBMS is a collection of data. In DBMS, the user is not required to write the procedures.
-- Due to the centralized approach, data sharing is easy.
-- DBMS gives an abstract view of data that hides the details.
-- DBMS provides a good protection mechanism.

-- File System Approach:
-- Data is distributed in many files, and it may be of different formats, so it isn't easy to share data.
-- The file system is a collection of data. In this system, the user has to write the procedures for managing the database.
-- The file system provides the detail of the data representation and storage of data.
-- It isn't easy to protect a file under the file system.

-- Limitations of File Systems: -------------
-- Data Redundancy (Duplicate Data): The same data would often be stored in multiple files. Example: A customer’s address might appear 
-- in both the “Orders” file and the “Customer Details” file, leading to unnecessary duplication.
-- Data Inconsistency: When data changes in one file but not in others, it results in mismatched information. Example: If a customer 
-- updates their phone number, but it’s updated only in the “Customer Details” file and not in the “Orders” file, the records become 
-- inconsistent.
-- Difficulty in Data Retrieval: Retrieving specific information from a file required manual effort or complex programming. Example: 
-- Finding all orders made by a customer in the last year could take hours if the data was scattered across multiple files.
-- Limited Security: File systems offered no advanced security features to control access. Example: Any employee with access to the storage 
-- could view sensitive information.
-- Concurrency Issues: Multiple users could not access or update files simultaneously without causing conflicts or data loss.

-- Advantages of DBMS over File Systems: 

-- Reduced Data Redundancy: Data is stored in a centralized location, eliminating unnecessary duplication. Example: Customer details are 
-- stored in one central database, accessible for all operations.

-- Improved Data Integrity and Consistency: Changes made in the database are reflected across all related data points. Example: If a 
-- customer’s address is updated, all orders automatically reflect the new address.

-- Enhanced Security: DBMS provides role-based access, ensuring only authorized users can view or modify data. Example: Only HR staff can 
-- access employee salary details.

-- Simplified Data Access: Query languages like SQL make data retrieval quick and easy. Example: A manager can run a simple query to find 
-- the total sales for the past month.

-- Support for Data Relationships:
-- Relational DBMS links data points, making relationships easier to manage.
-- Example: Customers and their orders can be linked using a “customer ID.”

-- Concurrency Control:
-- DBMS allows multiple users to access and modify data simultaneously without conflicts.
-- Example: Two employees can update the inventory at the same time without errors.

-- Role of DBMS: 
-- Managing data efficiently with optimized storage and retrieval.
-- Providing simple query languages like SQL.
-- Ensuring data consistency and concurrency with transaction controls.
-- Enforcing robust security policies with built-in access controls.

-- Below are the main reason why we need a DBMS software.
-- 1. Data Organization and Management: One of the primary needs for a DBMS is data organization and management. DBMSs allow data to be 
-- stored in a structured manner, which helps in easier retrieval and analysis. A well-designed database schema enables faster access to 
-- information, reducing the time required to find relevant data. A DBMS also provides features like indexing and searching, which make 
-- it easier to locate specific data within the database. This allows organizations to manage their data more efficiently and effectively.

-- 2. Data Security and Privacy: DBMSs provide a robust security framework that ensures the confidentiality, integrity, and availability 
-- of data. They offer authentication and authorization features that control access to the database. DBMSs also provide encryption 
-- capabilities to protect sensitive data from unauthorized access. Moreover, DBMSs comply with various data privacy regulations such as 
-- the GDPR, HIPAA, and CCPA, ensuring that organizations can store and manage their data in compliance with legal requirements.

-- 3. Data Integrity and Consistency: Data integrity and consistency are crucial for any database. DBMSs provide mechanisms that ensure 
-- the accuracy and consistency of data. These mechanisms include constraints, triggers, and stored procedures that enforce data 
-- integrity rules. DBMSs also provide features like transactions that ensure that data changes are atomic, consistent, isolated, 
-- and durable (ACID).

-- 4. Concurrent Data Access: A DBMS provides a concurrent access mechanism that allows multiple users to access the same data simultaneously. 
-- This is especially important for organizations that require real-time data access. DBMSs use locking mechanisms to ensure that multiple 
-- users can access the same data without causing conflicts or data corruption.

-- 5. Data Analysis and Reporting: DBMSs provide tools that enable data analysis and reporting. These tools allow organizations to extract 
-- useful insights from their data, enabling better decision-making. DBMSs support various data analysis techniques such as OLAP, data 
-- mining, and machine learning. Moreover, DBMSs provide features like data visualization and reporting, which enable organizations to 
-- present their data in a visually appealing and understandable way.

-- 6. Scalability and Flexibility: DBMSs provide scalability and flexibility, enabling organizations to handle increasing amounts of data. 
-- DBMSs can be scaled horizontally by adding more servers or vertically by increasing the capacity of existing servers. This makes it 
-- easier for organizations to handle large amounts of data without compromising performance. Moreover, DBMSs provide flexibility in terms 
-- of data modeling, enabling organizations to adapt their databases to changing business requirements.

-- 7. Cost-Effectiveness: DBMSs are cost-effective compared to traditional file-based systems. They reduce storage costs by eliminating 
-- redundancy and optimizing data storage. They also reduce development costs by providing tools for database design, maintenance, and 
-- administration. Moreover, DBMSs reduce operational costs by automating routine tasks and providing self-tuning capabilities.

-- Key Features of DBMS: -------------
-- Data Modeling: Tools to create and modify data models, defining the structure and relationships within the database.
-- Data Storage and Retrieval: Efficient mechanisms for storing data and executing queries to retrieve it quickly.
-- Concurrency Control: Ensures multiple users can access the database simultaneously without conflicts.
-- Data Integrity and Security: Enforces rules to maintain accurate and secure data, including access controls and encryption.
-- Backup and Recovery: Protects data with regular backups and enables recovery in case of system failures.

-- Database Languages: -------------
-- Database languages are specialized sets of commands and instructions used to define, manipulate, and control data within a database. 
-- Each language type plays a distinct role in database management, ensuring efficient storage, retrieval, and security of data. The 
-- primary database languages include:

-- 1. Data Definition Language (DDL): DDL is the short name for Data Definition Language, which deals with database schemas and descriptions, 
-- of how the data should reside in the database.
-- CREATE: to create a database and its objects like (table, index, views, store procedure, function, and triggers)
-- ALTER: alters the structure of the existing database
-- DROP: delete objects from the database
-- TRUNCATE: remove all records from a table, including all spaces allocated for the records are removed
-- COMMENT: add comments to the data dictionary
-- RENAME: rename an object

-- 2. Data Manipulation Language (DML): DML focuses on manipulating the data stored in the database, enabling users to retrieve, add, update, 
-- and delete data.
-- SELECT: retrieve data from a database
-- INSERT: insert data into a table
-- UPDATE: updates existing data within a table
-- DELETE: Delete all records from a database table
-- MERGE: UPSERT operation (insert or update)
-- CALL: call a PL/SQL or Java subprogram
-- EXPLAIN PLAN: interpretation of the data access path
-- LOCK TABLE: concurrency Control

-- 3. Data Control Language (DCL): DCL commands manage access permissions, ensuring data security by controlling who can perform certain 
-- actions on the database.
-- GRANT: Provides specific privileges to a user (e.g., SELECT, INSERT).
-- REVOKE: Removes previously granted permissions from a user.

-- 4. Transaction Control Language (TCL): TCL commands oversee transactional data to maintain consistency, reliability, and atomicity.
-- ROLLBACK: Undoes changes made during a transaction.
-- COMMIT: Saves all changes made during a transaction.
-- SAVEPOINT: Sets a point within a transaction to which one can later roll back.

-- 5. Data Query Language (DQL): DQL is a subset of DML, specifically focused on data retrieval.
-- SELECT: The primary DQL command, used to query data from the database without altering its structure or contents.

-- Paradigm Shift from File System to DBMS:
-- 1. Redundancy of data: When the same data exists in multiple places, any update must be manually repeated everywhere. For instance, if a 
-- student changes their phone number, it must be updated across all sections. Failure to do so leads to unnecessary duplication and wasted storage.
-- 2. Inconsistency of Data: Data is said to be inconsistent if multiple copies of the same data do not match each other. If the Phone number is 
-- different in Accounts Section and Academics Section, it will be inconsistent. Inconsistency may be because of typing errors or not updating 
-- all copies of the same data.
-- 3. Complex Data Access: A user should know the exact location of the file to access data, so the process is very cumbersome and tedious. If 
-- the user wants to search the student hostel allotment number of a student from 10000 unsorted students’ records, how difficult it can be.
-- 4. Lack of Security: File systems provided limited control over who could access certain data. A student who gained access to a file with grades 
-- might easily alter it without proper authorization, compromising data integrity.
-- 5. No Concurrent Access: File systems were not designed for multiple users working at the same time. If one user was editing a file, others 
-- had to wait, which hindered collaboration and slowed down workflows.
-- 6. No Backup and Recovery: File systems lacked built-in mechanisms for creating backups or recovering data after a loss. If a file was 
-- accidentally deleted or corrupted, there was no easy way to restore it, potentially causing permanent data loss.

-- Advantages of DBMS: -------------
-- Data organization: A DBMS allows for the organization and storage of data in a structured manner, making it easy to retrieve and query the 
-- data as needed.
-- Data integrity: A DBMS provides mechanisms for enforcing data integrity constraints, such as constraints on the values of data and access 
-- controls that restrict who can access the data.
-- Concurrent access: A DBMS provides mechanisms for controlling concurrent access to the database, to ensure that multiple users can access 
-- the data without conflicting with each other.
-- Data security: A DBMS provides tools for managing the security of the data, such as controlling access to the data and encrypting sensitive data.
-- Backup and recovery: A DBMS provides mechanisms for backing up and recovering the data in the event of a system failure.
-- Data sharing: A DBMS allows multiple users to access and share the same data, which can be useful in a collaborative work environment.

-- Disadvantages of DBMS: -------------
-- Complexity: DBMS can be complex to set up and maintain, requiring specialized knowledge and skills.
-- Performance overhead: The use of a DBMS can add overhead to the performance of an application, especially in cases where high levels of 
-- concurrency are required.
-- Scalability: The use of a DBMS can limit the scalability of an application, since it requires the use of locking and other synchronization 
-- mechanisms to ensure data consistency.
-- Cost: The cost of purchasing, maintaining and upgrading a DBMS can be high, especially for large or complex systems.
-- Limited Use Cases: Not all use cases are suitable for a DBMS, some solutions don’t need high reliability, consistency or security and may be 
-- better served by other types of data storage.

-- Applications of DBMS: -------------
-- Enterprise Information: Sales, accounting, human resources, Manufacturing, online retailers.
-- Banking and Finance Sector: Banks maintaining the customer details, accounts, loans, banking transactions, credit card transactions. Finance: 
-- Storing the information about sales and holdings, purchasing of financial stocks and bonds.
-- University: Maintaining the information about student course enrolled information, student grades, staff roles.
-- Airlines: Reservations and schedules.
-- Telecommunications: Prepaid, postpaid bills maintance.

-- Types of DBMS Architecture: -------------
-- 1-Tier Architecture.
-- 2-Tier Architecture.
-- 3-Tier Architecture.

-- 1-Tier Architecture: -------------
-- In this architecture, the database is directly available to the user. It means the user can directly sit on the DBMS and uses it.
-- Any changes done here will directly be done on the database itself. It doesn't provide a handy tool for end users.
-- The 1-Tier architecture is used for development of the local application, where programmers can directly communicate with the database 
-- for the quick response.

-- When is the Single Tier DBMS Architecture used?
-- There isn't much data alteration.
-- The database system is not being accessed by many users.
-- For application development purposes, we want a clear and easy method to access or alter the database.

-- Advantages of 1-Tier Architecture: -------------
-- Simple Architecture: 1-Tier Architecture is the most simple architecture to set up, as only a single machine is required to maintain it.
-- Cost-Effective: No additional hardware is required for implementing 1-Tier Architecture, which makes it cost-effective.
-- Easy to Implement: 1-Tier Architecture can be easily deployed, and hence it is mostly used in small projects.

-- 1-Tier DBMS Architecture Example: -------------
-- We configured our local system's SQL server and database in order to understand the Structure Query Language (SQL). We can do some 
-- operations and communicate with the relational database directly with this SQL server without the need for a network connection. 
-- The entire system for learning SQL queries is an illustration of a single-tier database management system.

-- Specialties:
-- The most basic DBMS design.
-- A single system houses the server, database, and client-the three main parts of a database management system.
-- The database is immediately accessible to the user.
-- Applied when there is little to no data change.
-- Fit for single-user access, database designers, and programmers.

-- 2-Tier Architecture: -------------
-- The 2-tier architecture is similar to a basic client-server model . The application at the client end directly communicates with the 
-- database on the server side. APIs like ODBC and JDBC are used for this interaction. The server side is responsible for providing query 
-- processing and transaction management functionalities. On the client side, the user interfaces and application programs are run. The 
-- application on the client side establishes a connection with the server side to communicate with the DBMS.
-- For Example: A Library Management System used in schools or small organizations is a classic example of two-tier architecture.

-- Client Layer (Tier 1): This is the user interface that library staff or users interact with. For example they might use a desktop application 
-- to search for books, issue them, or check due dates.
-- Database Layer (Tier 2): The database server stores all the library records such as book details, user information, and transaction logs.

-- Specialties:
-- similarly to an architecture with clients and servers.
-- Faster access, easier upkeep, and capacity for several users at once.
-- It is used when we wish to engage with DBMS via applications and APIs.
-- Has problems with security and scalability due to direct client-server connectivity.

-- Advantages of 2-Tier Architecture:
-- Easy to Access: 2-Tier Architecture makes easy access to the database, which makes fast retrieval.
-- Scalable: We can scale the database easily, by adding clients or upgrading hardware.
-- Low Cost: 2-Tier Architecture is cheaper than 3-Tier Architecture and Multi-Tier Architecture .
-- Easy Deployment: 2-Tier Architecture is easier to deploy than 3-Tier Architecture.
-- Simple: 2-Tier Architecture is easily understandable as well as simple because of only two components.

-- 3-Tier Architecture: -------------
-- In 3-Tier Architecture, there is another layer between the client and the server. The client does not directly communicate with the server. 
-- Instead, it interacts with an application server which further communicates with the database system and then the query processing and 
-- transaction management takes place. This intermediate layer acts as a medium for the exchange of partially processed data between the 
-- server and the client. This type of architecture is used in the case of large web applications.
-- For Example: E-commerce Store:
-- User: You visit an online store, search for a product and add it to your cart.
-- Processing: The system checks if the product is in stock, calculates the total price and applies any discounts.
-- Database: The product details, your cart and order history are stored in the database for future reference.

-- 3 Tier DBMS Architecture's primary benefits are:
-- Scalability: As load balancing is implemented by the application layer and the database server is unaware of any users outside it, you may 
-- have as many clients as you like.
-- Data Integrity: Because of the checks made on each client request at the application layer, data corruption and erroneous requests may be 
-- prevented.
-- Security: By removing the direct link between the client and server systems through abstraction, unwanted access to the database is decreased.

-- Specialties:
-- The most popular architecture for DBMSs.
-- Maintains the architecture of client-application-server.
-- Improved scalability, data integrity, and security.
-- It is more difficult and requires more maintenance due to the additional layer.

-- Advantages of 3-Tier Architecture:
-- Enhanced scalability: Scalability is enhanced due to the distributed deployment of application servers. Now, individual connections need 
-- not be made between the client and server.
-- Data Integrity: 3-Tier Architecture maintains Data Integrity. Since there is a middle layer between the client and the server, data 
-- corruption can be avoided/removed.
-- Security: 3-Tier Architecture Improves Security. This type of model prevents direct interaction of the client with the server thereby 
-- reducing access to unauthorized data.

-- Disadvantages of 3-Tier Architecture:
-- More Complex: 3-Tier Architecture is more complex in comparison to 2-Tier Architecture. Communication Points are also doubled in 3-Tier 
-- Architecture.
-- Difficult to Interact: It becomes difficult for this sort of interaction to take place due to the presence of middle layers.

-- Objectives of Three schema Architecture:
-- The main objective of three level architecture is to enable multiple users to access the same data with a personalized view while storing 
-- the underlying data only once. Thus it separates the user's view from the physical structure of the database. This separation is desirable 
-- for the following reasons:
-- Different users need different views of the same data.
-- The approach in which a particular user needs to see the data may change over time.
-- The users of the database should not worry about the physical implementation and internal workings of the database such as data compression 
-- and encryption techniques, hashing, optimization of the internal structures etc.
-- All users should be able to access the same data according to their requirements.
-- DBA should be able to change the conceptual structure of the database without affecting the user's
-- Internal structure of the database should be unaffected by changes to physical aspects of the storage.

-- 1. Internal Level:
-- The internal level has an internal schema which describes the physical storage structure of the database.
-- The internal schema is also known as a physical schema.
-- It uses the physical data model. It is used to define that how the data will be stored in a block.
-- The physical level is used to describe complex low-level data structures in detail.

-- The internal level is generally is concerned with the following activities:
-- Storage space allocations. For Example: B-Trees, Hashing etc.
-- Access paths. For Example: Specification of primary and secondary keys, indexes, pointers and sequencing.
-- Data compression and encryption techniques.
-- Optimization of internal structures.
-- Representation of stored fields.

-- 2. Conceptual Level:
-- The conceptual schema describes the design of a database at the conceptual level. Conceptual level is also known as logical level.
-- The conceptual schema describes the structure of the whole database.
-- The conceptual level describes what data are to be stored in the database and also describes what relationship exists among those data.
-- internal details such as an implementation of the data structure are hidden.
-- Programmers and database administrators work at this level.

-- 3. External Level:
-- At the external level, a database contains several schemas that sometimes called as subschema. The subschema is used to describe the 
-- different view of the database.
-- An external schema is also known as view schema.
-- Each view schema describes the database part that a particular user group is interested and hides the remaining database from that 
-- user group.
-- The view schema describes the end user interaction with database systems.

-- Making a DBMS Schema: -------------
-- choosing which types of information should be kept in the database.
-- The tables must be defined after the database's purpose has been defined.
-- The next step is to set up the table columns within each table.
-- The data type of each column indicates the kind of data that will be stored there. Text, integers, and dates are a few examples of data types.
-- The database's tables include associations that need to be specified.

-- Designs for Database Schemas: -------------
-- Database schema design is the process of creating a framework for arranging and storing data in a database. A few examples of 
-- database schema designs are as follows:
-- Data is arranged using hierarchical schema design in a manner akin to a binary tree.
-- More complicated relationships are possible with network schema design, as each record may have several parent and child records.
-- Data is arranged into tables with rows and columns using relational schema design.
-- A star schema is used in dimensional schema design to arrange data into fact tables and dimension tables.

----------------------------------------------------------------------------------------------------------------------------------

-- Data Models in DBMS: -------------
-- Data Model is the modeling of the data description, data semantics, and consistency constraints of the data. It provides the 
-- conceptual tools for describing the design of a database at each level of data abstraction.
-- The basic structure of a data model is entities, attributes, relationships and constraints. A data model makes it simple to know 
-- the meaning of the data by guarantee that we understand

-- Why do we need a Data Model
-- The main objective of data model is to help understand the meaning of data and make communication about the information needs. It 
-- supports communication between users and database designers. In this way, it helps organizations better understand the data.
-- Data Modeling enhances application maintainability and future systems may reuse parts of the existing models, which helps in reducing 
-- development costs.

-- 1) Relational Data Model: This type of model designs the data in the form of rows and columns within a table. Thus, a relational model 
-- uses tables for representing data and in-between relationships. Tables are also called relations. The relational data model is the 
-- widely used model which is primarily used by commercial data processing applications.

-- 2) Entity-Relationship Data Model: An ER model is the logical representation of data as objects and relationships among them. These 
-- objects are known as entities, and relationship is an association among these entities. It was widely used in database designing. A set 
-- of attributes describe the entities. For example, student_name, student_id describes the 'student' entity. A set of the same type of 
-- entities is known as an 'Entity set', and the set of the same type of relationships is known as 'relationship set'.

-- 3) Object-based Data Model: An extension of the ER model with notions of functions, encapsulation, and object identity, as well. This 
-- model supports a rich type system that includes structured and collection types. Thus, in 1980s, various database systems following the 
-- object-oriented approach were developed. Here, the objects are nothing but the data carrying its properties.

-- 4) Semistructured Data Model: This type of data model is different from the other three data models (explained above). The semistructured 
-- data model allows the data specifications at places where the individual data items of the same type may have different attributes sets. 
-- The Extensible Markup Language, also known as XML, is widely used for representing the semistructured data. Although XML was initially 
-- designed for including the markup information to the text document, it gains importance because of its application in the exchange of data.

-- Benefits of Data models:
-- The data model represents accurate data. This ensures the reduction of errors in database development.
-- The data model is capable of giving visual representation which is easy to understand or memorize.
-- Data models focus on data security. Private or sensitive data is being kept safe.
-- The data model improves the communication between developers and the business intelligence team.
-- Data models increase the efficiency of database performance.
-- Data models are a very fast technique that can be handled easily.

-- Disadvantages of using Data models:
-- If a small change in a specific structure is done then the whole application needs to be modified.
-- To develop a data model it is important to learn physical data stored characteristics.
-- Sometimes data models contain a huge database. This huge database causes problems to understand the data model.
-- Data manipulation language in DBMS is absent.

-- Processes in Data Modelling:
-- Step-1: Understanding the requirements: The process of data modeling begins with the understanding of business requirements. We need to 
-- identify the entities and study the types of Data, constraints and rules.

-- Step-2: Understanding the characteristics of each entity: After identifying and understanding the entities we have to understand the 
-- characteristics of each entity. Each entity's property is distinguished from another because each entity contains at least one or more 
-- unique properties. These unique properties are called attributes. The customer of a business organization could have different 
-- attributes such as name, contact number, address, etc.

-- Step-3: Making connections between different entities: This step of Data modeling defines the connection between different entities. 
-- For example, the customers could be related to each other by the address they live in. Basically, this step identifies the relationship 
-- among the entities.

-- Step-4: Pattern design and analysis: In this step the business organization makes the decision how they will use the data. Here Data 
-- modeling patterns are being designed and analysed respectively.

-- Step-5: Normalization and reduction of Data redundancy: Normalization technique is used to organise data models and the database. 
-- Normalization causes reduction of storage space in a database.

-- Step-6: Validation of Data Model: Now in this step, data models with stakeholders need to validate which ensures to fulfill all requirements.

-- Step-7: Implementation and maintenance: In this process implementation of the physical data model in a database takes place. We need to 
-- update the data model regularly to accommodate change in requirements.

-- Data model Schema and Instance: -------------
-- The data which is stored in the database at a particular moment of time is called an instance of the database.
-- The overall design of a database is called schema.
-- A database schema is the skeleton structure of the database. It represents the logical view of the entire database.
-- A schema contains schema objects like table, foreign key, primary key, views, columns, data types, stored procedure, etc.
-- A database schema can be represented by using the visual diagram. That diagram shows the database objects and relationship with 
-- each other.
-- A database schema is designed by the database designers to help programmers whose software will interact with the database. The process 
-- of database creation is called data modeling.

-- A schema diagram can display only some aspects of a schema like the name of record type, data type, and constraints. Other aspects can't 
-- be specified through the schema diagram.

-- Subschema: -------------
-- A subset of schema is called a subschema. It inherits the same properties as a schema. A subschema defines the part of the database seen 
-- by the application programs that actually generates the information they need from the data in the database. An application program can 
-- changes its corresponding subschema without affecting the subschema used by other application programs.

-- Since there are multiple users, each accessing some parts of the database, there can be different sub schemas for a given schema. 
-- For Example: Consider the section record database as discussed earlier. The sub schema is Student_Section relation which is derived from 
-- Student and Section relation. This relation will contain fields such as Name, Class, Section_indentifier, Course_number, Semester and Year.

-- Instance: -------------
-- An instance of the database is also called a database state. It is the data in the database at any given point of time. Every time any 
-- modifications such as update, insert and delete operation are performed on the database, the database changes from one state to another. 
-- The following figure shows an example of a Student_Section relation in a database schema.

-- Data Independence: -------------
-- Data independence can be explained using the three-schema architecture.
-- Data independence refers characteristic of being able to modify the schema at one level of the database system without altering the 
-- schema at the next higher level.

-- There are two types of data independence:
-- Logical Data Independence.
-- Physical Data Independence.

-- 1. Logical Data Independence:
-- Logical data independence refers characteristic of being able to change the conceptual schema without having to change the external schema.
-- Logical data independence is used to separate the external level from the conceptual view.
-- If we do any changes in the conceptual view of the data, then the user view of the data would not be affected.
-- Logical data independence occurs at the user interface level.
-- You may have to modify the conceptual schema to expand the database (by adding more entities, attributes etc.) or to reduce the 
-- database (by deleting entities, attributes etc.) but the exiting schemas are not changed.
-- Changes will be absorbed through mapping between external and conceptual levels.

-- 2. Physical Data Independence:
-- Above changes will affect the existing conceptual schema. Changes will be absorbed through mapping between conceptual and internal levels.

-- Why Data Independence?
-- Traditional systems have a very low level of data independence, meaning that a small change to a data structure (for example, adding or 
-- deleting a field in a record structure) usually requires multiple program changes. These changes will absorb on:

-- So by introducing a multi level architecture where each level represents one abstraction level makes the data independent otherwise if 
-- the data is used by hundred of application programs in a large database systems, a small change in structure of database may lead to 
-- rewriting all the application programs which may be very time consuming and costly.

-- Advantages of Data Independence: -------------

-- Disadvantages of Data Independence: -------------

----------------------------------------------------------------------------------------------------------------------------------

-- ACID Properties in DBMS: -------------
-- DBMS is the management of data that should remain integrated when any changes are done in it. It is because if the integrity of the data 
-- is affected, whole data will get disturbed and corrupted. Therefore, to maintain the integrity of the data, there are four properties 
-- described in the database management system, which are known as the ACID properties. The ACID properties are meant for the transaction 
-- that goes through a different group of tasks, and there we come to see the role of the ACID properties.

-- 1) Atomicity: It indicates that any operation performed on the data should be done so either fully or not at all.It also implies that 
-- there shouldn't be any breaks or incomplete execution of the process. When carrying out operations on a transaction, the action need to 
-- be carried out whole and not only in part.

-- Example: If Remo has account A having $30 in his account from which he wishes to send $10 to Sheero's account, which is B. In account B, 
-- a sum of $ 100 is already present. When $10 will be transferred to account B, the sum will become $110. Now, there will be two operations 
-- that will take place. One is the amount of $10 that Remo wants to transfer will be debited from his account A, and the same amount will 
-- get credited to account B, i.e., into Sheero's account. Now, what happens - the first operation of debit executes successfully, but the 
-- credit operation, however, fails. Thus, in Remo's account A, the value becomes $20, and to that of Sheero's account, it remains $100 as 
-- it was previously present.

-- 2) Consistency: The definition of consistency is that a value should always be maintained. Any modifications done to the database should 
-- always be kept, since this ensures the integrity of the data in DBMSs. Data integrity is essential for transactions in order to assure 
-- consistency in the database earlier and later in the transaction.

-- Example: there are three accounts, A, B, and C, where A is making a transaction T one by one to both B & C. There are two operations 
-- that take place, i.e., Debit and Credit. Account A firstly debits $50 to account B, and the amount in account A is read $300 by B before 
-- the transaction. After the successful transaction T, the available amount in B becomes $150. Now, A debits $20 to account C, and that 
-- time, the value read by C is $250 (that is correct as a debit of $50 has been successfully done to B). The debit and credit operation from 
-- account A to C has been done successfully. We can see that the transaction is done successfully, and the value is also read correctly. 
-- Thus, the data is consistent. In case the value read by B and C is $300, which means that data is inconsistent because when the debit 
-- operation executes, it will not be consistent.

-- 3) Isolation: 'Isolation' indicates to a phase of separation. A database's isolation, as defined by DBMS, is the quality wherein no data 
-- should impact any other database and can happen simultaneously. To put it briefly, one database operation should start once the first 
-- database operation is finished. It signifies that two processes on two different databases could not affect the values of the other 
-- process. When two or more transactions happen at the same time, consistency in the case of the transactions should be preserved. Until a 
-- modification is not committed in the memory, it cannot be observed by other transactions in that same transaction.

-- Example: If two operations are concurrently running on two different accounts, then the value of both accounts should not get affected. 
-- The value should remain persistent. As you can see in the below diagram, account A is making T1 and T2 transactions to account B and C, 
-- but both are executing independently without affecting each other. It is known as Isolation.

-- 4) Durability: Something's durability guarantees its permanence. The word "durability" in database management systems (DBMS) refers to 
-- the guarantee that data is permanently stored in the database following a successful transaction. Data need to be so completely persistent 
-- that it keeps the database intact even in the case of a crash or system failure.However, the recovery manager is responsible for ensuring 
-- that the database remains durable in the unfortunate circumstances. To commit the data, we must use the COMMIT command each time we make a 
-- modification.

