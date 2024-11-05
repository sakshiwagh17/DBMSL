-- CREATE DATABASE std;
-- USE std;
-- CREATE TABLE o_rollcall(roll_no int,name varchar(50));
-- INSERT INTO student(roll_no,name)
-- VALUES
-- (1,"SAKSHI"),
-- (2,"SAYALI");
-- CREATE TABLE n_rollcall(roll_no int,name varchar(50));

DELIMITER //
CREATE PROCEDURE merge_data(IN rollnew INTEGER)
BEGIN
	DECLARE sroll INTEGER;
	DECLARE rowcount INTEGER DEFAULT 0;
	DECLARE terminate BOOLEAN DEFAULT FALSE;
	DECLARE stud_details CURSOR FOR SELECT roll_no FROM o_rollcall WHERE roll_no=rollnew;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET terminate=TRUE;
	OPEN stud_details;
	getstud: LOOP
		FETCH stud_details INTO sroll;
		IF NOT EXISTS (SELECT * FROM n_rollcall WHERE sroll=roll_no) THEN
			INSERT INTO n_rollcall SELECT * FROM o_rollcall WHERE sroll=roll_no ;
			SET rowcount=rowcount+1;
		END IF;
		IF terminate=TRUE THEN
			LEAVE getstud;
		END IF;
	END LOOP getstud;
	CLOSE stud_details;
SELECT CONCAT("MERGE DATA ",rowcount," row(s) affected") AS Messege;
END ;
//
DELIMITER ;

-- CALL merge_Data(1);
-- SELECT * FROM n_rollcall;