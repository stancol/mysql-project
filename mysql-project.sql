USE devcamp_project_schema;

-- Create a script that populates all of the database tables with sample data
SELECT *
FROM students;

-- Create a script that populates all of the database tables with sample data
SELECT *
	FROM students s 
    JOIN grades g 
    ON s.students_id = g.grades_id
    JOIN courses c
    ON c.courses_id = s.students_id
    JOIN professors p 
    ON p.professors_id = s.students_id;
    
-- The average grade that is given by each professor    
SELECT AVG(students_grades)
FROM grades g
JOIN professors p
ON g.grades_id = p.professors_id;

SELECT *
	FROM students s 
    JOIN grades g 
    ON s.students_id = g.grades_id;
    
-- The top grades for each student
SELECT students_name AS "Students:", students_grades AS "Grades:"
FROM students s
JOIN grades g
ON s.students_id = g.grades_id
ORDER BY g.students_grades DESC;

-- Group students by the courses that they are enrolled in
SELECT courses_name AS "Course", students_name AS "Student" 
FROM courses c
JOIN grades g
ON g.grades_id = c.courses_id 
JOIN students s
ON s.students_id = c.courses_id 
GROUP BY courses_id;

-- 
SELECT student_name AS "Student", professor_name AS "Professor"
FROM grades
JOIN students
ON grades.grade_student_id = course_id
JOIN courses
ON courses.course_professor_id = professor_id
JOIN professors
GROUP BY student_name;

-- Finding which student and professor have the most courses in common
SELECT students_name AS "Student", professors_name AS "Professor", COUNT(*) AS classes_in_common
FROM grades g
JOIN students s
ON g.grades_id = s.students_id
JOIN courses c
ON g.grades_id = c.courses_id
JOIN professors p
ON c.courses_id = p.professors_id
GROUP BY professors_name, students_name
ORDER BY classes_in_common DESC
LIMIT 1;