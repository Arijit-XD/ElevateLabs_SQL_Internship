-- Procedure: get all students from a department
DELIMITER //
CREATE PROCEDURE GetStudentsByDepartment(IN dept_name VARCHAR(100))
BEGIN
    SELECT s.name AS student_name, d.name AS department
    FROM Students s
    JOIN Departments d ON s.department_id = d.department_id
    WHERE d.name = dept_name;
END //
DELIMITER ;

-- Function: get total students in a department
DELIMITER //
CREATE FUNCTION CountStudentsInDepartment(dept_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    SELECT COUNT(*) INTO total
    FROM Students
    WHERE department_id = dept_id;
    RETURN total;
END //
DELIMITER ;