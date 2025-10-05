CREATE DATABASE StudentManagement;
USE StudentManagement;

CREATE TABLE Students (
id INT PRIMARY KEY,
s_name VARCHAR(40),
age INT,
gender CHAR(1),
branch VARCHAR(50)
);

CREATE TABLE Course(
c_id INT PRIMARY KEY,
c_name VARCHAR(40),
credits INT);

CREATE TABLE Enrollments (
    e_id INT PRIMARY KEY,
    s_id INT,
    c_id INT,
    grade CHAR(1),
    FOREIGN KEY (s_id) REFERENCES Students(id),
    FOREIGN KEY (c_id) REFERENCES Course(c_id)
);

INSERT INTO Students VALUES
(11101,'VAISHNAVI',20,'F','CSE'),
(11102,'AKASH',21,'M','IT'),
(11103,'KAVYA',20,'F','EXTC'),
(11104,'AYUSH',22,'M','CSE'),
(11105,'SANDIP',25,'M','IT'),
(11106,'TISHA',21,'F','CSE');

INSERT INTO Course VALUES
(101, 'DATABASE MANAGEMENT', 4),
(102, 'JAVA PROGRAMMING', 2),
(103, 'DATA STRUCTURE', 5),
(104, 'PYTHON PROGRAMMING', 2),
(105, 'C++ PROGRAMMING', 4),
(106, 'WEB DEVELOPMENT', 3);

INSERT INTO Enrollments VALUES
(1,11101,101,'A'),
(2,11102,102,'B'),
(3,11103,103,'B'),
(4,11104,104,'B'),
(5,11105,105,'A'),
(6,11106,106,'C');

SELECT * FROM Students;

SELECT * FROM Course
LIMIT 0, 1000;

SELECT s.s_name, c.c_name, e.grade
FROM Students s
JOIN Enrollments e ON s.id = e.s_id
JOIN Course c ON e.c_id = c.c_id;

SELECT * FROM Enrollments;

SELECT branch, COUNT(*) AS total_students
FROM Students
GROUP BY branch;


SELECT s.s_name, c.c_name, e.grade
FROM Students s
JOIN Enrollments e ON s.id = e.s_id
JOIN Course c ON e.c_id = c.c_id
WHERE e.grade = 'A';

SELECT s.s_name, c.c_name, e.grade
FROM Students s
JOIN Enrollments e ON s.id = e.s_id
JOIN Course c ON e.c_id = c.c_id;

SELECT * FROM Students
WHERE branch = 'CSE';

SELECT * FROM Students
WHERE gender='F';

SELECT s.s_name, c.c_name, e.grade
FROM Students s
JOIN Enrollments e ON s.id = e.s_id
JOIN Course c ON e.c_id = c.c_id
WHERE e.grade = 'A';

SELECT * FROM Course
WHERE credits > 3;

SELECT AVG(age) AS average_age FROM Students;

SELECT MAX(credits) AS max_credits, MIN(credits) AS min_credits
FROM Course;

SELECT * FROM Students
ORDER BY age DESC;

SELECT * FROM Course
ORDER BY credits ASC;

UPDATE Enrollments
SET grade = 'A'
WHERE s_id = 11106 AND c_id = 106;

SELECT c.c_name, COUNT(e.s_id) AS total_students
FROM Course c
LEFT JOIN Enrollments e ON c.c_id = e.c_id
GROUP BY c.c_name;

SELECT s.s_name
FROM Students s
LEFT JOIN Enrollments e ON s.id = e.s_id
WHERE e.s_id IS NULL;

SELECT s.s_name, COUNT(e.grade) AS A_count
FROM Students s
JOIN Enrollments e ON s.id = e.s_id
WHERE e.grade = 'A'
GROUP BY s.s_name
ORDER BY A_count DESC;

-- Get the list of all CSE students
SELECT * FROM Students
WHERE branch = 'CSE';

-- Count of students in each branch
SELECT branch, COUNT(*) AS total_students
FROM Students
GROUP BY branch;











 

