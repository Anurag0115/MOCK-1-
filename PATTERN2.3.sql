CREATE DATABASE Student2;
USE Student2;

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    course VARCHAR(50) NOT NULL,
    marks INT NOT NULL,
    grade VARCHAR(5)
);

INSERT INTO Students VALUES
(301, 'Aisha', 'SQL', 78, 'B'),
(302, 'Rahul', 'SQL', 92, 'A'),
(303, 'Neha', 'Python', 85, 'A'),
(304, 'Arjun', 'SQL', 67, 'C'),
(305, 'Priya', 'Python', 95, 'A');


-- Your task is to retrieve all students who scored more than 80 marks. 
 -- The result should include the student_id, student_name, and marks, sorted by marks in descending 
 -- order. 

SELECT 
student_id,
student_name,
marks
FROM Students
WHERE marks > 80
ORDER BY marks desc;
