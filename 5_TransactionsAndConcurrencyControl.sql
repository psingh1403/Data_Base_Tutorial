
-- Transaction: ---------------
-- The transaction is a set of logically related operation. It contains a group of tasks.
-- A transaction is an action or series of actions. It is performed by a single user to perform operations for accessing the contents of 
-- the database.
-- Example: Suppose an employee of bank transfers Rs 800 from X's account to Y's account. This small transaction contains several low-level tasks:

-- X's Account:
-- Open_Account(X)  
-- Old_Balance = X.balance  
-- New_Balance = Old_Balance - 800  
-- X.balance = New_Balance  
-- Close_Account(X)  

-- Y's Account:
-- Open_Account(Y)  
-- Old_Balance = Y.balance  
-- New_Balance = Old_Balance + 800  
-- Y.balance = New_Balance  
-- Close_Account(Y)

-- Operations of Transaction: Following are the main operations of transaction:
-- Read(X): Read operation is used to read the value of X from the database and stores it in a buffer in main memory.
-- Write(X): Write operation is used to write the value back to the database from the buffer.

-- 1.  R(X);
-- 2.  X = X - 500;  
-- 3.  W(X);  

-- Let's assume the value of X before starting of the transaction is 4000.
-- The first operation reads X's value from database and stores it in a buffer.
-- The second operation will decrease the value of X by 500. So buffer will contain 3500.
-- The third operation will write the buffer's value to the database. So X's final value will be 3500.

-- But it may be possible that because of the failure of hardware, software or power, etc. that transaction may fail before finished all the 
-- operations in the set.

-- For example: If in the above transaction, the debit transaction fails after executing operation 2 then X's value will remain 4000 in the 
-- database which is not acceptable by the bank.

-- To solve this problem, we have two important operations:
-- Commit: It is used to save the work done permanently.
-- Rollback: It is used to undo the work done.

-- Transaction property: ---------------
-- From the definition of transaction it is clear that a single transaction may consists of a sequence of operations which are executed on 
-- the database internally. Once the transaction is being submitted, it should perform all the operations that are part of it and finally when 
-- it is completed, it should notify the success or failure and the changes made by the transaction to the user.

-- When the multiple user submit the truncations concurrently i.e. at the same time, the database may result in an inconsistent state due to 
-- overlapping of transactions. So, far a transaction to achieve data integrity in case of concurrent access and system failures, the transaction 
-- should have the properties of atomicity, consistency, isolation and durability. These properties are called ACID properties derived from the 
-- first letter of the property.

-- What is Transaction: 
-- It is a collection of operations that form a single logical unit of work. The transaction has four properties. These are used to maintain 
-- consistency in a database, before and after the transaction. The various operations that form a transaction typically include adding some 
-- new data, modifying the existing data, accessing existing data or a combination of these. The ACID properties are as follows:

-- Property of Transaction:
-- 1. Atomicity
-- 2. Consistency
-- 3. Isolation
-- 4. Durability

-- Atomicity: ---------------
-- The phrase “all or nothing” describes the first ACID property i.e. atomicity.
-- It states that all operations of the transaction take place at once if not, the transaction is aborted.
-- There is no midway, i.e., the transaction cannot occur partially. Each transaction is treated as one unit and either run to completion or 
-- is not executed at all.

-- Features of Atomicity Property:
-- Either all operations that are part of the transaction are completed or none.
-- It is maintained in the presence of disk, CPU, database software and application software failures.
-- It is maintained in the presence of deadlocks.
-- It can be locked at the system level as well as at the session level
-- Ensuring atomicity is the responsibility of the database system itself.

-- Atomicity involves the following two operations:
-- Abort: If a transaction aborts then all the changes made are not visible.
-- Commit: If a transaction commits then all the changes made are visible.

-- Consistency: ---------------
-- The phrase “no violation of integrity constraints” describes the property of consistency.
-- The integrity constraints are maintained so that the database is consistent before and after the transaction.
-- The execution of a transaction will leave a database in either its prior stable state or a new stable state.
-- The consistent property of database states that every transaction sees a consistent database instance.
-- The transaction is used to transform the database from one consistent state to another consistent state.

-- For example: The total amount must be maintained before or after the transaction.
-- Total before T occurs = 600+300=900
-- Total after T occurs= 500+400=900

-- Therefore, the database is consistent. In the case when T1 is completed but T2 fails, then inconsistency will occur.
-- Without a consistent property, money can be credited or debited by the transaction. It is the responsibility of the application programmers 
-- who code the transaction to maintain the consistency for individual transactions by enforcing consistency constraints on the database.

-- Isolation: ---------------
-- It shows that the data which is used at the time of execution of a transaction cannot be used by the second transaction until the first one 
-- is completed.
-- In isolation, if the transaction T1 is being executed and using the data item X, then that data item can't be accessed by any other 
-- transaction T2 until the transaction T1 ends.
-- The concurrency control subsystem of the DBMS enforced the isolation property.

-- Implementing Isolation:
-- When more than one transaction is executing concurrently then there can be problems even if each transaction satisfies the atomicity as 
-- well as the consistency property. These problems are there due to the overlapping of the concurrently running transactions i.e. when 
-- transaction interfere with one another

-- Durability: ---------------
-- The durability property is used to indicate the performance of the database's consistent state. It states that the transaction made the 
-- permanent changes.
-- They cannot be lost by the erroneous operation of a faulty transaction or by the system failure. When a transaction is completed, then the 
-- database reaches a state known as the consistent state. That consistent state cannot be lost, even in the event of a system's failure.
-- The recovery subsystem of the DBMS has the responsibility of Durability property.

-- How ACID Properties Impact DBMS Design and Operation:
-- The ACID properties, in totality, provide a mechanism to ensure the correctness and consistency of a database in a way such that each 
-- transaction is a group of operations that acts as a single unit, produces consistent results, acts in isolation from other operations, and 
-- updates that it makes are durably stored.

-- 1. Data Integrity and Consistency:
-- ACID properties safeguard the data integrity of a DBMS by ensuring that transactions either complete successfully or leave no trace if 
-- interrupted. They prevent partial updates from corrupting the data and ensure that the database transitions only between valid states.

-- 2. Concurrency Control:
-- ACID properties provide a solid framework for managing concurrent transactions. Isolation ensures that transactions do not interfere with each 
-- other, preventing data anomalies such as lost updates, temporary inconsistency, and uncommitted data.

-- 3. Recovery and Fault Tolerance:
-- Durability ensures that even if a system crashes, the database can recover to a consistent state. Thanks to the Atomicity and Durability 
-- properties, if a transaction fails midway, the database remains in a consistent state.

-- Advantages of ACID Properties in DBMS:
-- Data Consistency: ACID properties ensure that the data remains consistent and accurate after any transaction execution.
-- Data Integrity: It maintains the integrity of the data by ensuring that any changes to the database are permanent and cannot be lost.
-- Concurrency Control: ACID properties help to manage multiple transactions occurring concurrently by preventing interference between them.
-- Recovery: ACID properties ensure that in case of any failure or crash, the system can recover the data up to the point of failure or crash.

-- Disadvantages of ACID Properties in DBMS:
-- Performance Overhead: ACID properties can introduce performance costs, especially when enforcing isolation between transactions or ensuring 
-- atomicity.
-- Complexity: Maintaining ACID properties in distributed systems (like microservices or cloud environments) can be complex and may require 
-- sophisticated solutions like distributed locking or transaction coordination.
-- Scalability Issues: ACID properties can pose scalability challenges, particularly in systems with high transaction volumes, where traditional 
-- relational databases may struggle under load.

-- ACID in the Real World: 
-- Banking: Transactions involving money transfers, deposits, or withdrawals must maintain strict consistency and durability to prevent errors and fraud.
-- E-commerce: Ensuring that inventory counts, orders, and customer details are handled correctly and consistently, even during high traffic, 
-- requires ACID compliance.
-- Healthcare: Patient records, test results, and prescriptions must adhere to strict consistency, integrity, and security standards.

-- States of Transaction: ---------------
-- 1. Active state: 
-- The active state is the first state of every transaction. In this state, the transaction is being executed.
-- For example: Insertion or deletion or updating a record is done here. But all the records are still not saved to the database.

-- Partially committed: ---------------
-- In the partially committed state, a transaction executes its final operation, but the data is still not saved to the database.
-- In the total mark calculation example, a final display of the total marks step is executed in this state.

-- Committed: ---------------
-- A transaction is said to be in a committed state if it executes all its operations successfully. In this state, all the effects are 
-- now permanently saved on the database system.

-- Failed state: ---------------
-- If any of the checks made by the database recovery system fails, then the transaction is said to be in the failed state.
-- In the example of total mark calculation, if the database is not able to fire a query to fetch the marks, then the transaction will fail 
-- to execute.

-- Aborted: ---------------
-- If any of the checks fail and the transaction has reached a failed state then the database recovery system will make sure that the database 
-- is in its previous consistent state. If not then it will abort or roll back the transaction to bring the database into a consistent state.
-- If the transaction fails in the middle of the transaction then before executing the transaction, all the executed transactions are rolled back 
-- to its consistent state.

-- After aborting the transaction, the database recovery module will select one of the two operations:
-- 1. Re-start the transaction
-- 2. Kill the transaction

-- Schedule: ---------------
-- A series of operation from one transaction to another transaction is known as schedule. It is used to preserve the order of the operation in 
-- each of the individual transaction.

-- 1. Serial Schedule:
-- The serial schedule is a type of schedule where one transaction is executed completely before starting another transaction. In the serial 
-- schedule, when the first transaction completes its cycle, then the next transaction is executed.

-- 2. Non-serial Schedule:
-- This is a type of Scheduling where the operations of multiple transactions are interleaved. This might lead to a rise in the concurrency 
-- problem. The transactions are executed in a non-serial manner, keeping the end result correct and same as the serial schedule. Unlike the 
-- serial schedule where one transaction must wait for another to complete all its operation, in the non-serial schedule, the other transaction 
-- proceeds without waiting for the previous transaction to complete. This sort of schedule does not provide any benefit of the concurrent 
-- transaction. It can be of two types namely, Serializable and Non-Serializable Schedule. 

-- a). Serializable schedule: This is used to maintain the consistency of the database. It is mainly used in the Non-Serial scheduling to verify 
-- whether the scheduling will lead to any inconsistency or not. On the other hand, a serial schedule does not need the serializability because it 
-- follows a transaction only when the previous transaction is complete. The non-serial schedule is said to be in a serializable schedule only 
-- when it is equivalent to the serial schedules, for an n number of transactions. Since concurrency is allowed in this case thus, multiple 
-- transactions can execute concurrently. A serializable schedule helps in improving both resource utilization and CPU throughput. These are 
-- of two types:

-- => Conflict Serializable: A schedule is called conflict serializable if it can be transformed into a serial schedule by swapping non-conflicting 
-- operations. Two operations are said to be conflicting if all conditions satisfy:
-- They belong to different transactions
-- They operate on the same data item
-- At Least one of them is a write operation

-- Conflict Serializability guarantees that even though transactions run concurrently, their outcome will be identical to the result achieved if 
-- the transactions were executed one by one in a specific order.
-- It is a concept in concurrency control that determines whether a non-serial schedule can be rearranged to act like a serial schedule without 
-- conflicts.
-- It ensures data consistency when multiple transactions are executed at the same time.
-- There is another type of serializability called view serializability, which is less restrictive than conflict serializability.

-- Advantages of Conflict Serializability:
-- Consistency: Conflict serializability guarantees that the transactions’ outcomes correspond to the sequence in which they were carried out.
-- Correctness: Regardless of the order in which transactions were submitted, conflict serializability guarantees that transactions are 
-- executed correctly.
-- Decreased Overhead: By doing away with pointless locking and other conflict resolution techniques, conflict serializability lowers overhead.
-- Enhanced Concurrency: By enabling concurrent execution of operations without causing conflicts, conflict serializability enhances concurrency.

-- Disadvantages of Conflict Serializability: 
-- Complexity: Conflict serializability can be complex to implement, especially in large and complex databases.
-- Reduced Performance: Conflict serializability can reduce performance by introducing delays and overhead due to locking and other conflict 
-- resolution mechanisms.
-- Limited Concurrency: Conflict serializability can limit the degree of concurrency in the system because it may delay some transactions to 
-- avoid conflicts.
-- Increased Overhead: Conflict serializability requires additional overhead to maintain the order of the transactions and ensure that they 
-- do not conflict with each other.

-- => View Serializable: A Schedule is called view serializable if it is view equal to a serial schedule (no overlapping transactions). A conflict 
-- schedule is a view serializable but if the serializability contains blind writes, then the view serializable does not conflict serializable.

-- View Serializability guarantees that even though transactions run concurrently, their outcome will be identical to the result achieved if 
-- the transactions were executed one by one in a specific order.
-- It is a concept in concurrency control that determines whether a non-serial schedule can be rearranged to act like a serial schedule 
-- without conflicts.
-- It ensures data consistency and integrity when multiple transactions are executed at the same time.

-- b). Non-Serializable: The non-serializable schedule is divided into two types, Recoverable and Non-recoverable Schedule.

-- => Recoverable Schedule: Schedules in which transactions commit only after all transactions whose changes they read commit are called 
-- recoverable schedules. In other words, if some transaction T j is reading value updated or written by some other transaction T i , then 
-- the commit of T j must occur after the commit of T i .

-- This is a recoverable schedule since T 1 commits before T 2 , that makes the value read by T 2 correct. There can be three types of recoverable 
-- schedule:

-- Cascading Schedule: Also called Avoids cascading aborts/rollbacks (ACA). When there is a failure in one transaction and this leads to the 
-- rolling back or aborting other dependent transactions, then such scheduling is referred to as Cascading rollback or cascading abort.

-- Cascadeless Schedule: Schedules in which transactions read values only after all transactions whose changes they are going to read commit are 
-- called cascadeless schedules. Avoids that a single transaction abort leads to a series of transaction rollbacks. A strategy to prevent 
-- cascading aborts is to disallow a transaction from reading uncommitted changes from another transaction in the same schedule. In other words, 
-- if some transaction T j wants to read value updated or written by some other transaction T i , then the commit of T j must read it after the 
-- commit of T i .

-- Strict Schedule: A schedule is strict if for any two transactions Ti, Tj, if a write operation of Ti precedes a conflicting operation of Tj 
-- (either read or write), then the commit or abort event of Ti also precedes that conflicting operation of Tj. In other words, Tj can read or 
-- write updated or written value of Ti only after Ti commits/aborts.

------------------------------------------------------------------------------------------------------------------------

-- Concurrency Control: ---------------

-- Concurrency control is a critical mechanism in DBMS that ensures the consistency and integrity of data when multiple operations are performed 
-- at the same time.
-- Concurrency control is a concept in Database Management Systems (DBMS) that ensures multiple transactions can simultaneously access or modify 
-- data without causing errors or inconsistencies. It provides mechanisms to handle the concurrent execution in a way that maintains ACID properties.
-- By implementing concurrency control, a DBMS allows transactions to execute concurrently while avoiding issues such as deadlocks, race 
-- conditions, and conflicts between operations.
-- The main goal of concurrency control is to ensure that simultaneous transactions do not lead to data conflicts or violate the consistency of 
-- the database. The concept of serializability is often used to achieve this goal.

-- Concurrent Execution and Related Challenges in DBMS:
-- In a multi-user system, several users can access and work on the same database at the same time. This is known as concurrent execution, where 
-- the database is used simultaneously by different users for various operations. For instance, one user might be updating data while another is 
-- retrieving it.
-- When multiple transactions are performed on the database simultaneously, it is important that these operations are executed in an interleaved 
-- manner. This means that the actions of one user should not interfere with or affect the actions of another. This helps in maintaining the 
-- consistency of the database.

-- Concurrent Execution can lead to various challenges:
-- a). Dirty Reads: One transaction reads uncommitted data from another transaction, leading to potential inconsistencies if the changes are 
-- later rolled back.
-- b). Lost Updates: When two or more transactions update the same data simultaneously, one update may overwrite the other, causing data loss.
-- c). Inconsistent Reads: A transaction may read the same data multiple times during its execution, and the data might change between reads due 
-- to another transaction, leading to inconsistency.

-- Why is Concurrency Control Needed?
-- Without Concurrency Control: Transactions interfere with each other, causing issues like lost updates, dirty reads or inconsistent results.
-- With Concurrency Control: Transactions are properly managed (e.g., using locks or timestamps) to ensure they execute in a consistent, 
-- isolated manner, preserving data accuracy.

-- Concurrency control is critical to maintaining the accuracy and reliability of databases in multi-user environments. By preventing conflicts 
-- and inconsistencies during concurrent transactions, it ensures the database remains consistent and correct, even under high levels of 
-- simultaneous activity.

-- Concurrency Control Protocols: ---------------
-- Concurrency control protocols are the set of rules which are maintained in order to solve the concurrency control problems in the database. 
-- It ensures that the concurrent transactions can execute properly while maintaining the database consistency. The concurrent execution of a 
-- transaction is provided with atomicity, consistency, isolation, durability, and serializability via the concurrency control protocols.

-- a). Locked based concurrency control protocol.
-- b). Timestamp based concurrency control protocol.

-- a). Locked based concurrency control protocol: ---------------
-- lock-based concurrency control (BCC) is a method used to manage how multiple transactions access the same data. This protocol ensures data 
-- consistency and integrity when multiple users interact with the database simultaneously.
-- This method uses locks to manage access to data, ensuring transactions don’t clash and everything runs smoothly when multiple transactions 
-- happen at the same time.

-- What is a Lock: ---------------
-- A lock is a variable associated with a data item that indicates whether it is currently in use or available for other operations. Locks 
-- are essential for managing access to data during concurrent transactions. When one transaction is accessing or modifying a data item, a 
-- lock ensures that other transactions cannot interfere with it, maintaining data integrity and preventing conflicts. This process, known 
-- as locking, is a widely used method to ensure smooth and consistent operation in database systems.

-- Lock Based Protocols: Lock-Based Protocols in DBMS ensure that a transaction cannot read or write data until it gets the necessary lock.
-- These protocols prevent concurrency issues by allowing only one transaction to access a specific data item at a time.
-- Locks help multiple transactions work together smoothly by managing access to the database items.
-- Locking is a common method used to maintain the serializability of transactions.
-- A transaction must acquire a read lock or write lock on a data item before performing any read or write operations on it.

-- Types of Lock:
-- Shared Lock (S): Shared Lock is also known as Read-only lock. As the name suggests it can be shared between transactions because while 
-- holding this lock the transaction does not have the permission to update data on the data item. S-lock is requested using lock-S instruction.
-- Exclusive Lock (X): Data item can be both read as well as written. This is Exclusive and cannot be held simultaneously on the same data 
-- item. X-lock is requested using lock-X instruction.

-- Rules of Locking:

-- Read Lock (or) Shared Lock(S):
-- If a Transaction has a Read lock on a data item, it can read the item but not update it.
-- If a transaction has a Read lock on the data item, other transaction can obtain Read Lock on the data item but no Write Locks.
-- So, the Read Lock is also called a Shared Lock.

-- Write Lock (or) Exclusive Lock (X)
-- If a transaction has a write Lock on a data item, it can both read and update the data item.
-- If a transaction has a write Lock on the data item, then other transactions cannot obtain either a Read lock or write lock on the data item.
-- So, the Write Lock is also known as Exclusive Lock.

-- Cascadeless and Recoverable Schedules in Concurrency Control:

-- 1. Recoverable Schedules:
-- A recoverable schedule ensures that a transaction commits only if all the transactions it depends on have committed. This avoids situations 
-- where a committed transaction depends on an uncommitted transaction that later fails, leading to inconsistencies.
-- Concurrency control ensures recoverable schedules by keeping track of which transactions depend on others. It makes sure a transaction can 
-- only commit if all the transactions it relies on have already committed successfully. This prevents issues where a committed transaction 
-- depends on one that later fails.
-- Techniques like strict two-phase locking (2PL) enforce recoverability by delaying the commit of dependent transactions until the parent 
-- transactions have safely committed.

-- 2. Cascadeless Schedules:
-- A cascadeless schedule avoids cascading rollbacks, which occur when the failure of one transaction causes multiple dependent transactions 
-- to fail.
-- Concurrency control techniques such as strict 2PL or timestamp ordering ensure cascadeless schedules by ensuring dependent transactions 
-- only access committed data.
-- By delaying read or write operations until the transaction they depend on has committed, cascading rollbacks are avoided.

-- Advantages of Concurrency:
-- Waiting Time: It means if a process is in a ready state but still the process does not get the system to get execute is called waiting time. 
-- So, concurrency leads to less waiting time.
-- Response Time: The time wasted in getting the response from the CPU for the first time, is called response time. So, concurrency leads to 
-- less Response Time.
-- Resource Utilization: The amount of Resource utilization in a particular system is called Resource Utilization. Multiple transactions 
-- can run parallel in a system. So, concurrency leads to more Resource Utilization.
-- Efficiency: The amount of output produced in comparison to given input is called efficiency. So, Concurrency leads to more Efficiency.

-- Disadvantages of Concurrency:
-- Overhead: Implementing concurrency control requires additional overhead, such as acquiring and releasing locks on database objects. This 
-- overhead can lead to slower performance and increased resource consumption, particularly in systems with high levels of concurrency.
-- Deadlocks: Deadlocks can occur when two or more transactions are waiting for each other to release resources, causing a circular dependency 
-- that can prevent any of the transactions from completing. Deadlocks can be difficult to detect and resolve, and can result in reduced 
-- throughput and increased latency.
-- Reduced concurrency: Concurrency control can limit the number of users or applications that can access the database simultaneously. This 
-- can lead to reduced concurrency and slower performance in systems with high levels of concurrency.
-- Complexity: Implementing concurrency control can be complex, particularly in distributed systems or in systems with complex transactional 
-- logic. This complexity can lead to increased development and maintenance costs.
-- Inconsistency: In some cases, concurrency control can lead to inconsistencies in the database. For example, a transaction that is rolled 
-- back may leave the database in an inconsistent state, or a long-running transaction may cause other transactions to wait for extended 
-- periods, leading to data staleness and reduced accuracy.

-- Transaction Isolation Levels in DBMS: --------------
-- transaction isolation levels define the degree to which the operations in one transaction are isolated from the operations of other concurrent 
-- transactions. In other words, it defines how and when the changes made by one transaction are visible to others to assure data consistency and 
-- integrity.

-- As we know, to maintain consistency in a database, it follows ACID properties. Among these four properties (Atomicity, Consistency, Isolation, 
-- and Durability) Isolation determines how transaction integrity is visible to other users and systems. It means that a transaction should take 
-- place in a system in such a way that it is the only transaction that is accessing the resources in a database system. 

-- Isolation levels define the degree to which a transaction must be isolated from the data modifications made by any other transaction in the 
-- database system. A transaction isolation level is defined by the following phenomena: 

-- Dirty Read – A Dirty read is a situation when a transaction reads data that has not yet been committed. For example, Let’s say transaction 1 
-- updates a row and leaves it uncommitted, meanwhile, Transaction 2 reads the updated row. If transaction 1 rolls back the change, transaction 2 
-- will have read data that is considered never to have existed.

-- Non Repeatable read – Non-repeatable read occurs when a transaction reads the same row twice and gets a different value each time. For 
-- example, suppose transaction T1 reads data. Due to concurrency, another transaction T2 updates the same data and commit, Now if transaction 
-- T1 rereads the same data, it will retrieve a different value.

-- Phantom Read – Phantom Read occurs when two same queries are executed, but the rows retrieved by the two, are different. For example, 
-- suppose transaction T1 retrieves a set of rows that satisfy some search criteria. Now, Transaction T2 generates some new rows that match the 
-- search criteria for Transaction T1. If transaction T1 re-executes the statement that reads the rows, it gets a different set of rows this time.

-- Based on these phenomena, The SQL standard defines four isolation levels:  
-- Read Uncommitted – Read Uncommitted is the lowest isolation level. In this level, one transaction may read not yet committed changes made by 
-- other transactions, thereby allowing dirty reads. At this level, transactions are not isolated from each other.
-- Read Committed – This isolation level guarantees that any data read is committed at the moment it is read. Thus it does not allow dirty read. 
-- The transaction holds a read or write lock on the current row, and thus prevents other transactions from reading, updating, or deleting it.
-- Repeatable Read – This is the most restrictive isolation level. The transaction holds read locks on all rows it references and writes locks on 
-- referenced rows for update and delete actions. Since other transactions cannot read, update or delete these rows, consequently it avoids 
-- non-repeatable read.
-- Serializable – This is the highest isolation level. A serializable execution is guaranteed to be serializable. Serializable execution is 
-- defined to be an execution of operations in which concurrently executing transactions appears to be serially executing.

-- Advantages of Transaction Isolation Levels:
-- Improved concurrency: Transaction isolation levels can improve concurrency by allowing multiple transactions to run concurrently without 
-- interfering with each other.
-- Control over data consistency: Isolation levels provide control over the level of data consistency required by a particular application.
-- Reduced data anomalies: The use of isolation levels can reduce data anomalies such as dirty reads, non-repeatable reads, and phantom reads.
-- Flexibility: The use of different isolation levels provides flexibility in designing applications that require different levels of data 
-- consistency.

-- Disadvantages of Transaction Isolation Levels:
-- Increased overhead: The use of isolation levels can increase overhead because the database management system must perform additional checks 
-- and acquire more locks.
-- Decreased concurrency: Some isolation levels, such as Serializable, can decrease concurrency by requiring transactions to acquire more 
-- locks, which can lead to blocking.
-- Limited support: Not all database management systems support all isolation levels, which can limit the portability of applications across 
-- different systems.
-- Complexity: The use of different isolation levels can add complexity to the design of database applications, making them more difficult 
-- to implement and maintain.

-- Log based Recovery in DBMS: --------------
-- Log-based recovery in DBMS ensures data can be maintained or restored in the event of a system failure. The DBMS records every transaction 
-- on stable storage, allowing for easy data recovery when a failure occurs. For each operation performed on the database, a log file is 
-- created. Transactions are logged and verified before being applied to the database, ensuring data integrity.

-- Log in DBMS: A log is a sequence of records that document the operations performed during database transactions. Logs are stored in a log file 
-- for each transaction, providing a mechanism to recover data in the event of a failure. For every operation executed on the database, a 
-- corresponding log record is created. It is critical to store these logs before the actual transaction operations are applied to the database, 
-- ensuring data integrity and consistency during recovery processes.

-- For example, consider a transaction to modify a student’s city. This transaction generates the following logs:

-- Start Log: When the transaction begins, a log is created to indicate the start of the transaction.
-- Format:<Tn, Start>
-- Here, Tn represents the transaction identifier.
-- Example: <T1, Start> indicates that Transaction 1 has started.

-- Operation Log: When the city is updated, a log is recorded to capture the old and new values of the operation.
-- Format:<Tn, Attribute, Old_Value, New_Value>
-- Example: <T1, City, 'Gorakhpur', 'Noida'> shows that in Transaction 1, the value of the City attribute has changed from 'Gorakhpur' to 'Noida'.

-- Commit Log: Once the transaction is successfully completed, a final log is created to indicate that the transaction has been completed and 
-- the changes are now permanent.
-- Format:<Tn, Commit>
-- Example: <T1, Commit> signifies that Transaction 1 has been successfully completed.

-- These logs play a crucial role in ensuring that the database can recover to a consistent state after a system crash. If a failure occurs, 
-- the DBMS can use these logs to either roll back incomplete transactions or redo committed transactions to maintain data consistency.

-- Key Operations in Log-Based Recovery: --------------
-- Undo Operation: The undo operation reverses the changes made by an uncommitted transaction, restoring the database to its previous state.

-- Example of Undo: Consider a transaction T1 that updates a bank account balance but fails before committing:

-- Initial State:
-- Account balance = 500.
-- Transaction T1:
-- Update balance to 600.
-- Log entry:
-- <T1, Balance, 500, 600>
-- Failure:
-- T1 fails before committing.

-- Undo Process:
-- Use the old value from the log to revert the change.
-- Set balance back to 500.
-- Final log entry after undo:
-- <T1, Abort>

-- Redo Operation: The redo operation re-applies the changes made by a committed transaction to ensure consistency in the database.

-- Example of Redo: Consider a transaction T2 that updates an account balance but the database crashes before changes are permanently reflected:

-- Initial State:
-- Account balance = 300.
-- Transaction T2:
-- Update balance to 400.
-- Log entries:
-- <T2, Start><T2, Balance, 300, 400><T2, Commit>
-- Crash:
-- Changes are not reflected in the database.

-- Redo Process:
-- Use the new value from the log to reapply the committed change.
-- Set balance to 400.

-- Approaches to Modify the Database:
-- In database systems, changes to the database can be made using two main methods: Immediate Modification and Deferred Modification.

-- 1. Immediate Modification: In the Immediate Modification method, the database is updated as soon as a change is made during a transaction, 
-- even before the transaction is committed. Logs are written before making any changes to ensure recovery is possible in case of a system failure.

-- Key Characteristics of Immediate Modification:
-- Changes Are Applied Immediately: Updates to the database are made as soon as a transaction executes an operation, even before the transaction 
-- commits.
-- Requires Undo and Redo for Recovery: Uncommitted changes are reverted using undo, while committed changes are reapplied using redo during 
-- recovery.
-- Logs Are Written First: All changes are logged before being applied to ensure recoverability and consistency in case of failure.

-- 2. Deferred Modification: In the Deferred Modification method, changes to the database are not applied immediately. Instead, they are logged 
-- and stored temporarily. The database is only updated after the transaction is fully committed. This method ensures that no partial changes are 
-- made to the database, reducing the risk of inconsistency.

-- Key Characteristics of Deferred Modification:
-- Changes Are Logged First: All updates are recorded in the log before any changes are applied to the database.
-- Changes Are Applied Only After Commit: No updates are made to the database until the transaction commits. This prevents partial changes in 
-- case of a failure.
-- Simpler Recovery Process: Since no changes are applied before commit, only redo operations are needed for recovery.

-- Recovery using Log records: ---------------
-- Log-based recovery is a method used in database systems to restore the database to a consistent state after a crash or failure. The process 
-- uses a transaction log, which keeps a record of all operations performed on the database, including updates, inserts, deletes, and transaction 
-- states (start, commit, or abort).

-- How Log-Based Recovery Works:
-- Transaction Log:
-- The log stores all changes made by transactions, ensuring recoverability.
-- Each transaction’s start, changes (with old and new values), and its commit or abort state are recorded.

-- Recovery Process:
-- Undo: Transactions that started but didn’t commit (incomplete transactions) are undone to reverse their changes.
-- Redo: Transactions that committed before the crash are redone to ensure their changes are applied to the database.

-- Advantages of Log based Recovery:
-- Durability: In the event of a breakdown, the log file offers a dependable and long-lasting method of recovering data. It guarantees that in the 
-- event of a system crash, no committed transaction is lost.
-- Faster Recovery: Since log-based recovery recovers databases by replaying committed transactions from the log file, it is typically faster 
-- than alternative recovery methods.
-- Incremental Backup: Backups can be made in increments using log-based recovery. Just the changes made since the last backup are kept in the 
-- log file, rather than creating a complete backup of the database each time.
-- Lowers the Risk of Data Corruption: By making sure that all transactions are correctly committed or canceled before they are written to the 
-- database , log-based recovery lowers the risk of data corruption.

-- Disadvantages of Log based Recovery:
-- Additional overhead: Maintaining the log file incurs an additional overhead on the database system, which can reduce the performance of the system.
-- Complexity: Log-based recovery is a complex process that requires careful management and administration. If not managed properly, it can lead to 
-- data inconsistencies or loss.
-- Storage space: The log file can consume a significant amount of storage space, especially in a database with a large number of transactions.
-- Time-Consuming: The process of replaying the transactions from the log file can be time-consuming, especially if there are a large number of 
-- transactions to recover.

-- What is Timestamp Ordering Protocol?
-- The Timestamp Ordering Protocol is a method used in database systems to order transactions based on their timestamps. A timestamp is a unique 
-- identifier assigned to each transaction, typically determined using the system clock or a logical counter. Transactions are executed in the 
-- ascending order of their timestamps, ensuring that older transactions get higher priority.

-- For example:
-- If Transaction T1 enters the system first, it gets a timestamp TS(T1) = 007 (assumption).
-- If Transaction T2 enters after T1, it gets a timestamp TS(T2) = 009 (assumption).
-- This means T1 is “older” than T2 and T1 should execute before T2 to maintain consistency.

-- Key Features of Timestamp Ordering Protocol:
-- Transaction Priority:
-- Older transactions (those with smaller timestamps) are given higher priority.
-- For example, if transaction T1 has a timestamp of 007 times and transaction T2 has a timestamp of 009 times, T1 will execute first as it 
-- entered the system earlier.

-- Early Conflict Management:
-- Unlike lock-based protocols, which manage conflicts during execution, timestamp-based protocols start managing conflicts as soon as a 
-- transaction is created.

-- Advantages of Basic TO Protocol:
-- Conflict Serializable: Ensures all conflicting operations follow the timestamp order.
-- Deadlock-Free: Transactions do not wait for resources, preventing deadlocks.
-- Strict Ordering: Operations are executed in a predefined, conflict-free order based on timestamps.

-- Drawbacks of Basic Timestamp Ordering (TO) Protocol:
-- Cascading Rollbacks : If a transaction is aborted, all dependent transactions must also be aborted, leading to inefficiency.
-- Starvation of Newer Transactions : Older transactions are prioritized, which can delay or starve newer transactions.
-- High Overhead: Maintaining and updating timestamps for every data item adds significant system overhead.
-- Inefficient for High Concurrency: The strict ordering can reduce throughput in systems with many concurrent transactions.

-- Dirty Read in SQL: ---------------
-- A Dirty Read in SQL occurs when a transaction reads data that has been modified by another transaction, but not yet committed. In other 
-- words, a transaction reads uncommitted data from another transaction, which can lead to incorrect or inconsistent results.

-- This situation can occur when a transaction modifies a data item and then fails to commit the changes due to a system failure, network error, 
-- or other issue. If another transaction reads the modified data before the first transaction has a chance to commit, it can lead to a dirty read.

-- To prevent dirty reads, SQL provides transaction isolation levels, which specify how transactions should be isolated from one another. The 
-- isolation levels include:

-- Read uncommitted: This level allows transactions to read uncommitted data from other transactions, leading to potential dirty reads.
-- Read committed: This level allows transactions to read only committed data, preventing dirty reads.
-- Repeatable read: This level prevents dirty reads and also ensures that a transaction always reads the same data for a given query, even if other 
-- transactions modify the data in the meantime.
-- Serializable: This level provides the highest level of isolation and ensures that transactions are executed serially, preventing dirty reads and 
-- other anomalies.
-- Dirty reads in SQL can lead to incorrect or inconsistent results and should be prevented through the use of transaction isolation levels. There 
-- are mainly four types of common concurrency problems: dirty read, lost read, non-repeatable read and phantom reads. 
-- Dirty Reads – When a transaction is allowed to read a row that has been modified by another transaction that is not been committed yet that time 
-- Dirty Reads occurred. It is mainly occurred because of multiple transactions at a time which is not committed.

-- Advantages of Dirty Read:
-- Increased Concurrency: Dirty reads can increase the degree of concurrency in the database system, as transactions are allowed to read 
-- uncommitted data. This can lead to improved performance and throughput.
-- Reduced Locking Overhead: Since dirty reads do not require locks, the overhead associated with acquiring and releasing locks can be reduced.
-- Faster Response Time: Dirty reads can improve the response time of database queries, as transactions can read data without waiting for other 
-- transactions to commit.

-- Disadvantages of Dirty Read:
-- Inconsistent Data: Dirty Reads can lead to inconsistent and incorrect data, as transactions may be reading data that has been modified by other 
-- transactions that have not yet been committed. This can lead to errors and inaccuracies in the database.
-- Unreliable Results: Dirty reads can lead to unreliable query results, as the data being read may change before the transaction is completed.
-- Data Integrity Issues: Dirty reads can cause data integrity issues, as transactions may be reading data that is in an inconsistent or incomplete 
-- state.
-- Hard to Debug: Dirty reads can be difficult to debug, as the data being read may be inconsistent or incomplete, making it hard to trace the 
-- source of errors.

------------------------------------------------------------------------------------------------------------------------------------

-- Database Recovery Techniques: ----------------
-- Types of Recovery Techniques in DBMS: Database recovery techniques are used in database management systems (DBMS) to restore a database 
-- to a consistent state after a failure or error has occurred. The main goal of recovery techniques is to ensure data integrity and consistency 
-- and prevent data loss.

-- There are mainly two types of recovery techniques used in DBMS:
-- Rollback/Undo Recovery Technique.
-- Commit/Redo Recovery Technique.
-- CheckPoint Recovery Technique.

-- Rollback/Undo Recovery Technique: The rollback/undo recovery technique is based on the principle of backing out or undoing the effects of a 
-- transaction that has not been completed successfully due to a system failure or error. This technique is accomplished by undoing the changes 
-- made by the transaction using the log records stored in the transaction log. The transaction log contains a record of all the transactions 
-- that have been performed on the database. The system uses the log records to undo the changes made by the failed transaction and restore the 
-- database to its previous state.

-- Commit/Redo Recovery Technique: The commit/redo recovery technique is based on the principle of reapplying the changes made by a transaction 
-- that has been completed successfully to the database. This technique is accomplished by using the log records stored in the transaction log 
-- to redo the changes made by the transaction that was in progress at the time of the failure or error. The system uses the log records to reapply
-- the changes made by the transaction and restore the database to its most recent consistent state.

-- Checkpoint Recovery Technique: Checkpoint Recoveryis a technique used to improve data integrity and system stability, especially in databases 
-- and distributed systems. It entails preserving the system’s state at regular intervals, known as checkpoints, at which all ongoing transactions 
-- are either completed or not initiated. This saved state, which includes memory and CPU registers, is kept in stable, non-volatile storage so 
-- that it can withstand system crashes. In the event of a breakdown, the system can be restored to the most recent checkpoint, which reduces 
-- data loss and downtime. The frequency of checkpoint formation is carefully regulated to decrease system overhead while ensuring that recent 
-- data may be restored quickly.

-- Database Systems: There are both automatic and non-automatic ways for both, backing up data and recovery from any failure situations. The 
-- techniques used to recover lost data due to system crashes, transaction errors, viruses, catastrophic failure, incorrect command execution, 
-- etc. are database recovery techniques. So to prevent data loss recovery techniques based on deferred updates and immediate updates or backing 
-- up data can be used. Recovery techniques are heavily dependent upon the existence of a special file known as a system log. It contains 
-- information about the start and end of each transaction and any updates which occur during the transaction. The log keeps track of all 
-- transaction operations that affect the values of database items. This information is needed to recover from transaction failure.

-- The log is kept on disk start_transaction(T): This log entry records that transaction T starts the execution.
-- read_item(T, X): This log entry records that transaction T reads the value of database item X.
-- write_item(T, X, old_value, new_value): This log entry records that transaction T changes the value of the database item X from old_value to 
-- new_value. The old value is sometimes known as a before an image of X, and the new value is known as an afterimage of X.
-- commit(T): This log entry records that transaction T has completed all accesses to the database successfully and its effect can be committed 
-- (recorded permanently) to the database.
-- abort(T): This records that transaction T has been aborted.
-- checkpoint: A checkpoint is a mechanism where all the previous logs are removed from the system and stored permanently in a storage disk. 
-- Checkpoint declares a point before which the DBMS was in a consistent state, and all the transactions were committed.

-- A transaction T reaches its commit point when all its operations that access the database have been executed successfully i.e. the transaction 
-- has reached the point at which it will not abort (terminate without completing). Once committed, the transaction is permanently recorded in the 
-- database. Commitment always involves writing a commit entry to the log and writing the log to disk. At the time of a system crash, the item is 
-- searched back in the log for all transactions T that have written a start_transaction(T) entry into the log but have not written a commit(T) 
-- entry yet; these transactions may have to be rolled back to undo their effect on the database during the recovery process.

-- Undoing: If a transaction crashes, then the recovery manager may undo transactions i.e. reverse the operations of a transaction. This involves 
-- examining a transaction for the log entry write_item(T, x, old_value, new_value) and setting the value of item x in the database to old-value. 
-- There are two major techniques for recovery from non-catastrophic transaction failures: deferred updates and immediate updates.
-- Deferred Update: This technique does not physically update the database on disk until a transaction has reached its commit point. Before 
-- reaching commit, all transaction updates are recorded in the local transaction workspace. If a transaction fails before reaching its commit 
-- point, it will not have changed the database in any way so UNDO is not needed. It may be necessary to REDO the effect of the operations that 
-- are recorded in the local transaction workspace, because their effect may not yet have been written in the database. Hence, a deferred update 
-- is also known as the No-undo/redo algorithm.
-- Immediate Update: In the immediate update, the database may be updated by some operations of a transaction before the transaction reaches its 
-- commit point. However, these operations are recorded in a log on disk before they are applied to the database, making recovery still possible. 
-- If a transaction fails to reach its commit point, the effect of its operation must be undone i.e. the transaction must be rolled back hence we 
-- require both undo and redo. This technique is known as undo/redo algorithm.
-- Caching/Buffering: In this one or more disk pages that include data items to be updated are cached into main memory buffers and then updated 
-- in memory before being written back to disk. A collection of in-memory buffers called the DBMS cache is kept under the control of DBMS for 
-- holding these buffers. A directory is used to keep track of which database items are in the buffer. A dirty bit is associated with each buffer, 
-- which is 0 if the buffer is not modified else 1 if modified.
-- Shadow Paging: It provides atomicity and durability. A directory with n entries is constructed, where the ith entry points to the ith database 
-- page on the link. When a transaction began executing the current directory is copied into a shadow directory. When a page is to be modified, a 
-- shadow page is allocated in which changes are made and when it is ready to become durable, all pages that refer to the original are updated to 
-- refer new replacement page.
-- Backward Recovery: The term ” Rollback ” and ” UNDO ” can also refer to backward recovery. When a backup of the data is not available and 
-- previous modifications need to be undone, this technique can be helpful. With the backward recovery method, unused modifications are removed 
-- and the database is returned to its prior condition. All adjustments made during the previous traction are reversed during the backward 
-- recovery. In other words, it reprocesses valid transactions and undoes the erroneous database updates.
-- Forward Recovery: “ Roll forward “and ” REDO ” refers to forwarding recovery. When a database needs to be updated with all changes verified, 
-- this forward recovery technique is helpful. Some failed transactions in this database are applied to the database to roll those modifications 
-- forward. In other words, the database is restored using preserved data and valid transactions counted by their past saves.

-- Backup Techniques: There are different types of Backup Techniques. Some of them are listed below.
-- Full database Backup: In this full database including data and database, Meta information needed to restore the whole database, including 
-- full-text catalogs are backed up in a predefined time series.
-- Differential Backup: It stores only the data changes that have occurred since the last full database backup. When some data has changed many 
-- times since the last full database backup, a differential backup stores the most recent version of the changed data. For this first, we need 
-- to restore a full database backup.
-- Transaction Log Backup: In this, all events that have occurred in the database, like a record of every single statement executed is backed up. 
-- It is the backup of transaction log entries and contains all transactions that had happened to the database. Through this, the database can 
-- be recovered to a specific point in time. It is even possible to perform a backup from a transaction log if the data files are destroyed 
-- and not even a single committed transaction is lost.

-- Starvation in DBMS: Starvation in DBMS is a problem that happens when some processes are unable to get the resources they need because other 
-- processes keep getting priority. This can happen in situations like locking or scheduling, where some processes keep getting the resources 
-- first, leaving others waiting indefinitely.

-- Example 1: Imagine you are waiting at a restaurant to place your order. Every time the waiter comes, they serve people who arrived after you 
-- because they are VIPs or because the waiter is prioritizing large group orders. You’ve been waiting for hours, but your turn never comes. 
-- This is similar to starvation, where someone is stuck waiting indefinitely while others get served first.

-- Example 2: Suppose there are 3 transactions namely T1, T2, and T3 in a database that is trying to acquire a lock on data item ‘ I ‘. Now, 
-- suppose the scheduler grants the lock to T1(maybe due to some priority), and the other two transactions are waiting for the lock. As soon 
-- as the execution of T1 is over, another transaction T4 also comes over and requests a lock on data item I. Now, this time the scheduler 
-- grants lock to T4, and T2, T3 has to wait again. In this way, if new transactions keep on requesting the lock, T2 and T3 may have to wait 
-- for an indefinite period of time, which leads to Starvation. 

-- Reasons for Starvation: Starvation in DBMS happens when some transactions or processes are unable to get the resources they need, often 
-- because other processes are prioritized or due to poor resource management. Here are the main reasons for starvation in simple terms:

-- Unfair Prioritization: If lower-priority processes keep competing with higher-priority ones, they might be ignored for a long time, leading to 
-- indefinite waiting.
-- Inappropriate Locking Strategy: When resources are managed poorly, such as using a priority queue, lower-priority processes may never get 
-- access to locked resources.
-- Uncontrolled Resource Allocation: If processes keep passing resources to others without considering the system’s overall needs, some processes 
-- might never get the resources they require.
-- Queue Mismanagement: If resources are always passed to the next process in a queue, new processes keep getting added, and some may end up 
-- waiting indefinitely.
-- Repeated Victim Selection: Sometimes, the same transaction is repeatedly chosen as a “victim” during resource allocation, causing it to 
-- stay stuck without progress.
-- Resource Leakage: If resources are lost or mismanaged due to system errors, there may not be enough available to meet the demands of all 
-- processes. High Demand vs. Limited Resources: If the demand for resources is much higher than the supply, no matter how well resources are managed, 
-- some processes will inevitably experience starvation.
-- Random Resource Allocation: If resources are assigned randomly instead of following a proper queue, some processes may end up waiting much 
-- longer than others.
-- Denial-of-Service Attacks: Intentional attacks can overwhelm the system, making it impossible for legitimate processes to get the resources 
-- they need, causing starvation.

-- Solutions to starvation
-- Increase Priority Over Time: If a process or transaction has been waiting too long, its priority can be gradually increased. This ensures it 
-- will eventually be served. However, care should be taken as newer processes may end up waiting longer.
-- Modification in Victim Selection algorithm: If a transaction has been a victim of repeated selections, then the algorithm can be modified by 
-- lowering its priority over other transactions.
-- First Come First Serve approach: A fair scheduling approach i.e. FCFS can be adopted, In which the transaction can acquire a lock on an item 
-- in the order, in which the requested lock.
-- Wait-die and wound wait scheme: These techniques use timestamps to decide the order of resource allocation, ensuring older transactions are 
-- prioritized, which helps prevent starvation. 
-- Timeout Mechanism: A timeout mechanism can be implemented in which a transaction is only allowed to wait for a certain amount of time before 
-- it is aborted or restarted. This ensures that no transaction waits indefinitely, and prevents the possibility of starvation.
-- Resource Reservation: A resource reservation scheme can be used to allocate resources to a transaction before it starts execution. This 
-- ensures that the transaction has access to the necessary resources and reduces the chances of waiting for a resource indefinitely.
-- Preemption: Preemption involves the forcible removal of a lock from a transaction that has been waiting for a long time, in favor of another 
-- transaction that has a higher priority or has been waiting for a shorter time. Preemption ensures that no transaction waits indefinitely,
--  and prevents the possibility of starvation.
-- Dynamic Lock Allocation: In this approach, locks are allocated dynamically based on the current state of the system. The system may analyze 
-- the current lock requests and allocate locks in such a way that prevents deadlocks and reduces the chances of starvation.
-- Parallelism: By allowing multiple transactions to execute in parallel, the system can ensure that no transaction waits indefinitely, and 
-- reduces the chances of starvation. This approach requires careful consideration of the potential for conflicts and race conditions between 
-- transactions.

-- Disadvantages of Starvation
-- Decreased performance: Starvation can cause decreased performance in a DBMS by preventing transactions from making progress and causing a 
-- bottleneck.
-- Increased response time: Starvation can increase response time for transactions that are waiting for resources, leading to poor user 
-- experience and decreased productivity.
-- Inconsistent data: If a transaction is unable to complete due to starvation, it may leave the database in an inconsistent state, which can 
-- lead to data corruption and other problems.
-- Difficulty in troubleshooting: Starvation can be difficult to troubleshoot because it may not be immediately apparent which transaction is 
-- causing the problem.
-- Potential for deadlock: If multiple transactions are competing for the same resources, starvation can lead to deadlock, where none of the 
-- transactions can proceed, causing a complete system failure.

