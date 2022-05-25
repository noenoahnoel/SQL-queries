 -- Create a customer's table
CREATE TABLE customer ( 
    customer_id    integer primary key, 
    customer_last_name    char(20), 
    customer_first_name    char(15), 
    customer_discount    decimal(5,2)
    customer_address    char(50)
); 

-- Create a product table 
CREATE TABLE customer ( 
    product_id    integer primary key, 
    product_name   char(20), 
    product_code    char(15), 
    product_price    decimal(5,2)
    product_date    date('yyyy/mm-dd')
); 

-- Inserting records into a products table 
INSERT INTO product
VALUES (375, 'Outdoor 2 Gallon Cooler Pack', 'ny101', 18.29, '2020-05-15'), 
INSERT INTO product
VALUES (377, 'Outdoor 3 Gallon Cooler Pack', 'ny102', 21.25, '2020-05-15'),
INSERT INTO product
VALUES (373, 'Outdoor 4 Gallon Cooler Pack', 'ny105', 25.99, '2020-05-15'),
INSERT INTO product
VALUES (371, 'Outdoor 5 Gallon Cooler Pack', 'ny107', 31.29, '2020-05-15'),
INSERT INTO product
VALUES (379, 'Outdoor 6 Gallon Cooler Pack', 'ny103', 22.99, '2020-05-15'),
INSERT INTO product
VALUES (381, 'Outdoor 7 Gallon Cooler Pack', 'ny106', 26.39, '2020-05-15'),
INSERT INTO product
VALUES (383, 'Outdoor 8 Gallon Cooler Pack', 'ny104', 27.49, '2020-05-15'), 
INSERT INTO product
VALUES (385, 'Outdoor 9 Gallon Cooler Pack', 'ny108', 25.69, '2020-05-15'), 
INSERT INTO product
VALUES (387, 'Outdoor 10 Gallon Cooler Pack', 'ny110', 27.79, '2020-05-15'), 
INSERT INTO product
VALUES (391, 'Outdoor 1 Gallon Cooler Pack', 'ny109', 35.29, '2020-05-15')

-- Updating records in a table
UPDATE product
SET prod_cost = (prod_cost * 1.04);

UPDATE supplier 
SET supplier_name = 'Fergus Inc'
WHERE supplier_id >= 371; 

UPDATE customer
SET customer_discount = 0
WHERE customer_id = 1234

-- Deleting records in a table 
DELETE
FROM customer 
WHERE customer_id = 1234; 

DELETE 
FROM products 
WHERE product_id >= 371 AND product_id <= 391; 




