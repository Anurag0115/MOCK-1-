DROP DATABASE AdventureWorks3;
CREATE DATABASE AdventureWorks3;
USE AdventureWorks3;

CREATE TABLE SalesOrderHeader (
    SalesOrderID INT PRIMARY KEY,
    OrderDate DATE NOT NULL,
    TotalDue DECIMAL(12,2) NOT NULL
);
INSERT INTO SalesOrderHeader (SalesOrderID, OrderDate, TotalDue) VALUES
(1, '2013-01-05', 120000.00),
(2, '2013-01-18', 125000.00),
(3, '2013-02-02', 140000.00),
(4, '2013-02-21', 131500.00),
(5, '2013-03-09', 130000.00),
(6, '2013-03-27', 129800.00),
(7, '2013-04-03', 150000.00),
(8, '2013-04-25', 148400.00);

-- INSERT INTO SalesOrderHeader
-- (SalesOrderID, OrderDate, TotalDue)
-- VALUES
-- (1, '2025-01-05', 50000.00),
-- (2, '2025-01-12', 75000.00),
-- (3, '2025-01-20', 120000.00),

-- (4, '2025-02-03', 90000.00),
-- (5, '2025-02-15', 85000.00),
-- (6, '2025-02-25', 96500.00),

-- (7, '2025-03-04', 70000.00),
-- (8, '2025-03-16', 95000.00),
-- (9, '2025-03-27', 89800.00),

-- (10, '2025-04-05', 100000.00),
-- (11, '2025-04-18', 98000.00),
-- (12, '2025-04-25', 100400.00),

-- (13, '2025-05-06', 110000.00),
-- (14, '2025-05-15', 105000.00),
-- (15, '2025-05-28', 95000.00);

SELECT
    month_start,
    total_sales,
    LAG(total_sales) OVER (ORDER BY month_start) AS prev_month_sales,
    total_sales -
        LAG(total_sales) OVER (ORDER BY month_start) AS sales_change
FROM
(
    SELECT
        DATE_FORMAT(OrderDate, '%Y-%m-01') AS month_start,
        SUM(TotalDue) AS total_sales
    FROM SalesOrderHeader
    GROUP BY DATE_FORMAT(OrderDate, '%Y-%m-01')
) AS monthly_sales
ORDER BY month_start;