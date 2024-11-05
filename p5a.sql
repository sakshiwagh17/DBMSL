-- run p5b.sql first
-- CREATE DATABASE class;
-- USE class;
-- CREATE TABLE stud_marks(roll int,std_name varchar(50),total_marks int);
-- INSERT INTO stud_marks(roll,name,total_marks)
-- VALUES
-- ("1","sakshi",100);
-- SELECT * FROM stud_marks;
-- CREATE TABLE result(roll int,name varchar(50),class varchar(50));

DELIMITER //
CREATE PROCEDURE procclass(IN rollnew INTEGER)
BEGIN
    DECLARE tmarks INTEGER;
    DECLARE sname varchar(50);
    DECLARE sresult varchar(25);
    DECLARE EXIT HANDLER FOR NOT FOUND
BEGIN
	SELECT CONCAT("ROLL NO ",rollnew," NOT FOUND") AS NoRecord;
END;
	SELECT std_name , total_marks INTO sname,tmarks FROM stud_marks WHERE rollnew=roll;
    SET sresult=proc_grade(tmarks);
    INSERT INTO result VALUES(rollnew,sname,sresult);
END;
//
DELIMITER ;

-- CALL procclass(1);
-- SELECT * FROM result;