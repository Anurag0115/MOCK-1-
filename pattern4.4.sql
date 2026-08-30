CREATE DATABASE StudentDB4;
USE StudentDB4;

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL
);

CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

INSERT INTO Students VALUES
(101, 'Ananya Rao'),
(102, 'Rohan Mehta'),
(103, 'Priya Shah'),
(104, 'Rahul Verma'),
(105, 'Karan Patel'),
(109, 'Sneha Patel');

INSERT INTO Courses VALUES
(1, 'Database Management Systems'),
(2, 'Operating Systems'),
(3, 'Computer Networks'),
(4, 'Java Programming');

INSERT INTO Enrollments VALUES
(1, 101, 1, '2025-07-10'),
(2, 102, 2, '2025-07-10'),
(3, 103, 3, '2025-07-11'),
(4, 104, 1, '2025-07-11'),
(5, 105, 4, '2025-07-12'),
(6, 109, 1, '2025-07-13'),
(7, 101, 2, '2025-07-15');




-- Write a query to return: 
-- ● student_id 
-- ● student_name 
-- ● course_name 
-- ● enrollment_date


SELECT 
S.student_id,
S.student_name,
C.course_name,
E.enrollment_date
FROM STUDENTS S
JOIN ENROLLMENTS E
ON S.student_id = E.student_id 
JOIN COURSES C 
ON C.course_id = E.course_id
WHERE course_name = 'Database management Systems'
