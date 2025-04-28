
-- ER (Entity Relationship) Diagram in DBMS: -------------
-- The Entity Relationship Model is a model for identifying entities (like student, car or company) to be represented in the database 
-- and representation of how those entities are related. The ER data model specifies enterprise schema that represents the overall logical 
-- structure of a database graphically.
-- We typically follow the below steps for designing a database for an application.
-- Gather the requirements (functional and data) by asking questions to the database users.
-- Create a logical or conceptual design of the database. This is where ER model plays a role. It is the most used graphical 
-- representation of the conceptual design of a database.
-- After this, focus on Physical Database Design (like indexing) and external design (like views)

-- Why Use ER Diagrams In DBMS:
-- ER diagrams represent the E-R model in a database, making them easy to convert into relations (tables).
-- ER diagrams serve the purpose of real-world modeling of objects which makes them intently useful.
-- ER diagrams require no technical knowledge of the underlying DBMS used.
-- It gives a standard solution for visualizing the data logically.

-- Symbols Used in ER Model:
-- ER Model is used to model the logical view of the system from a data perspective which consists of these symbols:
-- Rectangles: Rectangles represent entities in the ER Model.
-- Ellipses: Ellipses represent attributes in the ER Model.
-- Diamond: Diamonds represent relationships among Entities.
-- Lines: Lines represent attributes to entities and entity sets with other relationship types.
-- Double Ellipse: Double ellipses represent multi-valued Attributes.
-- Double Rectangle: Double rectangle represents a weak entity.

-- Components of ER Diagram:

-- What is an Entity: An Entity may be an object with a physical existence: a particular person, car, house, or employee or it may be an 
-- object with a conceptual existence – a company, a job, or a university course.

-- What is an Entity Set: An entity refers to an individual object of an entity type, and the collection of all entities of a particular 
-- type is called an entity set. For example, E1 is an entity that belongs to the entity type “Student,” and the group of all students 
-- forms the entity set.

-- Types of Entity:
-- 1. Strong Entity: A Strong Entity is a type of entity that has a key Attribute. Strong Entity does not depend on other Entity in 
-- the Schema. It has a primary key, that helps in identifying it uniquely, and it is represented by a rectangle. These are called 
-- Strong Entity Types.

-- 2. Weak Entity: An Entity type has a key attribute that uniquely identifies each entity in the entity set. But some entity type 
-- exists for which key attributes can’t be defined. These are called Weak Entity types.

-- For Example, A company may store the information of dependents (Parents, Children, Spouse) of an Employee. But the dependents can’t 
-- exist without the employee. So dependent will be a Weak Entity Type and Employee will be identifying entity type for dependent, which 
-- means it is Strong Entity Type.

-- A weak entity type is represented by a double rectangle. The participation of weak entity types is always total. The relationship 
-- between the weak entity type and its identifying strong entity type is called identifying relationship and it is represented by a 
-- double diamond.

-- What are Attributes: Attributes are the properties that define the entity type. For example, Roll_No, Name, DOB, Age, Address, 
-- and Mobile_No are the attributes that define entity type Student. In ER diagram, the attribute is represented by an oval.

-- Types of Attributes:
-- 1. Key Attribute: The attribute which uniquely identifies each entity in the entity set is called the key attribute. For example, 
-- Roll_No will be unique for each student. In ER diagram, the key attribute is represented by an oval with underlying lines.

-- 2. Composite Attribute: An attribute composed of many other attributes is called a composite attribute. For example, the Address 
-- attribute of the student Entity type consists of Street, City, State, and Country. In ER diagram, the composite attribute is represented 
-- by an oval comprising of ovals.

-- 3. Multivalued Attribute: An attribute consisting of more than one value for a given entity. For example, Phone_No (can be more than 
-- one for a given student). In ER diagram, a multivalued attribute is represented by a double oval.

-- 4. Derived Attribute: An attribute that can be derived from other attributes of the entity type is known as a derived attribute. 
-- e.g.; Age (can be derived from DOB). In ER diagram, the derived attribute is represented by a dashed oval.

-- Relationship Type and Relationship Set:
-- A Relationship Type represents the association between entity types. For example, ‘Enrolled in’ is a relationship type that exists 
-- between entity type Student and Course. In ER diagram, the relationship type is represented by a diamond and connecting the entities 
-- with lines.

-- Degree of a Relationship Set:
-- 1. Unary Relationship: When there is only ONE entity set participating in a relation, the relationship is called a unary relationship. 
-- For example, one person is married to only one person.
-- 2. Binary Relationship: When there are TWO entities set participating in a relationship, the relationship is called a binary relationship. 
-- For example, a Student is enrolled in a Course.
-- 3. Ternary Relationship: When there are three entity sets participating in a relationship, the relationship is called a ternary relationship.
-- 4. N-ary Relationship: When there are n entities set participating in a relationship, the relationship is called an n-ary relationship.

-- What is Cardinality: The maximum number of times an entity of an entity set participates in a relationship set is known as cardinality. 
-- Cardinality can be of different types:

-- 1. One-to-One: When each entity in each entity set can take part only once in the relationship, the cardinality is one-to-one. Let us 
-- assume that a male can marry one female and a female can marry one male. So the relationship will be one-to-one.

-- 2. One-to-Many: In one-to-many mapping as well where each entity can be related to more than one entity. Let us assume that one surgeon 
-- department can accommodate many doctors. So the Cardinality will be 1 to M. It means one department has many Doctors.

-- 3. Many-to-One: When entities in one entity set can take part only once in the relationship set and entities in other entity sets can 
-- take part more than once in the relationship set, cardinality is many to one. Let us assume that a student can take only one course 
-- but one course can be taken by many students. So the cardinality will be n to 1. It means that for one course there can be n students 
-- but for one student, there will be only one course.

-- 4. Many-to-Many: When entities in all entity sets can take part more than once in the relationship cardinality is many to many. Let 
-- us assume that a student can take more than one course and one course can be taken by many students. So the relationship will be many 
-- to many.

-- Generalization, Specialization and Aggregation in ER Model: -------------
-- Generalization: Generalization is like a bottom-up approach in which two or more entities of lower level combine to form a higher level 
-- entity if they have some attributes in common.
-- In generalization, an entity of a higher level can also combine with the entities of the lower level to form a further higher level entity.
-- Generalization is more like subclass and superclass system, but the only difference is the approach. Generalization uses the bottom-up approach.
-- In generalization, entities are combined to form a more generalized entity, i.e., subclasses are combined to make a superclass.
-- For example, Faculty and Student entities can be generalized and create a higher level entity Person.

-- Generalization is also called as ‘ Bottom-up approach”.

-- Specialization: Specialization is a top-down approach, and it is opposite to Generalization. In specialization, one higher level entity can 
-- be broken down into two lower level entities.
-- Specialization is used to identify the subset of an entity set that shares some distinguishing characteristics.
-- Normally, the superclass is defined first, the subclass and its related attributes are defined next, and relationship set are then added.
-- For example: In an Employee management system, EMPLOYEE entity can be specialized as TESTER or DEVELOPER based on what role they play in 
-- the company.

-- Specialization is also called as ” Top-Down approch”.

-- Inheritance: It is an important feature of generalization and specialization.
-- Attribute inheritance : It allows lower level entities to inherit the attributes of higher level entities and vice versa. In diagram 
-- Car entity is an inheritance of Vehicle entity ,So Car can acquire attributes of Vehicle. Example:car can acquire Model attribute of Vehicle.

-- Participation inheritance: Participation inheritance in ER modeling refers to the inheritance of participation constraints from a 
-- higher-level entity (superclass) to a lower-level entity (subclass). It ensures that subclasses adhere to the same participation rules 
-- in relationships, although attributes and relationships themselves are inherited differently. In diagram Vehicle entity has an 
-- relationship with Cycle entity, but it would not automatically acquire the relationship itself with the Vehicle entity. Participation 
-- inheritance only refers to the inheritance of participation constraints, not the actual relationships between entities.

-- Aggregation: An ER diagram is not capable of representing the relationship between an entity and a relationship which may be required in 
-- some scenarios. In those cases, a relationship with its corresponding entities is aggregated into a higher-level entity. Aggregation is 
-- an abstraction through which we can represent relationships as higher-level entity sets.

-- For Example, an Employee working on a project may require some machinery. So, REQUIRE relationship is needed between the relationship 
-- WORKS_FOR and entity MACHINERY. Using aggregation, WORKS_FOR relationship with its entities EMPLOYEE and PROJECT is aggregated into a 
-- single entity and relationship REQUIRE is created between the aggregated entity and MACHINERY.

-- Recursive Relationships in ER diagrams: -------------
-- A relationship between two entities of the same entity set is called a recursive relationship or repeated relationship. Here the same 
-- entity set participates more than once in a relationship type with a different role for each instance.

-- Recursive relationships are often used to represent hierarchies or networks, where an entity can be connected to other entities of the 
-- same type.
-- For example, in an organizational chart, an employee can have a relationship with other employees who are also in a managerial position. 
-- Similarly, in a social network, a user can have a relationship with other users who are their friends.
-- To represent a recursive relationship in an ER diagram, we use a self-join, which is a join between a table and itself. In other words, 
-- we create a relationship between the same entity type. The self-join involves creating two instances of the same entity and connecting 
-- them with a relationship. One instance is considered the parent, and the other instance is considered the child.

-- Implementing a Recursive Relationship:
-- To implement a recursive relationship, a foreign key of the employee’s manager number would be held in each employee record. A Sample 
-- table would look something like this:- 

-- Emp_entity( Emp_no,Emp_Fname, Emp_Lname, Emp_DOB, Emp_NI_Number, Manager_no);
-- Manager no - (this is the employee no of the employee's manager)
-- Example:

-- CREATE TABLE employee (
--     id INT PRIMARY KEY,
--     name VARCHAR(50),
--     manager_id INT,
--     FOREIGN KEY (manager_id) REFERENCES employee(id)
-- );

-- Here, the employee table has a foreign key column called manager_id that references the id column of the same employee table. This 
-- allows you to create a recursive relationship where an employee can have a manager who is also an employee.

----------------------------------------------------------------------------------------------------------------------------------

-- Relational Model and Functional Dependencies: -------------

-- The Relational Model represents data and their relationships through a collection of tables. Each table also known as a relation consists 
-- of rows and columns. Every column has a unique name and corresponds to a specific attribute, while each row contains a set of related data 
-- values representing a real-world entity or relationship. This model is part of the record-based models which structure data in fixed-format 
-- records each belonging to a particular type with a defined set of attributes.

-- E.F. Codd introduced the Relational Model to organize data as relations or tables. After creating the conceptual design of a database using 
-- an ER diagram, this design must be transformed into a relational model which can then be implemented using relational database systems like 
-- Oracle SQL or MySQL.

-- What is the Relational Model? 
-- The relational model represents how data is stored in Relational Databases. A relational database consists of a collection of tables 
-- each of which is assigned a unique name. Consider a relation STUDENT with attributes ROLL_NO, NAME, ADDRESS, PHONE, and AGE shown in 
-- the table. 

-- Key Terms: -------------
-- Attribute: Attributes are the properties that define an entity. e.g. ROLL_NO, NAME, ADDRESS.

-- Relation Schema: A relation schema defines the structure of the relation and represents the name of the relation with its attributes. e.g. 
-- STUDENT (ROLL_NO, NAME, ADDRESS, PHONE, and AGE) is the relation schema for STUDENT. If a schema has more than 1 relation it is called 
-- Relational Schema.

-- Tuple: Each row in the relation is known as a tuple. The above relation contains 4 tuples one of which is shown as:

-- Relation Instance: The set of tuples of a relation at a particular instance of time is called a relation instance. It can change whenever 
-- there is an insertion, deletion or update in the database.

-- Degree: The number of attributes in the relation is known as the degree of the relation. The STUDENT relation defined above has degree 5.

-- Cardinality: The number of tuples in a relation is known as cardinality. The STUDENT relation defined above has cardinality 4.

-- Column: The column represents the set of values for a particular attribute. The column ROLL_NO is extracted from the relation STUDENT.

-- NULL Values: The value which is not known or unavailable is called a NULL value. It is represented by NULL. e.g. PHONE of STUDENT having 
-- ROLL_NO 4 is NULL. 

-- Relation Key: These are basically the keys that are used to identify the rows uniquely or also help in identifying tables. These are of 
-- the following types:
-- 1. Primary Key.
-- 2. Candidate Key.
-- 3. Super Key.
-- 4. Foreign Key.
-- 5. Alternate Key.
-- 6. Composite Key.

-- Characteristics of the Relational Model: -------------
-- Data Representation: Data is organized in tables (relations), with rows (tuples) representing records and columns (attributes) representing 
-- data fields.
-- Atomic Values: Each attribute in a table contains atomic values, meaning no multi-valued or nested data is allowed in a single cell.
-- Unique Keys: Every table has a primary key to uniquely identify each record, ensuring no duplicate rows.
-- Attribute Domain: Each attribute has a defined domain, specifying the valid data types and constraints for the values it can hold.
-- Tuples as Rows: Rows in a table, called tuples, represent individual records or instances of real-world entities or relationships.
-- Relation Schema: A table’s structure is defined by its schema, which specifies the table name, attributes, and their domains.
-- Data Independence: The model ensures logical and physical data independence, allowing changes in the database schema without affecting 
-- the application layer.

-- Integrity Constraints: Integrity constraints are a set of rules. It is used to maintain the quality of information.
-- Integrity constraints ensure that the data insertion, updating, and other processes have to be performed in such a way that data integrity 
-- is not affected.
-- Thus, integrity constraint is used to guard against accidental damage to the database.

-- Types of Integrity Constraint:
-- 1. Domain constraints:
-- Domain constraints can be defined as the definition of a valid set of values for an attribute.
-- The data type of domain includes string, character, integer, time, date, currency, etc. The value of the attribute must be available in 
-- the corresponding domain.

-- 2. Entity integrity constraints:
-- The entity integrity constraint states that primary key value can't be null.
-- This is because the primary key value is used to identify individual rows in relation and if the primary key has a null value, then we 
-- can't identify those rows.
-- A table can contain a null value other than the primary key field.

-- The Roll_no column, which is the primary key in the student table above, includes a null value in the last row, breaking the entity integrity 
-- requirement.

-- 3. Referential Integrity Constraints:
-- A referential integrity constraint is specified between two tables.
-- In the Referential integrity constraints, if a foreign key in Table 1 refers to the Primary Key of Table 2, then every value of the 
-- Foreign Key in Table 1 must be null or be available in Table 2.

-- 4. Key constraints:
-- Keys are the entity set that is used to identify an entity within its entity set uniquely.
-- An entity set can have multiple keys, but out of which one key will be the primary key. A primary key must be unique and cannot be NULL 
-- in the relational table.

-- Properties of Relations: -------------
-- Each attribute in a relation has only one data value corresponding to it i.e. they do not contain two or more values.
-- Name of the relation is distinct from all other relations.
-- Each relation cell contains exactly one atomic (single) value
-- Each attribute contains a distinct name
-- Attribute domain has no significance
-- tuple has no duplicate value
-- Order of tuple can have a different sequence
-- It also provides information about metadata.

-- Merits of Relational Model: -------------
-- This provides an abstract view of the data. It abstracts the physical structure from the logical structure of data.
-- This model is very easy to design. Tables can use different attributes as per requirements.
-- The relational model supports data independence. In a relational database the data is stored in tables so that we can modify the data 
-- without changing the physical structure.
-- Relational database helps the user to use a query language to query the database.
-- It offers more flexibility than other models.
-- By moving sensitive attributes, we can also implement database security control and authorization in a particular table into a separate 
-- relation with its authorization controls.
-- Relational database helps the user to use a query language to query the database.
-- A relational model consists of simple relationships. The characteristics of a database that make it immune to certain maintenance problems 
-- have been developed in the context of relational models.
-- It is useful for representing most real world objects and the relationships between them. It is very easy to implement a relationship 
-- through the use of a composite key, so this model persistence method dominates the market.

-- Anomalies in the Relational Model: -------------
-- Anomalies in the relational model refer to inconsistencies or errors that can arise when working with relational databases, specifically 
-- in the context of data insertion, deletion, and modification. There are different types of anomalies that can occur in referencing and 
-- referenced relations which can be discussed as:  

-- These anomalies can be categorized into three types:
-- Insertion Anomalies.
-- Deletion Anomalies.
-- Update Anomalies.

-- How Are Anomalies Caused in DBMS?
-- Anomalies in DBMS are caused by poor management of storing everything in the flat database, lack of normalization, data redundancy, and 
-- improper use of primary or foreign keys. These issues result in inconsistencies during insert, update, or delete operations, leading to data 
-- integrity problems. The three primary types of anomalies are:

-- Insertion Anomalies: These anomalies occur when it is not possible to insert data into a database because the required fields are missing 
-- or because the data is incomplete. For example, if a database requires that every record has a primary key, but no value is provided for a 
-- particular record, it cannot be inserted into the database.
-- Deletion anomalies: These anomalies occur when deleting a record from a database and can result in the unintentional loss of data. For 
-- example, if a database contains information about customers and orders, deleting a customer record may also delete all the orders associated 
-- with that customer.
-- Update anomalies:  These anomalies occur when modifying data in a database and can result in inconsistencies or errors. For example, 
-- if a database contains information about employees and their salaries, updating an employee’s salary in one record but not in all related 
-- records could lead to incorrect calculations and reporting.

-- Advantages of the Relational Model:
-- Simple model: Relational Model is simple and easy to use in comparison to other languages.
-- Flexible: Relational Model is more flexible than any other relational model present.
-- Secure: Relational Model is more secure than any other relational model.
-- Data Accuracy: Data is more accurate in the relational data model.
-- Data Integrity: The integrity of the data is maintained in the relational model.
-- Operations can be Applied Easily: It is better to perform operations in the relational model.

-- Disadvantages of the Relational Model:
-- Relational Database Model is not very good for large databases.
-- Sometimes, it becomes difficult to find the relation between tables.
-- Because of the complex structure, the response time for queries is high.

-- Types of Keys in Relational Model (Candidate, Super, Primary, Alternate and Foreign): -------------
-- Keys are one of the basic requirements of a relational database model. It is widely used to identify the tuples(rows) uniquely in the table. 
-- We also use keys to set up relations amongst various columns and tables of a relational database.

-- Why do we require Keys in a DBMS?
-- We require keys in a DBMS to ensure that data is organized, accurate, and easily accessible. Keys help to uniquely identify records in a 
-- table, which prevents duplication and ensures data integrity.
-- Keys also establish relationships between different tables, allowing for efficient querying and management of data. Without keys, it 
-- would be difficult to retrieve or update specific records, and the database could become inconsistent or unreliable.

-- Different Types of Database Keys:

-- Super Key:
-- The set of one or more attributes (columns) that can uniquely identify a tuple (record) is known as Super Key. 
-- For Example, STUD_NO, (STUD_NO, STUD_NAME), etc.
-- A super key is a group of single or multiple keys that uniquely identifies rows in a table. It supports NULL values in rows.
-- A super key can contain extra attributes that aren’t necessary for uniqueness. For example, if the “STUD_NO” column can uniquely 
-- identify a student, adding “SNAME” to it will still form a valid super key, though it’s unnecessary.

-- Candidate Key:
-- The minimal set of attributes that can uniquely identify a tuple is known as a candidate key. For Example, STUD_NO in STUDENT relation.
-- A candidate key is a minimal super key, meaning it can uniquely identify a record but contains no extra attributes.
-- It is a super key with no repeated data is called a candidate key.
-- The minimal set of attributes that can uniquely identify a record.
-- A candidate key must contain unique values, ensuring that no two rows have the same value in the candidate key’s columns.
-- Every table must have at least a single candidate key.
-- A table can have multiple candidate keys but only one primary key.

-- Example: STUD_NO is the candidate key for relation STUDENT.

-- Primary Key:
-- There can be more than one candidate key in relation out of which one can be chosen as the primary key. For Example, STUD_NO, as well as 
-- STUD_PHONE, are candidate keys for relation STUDENT but STUD_NO can be chosen as the primary key (only one out of many candidate keys).

-- A primary key is a unique key, meaning it can uniquely identify each record (tuple) in a table.
-- It must have unique values and cannot contain any duplicate values.
-- A primary key cannot be NULL, as it needs to provide a valid, unique identifier for every record.
-- A primary key does not have to consist of a single column. In some cases, a composite primary key (made of multiple columns) can be used 
-- to uniquely identify records in a table.
-- Databases typically store rows ordered in memory according to primary key for fast access of records using primary key.
-- Example: STUDENT table -> Student(STUD_NO, SNAME, ADDRESS, PHONE) , STUD_NO is a primary key  

-- Alternate Key:
-- An alternate key is any candidate key in a table that is not chosen as the primary key. In other words, all the keys that are not selected 
-- as the primary key are considered alternate keys.
-- An alternate key is also referred to as a secondary key because it can uniquely identify records in a table, just like the primary key.
-- An alternate key can consist of one or more columns (fields) that can uniquely identify a record, but it is not the primary key
-- Eg:- SNAME, and ADDRESS is Alternate keys

-- Example:
-- STUD_NO, as well as PHONE both, are candidate keys for relation STUDENT but PHONE will be an alternate key 
-- (only one out of many candidate keys).

-- Foreign Key:
-- A foreign key is an attribute in one table that refers to the primary key in another table. The table that contains the foreign key is 
-- called the referencing table, and the table that is referenced is called the referenced table.
-- A foreign key in one table points to the primary key in another table, establishing a relationship between them.
-- It helps connect two or more tables, enabling you to create relationships between them. This is essential for maintaining data integrity and preventing data redundancy.
-- They act as a cross-reference between the tables.
-- For example, DNO is a primary key in the DEPT table and a non-key in EMP

-- It may be worth noting that, unlike the Primary Key of any given relation, Foreign Key can be NULL as well as may contain duplicate tuples 
-- i.e. it need not follow uniqueness constraint. For Example, STUD_NO in the STUDENT_COURSE relation is not unique. It has been repeated for 
-- the first and third tuples. However, the STUD_NO in STUDENT relation is a primary key and it needs to be always unique, and it cannot be null.

-- Composite Key:
-- Sometimes, a table might not have a single column/attribute that uniquely identifies all the records of a table. To uniquely identify rows of a table, a combination of two or more columns/attributes can be used.  It still can give duplicate values in rare cases. So, we need to find the optimal set of attributes that can uniquely identify rows in a table.
-- It acts as a primary key if there is no primary key in a table.
-- Two or more attributes are used together to make a composite key.
-- Different combinations of attributes may give different accuracy in terms of identifying the rows uniquely.
-- Example: FULLNAME + DOB can be combined together to access the details of a student.

