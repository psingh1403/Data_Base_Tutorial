-- Functions: -------------
-- Handling date and time data in MySQL is essential for many database operations, especially when it comes to handling timestamps, scheduling
-- tasks, or generating time-based. MySQL provides a variety of date and time functions that help users work with date values, perform
-- calculations, and format them as needed.

-- These functions allow developers to perform calculations, extract specific parts of a date, or even format the output for better readability.

-- Understanding MySQL Date and Time Data Types:
-- When working with dates in MySQL, it can be tricky for beginners, especially because the format of the date in the database must match the
-- format of the input data during insertion. In many cases, instead of just using a simple date, we may need to store both a date and time,
-- depending on the use case. This is where the DATETIME and TIMESTAMP data types come into play.

-- 1. DATE:
-- Format: YYYY-MM-DD
-- Used for storing only the date (year, month, and day), without any time component.

-- 2. DATETIME:
-- Format: YYYY-MM-DD HH:MM:SS
-- Stores both the date and the time, making it useful when you need to capture specific times along with the date.

-- 3. TIMESTAMP:
-- Format: YYYY-MM-DD HH:MM:SS
-- Similar to DATETIME, but TIMESTAMP also includes time zone support. It automatically updates to the current timestamp when a record is
-- modified, making it ideal for tracking changes to records over time.

-- 4. YEAR:
-- Format: YYYY or YY
-- Used for storing just the year, which can be useful for applications where only the year is needed, such as tracking birth years or fiscal years.
-- MySQL Date and Time Functions

-- 1. NOW()- Get Current Date and Time: The NOW() function retrieves the current date and time in YYYY-MM-DD HH:MI:SS format.
SELECT NOW() as DateAndTime;

-- 2. CURDATE() - Get Current Date Only: If we only need the current date without the time portion, we can use CURDATE(), which returns the
-- date in YYYY-MM-DD format.
SELECT CURDATE() as Date;

-- 3. CURTIME() - Get Current Time Only: The CURTIME() function returns the current time in HH:MI:SS format, excluding the date.
SELECT CURTIME() as Time;

-- 4. DATE() - Extract the Date Part from a DATETIME Value: The DATE() function extracts only the date part from a DATETIME or TIMESTAMP
-- value, discarding the time.
SELECT Name, DATE(BirthTime) AS BirthDate FROM Test;

-- 5. EXTRACT() - Extract Specific Date Parts: EXTRACT() is used to extract specific parts of a date, such as the day, month, or year. This
-- function can be especially helpful when analyzing or comparing different parts of a date. Several units can be considered but only some
-- are used such as MICROSECOND, SECOND, MINUTE, HOUR, DAY, WEEK, MONTH, QUARTER, YEAR, etc. And 'date' is a valid date expression.

-- Syntax: EXTRACT(unit FROM date);

SELECT Name, Extract( DAY FROM BirthTime ) AS BirthDay FROM Test;

-- Query to Extract Year:
SELECT Name, Extract( YEAR FROM BirthTime ) AS BirthYear FROM Test;

-- Query to Extract Seconds:
SELECT Name, Extract(
        SECOND
        FROM BirthTime
    ) AS BirthSecond
FROM Test;

-- 6. DATE_ADD() - Add Intervals to a Date: The DATE_ADD() function allows you to add time intervals (e.g., days, months, years) to a date or
-- DATETIME value.

-- Syntax: DATE_ADD(date, INTERVAL expr type);

SELECT Name, DATE_ADD(BirthTime, INTERVAL 1 YEAR) AS BirthTimeModified
FROM Test;

-- 7. DATEDIFF() – Find the Difference Between Two Dates: This Function returns the number of days between two dates.

-- Syntax: DATEDIFF(interval,date1, date2);
-- interval - minute/hour/month/year,etc
-- date1 & date2- date/time expression

-- Query to Find the Difference Between Two Dates
-- SELECT DATEDIFF(day, '2017-01-13', '2017-01-03') AS DateDiff;

-- 8. DATE_FORMAT() - Foramt Date and Time: DATE_FORMAT() allows us to format a DATE, DATETIME, or TIMESTAMP value into a custom format using
-- placeholders.

-- Syntax: DATE_FORMAT(date,format);

-- String Functions: -------------
-- String functions are used to perform an operation on input string and return an output string.

-- 1. CONCAT(): Concatenate Strings: The CONCAT() function is used to concatenate (combine) two or more strings into one string. It is useful
-- when we want to merge fields like first and last names into a full name.

SELECT CONCAT('John', ' ', 'Doe') AS FullName;

-- 2. CHAR_LENGTH() / CHARACTER_LENGTH(): Find String Length: The CHAR_LENGTH() or LENGTH() function returns the length of a string in characters.
-- It’s essential for validating or manipulating text data, especially when you need to know how many characters a string contains.

SELECT CHAR_LENGTH('Hello') AS StringLength;

-- 3. UPPER() and LOWER(): These functions convert the text to uppercase or lowercase, respectively. They are useful for normalizing the case
-- of text in a database.

SELECT UPPER('hello') AS UpperCase;

SELECT LOWER('HELLO') AS LowerCase;

-- 4. LENGTH(): LENGTH() returns the length of a string in bytes. This can be useful for working with multi-byte character sets.

SELECT LENGTH('Hello') AS LengthInBytes;

-- 5. REPLACE(): The REPLACE() function replaces occurrences of a substring within a string with another substring. This is useful for cleaning
-- up data, such as replacing invalid characters or formatting errors.

SELECT REPLACE ('Hello World', 'World', 'SQL') AS UpdatedString;

-- 6. SUBSTRING() / SUBSTR(): The SUBSTRING() (or SUBSTR()) function is used to extract a substring from a string, starting from a specified
-- position. It is especially useful when we need to extract a specific part of a string, like extracting the domain from an email address.

SELECT SUBSTRING('Hello World', 1, 5) AS SubStringExample;

-- 7. LEFT() and RIGHT(): The LEFT() and RIGHT() functions allow you to extract a specified number of characters from the left or right side of
-- a string, respectively. It is used for truncating strings for display.

SELECT LEFT('Hello World', 5) AS LeftString;

SELECT RIGHT('Hello World', 5) AS RightString;

-- 8. INSTR(): The INSTR() function is used to find the position of the first occurrence of a substring within a string. It returns the position
-- (1-based index) of the substring. If the substring is not found, it returns 0. This function is particularly useful for locating specific
-- characters or substrings in text data.

SELECT INSTR('Hello World', 'World') AS SubstringPosition;

-- 9. TRIM(): The TRIM() function removes leading and trailing spaces (or other specified characters) from a string. By default, it trims spaces
-- but can also remove specific characters using TRIM(character FROM string). This is helpful for cleaning text data, such as user inputs or
-- database records.

SELECT TRIM( ' ' FROM ' Hello World ' ) AS TrimmedString;

-- 10. REVERSE(): The REVERSE() function reverses the characters in a string. It’s useful in situations where we need to process data backward,
-- such as for password validation or certain pattern matching.

SELECT REVERSE('Hello') AS ReversedString;

-- Numeric Functions: -------------
-- 1. ABS(): The ABS() function returns the absolute value of a number, which is the number without its sign.
-- Syntax: SELECT ABS(number);

SELECT ABS(-25);

-- 2. CEIL() or CEILING(): The CEIL() (or CEILING()) function rounds a number up to the nearest integer, regardless of whether the decimal part
-- is greater than or less than 0.5.
-- Syntax: SELECT CEIL(number);

SELECT CEIL(12.34);

-- 3. FLOOR(): The FLOOR() function rounds a number down to the nearest integer, ignoring the decimal part.
-- Syntax: SELECT FLOOR(number);

SELECT FLOOR(12.98);

-- 4. ROUND(): The ROUND() function rounds a number to a specified number of decimal places. It is very useful for financial calculations or
-- whenever precise rounding is necessary.
-- Syntax: SELECT ROUND(number, decimal_places);

SELECT ROUND(15.6789, 2);

-- 5. TRUNCATE(): The TRUNCATE() function is used to remove the decimal portion of a number without rounding. It truncates the number to the
-- specified number of decimal places.
-- Syntax: SELECT TRUNCATE(number, decimal_places);

SELECT TRUNCATE (12.98765, 2);

-- 6. MOD(): The MOD() function returns the remainder of a division operation (i.e., it computes the modulus). This function is useful for tasks
-- like determining even/odd numbers or finding remainders in mathematical operations.
-- Syntax: SELECT MOD(dividend, divisor);

SELECT MOD(10, 3);

-- 7. POWER(): The POWER() function is used to raise a number to the power of another number. It is often used in mathematical calculations
-- like compound interest or growth rate.
-- Syntax: SELECT POWER(base, exponent);

SELECT POWER(2, 3);

-- 8. SQRT(): The SQRT() function returns the square root of a number. This is useful for mathematical calculations involving geometry or
-- statistical analysis.
-- Syntax: SELECT SQRT(number);

SELECT SQRT(16);

-- 9. EXP(): The EXP() function returns the value of e raised to the power of a specified number, where e is the base of the natural logarithm
-- (approximately 2.71828).
-- Syntax: SELECT EXP(number);

SELECT EXP(1);

-- Statistical Functions: -------------
-- Statistics is a branch of mathematics that deals with data collection, analysis, interpretation, presentation, and organization. It involves
-- the use of mathematical techniques to extract meaningful information from data. Statistics is widely used in various fields such as business,
-- economics, social science, medicine, and engineering

-- A Statistical function is a mathematical function that helps us to process and analyze data to provide meaningful information about the
-- dataset. For example mean, sum, min, max, standard deviation, etc.

-- Statistical Functions in SQL:
-- AVG(): Calculates the average value of a numeric column.
-- SUM(): Calculates the sum of values in a numeric column.
-- COUNT(): Counts the number of rows in a result set or the number of non-null values in a column.
-- MIN(): Returns the minimum value in a column.
-- MAX(): Returns the maximum value in a column.
-- VAR() / VARIANCE(): Calculates the population variance of a numeric column.
-- STDDEV() / STDDEV_POP(): Calculates the population standard deviation of a numeric column.
-- CORR(): Calculates the correlation coefficient between two numeric columns.
-- COVAR_POP(): Calculates the population covariance between two numeric columns.
-- PERCENTILE_CONT(): Calculates a specified percentile value for a numeric column.

-- 1. AVG() Function: Calculate the average or arithmetic mean for a group of numbers or a numeric column.
-- Syntax: SELECT AVG(column_name) FROM table_name;

SELECT AVG(marks) AS average_marks FROM studentDetails;

-- 2. SUM() Function: The total of all numeric values in a group i.e. Calculates the total sum of values in a numeric column.
-- Syntax: SELECT SUM(column_name) FROM table_name;

SELECT SUM(marks) AS total_marks FROM studentDetails;

-- 3. Count() Function: The number of cell locations in a range that contain a numeric character i.e Counts the number of rows in a result set
-- or the number of non-null values in a column.
-- Syntax: SELECT COUNT(*) FROM table_name;
-- Syntex: SELECT COUNT(column_name) FROM table_name;

SELECT COUNT(studentID) AS total_students FROM studentDetails;

-- 4. Max() Function: Returns the highest numeric value in a group of numbers.
-- Syntax: SELECT MAX(column_name) FROM table_name;

SELECT MAX(marks) AS highest_marks FROM studentDetails;

-- 5. MIN() Function: Returns the lowest numeric value in a group of numbers.
-- Syntax: SELECT MIN(column_name) FROM table_name;

SELECT MIN(marks) AS lowest_marks FROM studentDetails;

-- 6. VAR() / VARIANCE() Function: Calculates the population variance of a numeric column.
-- Syntax: SELECT VAR(column_name) FROM table_name;

SELECT VARIANCE(marks) AS variance_marks FROM studentDetails;

-- 7. STDDEV() / STDDEV_POP() Function: The standard deviation for a group of numbers based on a sample.
-- Syntax: SELECT STDDEV(column_name) FROM table_name;

SELECT STDDEV(marks) AS stddev_marks FROM studentDetails;

-- JSON in SQL: -------------
-- JSON stands for Javascript Object Notation. It is mainly used in storing and transporting data. Mostly all NoSQL databases like MongoDB,
-- CouchDB, etc., use JSON format data. Whenever your data from one server has to be transferred to a web page, JSON format is the preferred
-- format for front-end applications like Android, iOS, React, Angular, etc.

-- What is JSON in SQL Server: JSON is a lightweight data-interchange format that is easy for humans to read and write. SQL Server introduced
-- native support for JSON handling starting from SQL Server 2016. This allows you to store JSON data in NVARCHAR columns and use SQL functions
-- to parse, query, and modify JSON data.

-- Storing JSON in SQL Server: In SQL Server, you can store JSON data as a string in an NVARCHAR column. SQL Server treats JSON data as a
-- string, allowing you to parse it when necessary.

