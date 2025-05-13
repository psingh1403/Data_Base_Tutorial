CREATE DATABASE Practice;

USE Practice;

DROP table MATHS;

CREATE TABLE MATHS (
    ROLL_NUMBER INT,
    S_NAME VARCHAR(10),
    MARKS INT
);

INSERT INTO
    MATHS (ROLL_NUMBER, S_NAME, MARKS)
VALUES (1, 'ABHI', 70),
    (2, 'RAVI', 80),
    (3, 'ARJUN', 90),
    (4, 'SAM', 100),
    (5, 'MOHAN', 50),
    (6, 'ROHAN', 10),
    (7, 'ROCKY', 20),
    (8, 'AYUSH', 40),
    (9, 'NEHA', 30),
    (10, 'KRITI', 60);

SELECT * FROM MATHS;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    City VARCHAR(50),
    PostalCode VARCHAR(10),
    Country VARCHAR(50)
);

INSERT INTO
    Customers (
        CustomerID,
        CustomerName,
        City,
        PostalCode,
        Country
    )
VALUES (
        1,
        'John Wick',
        'New York',
        '1248',
        'USA'
    ),
    (
        2,
        'Around the Horn',
        'London',
        'WA1 1DP',
        'UK'
    ),
    (
        3,
        'Rohan',
        'New Delhi',
        '100084',
        'India'
    );

CREATE TABLE Emp (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    Country VARCHAR(50),
    Age int(2),
    Salary int(10)
);

INSERT INTO
    Emp (
        EmpID,
        Name,
        Country,
        Age,
        Salary
    )
VALUES (
        1,
        'Shubham',
        'India',
        '23',
        '30000'
    ),
    (
        2,
        'Aman ',
        'Australia',
        '21',
        '45000'
    ),
    (
        3,
        'Naveen',
        'Sri lanka',
        '24',
        '40000'
    ),
    (
        4,
        'Aditya',
        'Austria',
        '21',
        '35000'
    ),
    (
        5,
        'Nishant',
        'Spain',
        '22',
        '25000'
    );

Select * from Emp;