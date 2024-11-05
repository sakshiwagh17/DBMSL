DELIMITER //
CREATE FUNCTION proc_grade(marks INTEGER)
  RETURNS varchar(25) NO SQL
BEGIN
  DECLARE sresult varchar(25);
  IF(marks<=1500 AND marks>=990) THEN
		  SET sresult="Distinction";
    ELSEIF(marks<=989 AND marks>=900) THEN
		  SET sresult="First Class";
    ELSEIF(marks<=899 AND marks>=825) THEN
		  SET sresult="Higher second class";
    ELSE
		  SET sresult="Pass class";
	END IF;
    RETURN sresult;
END;
//
DELIMITER ; 