
DROP TABLE IF EXISTS IMPACT_ANALYSIS;

-- PART OF RULES ENGINE
CREATE TABLE IMPACT_ANALYSIS (
	ID INT NOT NULL AUTO_INCREMENT,
	CROSS_NAME VARCHAR(16),
	SEVERITY INT NOT NULL,
	EVENT_TIME TIMESTAMP,
	BANK_CLOSED INT NOT NULL DEFAULT 0,
	PRIMARY KEY (ID)
);

-- ALTER TABLE IMPACT_ANALYSIS ADD BANK_CLOSED INT NOT NULL DEFAULT 0;
-- ALTER TABLE IMPACT_ANALYSIS ADD BANK_CLOSED INT NOT NULL DEFAULT 0;

DROP TABLE IF EXISTS CURRENCY_NEXT_PERIOD_EVENTS;

CREATE TABLE CURRENCY_NEXT_PERIOD_EVENTS (
	ID INTEGER NOT NULL AUTO_INCREMENT,
	CURRENCY VARCHAR(32) NOT NULL,
	DAY TIMESTAMP NOT NULL,
	SEVERITY INT NOT NULL,
	EVENT_COUNT INT NOT NULL,
	TIME_OF_DAY VARCHAR(32), 
	DESCRIPTION TINYTEXT,
	BANK_CLOSED INT NOT NULL DEFAULT 0,
	PRIMARY KEY (ID)
);
