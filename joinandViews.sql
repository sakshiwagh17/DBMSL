CREATE DATABASE class;
USE class;

CREATE TABLE student(
	std_id int,
    std_name varchar(50),
    course_id int
);

INSERT INTO student(std_id,std_name,course_id)
VALUES
(1,"sakshi",101),
(2,"sayali",102),
(3,"aditya",103),
(4,"pranjal",101),
(5,"abhi",105);

SELECT * FROM student;

CREATE TABLE course(
	course_id int,
    course_name varchar(50)
);

INSERT INTO course(course_id,course_name)
VALUES
(101,"DSA"),
(102,"DBMS"),
(103,"CNS"),
(104,"TOC");

SELECT * FROM course;

-- LEFT JOIN
SELECT * FROM student LEFT JOIN course ON student.course_id=course.course_id;

-- RIGHT JOIN
SELECT * FROM student RIGHT JOIN course ON student.course_id=course.course_id;

-- INNER JOIN
SELECT * FROM student INNER JOIN course ON student.course_id=course.course_id;

-- FULL OUTER JOIN IS NOT SUPPORTED THUS 
SELECT * FROM student LEFT JOIN course ON student.course_id=course.course_id UNION SELECT * FROM student RIGHT JOIN course ON student.course_id=course.course_id;

-- VIEWS

CREATE VIEW std1 AS SELECT * FROM student WHERE course_id=101;
SELECT * FROM std1;

CREATE OR REPLACE VIEW std2 AS SELECT * FROM student;
SELECT * FROM std2;

DROP VIEW std2;