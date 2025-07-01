-- Total students per department
SELECT d.name AS department, COUNT(*) AS total_students
FROM Students s
JOIN Departments d ON s.department_id = d.department_id
GROUP BY d.name;

-- Average age of students per department
SELECT d.name AS department, AVG(YEAR(CURDATE()) - YEAR(s.date_of_birth)) AS avg_age
FROM Students s
JOIN Departments d ON s.department_id = d.department_id
WHERE s.date_of_birth IS NOT NULL
GROUP BY d.name;

-- Courses with more than 1 enrollment
SELECT c.course_name, COUNT(*) AS total_enrollments
FROM Enrollments e
JOIN Courses c ON e.course_id = c.course_id
GROUP BY c.course_name
HAVING COUNT(*) > 1;

-- Total students enrolled in each course
SELECT c.course_name, COUNT(e.student_id) AS student_count
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name;

-- Department-wise instructor count
SELECT d.name AS department, COUNT(i.instructor_id) AS instructor_count
FROM Instructors i
JOIN Courses c ON i.instructor_id = c.instructor_id
JOIN Departments d ON c.department_id = d.department_id
GROUP BY d.name;

-- Average number of courses per instructor
SELECT i.name AS instructor, COUNT(c.course_id) AS course_count
FROM Instructors i
JOIN Courses c ON i.instructor_id = c.instructor_id
GROUP BY i.name;

-- Distinct student count
SELECT COUNT(DISTINCT student_id) AS unique_students FROM Students;
