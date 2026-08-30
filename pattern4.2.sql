CREATE DATABASE SmartMartDB4;
USE SmartMartDB4;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    status VARCHAR(30),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Customers VALUES
(1, 'Rahul Sharma'),
(2, 'Priya Nair'),
(3, 'Arjun Kumar'),
(4, 'Sneha Patel'),
(5, 'Vikram Shah');

INSERT INTO Orders VALUES
(1001, 1, '2025-08-12', 'Completed'),
(1002, 2, '2025-08-13', 'Pending'),
(1003, 3, '2025-08-14', 'Cancelled'),
(1005, 2, '2025-08-15', 'Completed'),
(1006, 4, '2025-08-16', 'Pending'),
(1010, 3, '2025-08-18', 'Completed'),
(1011, 5, '2025-08-19', 'Cancelled');




-- Write a query to return: 
-- ● order_id 
-- ● order_date 
-- ● customer_name 
-- ● status



SELECT 
O.order_id,
O.order_date,
C.customer_name,
O.status
FROM ORDERS O 
JOIN CUSTOMERS C
ON O.customer_id = C.customer_id
WHERE STATUS ='Completed'