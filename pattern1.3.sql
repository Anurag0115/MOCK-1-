CREATE DATABASE AdventureWorks1;
USE AdventureWorks1;

CREATE TABLE Person (
    BusinessEntityID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50)
);
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    PersonID INT,
    AccountNumber VARCHAR(20),
    FOREIGN KEY (PersonID) REFERENCES Person(BusinessEntityID)
);
CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    Name VARCHAR(100),
    ProductNumber VARCHAR(30),
    ListPrice DECIMAL(10,2)
);
CREATE TABLE SalesOrderHeader (
    SalesOrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);
CREATE TABLE SalesOrderDetail (
    SalesOrderID INT,
    ProductID INT,
    OrderQty INT,
    PRIMARY KEY (SalesOrderID, ProductID),
    FOREIGN KEY (SalesOrderID) REFERENCES SalesOrderHeader(SalesOrderID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);
INSERT INTO Person VALUES
(1, 'John', 'Smith'),
(2, 'David', 'Brown'),
(3, 'Sarah', 'Jones'),
(4, 'Michael', 'Lee'),
(5, 'Priya', 'Sharma'),
(6, 'Rahul', 'Patel');
INSERT INTO Customer VALUES
(101, 1, 'CUST-001'),
(102, 2, 'CUST-002'),
(103, 3, 'CUST-003'),
(104, 4, 'CUST-004'),
(105, 5, 'CUST-005'),
(106, 6, 'CUST-006');
INSERT INTO Product VALUES
(1, 'Mountain Bike', 'MB-001', 1500.00),
(2, 'Road Bike', 'RB-001', 1800.00),
(3, 'Touring Bike', 'TB-001', 2000.00),
(4, 'Helmet', 'HE-001', 100.00);
INSERT INTO SalesOrderHeader VALUES
(1001, 101, '2026-01-05'),
(1002, 102, '2026-01-10'),
(1003, 103, '2026-01-15'),
(1004, 104, '2026-01-20'),
(1005, 101, '2026-01-25'),
(1006, 105, '2026-02-01'),
(1007, 106, '2026-02-05'),
(1008, 102, '2026-02-10');
INSERT INTO SalesOrderDetail VALUES
(1001, 1, 60),
(1002, 1, 65),

(1003, 2, 40),
(1004, 2, 46),

(1005, 3, 20),
(1006, 3, 30),

(1007, 4, 10),
(1008, 4, 15);



-- Write a SQL query to retrieve: 
-- ● product_name 
-- ● total_quantity_ordered — total OrderQty for the product 
-- ● customer_name — customer's first name and last name 


SELECT 
P.name,
(SELECT sum(od2.OrderQty)
FROM  salesorderdetail od2
where od2.productid = p.productid)AS TOTAL_ORDER_QUANTITY, 
CONCAT(per.FirstName, ' ', per.LastName) AS customer_name
FROM product P
JOIN salesorderdetail od
ON p.productid = od.productid
JOIN salesorderheader oh
 on oh.salesorderid = od.salesorderid
 JOIN Customer C
 ON C.customerid = OH.Customerid
 JOIN person per 
on per.businessentityid = C.personid
ORDER BY p.productid,c.customerid




