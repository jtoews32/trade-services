delimiter //
DROP PROCEDURE IF EXISTS CALCULATE_TRADE_SESSION_DIFFS//
CREATE PROCEDURE CALCULATE_TRADE_SESSION_DIFFS ( IN CROSS_CURR_IN VARCHAR(16) )
BEGIN	
	DECLARE cross_value_prev FLOAT DEFAULT 0;
	DECLARE cross_value_c FLOAT DEFAULT 0;
	DECLARE cross_name_c VARCHAR(16);
	DECLARE trade_session_c INTEGER;
	
	DECLARE done INTEGER DEFAULT 0;
	DECLARE no_more_rows BOOLEAN;
  	DECLARE loop_cntr INT DEFAULT 0;
  	DECLARE num_rows INT DEFAULT 0;
  	
  	DECLARE difference FLOAT DEFAULT 0;
  	DECLARE dollar_up_c INT DEFAULT 0;
  	
	DECLARE CURRENCY_PRICE_CURSOR CURSOR FOR SELECT CROSS_VALUE, CROSS_NAME, TRADE_SESSION FROM CURRENCY_PRICE WHERE CROSS_NAME = CROSS_CURR_IN;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET no_more_rows = TRUE;

  	OPEN CURRENCY_PRICE_CURSOR;
  		SELECT FOUND_ROWS() INTO num_rows;
 		
    	the_loop: LOOP
    		FETCH CURRENCY_PRICE_CURSOR INTO cross_value_c, cross_name_c, trade_session_c;
    		
    		IF no_more_rows THEN
        		CLOSE CURRENCY_PRICE_CURSOR;
        		LEAVE the_loop;
    		END IF;
    		
			IF trade_session_c > 0 THEN
    			SELECT CROSS_VALUE INTO cross_value_prev FROM CURRENCY_PRICE WHERE TRADE_SESSION = (trade_session_c-1) AND CROSS_NAME = CROSS_CURR_IN;

    			IF cross_value_prev < cross_value_c THEN
    				set difference = cross_value_c - cross_value_prev;
    				set dollar_up_c = 1;
    			ELSE
    				set difference = cross_value_prev - cross_value_c;
    				set dollar_up_c = 0;
    			END IF;
    			
    			IF CROSS_CURR_IN != 'JPY' THEN
    				set difference = difference * 10000;
    			ELSE 
    				set difference = difference * 100;
    			END IF;
    			
    			INSERT INTO PIP_SPREAD (TRADE_SESSION, CROSS_NAME, DOLLAR_UP, DIFF) VALUES (trade_session_c, CROSS_CURR_IN, dollar_up_c, difference);
    		END IF;

    	SET loop_cntr = loop_cntr + 1;
  	END LOOP the_loop;	
END;
//
delimiter ;	


