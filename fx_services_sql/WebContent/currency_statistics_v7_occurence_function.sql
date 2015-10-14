DELIMITER $$

DROP FUNCTION IF EXISTS `INVOKE_POPULATION_PROC`$$

CREATE FUNCTION `INVOKE_POPULATION_PROC` (n2 INT, n1 INT)
  RETURNS INT
   DETERMINISTIC
BEGIN
	DECLARE avg INT;
	DECLARE counter INT DEFAULT 1;
	
	SET COUNTER = n2;
	
    simple_loop: LOOP

     	CALL ADD_NEW_ACTIVE_RECORD('EUR', counter);
		CALL ADD_NEW_ACTIVE_RECORD('CAD', counter);
        CALL ADD_NEW_ACTIVE_RECORD('CHF', counter);
     	CALL ADD_NEW_ACTIVE_RECORD('GBP', counter);
     	CALL ADD_NEW_ACTIVE_RECORD('JPY', counter);
     	CALL ADD_NEW_ACTIVE_RECORD('AUD', counter);
     	 	
		
      	IF counter=n1 THEN
            LEAVE simple_loop;
      	END IF;
      	
      	SET counter=counter+1;
  	END LOOP simple_loop;	

  	SET avg = n1;
  	RETURN avg;
END$$

DELIMITER ;





