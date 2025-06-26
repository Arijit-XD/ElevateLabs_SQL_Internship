-- All students
SELECT * FROM Students;

-- Student names and emails
SELECT name, email FROM Students;

-- Students in Computer Science
SELECT s.name
FROM Students s
JOIN Departments d ON s.department_id = d.department_id
WHERE d.name = 'Computer Science';

-- DOB between 2000 and 2003
SELECT name, date_of_birth
FROM Students
WHERE date_of_birth BETWEEN '2000-01-01' AND '2003-12-31';

-- Instructors without email
SELECT * FROM Instructors
WHERE email IS NULL;

-- Courses in A–Z order
SELECT course_name
FROM Courses
ORDER BY course_name;

-- First 2 students to enroll
SELECT s.name, e.enrollment_date
FROM Enrollments e
JOIN Students s ON e.student_id = s.student_id
ORDER BY e.enrollment_date
LIMIT 2;

-- Students starting with 'A'
SELECT * FROM Students
WHERE name LIKE 'A%';

-- Unique departments in courses
SELECT DISTINCT department_id
FROM Courses;

-- Show student names with alias
SELECT name AS 'Student Name'
FROM Students;
