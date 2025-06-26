-- Add departments
INSERT INTO Departments (name) VALUES 
('Computer Science'),
('Electrical Engineering');

-- Add instructors
INSERT INTO Instructors (name, email) VALUES 
('Dr. Reema Dey', 'reema.dey@abc.edu'),
('Dr. Sandeep Basu', NULL);

-- Add courses
INSERT INTO Courses (course_name, department_id, instructor_id) VALUES 
('Data Structures', 1, 1),
('Digital Circuits', 2, 2);

-- Add students
INSERT INTO Students (name, email, gender, date_of_birth, department_id) VALUES 
('Arijit Karmakar', 'arijit.k@abc.edu', 'M', '2002-10-15', 1),
('Diya Chakraborty', 'diya.c@abc.edu', 'F', NULL, 2),
('Ritwik Saha', NULL, 'M', '2003-01-22', 1);

-- Add enrollments
INSERT INTO Enrollments (student_id, course_id, enrollment_date) VALUES 
(1, 1, '2024-08-01'),
(2, 2, '2024-08-01'),
(3, 1, '2024-08-02');

-- Update instructor email
UPDATE Instructors
SET email = 'sandeep.basu@abc.edu'
WHERE instructor_id = 2;

-- Update student email
UPDATE Students
SET email = 'ritwik.s@abc.edu'
WHERE student_id = 3;

-- Delete an enrollment
DELETE FROM Enrollments
WHERE student_id = 2 AND course_id = 2;
