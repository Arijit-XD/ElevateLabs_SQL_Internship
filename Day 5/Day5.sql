-- Students with department names (inner join)
SELECT s.name AS student_name, d.name AS department
FROM Students s
INNER JOIN Departments d ON s.department_id = d.department_id;

-- All students, with or without department (left join)
SELECT s.name, d.name AS department
FROM Students s
LEFT JOIN Departments d ON s.department_id = d.department_id;

-- All departments, with or without students (right join)
SELECT s.name, d.name AS department
FROM Students s
RIGHT JOIN Departments d ON s.department_id = d.department_id;

-- All students and departments (full join using union)
SELECT s.name, d.name AS department
FROM Students s
LEFT JOIN Departments d ON s.department_id = d.department_id
UNION
SELECT s.name, d.name AS department
FROM Students s
RIGHT JOIN Departments d ON s.department_id = d.department_id;

-- Enrolled students with course and date
SELECT s.name AS student, c.course_name, e.enrollment_date
FROM Enrollments e
JOIN Students s ON e.student_id = s.student_id
JOIN Courses c ON e.course_id = c.course_id;

-- Students from same department (self join)
SELECT a.name AS student1, b.name AS student2
FROM Students a, Students b
WHERE a.department_id = b.department_id AND a.student_id <> b.student_id;
