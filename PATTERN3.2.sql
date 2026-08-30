CREATE DATABASE SMARTMART_DB3;
USE SMARTMART_DB3;

CREATE TABLE MonthlySales (
    month_start DATE PRIMARY KEY,
    total_revenue DECIMAL(12,2) NOT NULL
);

INSERT INTO MonthlySales (month_start, total_revenue)
VALUES
('2025-01-01', 125000.00),
('2025-02-01', 138500.00),
('2025-03-01', 131000.00),
('2025-04-01', 152000.00),
('2025-05-01', 145500.00),
('2025-06-01', 168000.00),
('2025-07-01', 175500.00),
('2025-08-01', 162000.00);


-- ● month_start 
-- ● total_revenue 
-- ● prev_month_revenue 
-- ● revenue_change


SELECT 
month_start,
total_revenue,
LAG(total_revenue) OVER (ORDER BY month_start) AS prev_month_revenue,
total_revenue - LAG(total_revenue) OVER (ORDER BY month_start) as revenue_change
FROM MonthlySales
ORDER BY month_start