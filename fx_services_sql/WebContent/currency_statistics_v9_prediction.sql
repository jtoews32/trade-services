DROP TABLE IF EXISTS PREDICTION;
DROP TABLE IF EXISTS PREDICTION_ANALYSIS;

CREATE TABLE PREDICTION (
	ID INT NOT NULL AUTO_INCREMENT,
	CROSS_NAME VARCHAR(16),
	BUY_SELL INTEGER NOT NULL,
	PREDICTION_TYPE VARCHAR(32),
	PRIMARY KEY (ID)
);

CREATE TABLE PREDICTION_ANALYSIS (
	ID INT NOT NULL AUTO_INCREMENT,
	TRADE_SESSION INT NOT NULL,
	CROSS_NAME VARCHAR(16),
	PROFIT_AMOUNT FLOAT NOT NULL,
	DOLLAR_UP INT NOT NULL,
	BET INT NOT NULL,
	PRIMARY KEY (ID)
);  