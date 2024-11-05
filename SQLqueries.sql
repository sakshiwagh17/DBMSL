CREATE DATABASE emp;
USE emp;

CREATE TABLE student(std_id int,first_name varchar(50),last_name varchar(50),age int,grade varchar(10),major varchar(50));

INSERT INTO student(std_id,first_name,last_name,age,grade,major)
VALUES
(1,"john","doe",20,"A","computer science"),
(2,"jane","smith",21,"B","mathematics"),
(3,"alex","johnson",22,"B","physics"),
(4,"emily","davis",23,"C","biology"),
(5,"david","duck",21,"B","mathematics"),
(6,"don","dev",22,"A","mathematics");

-- Create above table Student display the table
SELECT * FROM student;
-- Change the name of student Jane to Jenne.
UPDATE student SET first_name="jenne" WHERE first_name="jane";
-- Find Students with a Specific Grade A
SELECT * FROM student WHERE grade="A";
-- Count the Number of Students in Each Major
SELECT major,COUNT(*) AS std_no FROM student GROUP BY MAJOR;
-- Order Students by Age in Ascending Order
SELECT * FROM student ORDER BY age ASC;
-- Find the Oldest Student 
SELECT * FROM student WHERE age=(SELECT MAX(age) FROM student );
-- Find the youngest Student
SELECT * FROM student WHERE age=(SELECT MIN(age) FROM student);
-- Update a Student's Major of student_id-2
UPDATE student SET major="computer science" WHERE std_id=2;
-- Delete a Student Record of id=6;
DELETE FROM student WHERE std_id=6;
-- Count the Number of Students in each Major where grade=”a”
SELECT major,COUNT(*) AS std_no FROM student WHERE grade="A" GROUP BY major;
-- Count the Number of Students in Each Grade having count greater than 2
SELECT grade,COUNT(*) AS std_no FROM student GROUP BY grade HAVING std_no>2;