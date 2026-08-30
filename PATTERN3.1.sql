CREATE DATABASE INVENTORY_DB3;
USE INVENTORY_DB3;

CREATE TABLE MonthlyInventory (
    month_start DATE PRIMARY KEY,
    closing_stock INT NOT NULL
);

INSERT INTO MonthlyInventory (month_start, closing_stock)
VALUES
('2025-01-01', 5000),
('2025-02-01', 5400),
('2025-03-01', 5100),
('2025-04-01', 5750),
('2025-05-01', 5600),
('2025-06-01', 6200),
('2025-07-01', 5900),
('2025-08-01', 6500);


SELECT 
month_start,
closing_stock,
LAG(closing_stock) OVER (order by month_start) as prev_month_stock,
closing_stock - LAG(closing_stock) OVER (order by month_start) as stock_change
FROM MonthlyInventory
ORDER BY month_start