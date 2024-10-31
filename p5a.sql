-- run p5b.sql first
-- CREATE DATABASE class;
-- USE class;
-- CREATE TABLE stud_marks(name varchar(50),total_marks int);
-- INSERT INTO stud_marks(name,total_marks)
-- VALUES
-- ("sakshi",100);
-- SELECT * FROM stud_marks;
-- CREATE TABLE result(roll int,name varchar(50),class varchar(50));

DELIMITER //
CREATE PROCEDURE proc_grade(IN rollnew int)
BEGIN
DECLARE Tmarks int;
DECLARE Sname varchar(25);
DECLARE Sresult varchar(25);

DECLARE EXIT HANDLER FOR NOT FOUND
BEGIN
	SELECT CONCAT("ROLLNO",rollnew,"NOT FOUND") AS NoRecord;
END;
	SELECT name,total_marks INTO Sname,Sresult FROM stud_marks;
    SET Sresult=cal_grade(Tmarks);
    INSERT INTO result VALUES(rollnew,Sname,Sresult);
END;
//
DELIMITER ;

-- CALL proc_grade(1);
-- SELECT * FROM result;