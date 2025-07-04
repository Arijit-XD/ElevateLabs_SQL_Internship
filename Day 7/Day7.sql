-- View: students with department
CREATE VIEW StudentWithDepartment AS
SELECT s.name AS student_name, d.name AS department
FROM Students s
JOIN Departments d ON s.department_id = d.department_id;

-- View: course enrollments
CREATE VIEW CourseEnrollments AS
SELECT c.course_name, COUNT(e.student_id) AS total_students
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name;

-- View: instructor with course and dept
CREATE VIEW InstructorCourses AS
SELECT i.name AS instructor, c.course_name, d.name AS department
FROM Instructors i
JOIN Courses c ON i.instructor_id = c.instructor_id
JOIN Departments d ON c.department_id = d.department_id;

-- View: student info for display (hide DOB/email)
CREATE VIEW PublicStudentList AS
SELECT name, gender
FROM Students;

-- Drop a view
-- DROP VIEW IF EXISTS CourseEnrollments;