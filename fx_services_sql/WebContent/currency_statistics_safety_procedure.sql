delimiter //
DROP PROCEDURE IF EXISTS HIGH_PROBABILITY_STUDY_EXTREME_GAINS_PROC//
CREATE PROCEDURE HIGH_PROBABILITY_STUDY_EXTREME_GAINS_PROC()
BEGIN
	DECLARE ID_c INT DEFAULT 0;          
	DECLARE CROSS_NAME_c VARCHAR(16);
	DECLARE PROFIT_c FLOAT DEFAULT 0.0;
	DECLARE TEST_SUM INTEGER DEFAULT 0;
	DECLARE TOTAL_SESSIONS INT DEFAULT 0;
	DECLARE TOTAL_PROFIT FLOAT DEFAULT 0.0;
	DECLARE UpDown INT DEFAULT 0;
	DECLARE x INT DEFAULT 1;
    
    SELECT MAX(TRADE_SESSION) INTO TOTAL_SESSIONS FROM CURRENCY_LIST_VIEW;
    
    WHILE x <= TOTAL_SESSIONS DO
		SELECT SUM(DOLLAR_UP) INTO TEST_SUM FROM CURRENCY_LIST_VIEW WHERE TRADE_SESSION = x; 
	
    	IF TEST_SUM < 1 THEN
    		SELECT CROSS_NAME INTO CROSS_NAME_c FROM CURRENCY_LIST_VIEW WHERE 
    			DOLLAR_UP = 0 AND TRADE_SESSION = x AND DIFF=(SELECT DISTINCT MAX(DIFF) FROM CURRENCY_LIST_VIEW WHERE TRADE_SESSION = x);
    		
    		SELECT 
    			DOLLAR_UP INTO UpDown 
    		FROM 
    			CURRENCY_LIST_VIEW
    		WHERE 
    			TRADE_SESSION = (x+1) AND CROSS_NAME = CROSS_NAME_c;
    	
    			
    	   	SELECT 
    			DIFF INTO PROFIT_c 
    		FROM 
    			CURRENCY_LIST_VIEW
    		WHERE 
    			TRADE_SESSION = (x+1) AND CROSS_NAME = CROSS_NAME_c;

    			
    		INSERT INTO PREDICTION_ANALYSIS (TRADE_SESSION, CROSS_NAME, PROFIT_AMOUNT, DOLLAR_UP, BET) VALUES (x, CROSS_NAME_c, PROFIT_c, UpDown, 1);
    	END IF;

    	IF TEST_SUM > 5 THEN
    		SELECT CROSS_NAME INTO CROSS_NAME_c FROM CURRENCY_LIST_VIEW WHERE 
    			DOLLAR_UP = 1 AND TRADE_SESSION = x AND DIFF =(SELECT DISTINCT MAX(DIFF) FROM CURRENCY_LIST_VIEW WHERE TRADE_SESSION = x);

    	   	SELECT 
    			DOLLAR_UP INTO UpDown
    		FROM 
    			CURRENCY_LIST_VIEW 
    		WHERE 
    			TRADE_SESSION = (x+1) AND CROSS_NAME = CROSS_NAME_c;
    			
        	SELECT 
    			DIFF INTO PROFIT_c
    		FROM 
    			CURRENCY_LIST_VIEW 
    		WHERE 
    			TRADE_SESSION = (x+1) AND CROSS_NAME = CROSS_NAME_c;			
    			
    		IF UpDown = 0 THEN
    			SET TOTAL_PROFIT=TOTAL_PROFIT+PROFIT_c;
    		ELSE
    			SET TOTAL_PROFIT=TOTAL_PROFIT-PROFIT_c;
    		END IF;	
    	
    		INSERT INTO PREDICTION_ANALYSIS (TRADE_SESSION, CROSS_NAME, PROFIT_AMOUNT, DOLLAR_UP, BET) VALUES (x, CROSS_NAME_c, PROFIT_c, UpDown, 0);
    	END IF;

    	
        SET  x = x + 1; 
   	END WHILE;
END;
//
delimiter ;	