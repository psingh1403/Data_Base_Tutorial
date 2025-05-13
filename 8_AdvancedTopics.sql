
-- What is RAID: ---------------
-- RAID (Redundant Array of Independent Disks) is like having backup copies of your important files stored in different places on several 
-- hard drives or solid-state drives (SSDs). If one drive stops working, your data is still safe because you have other copies stored on the 
-- other drives. It’s like having a safety net to protect your files from being lost if one of your drives breaks down.

-- RAID (Redundant Array of Independent Disks) in a Database Management System (DBMS) is a technology that combines multiple physical disk 
-- drives into a single logical unit for data storage. The main purpose of RAID is to improve data reliability, availability, and performance. 
-- There are different levels of RAID, each offering a balance of these benefits.

-- How RAID Works?
-- Imagine you have a favorite book that you want to keep safe. Instead of giving the entire book to just one friend for safekeeping, you 
-- take a smart approach
-- Splitting the Book: You divide the book into smaller pieces (like chapters or sections) and give each piece to a different friend.
-- Making Copies: For extra security, you might also create duplicate pieces and give them to multiple friends.

-- Now, if one friend misplaces their piece, you can still recreate the entire book using the pieces held by the others. This way, your book 
-- is safe even if someone loses their portion.

-- This is exactly how RAID works with hard drives! RAID splits your data across multiple drives (similar to dividing the book into pieces). 
-- Depending on the RAID configuration, it may also create duplicates (like making extra copies). If one drive fails, the remaining drives can 
-- help reconstruct the lost data.

-- What is a RAID Controller?
-- A RAID controller is like a boss for your hard drives in a big storage system. It works between your computer’s operating system and the 
-- actual hard drives, organizing them into groups to make them easier to manage. This helps speed up how fast your computer can read and 
-- write data, and it also adds a layer of protection in case one of your hard drives breaks down. So, it’s like having a smart helper that 
-- makes your hard drives work better and keeps your important data safer.

-- Types of RAID Controller:

-- Hardware Based: In hardware-based RAID, there’s a physical controller that manages the whole array. This controller can handle the whole group 
-- of hard drives together. It’s designed to work with different types of hard drives, like SATA (Serial Advanced Technology Attachment) or SCSI 
-- (Small Computer System Interface). Sometimes, this controller is built right into the computer’s main board, making it easier to set up and 
-- manage your RAID system. It’s like having a captain for your team of hard drives, making sure they work together smoothly.

-- Software Based: In software-based RAID, the controller doesn’t have its own special hardware. So it use computer’s main processor and memory 
-- to do its job. It perform the same function as a hardware-based RAID controller, like managing the hard drives and keeping your data safe. 
-- But because it’s sharing resources with other programs on your computer, it might not make things run as fast. So, while it’s still helpful, 
-- it might not give you as big of a speed boost as a hardware-based RAID system

-- Firmware Based: Firmware-based RAID controllers are like helpers built into the computer’s main board. They work with the main processor, 
-- just like software-based RAID. But they only implement when the computer starts up. Once the operating system is running, a special driver 
-- takes over the RAID job. These controllers aren’t as expensive as hardware ones, but they make the computer’s main processor work harder. 
-- People also call them hardware-assisted software RAID, hybrid model RAID, or fake RAID.

-- Why Data Redundancy?
-- Data redundancy, although taking up extra space, adds to disk reliability. This means, that in case of disk failure, if the same data is also 
-- backed up onto another disk, we can retrieve the data and go on with the operation. On the other hand, if the data is spread across multiple 
-- disks without the RAID technique, the loss of a single disk can affect the entire data. 

-- Different RAID Levels
-- RAID-0 (Stripping)  
-- RAID-1 (Mirroring) 
-- RAID-2 (Bit-Level Stripping with Dedicated Parity)
-- RAID-3 (Byte-Level Stripping with Dedicated Parity)
-- RAID-4 (Block-Level Stripping with Dedicated Parity) 
-- RAID-5 (Block-Level Stripping with Distributed Parity) 
-- RAID-6 (Block-Level Stripping with two Parity Bits)

-- 1. RAID-0 (Stripping)
-- RAID-0 improves system performance by splitting data into smaller “blocks” and spreading them across multiple disks. This process is called 
-- “striping.” It enhances data access speed by enabling parallel read/write operations but provides no redundancy or fault tolerance.
-- A set of blocks distributed across the disks forms a “stripe.” For instance, “0, 1, 2, 3” is one stripe.
-- Instead of placing just one block into a disk at a time, we can work with two (or more) blocks placed into a disk before moving on to the 
-- next one. 

-- Advantages:
-- It is easy to implement.
-- It utilizes the storage capacity in a better way.

-- Disadvantages:
-- A single drive loss can result in the complete failure of the system.
-- It’s not a good choice for a critical system.

-- 2. RAID-1 (Mirroring): RAID-1 enhances reliability by creating an identical copy (mirror) of each data block on separate disks. This ensures 
-- that even if one disk fails, the data remains accessible from its duplicate. While this configuration is highly reliable, it requires 
-- significant storage overhead.

-- Mirroring: Each block of data is written to two (or more) disks.

-- For example:
-- Block 0 is stored on Disk 0 and its duplicate on Disk 1.
-- Block 1 is stored on Disk 2 and its duplicate on Disk 3.

-- Mirroring Level 2:
-- In the figure, “mirroring level 2” indicates that there are two copies of each block, distributed across different disks.
-- RAID 0 was unable to tolerate any disk failure. But RAID 1 is capable of reliability. 

-- Advantages:
-- It covers complete redundancy.
-- It can increase data security and speed.

-- Disadvantages:
-- It is highly expensive.
-- Storage capacity is less.

-- 3. RAID-2 (Bit-Level Stripping with Dedicated Parity)
-- RAID-2 is a specialized RAID level that uses bit-level striping combined with error correction using Hamming Code. In this configuration, data 
-- is distributed at the bit level across multiple drives, and a dedicated parity drive is used for error detection and correction. While it 
-- offers strong fault tolerance, its complexity and cost make it rarely used in practice.

-- Advantages:
-- In case of Error Correction, it uses hamming code.
-- It Uses one designated drive to store parity.

-- Disadvantages:
-- It has a complex structure and high cost due to extra drive.
-- It requires an extra drive for error detection.

-- 4. RAID-3 (Byte-Level Stripping with Dedicated Parity)
-- RAID-3 enhances fault tolerance by employing byte-level striping across multiple drives and storing parity information on a dedicated parity 
-- drive. The dedicated parity drive allows for the reconstruction of lost data if a single drive fails. This configuration is suitable for 
-- workloads requiring high throughput for sequential data but is less efficient for random I/O operations.

-- Here Disk 3 contains the Parity bits for Disk 0, Disk 1, and Disk 2. If data loss occurs, we can construct it with Disk 3.

-- Advantages:
-- Data can be transferred in bulk.
-- Data can be accessed in parallel.

-- Disadvantages:
-- It requires an additional drive for parity.
-- In the case of small-size files, it performs slowly.

-- Advantages of RAID:
-- Data redundancy: By keeping numerous copies of the data on many disks, RAID can shield data from disk failures.
-- Performance enhancement: RAID can enhance performance by distributing data over several drives, enabling the simultaneous execution of 
-- several read/write operations.
-- Scalability: RAID is scalable, therefore by adding more disks to the array, the storage capacity may be expanded.
-- Versatility: RAID is applicable to a wide range of devices, such as workstations, servers, and personal PCs

-- Disadvantages of RAID:
-- Cost: RAID implementation can be costly, particularly for arrays with large capacities.
-- Complexity: The setup and management of RAID might be challenging.
-- Decreased performance: The parity calculations necessary for some RAID configurations, including RAID 5 and RAID 6, may result in a 
-- decrease in speed.
-- Single point of failure: RAID is not a comprehensive backup solution while offering data redundancy. The array’s whole contents could be 
-- lost if the RAID controller malfunctions.

