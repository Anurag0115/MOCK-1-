CREATE DATABASE SmartMart2;
USE SmartMart2;

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT NOT NULL
);

INSERT INTO Products VALUES
(201, 'Rice 5kg', 'Grocery', 450.00, 35),
(202, 'Coffee Maker', 'Appliances', 3200.00, 12),
(203, 'Washing Powder', 'Household', 650.00, 40),
(204, 'Mixer Grinder', 'Appliances', 4500.00, 8),
(205, 'Cooking Oil', 'Grocery', 180.00, 50);

 -- our task is to retrieve all products whose price is greater than ₹2,000. 
 -- The result should include the product_id, product_name, and price, sorted by price in descending order. 
 
 
 SELECT 
 product_id,
 product_name,
 price
 FROM products
 WHERE price > 2000
 ORDER BY price DESC