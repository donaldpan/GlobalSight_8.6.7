#GBS-3720:Timed/Automatic Completion of Workflow Activities
ALTER TABLE ACTIVITY ADD COLUMN AUTO_COMPLETE_ACTIVITY CHAR(1) NOT NULL DEFAULT 'N';
ALTER TABLE ACTIVITY ADD COLUMN AFTER_JOB_CREATION VARCHAR(40) DEFAULT NULL;
ALTER TABLE ACTIVITY ADD COLUMN AFTER_JOB_DISPATCH VARCHAR(40) DEFAULT NULL;
ALTER TABLE ACTIVITY ADD COLUMN AFTER_ACTIVITY_START VARCHAR(40) DEFAULT NULL;