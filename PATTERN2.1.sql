CREATE DATABASE Inventory2;
USE Inventory2;

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    stock_quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

INSERT INTO Products VALUES
(101, 'Wireless Mouse', 'Electronics', 45, 799.00),
(102, 'Keyboard', 'Electronics', 8, 1299.00),
(103, 'Office Chair', 'Furniture', 25, 6500.00),
(104, 'USB Cable', 'Electronics', 5, 299.00),
(105, 'Notebook', 'Stationery', 60, 120.00);


 -- The inventory team wants to identify products that are running low on stock. Your task is to retrieve all 
-- products whose current stock quantity is less than 10. 
 -- The result should include the product_id, product_name, and stock_quantity, sorted by stock_quantity in 
 -- ascending order. 

-- Query to be Implemented 
 -- Write a query to return all products whose stock quantity is less than 10. 
 -- Output: 
 -- ● product_id 
 -- ● product_name 
 -- ● stock_quantity 
 
 SELECT 
 product_id,
 product_name,
 stock_quantity
 from products
 WHERE stock_quantity < 10
 ORDER BY stock_quantity
 
 
 






