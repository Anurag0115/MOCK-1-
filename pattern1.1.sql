CREATE DATABASE InventoryDB1;
USE InventoryDB1;

CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL,
    city VARCHAR(50)
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10,2),
    supplier_id INT,
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);

CREATE TABLE Purchase_Orders (
    order_id INT PRIMARY KEY,
    supplier_id INT,
    order_date DATE,
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);

CREATE TABLE Purchase_Items (
    order_id INT,
    product_id INT,
    quantity INT,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Purchase_Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Suppliers VALUES
(1, 'Supplier X', 'Mumbai'),
(2, 'Supplier Y', 'Pune'),
(3, 'Supplier Z', 'Nashik');

INSERT INTO Products VALUES
(101, 'Product A', 'Electronics', 5000.00, 1),
(102, 'Product B', 'Furniture', 8000.00, 1),
(103, 'Product C', 'Stationery', 500.00, 2),
(104, 'Product D', 'Electronics', 7000.00, 3);

INSERT INTO Purchase_Orders VALUES
(1001, 1, '2026-01-10'),
(1002, 2, '2026-01-15'),
(1003, 1, '2026-02-05'),
(1004, 3, '2026-02-10'),
(1005, 2, '2026-02-20');

INSERT INTO Purchase_Items VALUES
(1001, 101, 10),
(1002, 101, 15),
(1003, 102, 40),
(1004, 104, 20),
(1005, 103, 30);

SELECT 
    p.product_name,
    (
        SELECT SUM(pi_sub.quantity)
        FROM Purchase_Items pi_sub
        WHERE pi_sub.product_id = p.product_id
    ) AS total_quantity_purchased,
    s.supplier_name
FROM Products p
JOIN Purchase_Items pi ON p.product_id = pi.product_id
JOIN Purchase_Orders po ON pi.order_id = po.order_id
JOIN Suppliers s ON po.supplier_id = s.supplier_id
ORDER BY p.product_id,s.supplier_id;