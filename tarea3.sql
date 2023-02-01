 use unsis;
 
 Delimiter //
CREATE PROCEDURE factorial(IN x INT)
 BEGIN
    DECLARE result INT;
	DECLARE i INT;
	SET result = 1;
    SET i = 1;
    WHILE i <= x DO
    SET result = result * i;
	SET i = i + 1;
    END WHILE;
    SELECT x AS Number, result as Factorial;
END//
CALL Factorial(7);
Delimiter //
drop procedure if exists ecuacion//
CREATE PROCEDURE ecuacion(IN a INT , in b int , in c int, out resul int)
 BEGIN
	 set resul = 0;
	
    set resul = (a*a*a*a)+b-c;
END//
call ecuacion(2,2,3,@resul);
select @resul;