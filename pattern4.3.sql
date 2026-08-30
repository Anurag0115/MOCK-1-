CREATE DATABASE AdventureWorksPractice4;
USE AdventureWorksPractice4;

CREATE TABLE ProductCategory (
    ProductCategoryID INT PRIMARY KEY,
    Name VARCHAR(100)
);

CREATE TABLE ProductSubcategory (
    ProductSubcategoryID INT PRIMARY KEY,
    ProductCategoryID INT,
    Name VARCHAR(100),
    FOREIGN KEY (ProductCategoryID)
        REFERENCES ProductCategory(ProductCategoryID)
);

CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    Name VARCHAR(100),
    ProductNumber VARCHAR(50),
    ProductSubcategoryID INT,
    FOREIGN KEY (ProductSubcategoryID)
        REFERENCES ProductSubcategory(ProductSubcategoryID)
);




INSERT INTO ProductCategory VALUES
(1, 'Bikes'),
(2, 'Components'),
(3, 'Clothing');

INSERT INTO ProductSubcategory VALUES
(10, 1, 'Road Bikes'),
(11, 1, 'Mountain Bikes'),
(12, 1, 'Touring Bikes'),
(20, 2, 'Brakes'),
(30, 3, 'Jerseys');

INSERT INTO Product VALUES
(680, 'HL Road Frame - Black, 58', 'FR-R92B-58', 10),
(706, 'HL Road Frame - Red, 58', 'FR-R92R-58', 10),
(712, 'HL Road Tire', 'TI-R092', 10),
(715, 'Mountain-100 Black', 'BK-M82S-44', 11),
(720, 'Mountain-200 Silver', 'BK-M68S-42', 11),
(800, 'Touring Bike', 'BK-T01', 12),
(900, 'Brake Assembly', 'BR-001', 20),
(950, 'Cycling Jersey', 'CJ-001', 30);


-- Write a query to return: 
-- ● ProductID 
-- ● Name 
-- ● ProductNumber 
-- ● SubcategoryName 
-- ● CategoryName 

SELECT 
P.productid,
P.name,
P.productnumber,
PS.NAME,
PC.name
FROM PRODUCT P 
JOIN productsubcategory PS
ON P.productSubcategoryID = PS.productSubcategoryID
JOIN productcategory PC 
ON PC.productcategoryID = PS.productcategoryID
WHERE PC.name ='Bikes';














