
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
