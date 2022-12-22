--
-- update data structure
--

ALTER TABLE `is_count` ADD `days` INT(5) NOT NULL;

SELECT @total_days:=count(*) FROM `is_daycount`;
UPDATE `is_count` set `days`=@total_days, `ref_days`='1';


ALTER TABLE `is_daycount` DROP `id`;

ALTER TABLE `is_mth` DROP `id`;

ALTER TABLE `is_week` DROP `id`;


ALTER TABLE `is_engine` ADD `mthcount` int(10) NOT NULL AFTER `name`,
ADD `daycount` int(10) NOT NULL AFTER `mthcount`;
ADD `start_time` int(10) NOT NULL AFTER `daycount`;
UPDATE `is_engine` set `mthcount`=`count`, `daycount`=`count`, `start_time`='[new_ref_time]';

ALTER TABLE `is_keyword` DROP `id`, ADD `mthcount` int(10) NOT NULL AFTER `keyword`,
ADD `daycount` int(10) NOT NULL AFTER `mthcount`;
ADD `start_time` int(10) NOT NULL AFTER `daycount`;
UPDATE `is_keyword` set `mthcount`=`count`, `daycount`=`count`, `start_time`='[new_ref_time]';

ALTER TABLE `is_ref_site` DROP `id`, ADD `mthcount` int(10) NOT NULL AFTER `domain`,
ADD `daycount` int(10) NOT NULL AFTER `mthcount`;
ADD `start_time` int(10) NOT NULL AFTER `daycount`;
UPDATE `is_ref_site` set `mthcount`=`count`, `daycount`=`count`, `start_time`='[new_ref_time]';
DELETE FROM `is_ref_site` where `domain`='';


ALTER TABLE `is_referer` DROP `id`;

ALTER TABLE `is_page` DROP `id`;


ALTER TABLE `is_last_visitor` ADD `country_code` VARCHAR(5) NOT NULL AFTER `hostname`;

ALTER TABLE `is_last_visitor` ADD `country_name` VARCHAR(50) NOT NULL AFTER `country_code`,
ADD `referer` VARCHAR(200) NOT NULL AFTER `country_name`;


DROP TABLE `is_country`;


-- 
-- Table structure for table `is_country`
-- 

CREATE TABLE `is_country` (
  `country_name` varchar(100) NOT NULL default '',
  `country_code` varchar(5) NOT NULL default '',
  `daycount` int(10) NOT NULL default '0',
  `mthcount` int(10) NOT NULL default '0',
  `count` int(10) NOT NULL default '0'
) TYPE=MyISAM;

-- 
-- Dumping data for table `is_country`
-- 

INSERT INTO `is_country` VALUES ('', '', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Asia/Pacific Region', 'AP', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Europe', 'EU', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Andorra', 'AD', 0, 0, 0);
INSERT INTO `is_country` VALUES ('United Arab Emirates', 'AE', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Afghanistan', 'AF', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Antigua and Barbuda', 'AG', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Anguilla', 'AI', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Albania', 'AL', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Armenia', 'AM', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Netherlands Antilles', 'AN', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Angola', 'AO', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Antarctica', 'AQ', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Argentina', 'AR', 0, 0, 0);
INSERT INTO `is_country` VALUES ('American Samoa', 'AS', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Austria', 'AT', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Australia', 'AU', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Aruba', 'AW', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Azerbaijan', 'AZ', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Bosnia and Herzegovina', 'BA', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Barbados', 'BB', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Bangladesh', 'BD', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Belgium', 'BE', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Burkina Faso', 'BF', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Bulgaria', 'BG', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Bahrain', 'BH', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Burundi', 'BI', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Benin', 'BJ', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Bermuda', 'BM', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Brunei Darussalam', 'BN', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Bolivia', 'BO', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Brazil', 'BR', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Bahamas', 'BS', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Bhutan', 'BT', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Bouvet Island', 'BV', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Botswana', 'BW', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Belarus', 'BY', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Belize', 'BZ', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Canada', 'CA', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Cocos (Keeling) Islands', 'CC', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Congo, The Democratic Republic of the', 'CD', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Central African Republic', 'CF', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Congo', 'CG', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Switzerland', 'CH', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Cook\nIslands', 'CK', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Chile', 'CL', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Cameroon', 'CM', 0, 0, 0);
INSERT INTO `is_country` VALUES ('China', 'CN', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Colombia', 'CO', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Costa Rica', 'CR', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Cuba', 'CU', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Cape\nVerde', 'CV', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Christmas Island', 'CX', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Cyprus', 'CY', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Czech Republic', 'CZ', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Germany', 'DE', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Djibouti', 'DJ', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Denmark', 'DK', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Dominica', 'DM', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Dominican Republic', 'DO', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Algeria', 'DZ', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Ecuador', 'EC', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Estonia', 'EE', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Egypt', 'EG', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Western Sahara', 'EH', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Eritrea', 'ER', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Spain', 'ES', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Ethiopia', 'ET', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Finland', 'FI', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Fiji', 'FJ', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Falkland Islands (Malvinas)', 'FK', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Micronesia, Federated States of', 'FM', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Faroe\nIslands', 'FO', 0, 0, 0);
INSERT INTO `is_country` VALUES ('France', 'FR', 0, 0, 0);
INSERT INTO `is_country` VALUES ('France, Metropolitan', 'FX', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Gabon', 'GA', 0, 0, 0);
INSERT INTO `is_country` VALUES ('United Kingdom', 'GB', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Grenada', 'GD', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Georgia', 'GE', 0, 0, 0);
INSERT INTO `is_country` VALUES ('French Guiana', 'GF', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Ghana', 'GH', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Gibraltar', 'GI', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Greenland', 'GL', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Gambia', 'GM', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Guinea', 'GN', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Guadeloupe', 'GP', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Equatorial Guinea', 'GQ', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Greece', 'GR', 0, 0, 0);
INSERT INTO `is_country` VALUES ('South Georgia\nand the South Sandwich Islands', 'GS', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Guatemala', 'GT', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Guam', 'GU', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Guinea-Bissau', 'GW', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Guyana', 'GY', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Hong Kong', 'HK', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Heard Island and McDonald Islands', 'HM', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Honduras', 'HN', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Croatia', 'HR', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Haiti', 'HT', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Hungary', 'HU', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Indonesia', 'ID', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Ireland', 'IE', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Israel', 'IL', 0, 0, 0);
INSERT INTO `is_country` VALUES ('India', 'IN', 0, 0, 0);
INSERT INTO `is_country` VALUES ('British Indian Ocean Territory', 'IO', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Iraq', 'IQ', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Iran, Islamic Republic of', 'IR', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Iceland', 'IS', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Italy', 'IT', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Jamaica', 'JM', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Jordan', 'JO', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Japan', 'JP', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Kenya', 'KE', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Kyrgyzstan', 'KG', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Cambodia', 'KH', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Kiribati', 'KI', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Comoros', 'KM', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Saint Kitts and Nevis', 'KN', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Korea, Republic of', 'KR', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Kuwait', 'KW', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Cayman Islands', 'KY', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Kazakstan', 'KZ', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Lebanon', 'LB', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Saint Lucia', 'LC', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Liechtenstein', 'LI', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Sri Lanka', 'LK', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Liberia', 'LR', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Lesotho', 'LS', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Lithuania', 'LT', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Luxembourg', 'LU', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Latvia', 'LV', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Libyan Arab Jamahiriya', 'LY', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Morocco', 'MA', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Monaco', 'MC', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Moldova, Republic\nof', 'MD', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Madagascar', 'MG', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Marshall Islands', 'MH', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Macedonia', 'MK', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Mali', 'ML', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Myanmar', 'MM', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Mongolia', 'MN', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Macau', 'MO', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Northern Mariana Islands', 'MP', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Martinique', 'MQ', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Mauritania', 'MR', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Montserrat', 'MS', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Malta', 'MT', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Mauritius', 'MU', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Maldives', 'MV', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Malawi', 'MW', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Mexico', 'MX', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Malaysia', 'MY', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Mozambique', 'MZ', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Namibia', 'NA', 0, 0, 0);
INSERT INTO `is_country` VALUES ('New Caledonia', 'NC', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Niger', 'NE', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Norfolk Island', 'NF', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Nigeria', 'NG', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Nicaragua', 'NI', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Netherlands', 'NL', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Norway', 'NO', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Nepal', 'NP', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Nauru', 'NR', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Niue', 'NU', 0, 0, 0);
INSERT INTO `is_country` VALUES ('New Zealand', 'NZ', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Oman', 'OM', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Panama', 'PA', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Peru', 'PE', 0, 0, 0);
INSERT INTO `is_country` VALUES ('French\nPolynesia', 'PF', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Papua New Guinea', 'PG', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Philippines', 'PH', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Pakistan', 'PK', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Poland', 'PL', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Saint\nPierre and Miquelon', 'PM', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Pitcairn Islands', 'PN', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Puerto Rico', 'PR', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Palestinian Territory,\nOccupied', 'PS', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Portugal', 'PT', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Palau', 'PW', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Paraguay', 'PY', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Qatar', 'QA', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Reunion', 'RE', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Romania', 'RO', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Russian Federation', 'RU', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Rwanda', 'RW', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Saudi Arabia', 'SA', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Solomon Islands', 'SB', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Seychelles', 'SC', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Sudan', 'SD', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Sweden', 'SE', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Singapore', 'SG', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Saint Helena', 'SH', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Slovenia', 'SI', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Svalbard and Jan Mayen', 'SJ', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Slovakia', 'SK', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Sierra Leone', 'SL', 0, 0, 0);
INSERT INTO `is_country` VALUES ('San Marino', 'SM', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Senegal', 'SN', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Somalia', 'SO', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Suriname', 'SR', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Sao Tome and Principe', 'ST', 0, 0, 0);
INSERT INTO `is_country` VALUES ('El Salvador', 'SV', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Syrian Arab\nRepublic', 'SY', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Swaziland', 'SZ', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Turks and Caicos Islands', 'TC', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Chad', 'TD', 0, 0, 0);
INSERT INTO `is_country` VALUES ('French Southern\nTerritories', 'TF', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Togo', 'TG', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Thailand', 'TH', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Tajikistan', 'TJ', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Tokelau', 'TK', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Turkmenistan', 'TM', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Tunisia', 'TN', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Tonga', 'TO', 0, 0, 0);
INSERT INTO `is_country` VALUES ('East Timor', 'TP', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Turkey', 'TR', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Trinidad and Tobago', 'TT', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Tuvalu', 'TV', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Taiwan', 'TW', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Tanzania, United Republic of', 'TZ', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Ukraine', 'UA', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Uganda', 'UG', 0, 0, 0);
INSERT INTO `is_country` VALUES ('United States Minor Outlying Islands', 'UM', 0, 0, 0);
INSERT INTO `is_country` VALUES ('United States', 'US', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Uruguay', 'UY', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Uzbekistan', 'UZ', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Holy See (Vatican City State)', 'VA', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Saint Vincent and the\nGrenadines', 'VC', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Venezuela', 'VE', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Virgin Islands, British', 'VG', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Virgin Islands, U.S.', 'VI', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Vietnam', 'VN', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Vanuatu', 'VU', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Wallis and Futuna', 'WF', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Samoa', 'WS', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Yemen', 'YE', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Mayotte', 'YT', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Yugoslavia', 'YU', 0, 0, 0);
INSERT INTO `is_country` VALUES ('South Africa', 'ZA', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Zambia', 'ZM', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Zaire', 'ZR', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Zimbabwe', 'ZW', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Anonymous Proxy', 'A1', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Satellite Provider', 'A2', 0, 0, 0);
INSERT INTO `is_country` VALUES ('Other', 'O1', 0, 0, 0);