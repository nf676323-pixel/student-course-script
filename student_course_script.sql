DROP TABLE students CASCADE CONSTRAINTS;
DROP TABLE courses CASCADE CONSTRAINTS;

CREATE TABLE courses (
    course_id NUMBER PRIMARY KEY,
    course_name VARCHAR2(100) NOT NULL,
    credits NUMBER CHECK (credits BETWEEN 1 AND 5)
);

CREATE TABLE students (
    student_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50),
    last_name VARCHAR2(50),
    course_id NUMBER,
    CONSTRAINT fk_course FOREIGN KEY (course_id) REFERENCES courses(course_id)
);


ACCEPT course_id NUMBER PROMPT 'Enter Course ID: '
ACCEPT course_name CHAR PROMPT 'Enter Course Name: '
ACCEPT credits NUMBER PROMPT 'Enter Credits (1 to 5): '

INSERT INTO courses (course_id, course_name, credits)
VALUES (&course_id, '&course_name', &credits);

ACCEPT student_id NUMBER PROMPT 'Enter Student ID: '
ACCEPT first_name CHAR PROMPT 'Enter First Name: '
ACCEPT last_name CHAR PROMPT 'Enter Last Name: '
ACCEPT student_course_id NUMBER PROMPT 'Enter Course ID for Student: '

INSERT INTO students (student_id, first_name, last_name, course_id)
VALUES (&student_id, '&first_name', '&last_name', &student_course_id);


SELECT 
    s.student_id,
    s.first_name,
    s.last_name,
    c.course_name,
    c.credits
FROM 
    students s
JOIN 
    courses c ON s.course_id = c.course_id;


ACCEPT update_id NUMBER PROMPT 'Enter Student ID to Update: '
ACCEPT new_first CHAR PROMPT 'Enter New First Name: '

UPDATE students
SET first_name = '&new_first'
WHERE student_id = &update_id;


ACCEPT delete_id NUMBER PROMPT 'Enter Student ID to Delete: '

DELETE FROM students
WHERE student_id = &delete_id;

SELECT * FROM students;

