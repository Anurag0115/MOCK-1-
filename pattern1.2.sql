CREATE DATABASE SmartMartDB1;
USE SmartMartDB1;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Order_Items (
    order_id INT,
    product_id INT,
    quantity INT,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Customers VALUES
(1, 'John', 'Mumbai'),
(2, 'Sarah', 'Pune'),
(3, 'David', 'Delhi'),
(4, 'Priya', 'Bangalore');

INSERT INTO Products VALUES
(101, 'Laptop', 'Electronics', 60000.00),
(102, 'Smartphone', 'Electronics', 30000.00),
(103, 'Headphones', 'Accessories', 3000.00),
(104, 'Keyboard', 'Accessories', 1500.00);

INSERT INTO Orders VALUES
(1001, 1, '2026-01-05'),
(1002, 2, '2026-01-10'),
(1003, 1, '2026-01-15'),
(1004, 3, '2026-01-20'),
(1005, 4, '2026-01-25'),
(1006, 3, '2026-02-01');

INSERT INTO Order_Items VALUES
(1001, 101, 10),
(1002, 101, 5),
(1003, 102, 12),
(1004, 102, 10),
(1005, 103, 8),
(1006, 104, 6);



SELECT 
P.product_name,
(SELECT SUM(oi2.quantity)
FROM order_items oi2
WHERE oi2.product_id = p.product_id) as total_quantity_sold,
C.customer_name
FROM products P 
JOIN ORDER_items OI
ON p.product_id = oi.product_id 
JOIN ORDERS O 
ON O.order_id = OI.order_id 
JOIN CUSTOMERS C
ON C.customer_id = O.customer_id
ORDER BY p.product_id,C.customer_id


