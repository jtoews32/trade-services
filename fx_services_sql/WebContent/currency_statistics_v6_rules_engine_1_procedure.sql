-- PART OF RULES ENGINE 

1. A rule must tell you whether you should buy or sell the usd.
2. A rule has a one to five scale on whether you should buy a cucrency
3. A rule tells what it was followed by

mysql> SELECT * FROM PERIOD_MOVES_STATUS_VIEW;
+----+---------------+----------+------------+
| ID | TRADE_SESSION | MOVES_UP | MOVES_DOWN |
+----+---------------+----------+------------+
|  1 |             0 |        0 |          6 | 
|  2 |             1 |        6 |          0 | 
|  3 |             2 |        0 |          6 | 
|  4 |             3 |        4 |          2 | 
|  5 |             4 |        5 |          1 | 
|  6 |             5 |        1 |          5 | 
|  7 |             6 |        0 |          6 | 
|  8 |             7 |        3 |          3 | 
|  9 |             8 |        1 |          5 | 
| 10 |             9 |        1 |          5 | 
| 11 |            10 |        2 |          4 | 
| 12 |            11 |        3 |          3 | 
| 13 |            12 |        0 |          6 | 
| 14 |            13 |        1 |          5 | 
| 15 |            14 |        5 |          1 | 
| 16 |            15 |        1 |          5 | 
+----+---------------+----------+------------+


DROP TABLE IF EXISTS CURRENCY_MOVEMENTS_VS_USD;

-- PART OF RULES ENGINE
CREATE TABLE CURRENCY_MOVEMENTS_VS_USD (
	ID INT NOT NULL AUTO_INCREMENT,
	SESSION_USD_UP_COUNT INT NOT NULL,
	FOLLOWED_UP_OCCURED INT NOT NULL,
	FOLLOWED_DOWN_OCCURED INT NOT NULL,
	SELL_USD INT NOT NULL,	
	BUY_USD INT NOT NULL,
	PRIMARY KEY (ID)
);

DELIMITER $$

DROP FUNCTION IF EXISTS `CURRENCY_MOVEMENTS_VS_USD_PROC`$$
CREATE FUNCTION `CURRENCY_MOVEMENTS_VS_USD_PROC` (upMvs INT, dwnMvs INT, v1 VARCHAR(50))
  RETURNS INT
   DETERMINISTIC
BEGIN
	DECLARE avg INT;
	
	DECLARE id_c INT DEFAULT 0;
	DECLARE trade_session_c INT DEFAULT 0;
	DECLARE moves_up_c DECIMAL(32,0) DEFAULT 0;
	DECLARE moves_down_c DECIMAL(32,0) DEFAULT 0;
	DECLARE top_session INT DEFAULT 0;

	DECLARE no_more_rows BOOLEAN;
  	DECLARE loop_cntr INT DEFAULT 0;
  	DECLARE num_rows INT DEFAULT 0;

	DECLARE PERIOD_MOVES_STATUS_CURSOR CURSOR FOR SELECT ID, TRADE_SESSION, MOVES_UP, MOVES_DOWN FROM PERIOD_MOVES_STATUS_VIEW ORDER BY ID ASC;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET no_more_rows = TRUE;

	SELECT MAX(TRADE_SESSION) INTO top_session FROM CURRENCY_MOVEMENTS_VS_USD;
	
  	OPEN PERIOD_MOVES_STATUS_CURSOR;
  		SELECT FOUND_ROWS() INTO num_rows;
 		
    	the_loop: LOOP
    		FETCH PERIOD_MOVES_STATUS_CURSOR INTO id_c, trade_session_c, moves_up_c, moves_down_c;
    	
    		IF 
    		
    		
    		SELECT * FROM PERIOD_MOVES_STATUS_VIEW WHERE TRADE_SESSION = trade_session_c + 1; 
    		
    		
    		IF no_more_rows THEN
        		CLOSE PERIOD_MOVES_STATUS_CURSOR;
        		LEAVE the_loop;
    		END IF;

    	SET loop_cntr = loop_cntr + 1;
  	END LOOP the_loop;	

END$$

DELIMITER ;

	mysql> desc PERIOD_MOVES_STATUS_VIEW;	
+---------------+---------------+------+-----+---------+-------+
| Field         | Type          | Null | Key | Default | Extra |
+---------------+---------------+------+-----+---------+-------+
| ID            | int(11)       | NO   |     | NULL    |       | 
| TRADE_SESSION | int(11)       | NO   |     | NULL    |       | 
| MOVES_UP      | decimal(32,0) | YES  |     | NULL    |       | 
| MOVES_DOWN    | decimal(33,0) | YES  |     | NULL    |       | 
+---------------+---------------+------+-----+---------+-------+

