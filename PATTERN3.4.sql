CREATE DATABASE STUDENT_DB3;
USE STUDENT_DB3;

CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATE NOT NULL
);

INSERT INTO Enrollments
(enrollment_id, student_id, course_id, enrollment_date)
VALUES
(1, 101, 201, '2025-01-05'),
(2, 102, 202, '2025-01-08'),
(3, 103, 203, '2025-01-15'),
(4, 104, 201, '2025-01-20'),
(5, 105, 204, '2025-01-25'),

(6, 106, 201, '2025-02-03'),
(7, 107, 202, '2025-02-07'),
(8, 108, 203, '2025-02-12'),
(9, 109, 204, '2025-02-18'),
(10, 110, 205, '2025-02-22'),
(11, 111, 201, '2025-02-25'),

(12, 112, 202, '2025-03-04'),
(13, 113, 203, '2025-03-09'),
(14, 114, 204, '2025-03-14'),
(15, 115, 205, '2025-03-20'),

(16, 116, 201, '2025-04-02'),
(17, 117, 202, '2025-04-06'),
(18, 118, 203, '2025-04-11'),
(19, 119, 204, '2025-04-17'),
(20, 120, 205, '2025-04-25'),
(21, 121, 201, '2025-04-28');
-- ● month_start 
-- ● total_enrollments 
-- ● prev_month_enrollments 
-- ● enrollment_change

SELECT 
month_start,
total_enrollments,
LAG(total_enrollments)  OVER (ORDER BY month_start) as prev_month_enrollments,
total_enrollments - LAG(total_enrollments)  OVER (ORDER BY month_start) as enrollment_change
FROM (
SELECT DATE_FORMAT(ENROLLMENT_DATE,'%Y-%m-01') AS month_start,
COUNT(*) AS TOTAL_enrollments
FROM ENROLLMENTS 
GROUP BY DATE_FORMAT(ENROLLMENT_DATE,'%Y-%m-01')
) AS monthly_enrollment
ORDER BY month_start

