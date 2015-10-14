-- USE SOX_REPOSITORY;
-- mysql -uroot -padminadmin sox_repository < schema.sql

DROP TABLE IF EXISTS STOCK_VALUES;
DROP TABLE IF EXISTS CURRENCY_VALUES;
DROP TABLE IF EXISTS OWNER_PARENT;
DROP TABLE IF EXISTS OWNER; 
DROP TABLE IF EXISTS OWNER_MAPPING;
DROP TABLE IF EXISTS OBJECTIVE;
DROP TABLE IF EXISTS RISK_NON_ACHIEVED;
DROP TABLE IF EXISTS CONTROL;
DROP TABLE IF EXISTS REF;
DROP TABLE IF EXISTS EFF_DATE;
DROP TABLE IF EXISTS PREVENTION;
DROP TABLE IF EXISTS SYS_MANUAL;
DROP TABLE IF EXISTS FREQUENCY;
DROP TABLE IF EXISTS SOURCE;
DROP TABLE IF EXISTS DESIGN_EFF;
DROP TABLE IF EXISTS OPERATING_EFF;
DROP TABLE IF EXISTS TEST_REF;
DROP TABLE IF EXISTS GAPS_QA;
DROP TABLE IF EXISTS JOB_SCHEDULE;
DROP TABLE IF EXISTS EMAIL_RECORD;
DROP VIEW IF EXISTS OWNER_VIEW; 
DROP VIEW IF EXISTS SOX_TABLES;
DROP VIEW IF EXISTS SOX_TABLE_NAMES;
DROP TABLE IF EXISTS GRAPH_NAME;
DROP TABLE IF EXISTS GRAPH_VALUES;
DROP TABLE IF EXISTS NAME_MAPPING;



-- INSERT INTO CONTROL TABLE
CREATE TABLE CONTROL (
    ID integer not null,
    MID integer not null,
    ROW_ID varchar(30),
    CREATED timestamp,
    TASK TEXT not null,
    PRIMARY KEY (ID)
);
INSERT INTO CONTROL (ID, MID, ROW_ID, CREATED, TASK) VALUES(0, 0, 'S1.1', NOW(), 
    'Security policies and procedures MAX / Cincom have been established and documented in PP005 - Computer Security, Audit and Control Policy, 100-AWI-015 - Technical Support Operations, 100-AWI-014 - Cincom - System Description and Operations.');    
INSERT INTO CONTROL (ID, MID, ROW_ID, CREATED, TASK) VALUES(1, 0, 'S1.2', NOW(), 
    'All security policies and procedures are required to be reviewed and updated a minimum of every two years or as needed, per policy 500-ORG-051 - Procedural Requirements.');
INSERT INTO CONTROL (ID, MID, ROW_ID, CREATED, TASK) VALUES(2, 0, 'S2.1', NOW(), 
    'The IT Manager and IT Support Staff are responsible for ensuring proper enforcement and compliance monitoring of MAX / Cincom security policies and procedures as documented in 100-AWI-010 - Data Center Systems and Processes Monitoring and 100-AWI-015 - Technical Support Operations.');
INSERT INTO CONTROL (ID, MID, ROW_ID, CREATED, TASK) VALUES(3, 0, 'S3.2', NOW(), 
    'On a quarterly basis (as documented in 100-AWI-005 - Cincom - Application Account Menu Access Review), the IT Support Staff is responsible for distributing a list of MAX / Cincom user access rights to the appropriate system managers and supervisors and ensuring that the system managers and supervisors respond indicating a completion of their review.  The system managers and supervisors are than required (as documented in IT/SEC/16 - Access Control - System Manager Responsibilities) to review the MAX / Cincom access rights and notifying the IT Support Staff of any modifications that need to be made. Additionally, the Plant Controller is responsible for reviewing access provided to MAX / Cincom users with consideration given to segregation of duties as part of the quarterly MAX / Cincom user access review.');       
INSERT INTO CONTROL (ID, MID, ROW_ID, CREATED, TASK) VALUES(4, 0, 'S4.1',  NOW(),
    'Each MAX / Cincom user has their own unique user ID and password to ensure accountability and prevent unauthorized access or use.'); 
INSERT INTO CONTROL (ID, MID, ROW_ID, CREATED, TASK) VALUES(5, 0, 'S4.2', NOW(),
    'MAX / Cincom password settings are enforced in accordance with policy PP005 - Computer Security, Audit and Control Policy to prevent unauthorized access or use: -  A minimum of 6 alphanumeric characters -  Password expiration of 60 days -  System lockout after 5 failed login attempts'); 
INSERT INTO CONTROL (ID, MID, ROW_ID, CREATED, TASK) VALUES(6, 0, 'S4.3', NOW(),
    'The Watcher applDROP TABLE IF EXISTS SOX_CONTROL;ication in MAX automatically logs users out of the application after 45 minutes of inactivity.');
INSERT INTO CONTROL (ID, MID, ROW_ID, CREATED, TASK) VALUES(7, 0, 'S5.1', NOW(),
    'For MAX / Cincom new user access or modification of an existing user*s access (including temporary employees), requires a Remedy Help Desk ticket.  Tickets must be completed and/or approved by the user*s supervisor or the system manager along with the applicable User Access Request Form(s).  The IT Support Staff is required to verify that the appropriate supervisor or system manager has made the request to ensure appropriate approval before processing the request.');
INSERT INTO CONTROL (ID, MID, ROW_ID, CREATED, TASK) VALUES(8, 0, 'S5.2', NOW(),
    'The HR Department is responsible for notifying the local IT department and the Global Response Center of all terminations in a timely manner. Upon receipt of HR notification, the Global Response Center notifies all System Managers via email distribution, with instructions for deactivation and removal from the system (as documented in 100-AWI-015)');
INSERT INTO CONTROL (ID, MID, ROW_ID, CREATED, TASK) VALUES(9, 0, 'S6.1', NOW(),
    'Security event logs (e.g. login failures and lockouts) are generated by MAX / Cincom and are reviewed by the IT Support Staff on a daily basis to identify any suspicious activity (per documented policy 100-AWI-010 - Data Center System & Process Monitoring).  All security issues or violations found from monitoring the MAX / Cincom security event logs are acted upon in a timely manner and tracked in a Remedy Help Desk ticket (as documented in policy 100-AWI-010 Data Center Systems and Processes Monitoring).');
INSERT INTO CONTROL (ID, MID, ROW_ID, CREATED, TASK) VALUES(10, 0, 'S7', NOW(),
    'Not applicable - Control objective is not specific to MAX / Cincom.  This is covered in S7 of the US LAN RCM.');
INSERT INTO CONTROL (ID, MID, ROW_ID, CREATED, TASK) VALUES(11, 0, 'S8', NOW(),
    'Not applicable - Control objective is not specific to MAX / Cincom.  This is covered in S8 of the US LAN RCM.'); 
INSERT INTO CONTROL (ID, MID, ROW_ID, CREATED, TASK) VALUES(12, 0, 'S9', NOW(),
    'Not applicable - Control objective is not specific to MAX / Cincom.  This is covered in S9 of the US LAN RCM.');
INSERT INTO CONTROL (ID, MID, ROW_ID, CREATED, TASK) VALUES(13, 0, 'S10', NOW(),
    'Not applicable - Control objective is not specific to MAX / Cincom.  This is covered in S10 of the US LAN RCM.'); 
INSERT INTO CONTROL (ID, MID, ROW_ID, CREATED, TASK) VALUES(14, 0, 'S11.1', NOW(),
    'User administration (add/modify/delete) procedures for temporary employees follow the same user administration procedures as regular employees, except that temporary user account are set to expire in 30 days.');
INSERT INTO CONTROL (ID, MID, ROW_ID, CREATED, TASK) VALUES(15, 0, 'S12.1', NOW(),
    'On a quarterly basis, the IT Support Staff reviews MAX / Cincom password settings (as documented in the 100-AWI-013 - MAX System - User Login Account Review) to ensure that they are in compliance with the password settings as defined in the PP005 - Computer Security, Audit and Control Policy.');    
INSERT INTO CONTROL (ID, MID, ROW_ID, CREATED, TASK) VALUES(16, 0, 'S13.1', NOW(),
    'There are two user account IDs (SYSTEM and CONTROL_71) that have full system administrator privileges in MAX and Cincom.  Access to these accounts is limited to the IT Manager and the Cincom DBA. -  IT Manager:    SYSTEM -  Cincom DBA: CONTROL_71 A quarterly review is performed by the IT Manager and Controller of all individuals with access to MAX and Cincom privileged accounts.  Please see S13.2 for compensating control.');
INSERT INTO CONTROL (ID, MID, ROW_ID, CREATED, TASK) VALUES(17, 0, 'S13.2', NOW(),
    'On a quarterly basis, the IT Manager and Controller review MAX and Cincom privileged accounts to ensure they are restricted to the appropriate individuals (as documented in 100-AWI-013 - Max System - User Login Account Review). Note: Please see the change control RCM for a process to review MAX / Cincom privileged account activity.');
INSERT INTO CONTROL (ID, MID, ROW_ID, CREATED, TASK) VALUES(18, 0, 'S14.1', NOW(),
    'Access to the Cincom database (SUPRA) is limited to the following privileged functions only accessible by the DBA under the CONTROL_71 user account: -  Data-dictionary -  Database-Descriptions -  Public -  Universal -  Reports');
INSERT INTO CONTROL (ID, MID, ROW_ID, CREATED, TASK) VALUES(19, 0, 'NA', NOW(),
    'Note: Please see the change control RCM for a process to monitor changes made by the DBA.');

-- INSERT INTO REF TABLE
CREATE TABLE REF (
    ID integer not null,
    MID integer not null,
    REF_NUM varchar(16),
    CREATED timestamp,
    PRIMARY KEY (ID)
);
INSERT INTO REF (ID, MID, REF_NUM, CREATED) VALUES(0, 1, 'K-1', NOW());  
INSERT INTO REF (ID, MID, REF_NUM, CREATED) VALUES(1, 0, 'K-1', NOW());  
INSERT INTO REF (ID, MID, REF_NUM, CREATED) VALUES(2, 0, 'K-1', NOW());   
INSERT INTO REF (ID, MID, REF_NUM, CREATED) VALUES(3, 0, 'K-1', NOW());   
INSERT INTO REF (ID, MID, REF_NUM, CREATED) VALUES(4, 0, 'K-1', NOW());   
INSERT INTO REF (ID, MID, REF_NUM, CREATED) VALUES(5, 0, 'K-1', NOW());   
INSERT INTO REF (ID, MID, REF_NUM, CREATED) VALUES(6, 0, 'K-1', NOW());   
INSERT INTO REF (ID, MID, REF_NUM, CREATED) VALUES(7, 0, 'K-1', NOW());   
INSERT INTO REF (ID, MID, REF_NUM, CREATED) VALUES(8, 0, 'K-1', NOW()); 
INSERT INTO REF (ID, MID, REF_NUM, CREATED) VALUES(9, 0, 'K-1', NOW()); 
INSERT INTO REF (ID, MID, REF_NUM, CREATED) VALUES(10, 0, 'K-1', NOW()); 
INSERT INTO REF (ID, MID, REF_NUM, CREATED) VALUES(11, 0, 'K-1', NOW()); 
INSERT INTO REF (ID, MID, REF_NUM, CREATED) VALUES(12, 0, 'K-1', NOW()); 
INSERT INTO REF (ID, MID, REF_NUM, CREATED) VALUES(13, 0, 'K-1', NOW()); 
INSERT INTO REF (ID, MID, REF_NUM, CREATED) VALUES(14, 0, 'K-1', NOW()); 
INSERT INTO REF (ID, MID, REF_NUM, CREATED) VALUES(15, 0, 'K-1', NOW()); 
INSERT INTO REF (ID, MID, REF_NUM, CREATED) VALUES(16, 0, 'K-1', NOW()); 
INSERT INTO REF (ID, MID, REF_NUM, CREATED) VALUES(17, 0, 'K-1', NOW()); 
INSERT INTO REF (ID, MID, REF_NUM, CREATED) VALUES(18, 0, 'K-1', NOW()); 
INSERT INTO REF (ID, MID, REF_NUM, CREATED) VALUES(19, 0, 'K-1', NOW()); 

-- INSERT INTO EFF_DATE TABLE
CREATE TABLE EFF_DATE (
    ID integer not null,
    MID integer not null,
    EFF_DATE_TEXT varchar(16),
    CREATED timestamp,
    PRIMARY KEY (ID)
);
INSERT INTO EFF_DATE (ID, MID, EFF_DATE_TEXT, CREATED) VALUES(0, 0, 'Pre2007', NOW());
INSERT INTO EFF_DATE (ID, MID, EFF_DATE_TEXT, CREATED) VALUES(1, 0, 'Pre2007', NOW());
INSERT INTO EFF_DATE (ID, MID, EFF_DATE_TEXT, CREATED) VALUES(2, 0, 'Pre2007', NOW());
INSERT INTO EFF_DATE (ID, MID, EFF_DATE_TEXT, CREATED) VALUES(3, 0, 'Pre2007', NOW());
INSERT INTO EFF_DATE (ID, MID, EFF_DATE_TEXT, CREATED) VALUES(4, 0, 'Pre2007', NOW());
INSERT INTO EFF_DATE (ID, MID, EFF_DATE_TEXT, CREATED) VALUES(5, 0, 'Pre2007', NOW());
INSERT INTO EFF_DATE (ID, MID, EFF_DATE_TEXT, CREATED) VALUES(6, 0, 'Pre2007', NOW());
INSERT INTO EFF_DATE (ID, MID, EFF_DATE_TEXT, CREATED) VALUES(7, 0, 'Pre2007', NOW());
INSERT INTO EFF_DATE (ID, MID, EFF_DATE_TEXT, CREATED) VALUES(8, 0, 'Pre2007', NOW());
INSERT INTO EFF_DATE (ID, MID, EFF_DATE_TEXT, CREATED) VALUES(9, 0, 'Pre2007', NOW());
INSERT INTO EFF_DATE (ID, MID, EFF_DATE_TEXT, CREATED) VALUES(10, 0, 'Pre2007', NOW());
INSERT INTO EFF_DATE (ID, MID, EFF_DATE_TEXT, CREATED) VALUES(11, 0, 'Pre2007', NOW());
INSERT INTO EFF_DATE (ID, MID, EFF_DATE_TEXT, CREATED) VALUES(12, 0, 'Pre2007', NOW());
INSERT INTO EFF_DATE (ID, MID, EFF_DATE_TEXT, CREATED) VALUES(13, 0, 'Pre2007', NOW());
INSERT INTO EFF_DATE (ID, MID, EFF_DATE_TEXT, CREATED) VALUES(14, 0, 'Pre2007', NOW());
INSERT INTO EFF_DATE (ID, MID, EFF_DATE_TEXT, CREATED) VALUES(15, 0, 'Pre2007', NOW());
INSERT INTO EFF_DATE (ID, MID, EFF_DATE_TEXT, CREATED) VALUES(16, 0, 'Pre2007', NOW());
INSERT INTO EFF_DATE (ID, MID, EFF_DATE_TEXT, CREATED) VALUES(17, 0, 'Pre2007', NOW());
INSERT INTO EFF_DATE (ID, MID, EFF_DATE_TEXT, CREATED) VALUES(18, 0, 'Pre2007', NOW());
INSERT INTO EFF_DATE (ID, MID, EFF_DATE_TEXT, CREATED) VALUES(19, 0, 'Pre2007', NOW());

CREATE TABLE RISK_NON_ACHIEVED (
    ID integer not null,
    MID integer not null,
   	CREATED timestamp,
    RISK TEXT not null,
    PRIMARY KEY (ID)
);  
INSERT INTO RISK_NON_ACHIEVED (ID, MID, CREATED, RISK) VALUES(0, 0, NOW(),
    'Security procedures are ad hoc resulting in the increased risk of an IT security incident.  Security procedures exist, but are not communicated to the organization, resulting in users not following security policies and procedures. And/or are not current.  Security procedures exist, but are not up to date, possibly resulting in the application of ineffective/obsolete security policies and procedures.');  
INSERT INTO RISK_NON_ACHIEVED (ID, MID, CREATED, RISK) VALUES(1, 0, NOW(), '');      
INSERT INTO RISK_NON_ACHIEVED (ID, MID, CREATED, RISK) VALUES(2, 0, NOW(),
    'Roles and responsibilities regarding the security administration function are not clearly defined and compliance with security policies and procedures are not enforced and monitored, resulting in the increased risk of an IT security incident.');
INSERT INTO RISK_NON_ACHIEVED (ID, MID, CREATED, RISK) VALUES(3, 0, NOW(),
    'Unauthorized access to information assets possibly resulting in the manipulation of systems, and/or the compromise of data and other proprietary material. ');    
INSERT INTO RISK_NON_ACHIEVED (ID, MID, CREATED, RISK) VALUES(4, 0, NOW(), '');       
INSERT INTO RISK_NON_ACHIEVED (ID, MID, CREATED, RISK) VALUES(5, 0, NOW(),
    'Inappropriate access to or modifications of information systems, data, etc. occur without knowledge of who performed or attempted to perform the activities.');  
INSERT INTO RISK_NON_ACHIEVED (ID, MID, CREATED, RISK) VALUES(6, 0, NOW(), '');         
INSERT INTO RISK_NON_ACHIEVED (ID, MID, CREATED, RISK) VALUES(7, 0, NOW(), '');         
INSERT INTO RISK_NON_ACHIEVED (ID, MID, CREATED, RISK) VALUES(8, 0, NOW(),
    'An unauthorized individual may gain access to critical corporate applications, data, intellectual property, and other sensitive information, possibly resulting in the manipulation of systems, and/or the compromise of data and other proprietary material.');
INSERT INTO RISK_NON_ACHIEVED (ID, MID, CREATED, RISK) VALUES(9, 0, NOW(), '');    
INSERT INTO RISK_NON_ACHIEVED (ID, MID, CREATED, RISK) VALUES(10, 0, NOW(),
    'Violations of the corporate security policy and unauthorized access to information systems and sensitive information  may go undetected.');
INSERT INTO RISK_NON_ACHIEVED (ID, MID, CREATED, RISK) VALUES(11, 0, NOW(),
    'In the case of a security breach or incident, the damage to information systems and the compromise of data may not be minimized due to a lack of incident response procedures.');  
INSERT INTO RISK_NON_ACHIEVED (ID, MID, CREATED, RISK) VALUES(12, 0, NOW(),
    'Critical corporate data and other proprietary information is not properly classified, possibly resulting in the inadequate or improper protection of such data.');  
INSERT INTO RISK_NON_ACHIEVED (ID, MID, CREATED, RISK) VALUES(13, 0, NOW(),
    'The introduction of malicious software or code/viruses/worms may go undetected, possibly disabling corporate information resources.');
INSERT INTO RISK_NON_ACHIEVED (ID, MID, CREATED, RISK) VALUES(14, 0, NOW(),
    'An unauthorized individual may gain access to critical corporate applications, data, intellectual property, and other sensitive information, possibly resulting in the manipulation of systems, and/or the compromise of data and other proprietary material.');
INSERT INTO RISK_NON_ACHIEVED (ID, MID, CREATED, RISK) VALUES(15, 0, NOW(),
	'The lack of a formal plan regarding emergency and temporary IT system access for problem resolution may result in access to critical IT systems by an unauthorized user.'); 
INSERT INTO RISK_NON_ACHIEVED (ID, MID, CREATED, RISK) VALUES(16, 0, NOW(),
    'The lack of a proper review increases the risk that an unauthorized change to the system security parameters may occur and go undetected.');
INSERT INTO RISK_NON_ACHIEVED (ID, MID, CREATED, RISK)  VALUES(17, 0, NOW(),
    'Existence of unauthorized privileged users increases the risk that data integrity and system availability may be comprised.');
INSERT INTO RISK_NON_ACHIEVED (ID, MID, CREATED, RISK) VALUES(18, 0, NOW(), '');    
INSERT INTO RISK_NON_ACHIEVED (ID, MID, CREATED, RISK) VALUES(19, 0, NOW(),
    'Bypassing application controls and modifying the data directly may compromise data integrity.');

CREATE TABLE OBJECTIVE (
    ID integer not null,
    MID integer not null,
    ROW_ID varchar(30),
    CREATED timestamp,
    CONTROL TEXT not null,
    PRIMARY KEY (ID)
);

INSERT INTO OBJECTIVE (ID, MID, ROW_ID, CREATED, CONTROL) VALUES(0, 0, 'S1.', NOW(),
    'Security policies and procedures are established, documented, approved, communicated and are periodically reviewed and updated as appropriate.'); 
INSERT INTO OBJECTIVE (ID, MID, ROW_ID, CREATED, CONTROL) VALUES(1, 0, '', NOW(), '');  
INSERT INTO OBJECTIVE (ID, MID, ROW_ID, CREATED, CONTROL) VALUES(2, 0, 'S2.', NOW(),
    'Security administration roles and responsibilities have been assigned to ensure proper enforcement and compliance monitoring of information systems security policies and procedures.'); 
INSERT INTO OBJECTIVE (ID, MID, ROW_ID, CREATED, CONTROL) VALUES(3, 0, 'S3.', NOW(),
    'Management periodically reviews user access rights to ensure that access to information systems is assigned only on a business need-to-know basis with consideration given to segregation of duties.'); 
INSERT INTO OBJECTIVE (ID, MID, ROW_ID, CREATED, CONTROL) VALUES(4, 0, '', NOW(), '');  
INSERT INTO OBJECTIVE (ID, MID, ROW_ID, CREATED, CONTROL) VALUES(5, 0, 'S4', NOW(),
    'Individual, unique user IDs and password controls are in place to ensure accountability and to prevent unauthorized access or use.');  
INSERT INTO OBJECTIVE (ID, MID, ROW_ID, CREATED, CONTROL) VALUES(6, 0, '', NOW(), '');  
INSERT INTO OBJECTIVE (ID, MID, ROW_ID, CREATED, CONTROL) VALUES(7, 0, '', NOW(), '');   
INSERT INTO OBJECTIVE (ID, MID, ROW_ID, CREATED, CONTROL) VALUES(8, 0,'S5.', NOW(),
    'Procedures regarding the addition of new users, modification of access levels of existing users, and removal of users who no longer need access to information systems are documented and followed.'); 
INSERT INTO OBJECTIVE (ID, MID, ROW_ID, CREATED, CONTROL) VALUES(9, 0, '', NOW(), '');  
INSERT INTO OBJECTIVE (ID, MID, ROW_ID, CREATED, CONTROL) VALUES(10, 0, 'S6.', NOW(),
    'IT management should ensure that security activity is logged and reviewed, and that any resulting security issue or violation is acted upon in a timely manner.'); 
INSERT INTO OBJECTIVE (ID, MID, ROW_ID, CREATED, CONTROL) VALUES(11, 0, 'S7.', NOW(),
    'IT management should establish and document computer security incident procedures to ensure the proper response should a security breach or incident occur.'); 
INSERT INTO OBJECTIVE (ID, MID, ROW_ID, CREATED, CONTROL) VALUES(12, 0, 'S8.', NOW(),
    'IT management should ensure that procedures exist regarding the classification (e.g. public, internal, confidential, etc.) of data and other information in terms of sensitivity.'); 
INSERT INTO OBJECTIVE (ID, MID, ROW_ID, CREATED, CONTROL) VALUES(13, 0, 'S9.', NOW(),
    'IT management should ensure that adequate preventative, detective, and corrective control measures exist for defending against malicious software/code and viruses.'); 
INSERT INTO OBJECTIVE (ID, MID, ROW_ID, CREATED, CONTROL) VALUES(14, 0, 'S10.', NOW(),
    'An adequate perimeter defense (including network design, overall IS architecture, firewalls, routers, DMZ, etc.) exists to prevent unauthorized access to the corporate network.'); 
INSERT INTO OBJECTIVE (ID, MID, ROW_ID, CREATED, CONTROL) VALUES(15, 0, 'S11.', NOW(),
    'The problem management system should ensure that emergency and temporary access authorizations are documented, approved, communicated (to the necessary organizations), maintained, and terminated as soon as the business need for access no longer exists.'); 
INSERT INTO OBJECTIVE (ID, MID, ROW_ID, CREATED, CONTROL) VALUES(16, 0, 'S12.', NOW(),
    'Ensure that system security parameters (e.g. password settings, account lockout settings, audit log settings) are periodically reviewed for compliance against management policy / requirements.'); 
INSERT INTO OBJECTIVE (ID, MID, ROW_ID, CREATED, CONTROL) VALUES(17, 0, 'S13.', NOW(),
    'Ensure that privileged user access (e.g. super user, system administrator, DBA accounts, etc.) is appropriately restricted to approved and authorized personnel and that their activities are monitored by management.'); 
INSERT INTO OBJECTIVE (ID, MID, ROW_ID, CREATED, CONTROL) VALUES(18, 0, '', NOW(),
    'Bypassing application controls and modifying the data directly may compromise data integrity.'); 
INSERT INTO OBJECTIVE (ID, MID, ROW_ID, CREATED, CONTROL) VALUES(19, 0, 'S14.', NOW(),
    'Controls are in place to ensure that any modification of data outside of the application (e.g. via the use of utility programs or direct access to the database) may not be made without proper authorization.'); 

-- OWNER RELATIONSHIPS NEED THEIR OWN IMPORT PROCESS	
CREATE TABLE OWNER_MAPPING (
	ID integer not null,	-- WHICH ID OWNS ME, AND WHICH OWNER I AM
	PARENT_ID integer not null,
	OWNER_ID integer not null,
	CREATED timestamp,
	PRIMARY KEY (ID)
);

INSERT INTO OWNER_MAPPING (ID, PARENT_ID, OWNER_ID, CREATED) VALUES(0, 0, 0, NOW());  -- IT MANAGER
INSERT INTO OWNER_MAPPING (ID, PARENT_ID, OWNER_ID, CREATED) VALUES(1, 0, 1, NOW());  -- IT Support Staff
INSERT INTO OWNER_MAPPING (ID, PARENT_ID, OWNER_ID, CREATED) VALUES(2, 1, 0, NOW());  -- IT MANAGER
INSERT INTO OWNER_MAPPING (ID, PARENT_ID, OWNER_ID, CREATED) VALUES(3, 1, 1, NOW());  -- IT Support Staff
INSERT INTO OWNER_MAPPING (ID, PARENT_ID, OWNER_ID, CREATED) VALUES(4, 2, 0, NOW());  -- IT MANAGER
INSERT INTO OWNER_MAPPING (ID, PARENT_ID, OWNER_ID, CREATED) VALUES(5, 2, 1, NOW());  -- IT Support Staff
INSERT INTO OWNER_MAPPING (ID, PARENT_ID, OWNER_ID, CREATED) VALUES(6, 3, 1, NOW());  -- IT Support Staff
INSERT INTO OWNER_MAPPING (ID, PARENT_ID, OWNER_ID, CREATED) VALUES(7, 4, 1, NOW());  -- IT Support Staff
INSERT INTO OWNER_MAPPING (ID, PARENT_ID, OWNER_ID, CREATED) VALUES(8, 4, 2, NOW());  -- Plant Controller
INSERT INTO OWNER_MAPPING (ID, PARENT_ID, OWNER_ID, CREATED) VALUES(9, 5, 1, NOW());  -- IT Support Staff
INSERT INTO OWNER_MAPPING (ID, PARENT_ID, OWNER_ID, CREATED) VALUES(10, 5, 3, NOW());  -- Cincom DBA
INSERT INTO OWNER_MAPPING (ID, PARENT_ID, OWNER_ID, CREATED) VALUES(11, 6, 1, NOW());  -- IT Support Staff
INSERT INTO OWNER_MAPPING (ID, PARENT_ID, OWNER_ID, CREATED) VALUES(12, 7, 1, NOW());  -- IT Support Staff
INSERT INTO OWNER_MAPPING (ID, PARENT_ID, OWNER_ID, CREATED) VALUES(13, 8, 1, NOW());  -- IT Support Staff
INSERT INTO OWNER_MAPPING (ID, PARENT_ID, OWNER_ID, CREATED) VALUES(14, 9, 1, NOW());  -- IT Support Staff
INSERT INTO OWNER_MAPPING (ID, PARENT_ID, OWNER_ID, CREATED) VALUES(15, 9, 3, NOW());  -- Cincom DBA
INSERT INTO OWNER_MAPPING (ID, PARENT_ID, OWNER_ID, CREATED) VALUES(16, 10, 1, NOW());  -- IT Support Staff
INSERT INTO OWNER_MAPPING (ID, PARENT_ID, OWNER_ID, CREATED) VALUES(17, 11, 5, NOW());  -- N/A
INSERT INTO OWNER_MAPPING (ID, PARENT_ID, OWNER_ID, CREATED) VALUES(18, 12, 5, NOW());  -- N/A
INSERT INTO OWNER_MAPPING (ID, PARENT_ID, OWNER_ID, CREATED) VALUES(19, 13, 5, NOW());  -- N/A
INSERT INTO OWNER_MAPPING (ID, PARENT_ID, OWNER_ID, CREATED) VALUES(20, 14, 5, NOW());  -- N/A
INSERT INTO OWNER_MAPPING (ID, PARENT_ID, OWNER_ID, CREATED) VALUES(21, 15, 1, NOW());  -- IT Support Staff
INSERT INTO OWNER_MAPPING (ID, PARENT_ID, OWNER_ID, CREATED) VALUES(22, 15, 3, NOW());  -- Cincom DBA
INSERT INTO OWNER_MAPPING (ID, PARENT_ID, OWNER_ID, CREATED) VALUES(23, 16, 1, NOW());  -- IT Support Staff
INSERT INTO OWNER_MAPPING (ID, PARENT_ID, OWNER_ID, CREATED) VALUES(24, 17, 0, NOW());  -- IT MANAGER
INSERT INTO OWNER_MAPPING (ID, PARENT_ID, OWNER_ID, CREATED) VALUES(25, 17, 3, NOW());  -- Cincom DBA
INSERT INTO OWNER_MAPPING (ID, PARENT_ID, OWNER_ID, CREATED) VALUES(26, 18, 0, NOW());  -- IT MANAGER
INSERT INTO OWNER_MAPPING (ID, PARENT_ID, OWNER_ID, CREATED) VALUES(27, 18, 4, NOW());  -- Controller
INSERT INTO OWNER_MAPPING (ID, PARENT_ID, OWNER_ID, CREATED) VALUES(28, 19, 0, NOW());  -- IT MANAGER
    
CREATE TABLE OWNER_PARENT (	-- I'M THE ROW
    ID integer not null,
    MID integer not null,
    ROW_NUM_ID integer not null,
    CREATED timestamp,
    PRIMARY KEY (ID)
);	

INSERT INTO OWNER_PARENT (ID, MID, ROW_NUM_ID, CREATED) VALUES(0, 0, 0, NOW());  
INSERT INTO OWNER_PARENT (ID, MID, ROW_NUM_ID, CREATED) VALUES(1, 0, 1, NOW());  
INSERT INTO OWNER_PARENT (ID, MID, ROW_NUM_ID, CREATED) VALUES(2, 0, 2, NOW());  
INSERT INTO OWNER_PARENT (ID, MID, ROW_NUM_ID, CREATED) VALUES(3, 0, 3, NOW());  
INSERT INTO OWNER_PARENT (ID, MID, ROW_NUM_ID, CREATED) VALUES(4, 0, 4, NOW());  
INSERT INTO OWNER_PARENT (ID, MID, ROW_NUM_ID, CREATED) VALUES(5, 0, 5, NOW());  
INSERT INTO OWNER_PARENT (ID, MID, ROW_NUM_ID, CREATED) VALUES(6, 0, 6, NOW());  
INSERT INTO OWNER_PARENT (ID, MID, ROW_NUM_ID, CREATED) VALUES(7, 0, 7, NOW());  
INSERT INTO OWNER_PARENT (ID, MID, ROW_NUM_ID, CREATED) VALUES(8, 0, 8, NOW());  	
INSERT INTO OWNER_PARENT (ID, MID, ROW_NUM_ID, CREATED) VALUES(9, 0, 9, NOW());  
INSERT INTO OWNER_PARENT (ID, MID, ROW_NUM_ID, CREATED) VALUES(10, 0, 10, NOW());  
INSERT INTO OWNER_PARENT (ID, MID, ROW_NUM_ID, CREATED) VALUES(11, 0, 11, NOW());  
INSERT INTO OWNER_PARENT (ID, MID, ROW_NUM_ID, CREATED) VALUES(12, 0, 12, NOW());  
INSERT INTO OWNER_PARENT (ID, MID, ROW_NUM_ID, CREATED) VALUES(13, 0, 13, NOW());  
INSERT INTO OWNER_PARENT (ID, MID, ROW_NUM_ID, CREATED) VALUES(14, 0, 14, NOW());  
INSERT INTO OWNER_PARENT (ID, MID, ROW_NUM_ID, CREATED) VALUES(15, 0, 15, NOW());  
INSERT INTO OWNER_PARENT (ID, MID, ROW_NUM_ID, CREATED) VALUES(16, 0, 16, NOW());  
INSERT INTO OWNER_PARENT (ID, MID, ROW_NUM_ID, CREATED) VALUES(17, 0, 17,NOW());  	
INSERT INTO OWNER_PARENT (ID, MID, ROW_NUM_ID, CREATED) VALUES(18, 0, 18, NOW()); 
INSERT INTO OWNER_PARENT (ID, MID, ROW_NUM_ID, CREATED) VALUES(19, 0, 19, NOW()); 	

CREATE TABLE OWNER (			-- THERE ARE ONLY GOING TO BE ABOUT FIVE OF ME
	ID integer not null,
	OWNER_NAME varchar(30),
	CREATED timestamp,
	PRIMARY KEY (ID)
);	
INSERT INTO OWNER (ID, OWNER_NAME, CREATED) VALUES(0, 'IT Manager', NOW());  
INSERT INTO OWNER (ID, OWNER_NAME, CREATED) VALUES(1, 'IT Support Staff', NOW());  
INSERT INTO OWNER (ID, OWNER_NAME, CREATED) VALUES(2, 'Plant Controller', NOW());  
INSERT INTO OWNER (ID, OWNER_NAME, CREATED) VALUES(3, 'Cincom DBA', NOW());
INSERT INTO OWNER (ID, OWNER_NAME, CREATED) VALUES(4, 'Controller', NOW());
INSERT INTO OWNER (ID, OWNER_NAME, CREATED) VALUES(5, 'N/A', NOW()); 

CREATE VIEW OWNER_VIEW 
   AS 
SELECT  
	om.PARENT_ID as ID, own_par.ROW_NUM_ID AS ROW_NUMBER, own.OWNER_NAME AS OWNER_NAME
FROM 
	OWNER_MAPPING om, OWNER own, OWNER_PARENT own_par
WHERE
	om.PARENT_ID = own_par.ID AND
	om.OWNER_ID = own.ID
ORDER BY ROW_NUMBER ASC;	


CREATE TABLE JOB_SCHEDULE (
    ID integer not null,
    MID integer not null,
    ROW_ID varchar(30),
    CONTROL_NEXT_RUN timestamp,
    CONTROL_EFF_DT timestamp,
    CONTROL_EFF_DT_TEXT varchar(30),
    CONTROL_PREV_RUN timestamp,
    PRIMARY KEY (ID)
);

INSERT INTO JOB_SCHEDULE (ID, MID, ROW_ID, CONTROL_NEXT_RUN, CONTROL_EFF_DT, CONTROL_EFF_DT_TEXT, CONTROL_PREV_RUN) 
	VALUES(0, 0, 0, NOW(), NOW(), 'Prev2007', NOW());  
	
INSERT INTO JOB_SCHEDULE (ID, MID, ROW_ID, CONTROL_NEXT_RUN, CONTROL_EFF_DT, CONTROL_EFF_DT_TEXT, CONTROL_PREV_RUN) 
	VALUES(1, 0, 0, NOW(), NOW(), 'Prev2007', NOW());  
	
INSERT INTO JOB_SCHEDULE (ID, MID, ROW_ID, CONTROL_NEXT_RUN, CONTROL_EFF_DT, CONTROL_EFF_DT_TEXT, CONTROL_PREV_RUN) 
	VALUES(2, 0, 0, NOW(), NOW(), 'Prev2007', NOW());  
	
INSERT INTO JOB_SCHEDULE (ID, MID, ROW_ID, CONTROL_NEXT_RUN, CONTROL_EFF_DT, CONTROL_EFF_DT_TEXT, CONTROL_PREV_RUN) 
	VALUES(3, 0, 0, NOW(), NOW(), 'Prev2007', NOW());  
	
INSERT INTO JOB_SCHEDULE (ID, MID, ROW_ID, CONTROL_NEXT_RUN, CONTROL_EFF_DT, CONTROL_EFF_DT_TEXT, CONTROL_PREV_RUN) 
	VALUES(4, 0, 0, NOW(), NOW(), 'Prev2007', NOW());  
	
INSERT INTO JOB_SCHEDULE (ID, MID, ROW_ID, CONTROL_NEXT_RUN, CONTROL_EFF_DT, CONTROL_EFF_DT_TEXT, CONTROL_PREV_RUN) 
	VALUES(5, 0, 0, NOW(), NOW(), 'Prev2007', NOW());  
	
INSERT INTO JOB_SCHEDULE (ID, MID, ROW_ID, CONTROL_NEXT_RUN, CONTROL_EFF_DT, CONTROL_EFF_DT_TEXT, CONTROL_PREV_RUN) 
	VALUES(6, 0, 0, NOW(), NOW(), 'Prev2007', NOW());  
	
INSERT INTO JOB_SCHEDULE (ID, MID, ROW_ID, CONTROL_NEXT_RUN, CONTROL_EFF_DT, CONTROL_EFF_DT_TEXT, CONTROL_PREV_RUN) 
	VALUES(7, 0, 0, NOW(), NOW(), 'Prev2007', NOW());  
	
INSERT INTO JOB_SCHEDULE (ID, MID, ROW_ID, CONTROL_NEXT_RUN, CONTROL_EFF_DT, CONTROL_EFF_DT_TEXT, CONTROL_PREV_RUN) 
	VALUES(8, 0, 0, NOW(), NOW(), 'Prev2007', NOW());  
	
INSERT INTO JOB_SCHEDULE (ID, MID, ROW_ID, CONTROL_NEXT_RUN, CONTROL_EFF_DT, CONTROL_EFF_DT_TEXT, CONTROL_PREV_RUN) 
	VALUES(9, 0, 0, NOW(), NOW(), 'Prev2007', NOW());  
	
INSERT INTO JOB_SCHEDULE (ID, MID, ROW_ID, CONTROL_NEXT_RUN, CONTROL_EFF_DT, CONTROL_EFF_DT_TEXT, CONTROL_PREV_RUN) 
	VALUES(10, 0, 0, NOW(), NOW(), 'Prev2007', NOW());  
	
INSERT INTO JOB_SCHEDULE (ID, MID, ROW_ID, CONTROL_NEXT_RUN, CONTROL_EFF_DT, CONTROL_EFF_DT_TEXT, CONTROL_PREV_RUN) 
	VALUES(11, 0, 0, NOW(), NOW(), 'Prev2007', NOW());  
	
INSERT INTO JOB_SCHEDULE (ID, MID, ROW_ID, CONTROL_NEXT_RUN, CONTROL_EFF_DT, CONTROL_EFF_DT_TEXT, CONTROL_PREV_RUN) 
	VALUES(12, 0, 0, NOW(), NOW(), 'Prev2007', NOW());  
	
INSERT INTO JOB_SCHEDULE (ID, MID, ROW_ID, CONTROL_NEXT_RUN, CONTROL_EFF_DT, CONTROL_EFF_DT_TEXT, CONTROL_PREV_RUN) 
	VALUES(13, 0, 0, NOW(), NOW(), 'Prev2007', NOW());  
	
INSERT INTO JOB_SCHEDULE (ID, MID, ROW_ID, CONTROL_NEXT_RUN, CONTROL_EFF_DT, CONTROL_EFF_DT_TEXT, CONTROL_PREV_RUN) 
	VALUES(14, 0, 0, NOW(), NOW(), 'Prev2007', NOW());  
	
INSERT INTO JOB_SCHEDULE (ID, MID, ROW_ID, CONTROL_NEXT_RUN, CONTROL_EFF_DT, CONTROL_EFF_DT_TEXT, CONTROL_PREV_RUN) 
	VALUES(15, 0, 0, NOW(), NOW(), 'Prev2007', NOW());  
	
INSERT INTO JOB_SCHEDULE (ID, MID, ROW_ID, CONTROL_NEXT_RUN, CONTROL_EFF_DT, CONTROL_EFF_DT_TEXT, CONTROL_PREV_RUN) 
	VALUES(16, 0, 0, NOW(), NOW(), 'Prev2007', NOW());  
	
INSERT INTO JOB_SCHEDULE (ID, MID, ROW_ID, CONTROL_NEXT_RUN, CONTROL_EFF_DT, CONTROL_EFF_DT_TEXT, CONTROL_PREV_RUN) 
	VALUES(17, 0, 0, NOW(), NOW(), 'Prev2007', NOW());  
	
INSERT INTO JOB_SCHEDULE (ID, MID, ROW_ID, CONTROL_NEXT_RUN, CONTROL_EFF_DT, CONTROL_EFF_DT_TEXT, CONTROL_PREV_RUN) 
	VALUES(18, 0, 0, NOW(), NOW(), 'Prev2007', NOW());  
	
INSERT INTO JOB_SCHEDULE (ID, MID, ROW_ID, CONTROL_NEXT_RUN, CONTROL_EFF_DT, CONTROL_EFF_DT_TEXT, CONTROL_PREV_RUN) 
	VALUES(19, 0, 0, NOW(), NOW(), 'Prev2007', NOW());  
	
	

CREATE TABLE EMAIL_RECORD (
    ID integer not null,
    MID integer not null,
   	CREATED timestamp,
   	SUBJECT varchar(45),
   	SEND_EML varchar(64),
   	RECV_EML varchar(64),
   	CC_EML TEXT not null, 
    MESSAGE TEXT not null,
    PRIMARY KEY (ID)
);  

CREATE TABLE PREVENTION (
    ID integer not null,
    MID integer not null,
    ROW_ID varchar(30),
    CONTROL TEXT not null,
    CREATED timestamp,
    PRIMARY KEY (ID)
);

CREATE TABLE SYS_MANUAL (
    ID integer not null,
    MID integer not null,
    ROW_ID varchar(30),
    CONTROL TEXT not null,
    CREATED timestamp,
    PRIMARY KEY (ID)
);

CREATE TABLE FREQUENCY (
    ID integer not null,
    MID integer not null,
    ROW_ID varchar(30),
    CONTROL TEXT not null,
    CREATED timestamp,
    PRIMARY KEY (ID)
);

CREATE TABLE SOURCE (
    ID integer not null,
    MID integer not null,
    ROW_ID varchar(30),
    CONTROL TEXT not null,
    CREATED timestamp,
    PRIMARY KEY (ID)
);

CREATE TABLE DESIGN_EFF (
    ID integer not null,
    MID integer not null,
    ROW_ID varchar(30),
    CONTROL TEXT not null,
    CREATED timestamp,
    PRIMARY KEY (ID)
);

CREATE TABLE OPERATING_EFF (
    ID integer not null,
    MID integer not null,
    ROW_ID varchar(30),
    CONTROL TEXT not null,
    CREATED timestamp,
    PRIMARY KEY (ID)
);

CREATE TABLE TEST_REF (
    ID integer not null,
    MID integer not null,
    ROW_ID varchar(30),
    CONTROL TEXT not null,
    CREATED timestamp,
    PRIMARY KEY (ID)
);

CREATE TABLE GAPS_QA (
    ID integer not null,
    MID integer not null,
    ROW_ID varchar(30),
    CONTROL TEXT not null,
    CREATED timestamp,
    PRIMARY KEY (ID)
);



CREATE TABLE GRAPH_NAME (
    ID integer not null,
    NAME varchar(64) not null,
    X_AXIS varchar(64) not null,
    Y_AXIS varchar(64) not null,
    CREATED timestamp,
    PRIMARY KEY (ID)
);

CREATE TABLE GRAPH_VALUES (
    ID integer not null,
 	GRAPH_ID integer not null,
    X_AXIS_VALUE integer not null,
    Y_AXIS_VALUE integer not null,
    CREATED timestamp,
    X_AXIS timestamp,
    PRIMARY KEY (ID)
);

CREATE TABLE CURRENCY_VALUES (
    ID integer not null,
 	READ_COUNT integer not null,
    USD_VALUE varchar(16),
    CROSS_VALUE varchar(16),
    CROSS_NAME varchar(16), 
    CREATED timestamp,
    PRIMARY KEY (ID)
);

CREATE TABLE STOCK_VALUES (
    ID integer not null,
 	READ_COUNT integer not null,
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


INSERT INTO NAME_MAPPING (ID, TABLE_NAME, REST_NAME) VALUES(0, 'CONTROL', 'controls'); 
INSERT INTO NAME_MAPPING (ID, TABLE_NAME, REST_NAME) VALUES(1, 'CURRENCY_VALUES', 'currencyValuess'); 
INSERT INTO NAME_MAPPING (ID, TABLE_NAME, REST_NAME) VALUES(2, 'DESIGN_EFF', 'designEffs'); 
INSERT INTO NAME_MAPPING (ID, TABLE_NAME, REST_NAME) VALUES(3, 'EFF_DATE', 'effDates'); 
INSERT INTO NAME_MAPPING (ID, TABLE_NAME, REST_NAME) VALUES(4, 'EMAIL_RECORD', 'emailRecords'); 
INSERT INTO NAME_MAPPING (ID, TABLE_NAME, REST_NAME) VALUES(5, 'FREQUENCY', 'frequencies'); 
INSERT INTO NAME_MAPPING (ID, TABLE_NAME, REST_NAME) VALUES(6, 'GAPS_QA', 'gapsQas'); 
INSERT INTO NAME_MAPPING (ID, TABLE_NAME, REST_NAME) VALUES(7, 'GRAPH_NAME', 'graphNames'); 
INSERT INTO NAME_MAPPING (ID, TABLE_NAME, REST_NAME) VALUES(8, 'GRAPH_VALUES', 'graphValuess'); 
INSERT INTO NAME_MAPPING (ID, TABLE_NAME, REST_NAME) VALUES(9, 'JOB_SCHEDULE', 'jobSchedules'); 
INSERT INTO NAME_MAPPING (ID, TABLE_NAME, REST_NAME) VALUES(10, 'NAME_MAPPING', 'nameMappings'); 
INSERT INTO NAME_MAPPING (ID, TABLE_NAME, REST_NAME) VALUES(11, 'OBJECTIVE', 'objectives'); 
INSERT INTO NAME_MAPPING (ID, TABLE_NAME, REST_NAME) VALUES(12, 'OPERATING_EFF', 'operatingEffs'); 
INSERT INTO NAME_MAPPING (ID, TABLE_NAME, REST_NAME) VALUES(13, 'OWNER', 'owners'); 
INSERT INTO NAME_MAPPING (ID, TABLE_NAME, REST_NAME) VALUES(14, 'OWNER_MAPPING', 'ownerMappings'); 
INSERT INTO NAME_MAPPING (ID, TABLE_NAME, REST_NAME) VALUES(15, 'OWNER_PARENT', 'ownerParents'); 
INSERT INTO NAME_MAPPING (ID, TABLE_NAME, REST_NAME) VALUES(16, 'OWNER_VIEW', 'ownerViews'); 
INSERT INTO NAME_MAPPING (ID, TABLE_NAME, REST_NAME) VALUES(17, 'PREVENTION', 'preventions'); 
INSERT INTO NAME_MAPPING (ID, TABLE_NAME, REST_NAME) VALUES(18, 'REF', 'refs'); 
INSERT INTO NAME_MAPPING (ID, TABLE_NAME, REST_NAME) VALUES(19, 'RISK_NON_ACHIEVED', 'riskNonAchieveds');  
INSERT INTO NAME_MAPPING (ID, TABLE_NAME, REST_NAME) VALUES(20, 'SOURCE', 'sources'); 
INSERT INTO NAME_MAPPING (ID, TABLE_NAME, REST_NAME) VALUES(21, 'SOX_TABLES', 'soxTabless');  
INSERT INTO NAME_MAPPING (ID, TABLE_NAME, REST_NAME) VALUES(22, 'SOX_TABLE_NAMES', 'soxTableNamess'); 
INSERT INTO NAME_MAPPING (ID, TABLE_NAME, REST_NAME) VALUES(23, 'STOCK_VALUES', 'stockValuess'); 
INSERT INTO NAME_MAPPING (ID, TABLE_NAME, REST_NAME) VALUES(24, 'SYS_MANUAL', 'sysManuals'); 
INSERT INTO NAME_MAPPING (ID, TABLE_NAME, REST_NAME) VALUES(25, 'TEST_REF', 'testRefs'); 


CREATE VIEW SOX_TABLES 
   AS
SELECT 
	DISTINCT TABLE_NAME 
FROM 
	INFORMATION_SCHEMA.COLUMNS 
WHERE 
	TABLE_SCHEMA = 'sox_repository'
ORDER BY 
	TABLE_NAME ASC;
	
CREATE VIEW SOX_TABLE_NAMES 
	AS 
SELECT 
	TABLE_NAME, COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH 
FROM 
	INFORMATION_SCHEMA.COLUMNS;









