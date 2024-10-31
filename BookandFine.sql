-- CREATE DATABASE book;
-- USE book;
-- CREATE TABLE borrower(roll_no int,name varchar(50),DOI date,nameofbook varchar(50),status varchar(50));
-- INSERT INTO borrower(roll_no,name,DOI,nameofbook,status)
-- VALUES
-- (1,"sakshi",20240315,"DSA","I"),
-- (2,"sayali",20241012,"DBMS","I");
-- SELECT * FROM borrower;

-- CREATE TABLE Fine(roll_no int,date date,amt int);

Delimiter //
CREATE PROCEDURE BookFine(roll_new int,book_name varchar(50))
BEGIN 
DECLARE X integer;
DECLARE CONTINUE HANDLER FOR NOT FOUND
BEGIN
SELECT CONCAT("ROLLNO",roll_new,"NOT FOUND") AS NoRecord;
end;
SELECT DATEDIFF(CURDATE(),DOI) INTO X FROM borrower WHERE roll_no=roll_new;
IF(X>15&&X<30) THEN
	INSERT INTO fine VALUES(roll_new,CURDATE(),(X*5));
END IF;
IF(X>30) THEN
	INSERT INTO fine VALUES(roll_new,CURDATE(),(X*50));
END IF;
UPDATE borrower SET status="R" WHERE roll_no=roll_new;
END;
//
Delimiter ;

-- CALL BookFine(1,"DSA");
-- SELECT * FROM fine;