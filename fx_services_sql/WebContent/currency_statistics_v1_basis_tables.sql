
DROP TABLE IF EXISTS STOCK_PRICE;
DROP VIEW IF EXISTS SW_TABLE;
DROP VIEW IF EXISTS SW_TABLE_NAME;
DROP TABLE IF EXISTS GRAPH_NAME;
DROP TABLE IF EXISTS GRAPH_XY;
DROP TABLE IF EXISTS CURRENCY_PRICE;
DROP TABLE IF EXISTS NAME_MAPPING;

CREATE TABLE GRAPH_NAME (
    ID integer not null,
    NAME varchar(64) not null,
    X_AXIS varchar(64) not null,
    Y_AXIS varchar(64) not null,
    CREATED timestamp,
    PRIMARY KEY (ID)
);

CREATE TABLE GRAPH_XY (
    ID integer not null,
 	GRAPH_ID integer not null,
    X_AXIS_VALUE integer not null,
    Y_AXIS_VALUE integer not null,
    CREATED timestamp,
    X_AXIS timestamp,
    PRIMARY KEY (ID)
);

CREATE TABLE CURRENCY_PRICE (
    ID integer not null,
 	TRADE_SESSION integer not null,
    USD_VALUE float,
    CROSS_VALUE float,
    CROSS_NAME varchar(16), 
    CREATED timestamp,
    -- DAY_OR_NIGHT integer not null, 
    PRIMARY KEY (ID)
);

CREATE TABLE STOCK_PRICE (
    ID integer not null,
 	TRADE_SESSION integer not null,
    USD_PRICE varchar(16),
    CREATED timestamp,
    PRIMARY KEY (ID)
);

CREATE TABLE NAME_MAPPING (
    ID integer not null,
 	TABLE_NAME varchar(32),
    REST_NAME varchar(32),
    PRIMARY KEY (ID)
);



INSERT INTO NAME_MAPPING (ID, TABLE_NAME, REST_NAME) VALUES(0, 'GRAPH_XY', 'graphXies'); 
INSERT INTO NAME_MAPPING (ID, TABLE_NAME, REST_NAME) VALUES(1, 'STOCK_PRICE', 'stockPrices'); 
INSERT INTO NAME_MAPPING (ID, TABLE_NAME, REST_NAME) VALUES(2, 'CURRENCY_PRICE', 'currencyPrices'); 
INSERT INTO NAME_MAPPING (ID, TABLE_NAME, REST_NAME) VALUES(3, 'GRAPH_NAME', 'graphNames'); 
INSERT INTO NAME_MAPPING (ID, TABLE_NAME, REST_NAME) VALUES(4, 'NAME_MAPPING', 'nameMappings'); 

CREATE VIEW SW_TABLE 
   AS
SELECT 
	DISTINCT TABLE_NAME 
FROM 
	INFORMATION_SCHEMA.COLUMNS 
WHERE 
	TABLE_SCHEMA = 'stockwatch'
ORDER BY 
	TABLE_NAME ASC;
	
CREATE VIEW SW_TABLE_NAME
	AS 
SELECT 
	TABLE_NAME, COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH 
FROM 
	INFORMATION_SCHEMA.COLUMNS;