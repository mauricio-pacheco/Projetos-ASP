ALTER TABLE `is_count` DROP `ref_days`;

ALTER TABLE `is_last_visitor` ADD `country_name` VARCHAR(50) NOT NULL AFTER `country_code`,
ADD `referer` VARCHAR(200) NOT NULL AFTER `country_name`;


ALTER TABLE `is_engine` ADD `start_time` int(10) NOT NULL AFTER `daycount`;
UPDATE `is_engine` set `start_time`='[new_ref_time]';

ALTER TABLE `is_keyword` ADD `start_time` int(10) NOT NULL AFTER `daycount`;
UPDATE `is_keyword` set `start_time`='[new_ref_time]';

ALTER TABLE `is_ref_site` ADD `start_time` int(10) NOT NULL AFTER `daycount`;
UPDATE `is_ref_site` set `start_time`='[new_ref_time]';