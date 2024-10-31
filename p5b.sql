Delimiter //

CREATE FUNCTION cal_grade(Marks Integer)
RETURNS varchar(25) NO SQL

   BEGIN
	DECLARE Sresult varchar(25);

  IF (Marks>=990 AND Marks<=1500) then
	SET Sresult = 'DISTINCTION';
  ELSEIF (Marks>=900 AND Marks<=989) THEN
	SET Sresult = 'FIRST CLASS';
  ELSEIF (Marks>=825 AND Marks<=899) THEN
	SET Sresult = 'HIGHER SECOND CLASS';
  ELSE
	SET Sresult = 'PASS CLASS';  
  END IF;
	RETURN Sresult;
END;
//
Delimiter ;