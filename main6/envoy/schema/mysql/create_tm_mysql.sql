--  This is a TM migration script from 4.4.x to 4.5

INSERT INTO SEQUENCE VALUES('PAGE_TM_SEQ', 1000);
INSERT INTO SEQUENCE VALUES('PAGE_TM_TU_T_SEQ', 1000);
INSERT INTO SEQUENCE VALUES('PAGE_TM_TUV_T_SEQ', 1000);
INSERT INTO SEQUENCE VALUES('PAGE_TM_TU_L_SEQ', 1000);
INSERT INTO SEQUENCE VALUES('PAGE_TM_TUV_L_SEQ', 1000);
INSERT INTO SEQUENCE VALUES('SEGMENT_TM_TU_T_SEQ', 1000);
INSERT INTO SEQUENCE VALUES('SEGMENT_TM_TUV_T_SEQ', 1000);
INSERT INTO SEQUENCE VALUES('SEGMENT_TM_TU_L_SEQ', 1000);
INSERT INTO SEQUENCE VALUES('SEGMENT_TM_TUV_L_SEQ', 1000);
COMMIT;

--  project tm tu translatable
DROP TABLE IF EXISTS PROJECT_TM_TU_T CASCADE;
CREATE TABLE PROJECT_TM_TU_T
(
  ID BIGINT
     AUTO_INCREMENT
     PRIMARY KEY,
  TM_ID BIGINT,
  `FORMAT` VARCHAR(20),
  `TYPE`  VARCHAR(50)
     NOT NULL,
  SOURCE_LOCALE_ID BIGINT,
  SOURCE_TM_NAME VARCHAR(60),
  FROM_WORLD_SERVER CHAR(1)
     NOT NULL
     CHECK (FROM_WORLD_SERVER IN('Y', 'N')),
  CONSTRAINT FK_PROJECT_TM_TU_T_TM_ID FOREIGN KEY(TM_ID) REFERENCES PROJECT_TM(ID),
  CONSTRAINT FK_PROJECT_TM_TU_T_SOURCE_LOCALE_ID FOREIGN KEY(SOURCE_LOCALE_ID) REFERENCES LOCALE(ID)
) AUTO_INCREMENT = 1000;


--  project tm tuv translatable
DROP TABLE IF EXISTS PROJECT_TM_TUV_T CASCADE;
CREATE TABLE PROJECT_TM_TUV_T
(
  ID BIGINT
     AUTO_INCREMENT
     PRIMARY KEY,
  TU_ID BIGINT,
  SEGMENT_STRING TEXT,
  SEGMENT_CLOB MEDIUMTEXT,
  EXACT_MATCH_KEY BIGINT,
  LOCALE_ID  BIGINT,
  CREATION_DATE  DATETIME NOT NULL,
  CREATION_USER  VARCHAR(80),
  MODIFY_DATE  DATETIME NOT NULL,
  MODIFY_USER  VARCHAR(80),
  UPDATED_BY_PROJECT VARCHAR(40),
  SID VARCHAR(255),
  CONSTRAINT FK_PROJECT_TM_TVU_T_TU_ID FOREIGN KEY(TU_ID) REFERENCES PROJECT_TM_TU_T(ID),
  CONSTRAINT FK_PROJECT_TM_TVU_T_LOCALE_ID FOREIGN KEY(LOCALE_ID) REFERENCES LOCALE(ID)
) AUTO_INCREMENT = 1000;


--  project tm tu localizable
DROP TABLE IF EXISTS PROJECT_TM_TU_L CASCADE;
CREATE TABLE PROJECT_TM_TU_L
(
  ID BIGINT
     AUTO_INCREMENT
     PRIMARY KEY,
  TM_ID BIGINT,
  FORMAT VARCHAR(20),
  TYPE VARCHAR(50)
     NOT NULL,
  SOURCE_LOCALE_ID BIGINT,
  SOURCE_TM_NAME VARCHAR(60),
  FROM_WORLD_SERVER CHAR(1)
     NOT NULL
     CHECK (FROM_WORLD_SERVER IN('Y', 'N')),
  CONSTRAINT FK_PROJECT_TM_TU_L_TM_ID FOREIGN KEY(TM_ID) REFERENCES PROJECT_TM(ID),
  CONSTRAINT FK_PROJECT_TM_TU_L_SOURCE_LOCALE_ID FOREIGN KEY(SOURCE_LOCALE_ID) REFERENCES LOCALE(ID)
) AUTO_INCREMENT = 1000;


--  project tm tuv localizable
DROP TABLE IF EXISTS PROJECT_TM_TUV_L CASCADE;
CREATE TABLE PROJECT_TM_TUV_L
(
  ID BIGINT
     AUTO_INCREMENT
     PRIMARY KEY,
  TU_ID BIGINT,
  SEGMENT_STRING TEXT,
  SEGMENT_CLOB MEDIUMTEXT,
  EXACT_MATCH_KEY BIGINT,
  LOCALE_ID  BIGINT,
  CREATION_DATE  DATETIME NOT NULL,
  CREATION_USER  VARCHAR(80),
  MODIFY_DATE  DATETIME NOT NULL,
  MODIFY_USER  VARCHAR(80),
  UPDATED_BY_PROJECT VARCHAR(40),
  SID VARCHAR(255),
  CONSTRAINT FK_PROJECT_TM_TUV_L_TU_ID FOREIGN KEY(TU_ID) REFERENCES PROJECT_TM_TU_L(ID),
  CONSTRAINT FK_PROJECT_TM_TUV_L_LOCALE_ID FOREIGN KEY(LOCALE_ID) REFERENCES LOCALE(ID)
) AUTO_INCREMENT = 1000;


--  page tm
DROP TABLE IF EXISTS PAGE_TM CASCADE;
CREATE TABLE PAGE_TM
(
  ID BIGINT
     AUTO_INCREMENT
     PRIMARY KEY,
  PAGE_NAME VARCHAR(4000)
     NOT NULL,
  SOURCE_LOCALE_ID BIGINT,
  CONSTRAINT FK_PAGE_TM_SOURCE_LOCALE_ID FOREIGN KEY(SOURCE_LOCALE_ID) REFERENCES LOCALE(ID)
) AUTO_INCREMENT = 1000;


--  page tm tu translatable
DROP TABLE IF EXISTS PAGE_TM_TU_T CASCADE;
CREATE TABLE PAGE_TM_TU_T
(
  ID BIGINT
     AUTO_INCREMENT
     PRIMARY KEY,
  TM_ID BIGINT,
  `FORMAT` VARCHAR(20),
  `TYPE` VARCHAR(50)
     NOT NULL,
  SOURCE_TM_NAME VARCHAR(60),
  CONSTRAINT FK_PAGE_TM_TU_T FOREIGN KEY(TM_ID) REFERENCES PAGE_TM(ID)
) AUTO_INCREMENT = 1000;


--  page tm tuv translatable
DROP TABLE IF EXISTS PAGE_TM_TUV_T CASCADE;
CREATE TABLE PAGE_TM_TUV_T
(
  ID BIGINT
     AUTO_INCREMENT
     PRIMARY KEY,
  TU_ID BIGINT,
  SEGMENT_STRING TEXT,
  SEGMENT_CLOB MEDIUMTEXT,
  EXACT_MATCH_KEY BIGINT,
  LOCALE_ID  BIGINT,
  CREATION_DATE  DATETIME NOT NULL,
  CREATION_USER  VARCHAR(80),
  MODIFY_DATE  DATETIME NOT NULL,
  MODIFY_USER  VARCHAR(80),
  UPDATED_BY_PROJECT VARCHAR(40),
  SID VARCHAR(255),
  CONSTRAINT FK_PAGE_TM_TUV_T_TU_ID FOREIGN KEY(TU_ID) REFERENCES PAGE_TM_TU_T(ID),
  CONSTRAINT FK_PAGE_TM_TU_T_LOCALE_ID FOREIGN KEY(LOCALE_ID) REFERENCES LOCALE(ID)
) AUTO_INCREMENT = 1000;


--  page tm tu localizable
DROP TABLE IF EXISTS PAGE_TM_TU_L CASCADE;
CREATE TABLE PAGE_TM_TU_L
(
  ID BIGINT
     AUTO_INCREMENT
     PRIMARY KEY,
  TM_ID BIGINT,
  `FORMAT` VARCHAR(20),
  `TYPE` VARCHAR(50)
     NOT NULL,
  SOURCE_TM_NAME VARCHAR(60),
  CONSTRAINT FK_PAGE_TM_TU_L_TM_ID FOREIGN KEY(TM_ID) REFERENCES PAGE_TM(ID)
) AUTO_INCREMENT = 1000;


--  page tm tuv localizable
DROP TABLE IF EXISTS PAGE_TM_TUV_L CASCADE;
CREATE TABLE PAGE_TM_TUV_L
(
  ID BIGINT
     AUTO_INCREMENT
     PRIMARY KEY,
  TU_ID BIGINT,
  SEGMENT_STRING TEXT,
  SEGMENT_CLOB MEDIUMTEXT,
  EXACT_MATCH_KEY BIGINT,
  LOCALE_ID  BIGINT,
  CREATION_DATE  DATETIME NOT NULL,
  CREATION_USER  VARCHAR(80),
  MODIFY_DATE  DATETIME NOT NULL,
  MODIFY_USER  VARCHAR(80),
  UPDATED_BY_PROJECT VARCHAR(40),
  SID VARCHAR(255),
  CONSTRAINT FK_PAGE_TM_TUV_L_TU_ID FOREIGN KEY(TU_ID) REFERENCES PAGE_TM_TU_L(ID),
  CONSTRAINT FK_PAGE_TM_TUV_T_LOCALE_ID FOREIGN KEY(LOCALE_ID) REFERENCES LOCALE(ID)
) AUTO_INCREMENT = 1000;


--  Index creation
CREATE INDEX PT_TUV_T_EXACT_MATCH_KEY ON PAGE_TM_TUV_T(EXACT_MATCH_KEY);
CREATE INDEX PT_TUV_L_EXACT_MATCH_KEY ON PAGE_TM_TUV_L(EXACT_MATCH_KEY);
CREATE INDEX ST_TUV_T_EXACT_MATCH_KEY ON PROJECT_TM_TUV_T(EXACT_MATCH_KEY);
CREATE INDEX ST_TUV_L_EXACT_MATCH_KEY ON PROJECT_TM_TUV_L(EXACT_MATCH_KEY);

CREATE INDEX PT_TUV_T_LOCALE_ID ON PAGE_TM_TUV_T(LOCALE_ID);
CREATE INDEX PT_TUV_L_LOCALE_ID ON PAGE_TM_TUV_L(LOCALE_ID);
CREATE INDEX ST_TUV_T_LOCALE_ID ON PROJECT_TM_TUV_T(LOCALE_ID);
CREATE INDEX ST_TUV_L_LOCALE_ID ON PROJECT_TM_TUV_L(LOCALE_ID);

CREATE INDEX PT_TUV_T_TU_ID ON PAGE_TM_TUV_T(TU_ID);
CREATE INDEX PT_TUV_L_TU_ID ON PAGE_TM_TUV_L(TU_ID);
CREATE INDEX ST_TUV_T_TU_ID ON PROJECT_TM_TUV_T(TU_ID);
CREATE INDEX ST_TUV_L_TU_ID ON PROJECT_TM_TUV_L(TU_ID);

CREATE INDEX PT_TU_T_TM_ID ON PAGE_TM_TU_T(TM_ID);
CREATE INDEX PT_TU_L_TM_ID ON PAGE_TM_TU_L(TM_ID);
CREATE INDEX ST_TU_T_TM_ID ON PROJECT_TM_TU_T(TM_ID);
CREATE INDEX ST_TU_L_TM_ID ON PROJECT_TM_TU_L(TM_ID);

CREATE INDEX PT_TU_T_TYPE ON PAGE_TM_TU_T(TYPE);
CREATE INDEX PT_TU_L_TYPE ON PAGE_TM_TU_L(TYPE);
CREATE INDEX ST_TU_T_TYPE ON PROJECT_TM_TU_T(TYPE);
CREATE INDEX ST_TU_L_TYPE ON PROJECT_TM_TU_L(TYPE);

CREATE INDEX ST_TU_T_SOURCE_LOCALE_ID ON PROJECT_TM_TU_T(SOURCE_LOCALE_ID);
CREATE INDEX ST_TU_L_SOURCE_LOCALE_ID ON PROJECT_TM_TU_L(SOURCE_LOCALE_ID);


-- TM3 Segment storage
DROP TABLE IF EXISTS `TM3_EVENTS`;
DROP TABLE IF EXISTS `TM3_ATTR`;
DROP TABLE IF EXISTS `TM3_ID`;
DROP TABLE IF EXISTS `TM3_TM`;

CREATE TABLE `TM3_TM` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` smallint(6) NOT NULL,
  `tu_table` varchar(128) DEFAULT NULL,
  `tuv_table` varchar(128) DEFAULT NULL,
  `tuv_ext_table` varchar(128) DEFAULT NULL,
  `fuzzy_table` varchar(128) DEFAULT NULL,
  `attr_val_table` varchar(128) DEFAULT NULL,
  `srcLocaleId` bigint(20),
  `tgtLocaleId` bigint(20),
  `sharedStorageId` bigint(20),
  PRIMARY KEY (`id`),
  KEY(`sharedStorageId`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

--
-- Table structure for table `tm3_attr`
--

CREATE TABLE `TM3_ATTR` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tmId` bigint(20) NOT NULL,
  `name` varchar(128) NOT NULL,
  `columnName` varchar(32),
  `valueType` varchar(128) NOT NULL,
  `affectsIdentity` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tmId` (`tmId`,`name`),
  CONSTRAINT `tm3_attr_ibfk_1` FOREIGN KEY (`tmId`) REFERENCES `TM3_TM` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;


--
-- Table structure for table `tm3_events`
--

CREATE TABLE `TM3_EVENTS` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime NOT NULL,
  `userName` varchar(128) NOT NULL,
  `tmId` bigint(20) NOT NULL,
  `type` smallint(6) NOT NULL,
  `arg` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `tm3_events_ibfk_1` FOREIGN KEY (`tmId`) REFERENCES `TM3_TM` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

CREATE TABLE `TM3_ID` (
    `tableName` varchar(128) NOT NULL,
    `nextId` bigint(20) NOT NULL DEFAULT 0,
    PRIMARY KEY (`tableName`)
) ENGINE=MyISAM DEFAULT CHARSET=UTF8;
