# for gbs-1251
ALTER TABLE TM_PROFILE ADD COLUMN MS_MT_APPID VARCHAR(50) DEFAULT NULL;
ALTER TABLE TM_PROFILE ADD COLUMN MS_MT_URL_FLAG CHAR(1) DEFAULT NULL;