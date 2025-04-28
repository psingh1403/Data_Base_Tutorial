-- Functional Dependency and Attribute Closure: -------------

-- Functional Dependency:
-- A functional dependency A->B in a relation holds if two tuples having the same value of attribute A must have the same value for 
-- attribute B. For Example, in relation to STUDENT shown in Table 1, Functional Dependencies

-- STUD_NO -> STUD_NAME and
-- STUD_NO -> STUD_PHONE hold
-- Note : A STUD_NO uniquely identifies a STUD_NAME and STUD_PHONE

-- but 
-- STUD_NAME->STUD_STATE does not hold
-- Note: Two students can have same name (Like RAM in the below table) and hence same state

-- How to find Functional Dependencies for a Relation?
-- Functional Dependencies in a relation are dependent on the domain of the relation. Consider the STUDENT relation given in Table 1. 

-- We know that STUD_NO is unique for each student. So STUD_NO->STUD_NAME, STUD_NO->STUD_PHONE, STUD_NO->STUD_STATE, STUD_NO->STUD_COUNTRY 
-- and STUD_NO -> STUD_AGE all will be true.
-- Similarly, STUD_STATE->STUD_COUNTRY will be true as if two records have same STUD_STATE, they will have same STUD_COUNTRY as well.
-- For relation STUDENT_COURSE, COURSE_NO->COURSE_NAME will be true as two records with same COURSE_NO will have same COURSE_NAME.
-- Important Points About Functional Dependencies
-- Ensure data consistency and integrity across the database.
-- Simplify data operations like addition, editing, and deletion.
-- Identifying dependencies can be complex for large databases.
-- Overly restrictive dependencies may slow queries or cause inconsistencies.

-- Functional Dependency Set: -------------
-- Functional Dependency set or FD set of a relation is the set of all FDs present in the relation. For Example, FD set for relation STUDENT 
-- shown in table 1 is: 
-- { STUD_NO->STUD_NAME, STUD_NO->STUD_PHONE, STUD_NO->STUD_STATE, STUD_NO->STUD_COUNTRY, STUD_NO -> STUD_AGE, STUD_STATE->STUD_COUNTRY }

-- Types of Functional dependency:

-- 1. Trivial functional dependency:
-- A → B has trivial functional dependency if B is a subset of A.
-- The following dependencies are also trivial like: A → A, B → B

-- Example:
-- Consider a table with two columns Employee_Id and Employee_Name.  
-- {Employee_id, Employee_Name}   →    Employee_Id is a trivial functional dependency as   
-- Employee_Id is a subset of {Employee_Id, Employee_Name}.  
-- Also, Employee_Id → Employee_Id and Employee_Name   →    Employee_Name are trivial dependencies too.  

-- 2. Non-trivial functional dependency:
-- A → B has a non-trivial functional dependency if B is not a subset of A.
-- When A intersection B is NULL, then A → B is called as complete non-trivial.

-- Example:
-- ID   →    Name,  
-- Name   →    DOB  

-- Armstrong's Axioms of Functional Dependency Property:
-- 2. Reflexivity: This rule of Armstrong's axioms state that, If S -> T, then T is the subset of S.
-- 1. Augmentation: This rule of Armstrong's axioms state that, If S -> T, then we can say SR -> TR.
-- 3. Transitivity: This rule of Armstrong's axioms state that, If S -> T and T -> U, then we can say S -> U.
-- 4. Attribute Closure: The set of attributes that are functionally dependent on the attribute A is called Attribute Closure of A and it 
-- can be represented as A+.

-- Functional Dependency in DBMS Advantages: 
-- 1. Data Accuracy: In a database, functional dependencies aid in preserving data integrity. A database management system (DBMS) can 
-- impose restrictions to stop inconsistent or inaccurate data from being put into the database by setting rules that regulate the connections 
-- between attributes.

-- 2. Normalization: A technique used in normalization of databases is functional dependencies. Database designers can reduce data 
-- duplication and anomalies by dividing huge tables into smaller, more manageable ones by recognizing and implementing functional relationships.

-- 3. Effective Storage: Data storage may become more effective by using functional dependencies to normalize a database. Less storage space 
-- is required for smaller, normalized tables, which is particularly advantageous for larger databases.

-- 4. The simplicity of Maintenance: Maintaining functional relationships makes databases easier. The impact of necessary modifications to 
-- the database structure or schema is more limited, which lowers the possibility of generating mistakes or inconsistencies in the data.

-- Prime and Non-Prime Attributes: -------------
-- Attributes which are parts of any candidate key of relation are called as prime attribute, others are non-prime attributes. For Example, 
-- STUD_NO in STUDENT relation is prime attribute, others are non-prime attribute.

-- Armstrong’s Axioms in Functional Dependency in DBMS: -------------
-- Armstrong’s Axioms refer to a set of inference rules, introduced by William W. Armstrong, that are used to test the logical implication 
-- of functional dependencies. Given a set of functional dependencies F, the closure of F (denoted as F+) is the set of all functional 
-- dependencies logically implied by F. Armstrong’s Axioms, when applied repeatedly, help generate the closure of functional dependencies.

-- These axioms are fundamental in determining functional dependencies in databases and are used to derive conclusions about the 
-- relationships between attributes.

-- Axioms:
-- Axiom of Reflexivity: If A is a set of attributes and B is a subset of A, then A holds B. If B⊆A then A→B. This property is 
-- trivial property.

-- {A} → {A} (A set always determines itself).
-- {B} → {B}.
-- {A, C} → {A}.

-- Axiom of Augmentation: If A→B holds and Y is the attribute set, then AY→BY also holds. That is adding attributes to dependencies, 
-- does not change the basic dependencies. If A→B, then AC→BC for any C.

-- From {A} → {B}, we can augment both sides with {C}: {A, C} → {B, C}.
-- From {B} → {C}, we can augment both sides with {A}: {A, B} → {C, B}.

-- Axiom of Transitivity: Same as the transitive rule in algebra, if A→B holds and B→C holds, then A→C also holds. A→B is called A 
-- functionally which determines B. If X→Y and Y→Z, then X→Z.

-- If we know {A} → {B} and {B} → {C}, we can infer that: {A} → {C} (Using transitivity: {A} → {B} and {B} → {C}).

-- Secondary Rules: These rules can be derived from the above axioms.

-- Union: If A→B holds and A→C holds, then A→BC holds. If X→Y and X→Z then X→YZ.
-- If A → B and A → C, then by the Union Rule, we can infer: A → BC This means if A determines both B and C, it also determines 
-- their combination, BC.

-- Composition: If A→B and X→Y hold, then AX→BY holds.
-- Decomposition: If A→BC holds then A→B and A→C hold. If X→YZ then X→Y and X→Z.
-- Pseudo Transitivity: If A→B holds and BC→D holds, then AC→D holds. If X→Y and YZ→W then XZ→W.

-- Advantages of Using Armstrong’s Axioms in Functional Dependency:
-- They provide a systematic and efficient method for inferring additional functional dependencies from a given set of functional dependencies, 
-- which can help to optimize database design.
-- They can be used to identify redundant functional dependencies, which can help to eliminate unnecessary data and improve database performance.
-- They can be used to verify whether a set of functional dependencies is a minimal cover, which is a set of dependencies that cannot be 
-- further reduced without losing information.

-- Disadvantages of Using Armstrong’s Axioms in Functional Dependency: 
-- The process of using Armstrong’s axioms to infer additional functional dependencies can be computationally expensive, especially for 
-- large databases with many tables and relationships.
-- The axioms do not take into account the semantic meaning of data, and may not always accurately reflect the relationships between 
-- data elements.
-- The axioms can result in a large number of inferred functional dependencies, which can be difficult to manage and maintain over time.

---------------------------------------------------------------------------------------------------------------------------

-- Normalization in DBMS: -------------
-- Normalization is an important process in database design that helps improve the database’s efficiency, consistency, and accuracy. It makes 
-- it easier to manage and maintain the data and ensures that the database is adaptable to changing business needs.

-- Database normalization is the process of organizing the attributes of the database to reduce or eliminate data redundancy (having the same 
-- data but at different places).
-- Data redundancy unnecessarily increases the size of the database as the same data is repeated in many places. Inconsistency problems also 
-- arise during insert, delete, and update operations. 
-- In the relational model, there exist standard methods to quantify how efficient a databases is. These methods are called normal forms and 
-- there are algorithms to covert a given database into normal forms.
-- Normalization generally involves splitting a table into multiple ones which must be linked each time a query is made requiring data from 
-- the split tables.

-- Normalization is the process of organizing the data in the database.
-- Normalization is used to minimize the redundancy from a relation or set of relations. It is also used to eliminate undesirable 
-- characteristics like Insertion, Update, and Deletion Anomalies.
-- Normalization divides the larger table into smaller and links them using relationships.
-- The normal form is used to reduce redundancy from the database table.

-- Why do we need Normalization: -------------
-- The primary objective for normalizing the relations is to eliminate the below anomalies. Failure to reduce anomalies results in data 
-- redundancy, which may threaten data integrity and cause additional issues as the database increases. Normalization consists of a set 
-- of procedures that assist you in developing an effective database structure.

-- Insertion Anomalies: Insertion anomalies occur when it is not possible to insert data into a database because the required fields 
-- are missing or because the data is incomplete. For example, if a database requires that every record has a primary key, but no value 
-- is provided for a particular record, it cannot be inserted into the database.

-- Deletion anomalies: Deletion anomalies occur when deleting a record from a database and can result in the unintentional loss of data. 
-- For example, if a database contains information about customers and orders, deleting a customer record may also delete all the orders 
-- associated with that customer.

-- Updation anomalies: Updation anomalies occur when modifying data in a database and can result in inconsistencies or errors. For 
-- example, if a database contains information about employees and their salaries, updating an employee’s salary in one record but not 
-- in all related records could lead to incorrect calculations and reporting.

-- Prerequisites for Understanding Database Normalization: -------------
-- Keys are like unique identifiers in a table. For example, in a table of students, the student ID is a key because it uniquely identifies 
-- each student. Without keys, it would be hard to tell one record apart from another, especially if some information (like names) is the 
-- same. Keys ensure that data is not duplicated and that every record can be uniquely accessed.

-- Functional dependency helps define the relationships between data in a table. For example, if you know a student’s ID, you can find 
-- their name, age, and class. This relationship shows how one piece of data (like the student ID) determines other pieces of data in the 
-- same table. Functional dependency helps us understand these rules and connections, which are crucial for organizing data properly.

-- Once we figure out dependencies, we split tables to make sure that only closely related data is together in a table. When we split tables, 
-- we need to ensure that we do not loose information. For this, we need to learn the below concepts.

-- Features of Database Normalization: -------------
-- Elimination of Data Redundancy: One of the main features of normalization is to eliminate the data redundancy that can occur in a 
-- database. Data redundancy refers to the repetition of data in different parts of the database. Normalization helps in reducing or 
-- eliminating this redundancy, which can improve the efficiency and consistency of the database.

-- Ensuring Data Consistency: Normalization helps in ensuring that the data in the database is consistent and accurate. By eliminating 
-- redundancy, normalization helps in preventing inconsistencies and contradictions that can arise due to different versions of the same data.

-- Simplification of Data Management: Normalization simplifies the process of managing data in a database. By breaking down a complex 
-- data structure into simpler tables, normalization makes it easier to manage the data, update it, and retrieve it.

-- Improved Database Design: Normalization helps in improving the overall design of the database. By organizing the data in a structured 
-- and systematic way, normalization makes it easier to design and maintain the database. It also makes the database more flexible and 
-- adaptable to changing business needs.

-- Avoiding Update Anomalies: Normalization helps in avoiding update anomalies, which can occur when updating a single record in a table 
-- affects multiple records in other tables. Normalization ensures that each table contains only one type of data and that the relationships 
-- between the tables are clearly defined, which helps in avoiding such anomalies.

-- Standardization: Normalization helps in standardizing the data in the database. By organizing the data into tables and defining 
-- relationships between them, normalization helps in ensuring that the data is stored in a consistent and uniform manner.

-- Normal Forms in DBMS: -------------

-- 1. First Normal Form (1NF): A relation is in first normal form if every attribute in that relation is single-valued attribute. 

-- If a relation contains a composite or multi-valued attribute, it violates the first normal form, or the relation is in the first normal 
-- form if it does not contain any composite or multi-valued attribute. A relation is in first normal form if every attribute in that relation 
-- is single-valued attribute. 

-- A table is in 1 NF if: 
-- There are only Single Valued Attributes.
-- Attribute Domain does not change.
-- There is a unique name for every Attribute/Column.
-- The order in which data is stored does not matter.

-- 2. Second Normal Form (2NF): A relation that is in First Normal Form and every non-primary-key attribute is fully functionally 
-- dependent on the primary key, then the relation is in Second Normal Form (2NF).

-- Second Normal Form (2NF) is based on the concept of fully functional dependency. It is a way to organize a database table so that it 
-- reduces redundancy and ensures data consistency. For a table to be in 2NF, it must first meet the requirements of First Normal Form (1NF), 
-- meaning all columns should contain single, indivisible values without any repeating groups. Additionally, the table should not have partial 
-- dependencies.

-- The primary goal of Second Normal Form is to eliminate partial dependencies. A partial dependency happens when a non-prime attribute 
-- (an attribute not part of a candidate key) depends on only a part of a composite primary key, rather than on the entire key. Removing 
-- these partial dependencies helps in reducing redundancy and preventing update anomalies.

-- Why is 2NF Important?
-- 1. Reduces Redundancy.
-- 2. Minimizes Update Anomalies.
-- 3. Improves Data Integrity.
-- 4. Enhances Query Efficiency.

-- What is Partial Dependency?
-- A functional dependency denoted as X→Y where X and Y are an attribute set of a relation, is a partial dependency , if some attribute A∈X 
-- can be removed and the dependency still holds. For example, if you have a functional dependency X→Y, where X is a composite candidate key 
-- (made of multiple columns), and we can remove one column from X, but the dependency still works, then it’s a partial dependency.

-- In a composite key (a key made of multiple attributes), a partial dependency happens when one of the non-prime attributes depends only 
-- on a part of the composite key. Here’s how to identify partial dependencies in your database:
-- Look for functional dependencies where one attribute depends on a part of the primary key, not the entire key.
-- If an attribute (like COURSE_FEE in our example) depends on just a part of the key (COURSE_NO), it’s a partial dependency.
-- To remove partial dependencies, break the table into smaller tables that store only relevant data together.

-- 3. Third Normal Form (3NF): A relation is in the third normal form, if there is no transitive dependency for non-prime attributes as well as 
-- it is in the second normal form. A relation is in 3NF if at least one of the following conditions holds in every non-trivial function 
-- dependency X –> Y.

-- X is a super key.
-- Y is a prime attribute (each element of Y is part of some candidate key).

-- In other words, A relation that is in First and Second Normal Form and in which no non-primary-key attribute is transitively dependent on 
-- the primary key, then it is in Third Normal Form (3NF). 

-- Note: If A->B and B->C are two FDs then A->C is called transitive dependency. The normalization of 2NF relations to 3NF involves the 
-- removal of transitive dependencies. If a transitive dependency exists, we remove the transitively dependent attribute(s) from the relation 
-- by placing the attribute(s) in a new relation along with a copy of the determinant.

-- What is Transitive Dependency?
-- A transitive dependency occurs when a non-key attribute depends on the another non-key attribute rather than directly on the primary key. 
-- For instance, consider a table with the attributes (A, B, C) where A is the primary key and B and C are non-key attributes. If B determines 
-- C then C is transitively dependent on the A through B. This can lead to data anomalies and redundancy which 3NF aims to eliminate by the 
-- ensuring that all non-key attributes depend only on the primary key.

-- 4. Boyce-Codd Normal Form (BCNF): For BCNF the relation should satisfy the below conditions:
-- The relation should be in the 3rd Normal Form.
-- X should be a super-key for every functional dependency (FD) X−>Y in a given relation. 

-- It enforces that every non-trivial functional dependency must have a superkey on its left-hand side. This approach addresses potential 
-- issues with candidate keys and ensures the database is free from redundancy.
-- BCNF eliminates redundancy more effectively than 3NF by strictly requiring that all functional dependencies originate from super-keys.
-- BCNF is essential for good database schema design in higher-level systems where consistency and efficiency are important, particularly 
-- when there are many candidate keys (as one often finds with a delivery system).

-- Note: To test whether a relation is in BCNF, we identify all the determinants and make sure that they are candidate keys.

-- 5. Fourth Normal Form (4NF): A relation R is in 4NF if and only if the following conditions are satisfied: 
-- It should be in the Boyce-Codd Normal Form (BCNF).
-- The table should not have any Multi-valued Dependency.

-- 6. Fifth Normal Form (5NF):
-- R should be already in 4NF.
-- It cannot be further non loss decomposed (join dependency).

-- Advantages of Normalization:
-- Normalization eliminates data redundancy and ensures that each piece of data is stored in only one place, reducing the risk of data 
-- inconsistency and making it easier to maintain data accuracy.
-- By breaking down data into smaller, more specific tables, normalization helps ensure that each table stores only relevant data, which 
-- improves the overall data integrity of the database.
-- Normalization simplifies the process of updating data, as it only needs to be changed in one place rather than in multiple places 
-- throughout the database.
-- Normalization enables users to query the database using a variety of different criteria, as the data is organized into smaller, more 
-- specific tables that can be joined together as needed.
-- Normalization can help ensure that data is consistent across different applications that use the same database, making it easier to 
-- integrate different applications and ensuring that all users have access to accurate and consistent data.

-- Disadvantages of Normalization:
-- Normalization can result in increased performance overhead due to the need for additional join operations and the potential for slower 
-- query execution times.
-- Normalization can result in the loss of data context, as data may be split across multiple tables and require additional joins to retrieve.
-- Proper implementation of normalization requires expert knowledge of database design and the normalization process. 
-- Normalization can increase the complexity of a database design, especially if the data model is not well understood or if the normalization 
-- process is not carried out correctly.

-- Applications of Normal Forms in DBMS:
-- Ensures Data Consistency.
-- Reduces Data Redundancy.
-- Improves Query Performance: Simplifies queries by breaking large tables into smaller, more manageable ones, leading to faster data retrieval.
-- Enhances Data Integrity: Ensures that data is accurate and reliable by adhering to defined relationships and constraints between tables.
-- Easier Database Maintenance: Simplifies updates, deletions, and modifications by ensuring that changes only need to be made in one place, 
-- reducing the risk of errors.
-- Facilitates Scalability: Makes it easier to modify, expand, or scale the database structure as business requirements grow.
-- Supports Better Data Modeling: Helps in designing databases that are logically structured, with clear relationships between tables, 
-- making it easier to understand and manage.
-- Reduces Update Anomalies: Prevents issues like insertion, deletion, or modification anomalies that can arise from redundant data.
-- Improves Data Integrity and Security: By reducing unnecessary data duplication, normal forms help ensure sensitive information is 
-- securely and correctly maintained.
-- Optimizes Storage Efficiency: By organizing data into smaller tables, storage is used more efficiently, reducing the overhead for 
-- large databases.

-- Problems Caused Due to Redundancy: -------------
-- Data Inconsistency: Redundancy can lead to data inconsistencies, where the same data is stored in multiple locations, and changes to one 
-- copy of the data are not reflected in the other copies. This can result in incorrect data being used in decision-making processes and can 
-- lead to errors and inconsistencies in the data.
-- Storage Requirements: Redundancy increases the storage requirements of a database. If the same data is stored in multiple places, more 
-- storage space is required to store the data. This can lead to higher costs and slower data retrieval.
-- Update Anomalies: Redundancy can lead to update anomalies, where changes made to one copy of the data are not reflected in the other copies. 
-- This can result in incorrect data being used in decision-making processes and can lead to errors and inconsistencies in the data.
-- Performance Issues: Redundancy can also lead to performance issues, as the database must spend more time updating multiple copies of the 
-- same data. This can lead to slower data retrieval and slower overall performance of the database.
-- Security Issues: Redundancy can also create security issues, as multiple copies of the same data can be accessed and manipulated by 
-- unauthorized users. This can lead to data breaches and compromise the confidentiality, integrity, and availability of the data.
-- Maintenance Complexity: Redundancy can increase the complexity of database maintenance, as multiple copies of the same data must be updated 
-- and synchronized. This can make it more difficult to troubleshoot and resolve issues and can require more time and resources to maintain 
-- the database.
-- Data Duplication: Redundancy can lead to data duplication, where the same data is stored in multiple locations, resulting in wasted storage 
-- space and increased maintenance complexity. This can also lead to confusion and errors, as different copies of the data may have different 
-- values or be out of sync.
-- Data Integrity: Redundancy can also compromise data integrity, as changes made to one copy of the data may not be reflected in the other 
-- copies. This can result in inconsistencies and errors and can make it difficult to ensure that the data is accurate and up-to-date.
-- Usability Issues: Redundancy can also create usability issues, as users may have difficulty accessing the correct version of the data or 
-- may be confused by inconsistencies and errors. This can lead to frustration and decreased productivity, as users spend more time searching 
-- for the correct data or correcting errors.

-- Relational Decomposition: -------------
-- When a relation in the relational model is not in appropriate normal form then the decomposition of a relation is required.
-- In a database, it breaks the table into multiple tables.
-- If the relation has no proper decomposition, then it may lead to problems like loss of information.
-- Decomposition is used to eliminate some of the problems of bad design like anomalies, inconsistencies, and redundancy.

-- Types of Decomposition:

-- Lossless Decomposition:
-- If the information is not lost from the relation that is decomposed, then the decomposition will be lossless.
-- The lossless decomposition guarantees that the join of relations will result in the same relation as it was decomposed.
-- The relation is said to be lossless decomposition if natural joins of all the decomposition give the original relation.

-- Only 1NF,2NF,3NF, and BCNF are valid for lossless join decomposition.
-- In Lossless Decomposition, we select the common attribute and the criteria for selecting a common attribute is that the common attribute 
-- must be a candidate key or super key in either relation R1, R2, or both.

-- Dependency Preserving:
-- It is an important constraint of the database.
-- In the dependency preservation, at least one decomposed table must satisfy every dependency.
-- If a relation R is decomposed into relation R1 and R2, then the dependencies of R either must be a part of R1 or R2 or must be derivable 
-- from the combination of functional dependencies of R1 and R2.
-- For example, suppose there is a relation R(A, B, C, D) with functional dependency set (A->BC). The relational R is decomposed into R1(ABC) 
-- and R2(AD) which is dependency preserving because FD A->BC is a part of relation R1(ABC).

-- Key Concepts of Dependency Preserving Decomposition in DBMS:
-- Functional Dependency Preservation: This means that after decomposition, the functional dependencies in the original schema must still 
-- hold true in the decomposed schema.
-- Lossless Join Property: The decomposition must allow for the original relation to be reconstructed from the decomposed relations without 
-- any data loss, ensuring no information is discarded.
-- Normalization: The decomposition often aims to normalize the schema to higher normal forms (like 3NF or BCNF), which further eliminates 
-- redundancy and dependency anomalies.
-- Minimal Redundancy: By ensuring the decomposition preserves functional dependencies, it minimizes data redundancy and helps in avoiding 
-- data anomalies.

-- Step-by-Step Approach to Dependency Preserving Decomposition in DBMS:
-- In this technique, the original relation is decomposed into smaller relations in such a way that the resulting relations preserve the 
-- functional dependencies of the original relation. This is important because if the decomposition results in losing any of the original 
-- functional dependencies, it can lead to data inconsistencies and anomalies.
-- To achieve dependency preserving decomposition, there are various algorithms available, such as the Boyce-Codd Normal Form (BCNF) 
-- decomposition and the Third Normal Form (3NF) decomposition. These algorithms are based on the concept of functional dependencies 
-- and are used to identify the attributes that should be grouped together to form smaller relations.
-- The BCNF decomposition algorithm is used to decompose a relation into smaller relations in such a way that each resulting relation 
-- is in BCNF. BCNF is a higher normal form than 3NF and is used when there are multiple candidate keys in a relation.
-- The 3NF decomposition algorithm is used to decompose a relation into smaller relations in such a way that each resulting relation 
-- is in 3NF. 3NF is a normal form that ensures that there are no transitive dependencies between the attributes of a relation.
-- Overall, dependency preserving decomposition is an important technique in DBMS for improving database efficiency while maintaining 
-- data consistency and integrity. It is important to choose the right decomposition algorithm based on the specific requirements of the 
-- database to achieve the desired results.

-- Multivalued Dependency:
-- Multivalued dependency occurs when two attributes in a table are independent of each other but, both depend on a third attribute.
-- A multivalued dependency consists of at least two attributes that are dependent on a third attribute that's why it always requires at 
-- least three attributes.
-- Mutiivalued dependencies are consequences of 1NF which did not allow an attribute in a tuple to have a set of values.
-- In a relation, the functional dependency A -> B relates a value of A to a value of B while multivalued dependency represented A ->-> B 
-- represents a relationship that defines a relationship in which attribute B are determined by a single value of A. The multivalued 
-- dependency is the result of 1NF that prohibits an attribute from having a set of values.

-- Properties of Multivalued Dependency:
-- For a relation to maintain multivalued dependency, it must have atleast three attributes. Since Multivalued Dependency always occurs in 
-- pairs i.e. A->->C also holds in a relation R (A, B, C).
-- The attributes giving rise to the multivalued facts must be independent of each other.
-- Functional dependency is a special case of multivalued dependency. If we restrict the set determined by multivalued dependency to a 
-- single set then multivalued dependency reduces to a functional dependency.

-- Join Dependency:
-- Join decomposition is a further generalization of Multivalued dependencies.
-- If the join of R1 and R2 over C is equal to relation R, then we can say that a join dependency (JD) exists.
-- Where R1 and R2 are the decompositions R1(A, B, C) and R2(C, D) of a given relations R(A, B, C, D).
-- Alternatively, R1 and R2 are a lossless decomposition of R.
-- A JD ⋈ {R1, R2,..., Rn} is said to hold over a relation R if R1, R2,....., Rn is a lossless-join decomposition.
-- The *(A, B, C, D), (C, D) will be a JD of R if the join of join's attribute is equal to the relation R.
-- Here, *(R1, R2, R3) is used to indicate that relation R1, R2, R3 and so on are a JD of R.

-- Inclusion Dependency:
-- Multivalued dependency and join dependency can be used to guide database design although they both are less common than functional 
-- dependencies.
-- Inclusion dependencies are quite common. They typically show little influence on designing of the database.
-- The inclusion dependency is a statement in which some columns of a relation are contained in other columns.
-- The example of inclusion dependency is a foreign key. In one relation, the referring relation is contained in the primary key column(s) 
-- of the referenced relation.
-- Suppose we have two relations R and S which was obtained by translating two entity sets such that every R entity is also an S entity.
-- Inclusion dependency would be happen if projecting R on its key attributes yields a relation that is contained in the relation obtained 
-- by projecting S on its key attributes.
-- In inclusion dependency, we should not split groups of attributes that participate in an inclusion dependency.
-- In practice, most inclusion dependencies are key-based that is involved only keys.

-- Domain Key Normal Form in DBMS: -------------
-- a relation schema is said to be in DKNF only if all the constraints and dependencies that should hold on the valid relation state can be 
-- enforced simply by enforcing the domain constraints and the key constraints on the relation. For a relation in DKNF, it becomes very 
-- straight forward to enforce all the database constraints by simply checking that each attribute value is a tuple is of the appropriate 
-- domain and that every key constraint is enforced. Reason to use DKNF are as follows:

-- To avoid general constraints in the database that are not clear key constraints.
-- Most database can easily test or check key constraints on attributes.

-- Advantages of Domain Key Normal Form:
-- Improved Data Integrity: DK/NF ensures that all dependencies and constraints are preserved, resulting in improved data integrity.
-- Reduced Data Redundancy: DK/NF reduces data redundancy by breaking down a relation into smaller, more focused relations.
-- Improved Query Performance: By breaking down a relation into smaller, more focused relations, query performance can be improved.
-- Easier Maintenance and Updates: The smaller, more focused relations are easier to maintain and update than the original relation, making 
-- it easier to modify the database schema and update the data.
-- Better Flexibility: DK/NF can improve the flexibility of the database system by allowing for easier modification of the schema.

-- Disadvantages of Domain Key Normal Form:
-- Increased Complexity: Normalizing a relation to DK/NF can increase the complexity of the database system, making it harder to understand 
-- and manage.
-- Costly: Normalizing a relation to DK/NF can be costly, especially if the database is large and complex. This can require additional 
-- resources, such as hardware and personnel.
-- Reduced Performance: Although query performance can be improved in some cases, in others, normalization to DK/NF can result in reduced 
-- query performance due to the need for additional join operations.
-- Limited Scalability: Normalization to DK/NF may not scale well in larger databases, as the number of smaller, focused relations can 
-- become unwieldy.

-- Denormalization in Databases: -------------
-- Denormalization is a database optimization technique in which we add redundant data to one or more tables. This can help us avoid costly 
-- joins in a relational database. Note that denormalization does not mean ‘reversing normalization’ or ‘not to normalize’. It is an 
-- optimization technique that is applied after normalization.
-- Basically, The process of taking a normalized schema and making it non-normalized is called denormalization, and designers use it to 
-- tune the performance of systems to support time-critical operations.
-- In a traditional normalized database, we store data in separate logical tables and attempt to minimize redundant data. We may strive to 
-- have only one copy of each piece of data in a database.
-- For example, in a normalized database, we might have a Courses table and a Teachers table. Each entry in Courses would store the teacherID 
-- for a Course but not the teacherName. When we need to retrieve a list of all Courses with the Teacher’s name, we would do a join between 
-- these two tables. 
-- In some ways, this is great; if a teacher changes his or her name, we only have to update the name in one place. The drawback is that if 
-- tables are large, we may spend an unnecessarily long time doing joins on tables. Denormalization, then, strikes a different compromise. 
-- Under denormalization, we decide that we’re okay with some redundancy and some extra effort to update the database in order to get the 
-- efficiency advantages of fewer joins. 

-- How is Denormalization Different From Normalization?
-- Normalization and Denormalization both are the method which use in database but it works opposite to each other. One side normalization 
-- is used for reduce or removing the redundancy which means there will be no duplicate data or entries in the same table and also optimizes 
-- for data integrity and efficient storage, while Denormalization is used for add the redundancy into normalized table so that enhance the 
-- functionality and minimize the running time of database queries (like joins operation ) and optimizes for performance and query simplicity.

-- Advantages of Denormalization:
-- Improved Query Performance: Denormalization can improve query performance by reducing the number of joins required to retrieve data.
-- Reduced Complexity: By combining related data into fewer tables, denormalization can simplify the database schema and make it easier to manage.
-- Easier Maintenance and Updates: Denormalization can make it easier to update and maintain the database by reducing the number of tables.
-- Improved Read Performance: Denormalization can improve read performance by making it easier to access data.
-- Better Scalability: Denormalization can improve the scalability of a database system by reducing the number of tables and improving the 
-- overall performance.

-- Disadvantages of Denormalization:
-- Reduced Data Integrity: By adding redundant data, denormalization can reduce data integrity and increase the risk of inconsistencies.
-- Increased Complexity: While denormalization can simplify the database schema in some cases, it can also increase complexity by 
-- introducing redundant data.
-- Increased Storage Requirements: By adding redundant data, denormalization can increase storage requirements and increase the cost of 
-- maintaining the database.
-- Increased Update and Maintenance Complexity: Denormalization can increase the complexity of updating and maintaining the database by 
-- introducing redundant data.
-- Limited Flexibility: Denormalization can reduce the flexibility of a database system by introducing redundant data and making it harder 
-- to modify the schema.

-- Data Replication in DBMS: -------------
-- Data Replication is the process of storing data in more than one site or node. It is useful in improving the availability of data. It is 
-- simply copying data from a database from one server to another server so that all the users can share the same data without any 
-- inconsistency. The result is a distributed database in which users can access data relevant to their tasks without interfering with the 
-- work of others. Data replication encompasses the duplication of transactions on an ongoing basis so that the replicate is in a consistently 
-- updated state and synchronized with the source. However in data replication data is available at different locations, but a particular 
-- relation has to reside at only one location. There can be full replication, in which the whole database is stored at every site. There 
-- can also be partial replication, in which some frequently used fragments of the database are replicated and others are not replicated.

-- Types of Data Replication: -
-- Transactional Replication: In Transactional replication users receive full initial copies of the database and then receive updates as data 
-- changes. Data is copied in real-time from the publisher to the receiving database(subscriber) in the same order as they occur with the 
-- publisher therefore in this type of replication, transactional consistency is guaranteed. Transactional replication is typically used in 
-- server-to-server environments. It does not simply copy the data changes, but rather consistently and accurately replicates each change.

-- Snapshot Replication: Snapshot replication distributes data exactly as it appears at a specific moment in time and the does not monitor for 
-- updates to the data. The entire snapshot is generated and sent to Users. Snapshot replication is generally used when data changes are 
-- infrequent. It is a bit slower than transactional because on each attempt it moves multiple records from one end to the other end. Snapshot 
-- replication is a good way to perform initial synchronization between the publisher and the subscriber.

-- Merge Replication: Data from two or more databases is combined into a single database. Merge replication is the most complex type of 
-- replication because it allows both publisher and subscriber to independently make changes to the database. Merge replication is typically 
-- used in server-to-client environments. It allows changes to be sent from one publisher to multiple subscribers.

-- Replication Schemes: - 
-- 1. Full Replication: The most extreme case is replication of the whole database at every site in the distributed system. This will improve 
-- the availability of the system because the system can continue to operate as long as atleast one site is up.

-- Advantages of full replication:
-- High Availability of Data.
-- Improves the performance for retrieval of global queries as the result can be obtained locally from any of the local site.
-- Faster execution of Queries.

-- Disadvantages of full replication:
-- Concurrency is difficult to achieve in full replication.
-- Slow update process as a single update must be performed at different databases to keep the copies consistent.
-- The data can be easily recovered.
-- Concurrency can be achieved in no replication.
-- Since multiple users are accessing the same server, it may slow down the execution of queries.
-- The data is not easily available as there is no replication.
-- The number of copies of the fragment depends upon the importance of data.
-- To provide a consistent copy of data across all the database nodes.
-- To increase the availability of data.
-- The reliability of data is increased through data replication.
-- Data Replication supports multiple users and gives high performance.
-- To remove any data redundancy,the databases are merged and slave databases are updated with outdated or incomplete data.
-- Since replicas are created there are chances that the data is found itself where the transaction is executing which reduces the data movement.
-- To perform faster execution of queries.
-- More storage space is needed as storing the replicas of same data at different sites consumes more space.
-- Data Replication becomes expensive when the replicas at all different sites need to be updated.
-- Maintaining Data consistency at all different sites involves complex measures.

-- No replication: No replication means, each fragment is stored exactly at one site.

-- Advantages of No replication:
-- Concurrency has been minimized as only one site to be updated
-- Only one site hence easy to recover data.

-- Disadvantages of No replication:
-- Poor availability of data as centralized server only has data.
-- Slow down query execution as multiple clients accessing same server.

-- 3.Partial replication: Partial replication means, some fragments are replicated whereas others are not. Only a subset of the database 
-- is replicated at each site. This reduces storage costs but requires careful planning to ensure data consistency.

-- Advantages of partial replication:
-- Number of replicas created for a fragment directly depends upon the importance of data in that fragment.
-- Optimized architecture give advantages of both full replication and no replication scheme.

-- Features of data replication are:
-- Increased Availability: Data replication can improve availability by providing multiple copies of the same data in different locations, 
-- which reduces the risk of data unavailability due to network or hardware failures.

-- Improved Performance: Replicated data can be accessed more quickly since it is available in multiple locations, which can help to reduce
-- network latency and improve query performance.

-- Enhanced Scalability: Replication can improve scalability by distributing data across multiple nodes, which allows for increased processing 
-- power and improved performance.

-- Improved Fault Tolerance: By storing data redundantly in multiple locations, replication can improve fault tolerance by ensuring that data 
-- remains available even if a node or network fails.

-- Improved Data Locality: Replication can improve data locality by storing data close to the applications or users that need it, which can 
-- help to reduce network traffic and improve performance.

-- Simplified Backup and Recovery: Replication can simplify backup and recovery processes by providing multiple copies of the same data in 
-- different locations, which reduces the risk of data loss due to hardware or software failures.

-- Enhanced Disaster Recovery: Replication can improve disaster recovery capabilities by providing redundant copies of data in different 
-- geographic locations, which reduces the risk of data loss due to natural disasters or other events.

-- There are several types of data replication:
-- Master-slave replication: In this type of replication, one database server is designated as the master, and one or more other servers are 
-- designated as slaves. The master server receives all the write operations, and the slaves receive a copy of the data from the master.
-- Multi-master replication: In this type of replication, all the servers involved in replication can receive write operations, and all the 
-- updates made to any server will be replicated to all the other servers.
-- Peer-to-peer replication: In this type of replication, each server can act as both a master and a slave, and the data is replicated between 
-- all the servers in a peer-to-peer fashion.
-- Single-source replication: In this type of replication, a single source database is replicated to multiple target databases.

-- The advantages of data replication include:
-- Improved performance, as data can be read from a local copy of the data instead of a remote one.
-- Increased data availability, as copies of the data can be used in case of a failure of the primary database.
-- Improved scalability, as the load on the primary database can be reduced by reading data from the replicas.

-- The disadvantages of data replication include:
-- Increased complexity, as the replication process needs to be configured and maintained.
-- Increased risk of data inconsistencies, as data can be updated simultaneously on different replicas.
-- Increased storage and network usage, as multiple copies of the data need to be stored and transmitted.
-- Data replication is widely used in various types of systems, such as online transaction processing systems, data warehousing systems, 
-- and distributed systems.

