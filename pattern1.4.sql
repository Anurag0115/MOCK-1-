CREATE DATABASE StudentDB1;
USE StudentDB1;

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    email VARCHAR(100)
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits INT
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
(1, 'John', 'john@gmail.com'),
(2, 'Sarah', 'sarah@gmail.com'),
(3, 'David', 'david@gmail.com'),
(4, 'Michael', 'michael@gmail.com'),
(5, 'Priya', 'priya@gmail.com'),
(6, 'Rahul', 'rahul@gmail.com'),
(7, 'Amit', 'amit@gmail.com'),
(8, 'Neha', 'neha@gmail.com'),
(9, 'Rohan', 'rohan@gmail.com'),
(10, 'Sneha', 'sneha@gmail.com'),
(11, 'Karan', 'karan@gmail.com'),
(12, 'Ananya', 'ananya@gmail.com'),
(13, 'Vikram', 'vikram@gmail.com'),
(14, 'Pooja', 'pooja@gmail.com'),
(15, 'Arjun', 'arjun@gmail.com'),
(16, 'Isha', 'isha@gmail.com'),
(17, 'Varun', 'varun@gmail.com'),
(18, 'Meera', 'meera@gmail.com'),
(19, 'Aditya', 'aditya@gmail.com'),
(20, 'Nisha', 'nisha@gmail.com'),
(21, 'Sahil', 'sahil@gmail.com'),
(22, 'Riya', 'riya@gmail.com'),
(23, 'Manish', 'manish@gmail.com'),
(24, 'Kavya', 'kavya@gmail.com'),
(25, 'Yash', 'yash@gmail.com'),
(26, 'Simran', 'simran@gmail.com'),
(27, 'Akash', 'akash@gmail.com'),
(28, 'Tanya', 'tanya@gmail.com'),
(29, 'Dev', 'dev@gmail.com'),
(30, 'Aarav', 'aarav@gmail.com');

INSERT INTO Courses VALUES
(101, 'Python Programming', 4),
(102, 'Database Systems', 4),
(103, 'Web Development', 3);

INSERT INTO Enrollments VALUES
(1, 1, 101, '2026-01-05'),
(2, 2, 101, '2026-01-05'),
(3, 3, 101, '2026-01-05'),
(4, 4, 101, '2026-01-05'),
(5, 5, 101, '2026-01-06'),
(6, 6, 101, '2026-01-06'),
(7, 7, 101, '2026-01-06'),
(8, 8, 101, '2026-01-07'),
(9, 9, 101, '2026-01-07'),
(10, 10, 101, '2026-01-07'),
(11, 11, 101, '2026-01-08'),
(12, 12, 101, '2026-01-08'),
(13, 13, 101, '2026-01-08'),
(14, 14, 101, '2026-01-09'),
(15, 15, 101, '2026-01-09'),
(16, 16, 101, '2026-01-09'),
(17, 17, 101, '2026-01-10'),
(18, 18, 101, '2026-01-10'),
(19, 19, 101, '2026-01-10'),
(20, 20, 101, '2026-01-11'),
(21, 21, 101, '2026-01-11'),
(22, 22, 101, '2026-01-11'),
(23, 23, 101, '2026-01-12'),
(24, 24, 101, '2026-01-12'),
(25, 25, 101, '2026-01-12'),
(26, 26, 101, '2026-01-13'),
(27, 27, 101, '2026-01-13'),
(28, 28, 101, '2026-01-13'),
(29, 29, 101, '2026-01-14'),
(30, 30, 101, '2026-01-14');

INSERT INTO Enrollments VALUES
(31, 1, 102, '2026-01-15'),
(32, 2, 102, '2026-01-15'),
(33, 3, 102, '2026-01-15'),
(34, 4, 102, '2026-01-16'),
(35, 5, 102, '2026-01-16'),
(36, 6, 102, '2026-01-16'),
(37, 7, 102, '2026-01-17'),
(38, 8, 102, '2026-01-17'),
(39, 9, 102, '2026-01-17'),
(40, 10, 102, '2026-01-18'),
(41, 11, 102, '2026-01-18'),
(42, 12, 102, '2026-01-18'),
(43, 13, 102, '2026-01-19'),
(44, 14, 102, '2026-01-19'),
(45, 15, 102, '2026-01-19'),
(46, 16, 102, '2026-01-20'),
(47, 17, 102, '2026-01-20'),
(48, 18, 102, '2026-01-20'),
(49, 19, 102, '2026-01-21'),
(50, 20, 102, '2026-01-21'),
(51, 21, 102, '2026-01-21'),
(52, 22, 102, '2026-01-22'),
(53, 23, 102, '2026-01-22'),
(54, 24, 102, '2026-01-22'),
(55, 25, 102, '2026-01-23');

INSERT INTO Enrollments VALUES
(56, 26, 103, '2026-01-25'),
(57, 27, 103, '2026-01-25'),
(58, 28, 103, '2026-01-25'),
(59, 29, 103, '2026-01-26'),
(60, 30, 103, '2026-01-26');




-- Write a SQL query to retrieve: 
-- ● course_name 
-- ● total_enrollments — total number of students enrolled in the course 
-- ● student_name




SELECT 
C.course_name,
(SELECT COUNT(E2.enrollment_id)
FROM Enrollments E2
where E2.course_id = C.course_id) as total_enrollments,
S.student_name
FROM STUDENTS S
JOIN ENROLLMENTS E
ON S.student_id = E.student_id
JOIN COURSES C
ON C.course_id = E.course_id
ORDER BY C.course_id,S.student_id
