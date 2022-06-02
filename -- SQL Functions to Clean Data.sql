-- SQL Functions to Clean Data 

-- LENGTH, LENGTH and RIGHT 
SELECT 
    column1, LENGTH(column1) AS new_column 
FROM tablename 
WHERE condition = ' '; 

SELECT 
    column2, LENGTH(column2) AS new_column2 
FROM tablename 
WHERE condition = ' ' AND LENGTH(column2) > 4 
ORDER BY new_column2; 

SELECT 
    column1, LEFT(column1) AS column1_Lgroup 
FROM tablename; 

SELECT 
    column1, RIGHT(column1) AS column1_Rgroup 
FROM tablename; 

-- Sample 
SELECT 
    customer_id, RIGHT(customer_id), LENGTH(customer_id)-3) AS cust_number 
FROM customers_table; 

-- UPPER and LOWER 
SELECT 
    UPPPER(column_name) AS UpCase_col
FROM tablename; 

SELECT 
    LOWER(column_name) AS LowCase_col 
FROM tablename; 

UPDATE tablename
SET column1 = UPPER(column1)
WHERE condition = ' ';

-- SAMPLE 
SELECT * 
FROM customers_table
WHERE cust_number = '10001'; 

UPDATE customers_table
SET customer_fName = UPPER(customer_fName)
WHERE cust_number = '10001'; 

-- Replace Function 
SELECT 
    column1, 
    column2,
    column3, REPLACE(column3, 'current value', 'new value') AS new_column3
FROM tablename; 

-- Sample 
SELECT 
    customer_fName, 
    region, 
    country, REPLACE(LOWER(country), 'united states', 'US') AS country_abbrev
FROM customers_table; 

-- TRIM, RTRIM and LTRIM 

-- TRIM to remove white space 
SELECT TRIM(' sample_value ');

-- RTRIM to remove white space on right
SELECT RTRIM(' sample_value '); 

-- LTRIM to remove white space on left
SELECT LTRIM(' sample_value '); 

-- Sample 
-- remove brackets from the customer's id column in the customer's table 
SELECT * 
FROM customers_table; 

SELECT 
    customer_id, TRIM(customer_id, '[]') AS cleaned_cust_id
FROM customers_table; 

-- Concatenatation 
SELECT 
    column1, 
    column2, 
    column3, column1||' '||column2 AS column12 
FROM tablename; 

-- Samples
SELECT 
    customer_id, 
    customer_fName, 
    customer_lName, customer_fName||' '||customer_lName AS customer_fullName 
FROM customers_table
ORDER BY customer_id; 

SELECT
    customer_fullName, 
    customer_city, 
    customer_street, 
    customer_state, customer_street||' '||customer_city||', '||customer_state AS fullAddress
FROM customers_table
ORDER BY customer_fullName; 

SELECT
    customer_fullName, CONCAT(customer_fullName, ' is delinquent? ', bill_due) AS delinquent_T_or_F 
FROM customers_table; 

-- Substrings 
SELECT
    column1, 
    column2
SUBSTRING(column1 FOR 2) AS column1_2chars 
FROM tablename; 

-- SAMPLE
-- Retreive IDs beginning with 'AB' 
SELECT
    customer_id, 
    customer_fullName, 
SUBSTRING(customer_id FOR 2) AS Cust_group 
FROM customers_table
WHERE SUBSTRING(customer_id FOR 2) = 'AB';

-- String Aggregation 
SELECT 
    column1, STRING_AGG(column2, ' , ') AS new_column
FROM tablename
GROUP BY column1; 

-- Sample 
-- return a list of all products ordered by a customer from the sales table 
SELECT * 
FROM sales;

SELECT * 
FROM customers_table; 

SELECT 
    order_id, STRING_AGG(product_id, ', ') AS prod_ordered 
FROM sales 
GROUP BY order_id 
ORDER BY order_id; 

-- Coalesce 
SELECT 
    column1, 
    column2, COALESCE(column1, column2) AS replaced_column 
FROM tablename
ORDER BY column2; 

