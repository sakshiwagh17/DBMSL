-- CREATE DATABASE lib;
-- USE lib;
-- CREATE TABLE libary(id int,name varchar(24),nameofbook varchar(24),status varchar(3));
-- INSERT INTO libary(id,name,nameofbook,status)
-- VALUES
-- (1,"SAKSHI","DSA","I"),
-- (2,"sayali","DBMS","I");
-- CREATE TABLE libary_audit(id int,name varchar(24),nameofbook varchar(24),status varchar(3));

-- AFTER INSERT TRIGGER
DELIMITER $
CREATE TRIGGER T1
BEFORE INSERT ON libary
FOR EACH ROW
BEGIN
INSERT INTO libary_audit VALUES(NEW.id,NEW.name,NEW.nameofbook,NEW.status);
END;
$
DELIMITER ;
SELECT * FROM libary_audit;
DROP TRIGGER T1;

-- UPDATE TRIGGER
DELIMITER $
CREATE TRIGGER T2 
AFTER UPDATE ON libary
FOR EACH ROW
BEGIN
INSERT INTO libary_audit VALUES(OLD.id,OLD.name,OLD.nameofbook,NEW.status);
END;
$
DELIMITER ;

-- DELETE TRIGGER
DELIMITER $
CREATE TRIGGER T3
AFTER DELETE ON libary
FOR EACH ROW 
BEGIN
INSERT INTO libary_audit VALUES(OLD.id,OLD.name,OLD.nameofbook,OLD.status);
END;
$
DELIMITER ;

-- SELECT * FROM libary_audit;