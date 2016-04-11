#For GBS-741
CREATE TABLE IF NOT EXISTS jsp_filter (
  ID BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  FILTER_NAME VARCHAR(255) NOT NULL,
  FILTER_DESCRIPTION VARCHAR(2000),
  COMPANY_ID BIGINT UNSIGNED NOT NULL,
  IS_ADDITIONAL_HEAD_ADDED CHAR(1) NOT NULL DEFAULT 'N',
  IS_ESCAPE_ENTITY CHAR(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`)
)
ENGINE = InnoDB;