-- increase the column length of remove_tag

ALTER TABLE `removed_prefix_tag` CHANGE COLUMN `STRING` `STRING` TEXT NOT NULL;
ALTER TABLE `removed_suffix_tag` CHANGE COLUMN `STRING` `STRING` TEXT NOT NULL;
ALTER TABLE `removed_tag` CHANGE COLUMN `PREFIX_STRING` `PREFIX_STRING` TEXT NOT NULL;
ALTER TABLE `removed_tag` CHANGE COLUMN `SUFFIX_STRING` `SUFFIX_STRING` TEXT NOT NULL;

