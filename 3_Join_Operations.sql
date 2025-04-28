-- Join Operations:
-- A Join operation combines related tuples from different relations, if and only if a given join condition is satisfied.

-- 1. Natural Join: A natural join is the set of tuples of all combinations in R and S that are equal on their common attribute names.

-- 2. Outer Join: The outer join operation is an extension of the join operation. It is used to deal with missing information.

-- An outer join is basically of three types:
-- a). Left outer join.
-- b). Right outer join.
-- c). Full outer join.

-- a. Left outer join:
-- Left outer join contains the set of tuples of all combinations in R and S that are equal on their common attribute names.
-- In the left outer join, tuples in R have no matching tuples in S.

-- b. Right outer join:
-- Right outer join contains the set of tuples of all combinations in R and S that are equal on their common attribute names.
-- In right outer join, tuples in S have no matching tuples in R.

-- c. Full outer join:
-- Full outer join is like a left or right join except that it contains all rows from both tables.
-- In full outer join, tuples in R that have no matching tuples in S and tuples in S that have no matching tuples in R in their common 
-- attribute name.

-- 3. Equi join:
-- It is also known as an inner join. It is the most common join. It is based on matched data as per the equality condition. The equi join 
-- uses the comparison operator(=).

