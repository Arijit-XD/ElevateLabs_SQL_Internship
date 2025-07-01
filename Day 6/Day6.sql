-- Students enrolled in more than 1 course
SELECT name
FROM Students
WHERE student_id IN (
    SELECT student_id
    FROM Enrollments
    GROUP BY student_id
    HAVING COUNT(*) > 1
);

-- Students older than avg student age
SELECT name, date_of_birth
FROM Students
WHERE date_of_birth < (
    SELECT AVG(date_of_birth)
    FROM Students
    WHERE date_of_birth IS NOT NULL
);

-- Departments that have courses
SELECT name
FROM Departments
WHERE department_id IN (
    SELECT department_id
    FROM Courses
);

-- Students not enrolled in any course
SELECT name
FROM Students
WHERE student_id NOT IN (
    SELECT student_id
    FROM Enrollments
);

-- Course with highest enrollments
SELECT course_name
FROM Courses
WHERE course_id = (
    SELECT course_id
    FROM Enrollments
    GROUP BY course_id
    ORDER BY COUNT(*) DESC
    LIMIT 1
);

-- Instructors who teach in CS dept
SELECT name
FROM Instructors
WHERE instructor_id IN (
    SELECT instructor_id
    FROM Courses
    WHERE department_id = (
        SELECT department_id
        FROM Departments
        WHERE name = 'Computer Science'
    )
);

-- Student count per course using subquery
SELECT course_name,
    (SELECT COUNT(*)
     FROM Enrollments e
     WHERE e.course_id = c.course_id) AS total_students
FROM Courses c;
