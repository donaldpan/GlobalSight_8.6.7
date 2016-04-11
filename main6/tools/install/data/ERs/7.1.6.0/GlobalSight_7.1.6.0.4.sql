-- #600

CREATE TABLE IF NOT EXISTS `html_filter` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `FILTER_NAME` varchar(255) NOT NULL,
  `FILTER_DESCRIPTION` varchar(4000) DEFAULT NULL,
  `EMBEDDABLE_TAGS` varchar(4000) NOT NULL,
  `PLACEHOLD_TRIMMING` varchar(255) NOT NULL,
  `COMPANY_ID` bigint(20) NOT NULL,
  `DEFAULT_EMBEDDABLE_TAGS` varchar(4000) NOT NULL,
  `CONVERT_HTML_ENTRY` char(1) NOT NULL DEFAULT 'N',
  `IGNORE_INVALIDE_HTML_TAGS` char(1) NOT NULL DEFAULT 'N',
  `JS_FUNCTION_FILTER` varchar(1000) NOT NULL,
  `DEFAULT_PAIRED_TAGS` varchar(2000) NOT NULL,
  `PAIRED_TAGS` varchar(2000) NOT NULL,
  `DEFAULT_UNPAIRED_TAGS` varchar(2000) NOT NULL,
  `UNPAIRED_TAGS` varchar(2000) NOT NULL,
  `DEFAULT_SWITCH_TAG_MAPS` text NOT NULL,
  `SWITCH_TAG_MAPS` text NOT NULL,
  `DEFAULT_WHITE_PRESERVING_TAGS` text NOT NULL,
  `WHITE_PRESERVING_TAGS` text NOT NULL,
  `DEFAULT_NON_TRANSLATABLE_META_ATTRIBUTES` text NOT NULL,
  `NON_TRANSLATABLE_META_ATTRIBUTES` text NOT NULL,
  `DEFAULT_TRANSLATABLE_ATTRIBUTES` text NOT NULL,
  `TRANSLATABLE_ATTRIBUTES` text NOT NULL,
  `DEFAULT_LOCALIZABLE_ATTRIBUTE_MAPS` text NOT NULL,
  `LOCALIZABLE_ATTRIBUTE_MAPS` text NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
