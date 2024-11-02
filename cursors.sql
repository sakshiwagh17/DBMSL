-- CREATE DATABASE std;
-- USE std;
-- CREATE TABLE student(rollno int,name varchar(50));
-- INSERT INTO student(rollno,name)
-- VALUES
-- (1,"SAKSHI");
-- CREATE TABLE nstudent(rollno int,name varchar(50));

DELIMITER //
CREATE PROCEDURE merge_data(IN rollnew INTEGER) 
BEGIN
	DECLARE sroll INTEGER;
	DECLARE rowcount INTEGER DEFAULT 0;
	DECLARE terminate BOOLEAN DEFAULT FALSE;
	DECLARE stud_details CURSOR FOR 
	SELECT rollno FROM student WHERE rollno=rollnew;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET terminate=TRUE;
	OPEN stud_details;
	getstud:Loop
		FETCH stud_details INTO sroll;
		IF NOT EXISTS (SELECT * FROM nstudent WHERE rollno=sroll) THEN
		INSERT INTO nstudent SELECT * FROM student WHERE roll=sroll;
		SET rowcount=rowcount+1;
	END IF;
	IF terminate=TRUE THEN
		LEAVE getstud;
	END IF;
	END LOOP getstud;
	close stud_details;
	SELECT CONCAT('RECORD MERGED,',rowcount,'row(s) affected') AS MESSAGE;
END 
//
DELIMITER ;

-- CALL merge_Data(1);
-- SELECT * FROM nstudent;