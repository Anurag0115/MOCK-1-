CREATE DATABASE InventoryDB4;
USE InventoryDB4;

CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    supplier_id INT,
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);

CREATE TABLE Inventory (
    product_id INT PRIMARY KEY,
    stock_quantity INT NOT NULL,
    reorder_level INT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);


INSERT INTO Suppliers VALUES
(1, 'TechSupply'),
(2, 'Computer World'),
(3, 'Digital Hub'),
(4, 'Gadget Zone');

INSERT INTO Products VALUES
(101, 'Wireless Mouse', 1),
(102, 'Laptop Stand', 1),
(103, 'USB Cable', 3),
(104, 'Webcam', 4),
(105, 'USB Keyboard', 2),
(106, 'Bluetooth Speaker', 3);

INSERT INTO Inventory VALUES
(101, 8, 20),
(102, 25, 15),
(103, 10, 10),
(104, 5, 12),
(105, 12, 25),
(106, 30, 15);



-- Write a query to return: 
-- ● product_id 
-- ● product_name 
-- ● supplier_name 
-- ● stock_quantity 
-- ● reorder_level




SELECT 
p.product_id,
p.product_name,
s.supplier_name,
i.stock_quantity,
i.reorder_level
FROM products P
JOIN Inventory I
ON P.product_id = I.product_id
JOIN Suppliers S
ON S.supplier_id = P.supplier_id
WHERE i.stock_quantity < i.reorder_level;



