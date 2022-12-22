-- phpMyAdmin SQL Dump
-- version 2.6.0-pl2
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Nov 14, 2004 at 12:46 PM
-- Server version: 4.0.13
-- PHP Version: 4.3.9
-- 
-- Database: `hkurl`
-- 

-- --------------------------------------------------------

-- 
-- Table structure for table `is_browser`
-- 

CREATE TABLE `is_browser` (
  `browser` varchar(30) NOT NULL default '',
  `count` int(10) NOT NULL default '0'
) TYPE=MyISAM;

-- 
-- Dumping data for table `is_browser`
-- 

INSERT INTO `is_browser` VALUES ('Internet Explorer 6', 0);
INSERT INTO `is_browser` VALUES ('Internet Explorer 5', 0);
INSERT INTO `is_browser` VALUES ('Internet Explorer 4', 0);
INSERT INTO `is_browser` VALUES ('Firefox', 0);
INSERT INTO `is_browser` VALUES ('Netscape 7', 0);
INSERT INTO `is_browser` VALUES ('Netscape 6', 0);
INSERT INTO `is_browser` VALUES ('Netscape 4', 0);
INSERT INTO `is_browser` VALUES ('Netscape 3', 0);
INSERT INTO `is_browser` VALUES ('Opera', 0);
INSERT INTO `is_browser` VALUES ('Other', 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `is_color`
-- 

CREATE TABLE `is_color` (
  `color` varchar(30) NOT NULL default '',
  `count` int(10) NOT NULL default '0'
) TYPE=MyISAM;

-- 
-- Dumping data for table `is_color`
-- 

INSERT INTO `is_color` VALUES ('256 color', 0);
INSERT INTO `is_color` VALUES ('16 bit', 0);
INSERT INTO `is_color` VALUES ('24 bit', 0);
INSERT INTO `is_color` VALUES ('32 bit', 0);
INSERT INTO `is_color` VALUES ('Unknow', 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `is_count`
-- 

CREATE TABLE `is_count` (
  `count` int(10) NOT NULL default '0',
  `days` int(5) NOT NULL default '0'
) TYPE=MyISAM;

-- 
-- Dumping data for table `is_count`
-- 

INSERT INTO `is_count` VALUES (0, 0);

-- --------------------------------------------------------

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

-- --------------------------------------------------------

-- 
-- Table structure for table `is_daycount`
-- 

CREATE TABLE `is_daycount` (
  `date` date NOT NULL default '0000-00-00',
  `daycount` int(10) NOT NULL default '0'
) TYPE=MyISAM;

-- 
-- Dumping data for table `is_daycount`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `is_engine`
-- 

CREATE TABLE `is_engine` (
  `name` varchar(50) NOT NULL default '',
  `mthcount` int(10) NOT NULL default '0',
  `daycount` int(10) NOT NULL default '0',
  `start_time` int(10) NOT NULL, `count` int(10) NOT NULL default '0'
) TYPE=MyISAM;

-- 
-- Dumping data for table `is_engine`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `is_hostname`
-- 

CREATE TABLE `is_hostname` (
  `hostname` varchar(100) NOT NULL default '',
  `count` int(10) NOT NULL default '0'
) TYPE=MyISAM;

-- 
-- Dumping data for table `is_hostname`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `is_hour`
-- 

CREATE TABLE `is_hour` (
  `hour` char(2) NOT NULL default '',
  `count` int(10) NOT NULL default '0'
) TYPE=MyISAM;

-- 
-- Dumping data for table `is_hour`
-- 

INSERT INTO `is_hour` VALUES ('00', 0);
INSERT INTO `is_hour` VALUES ('01', 0);
INSERT INTO `is_hour` VALUES ('02', 0);
INSERT INTO `is_hour` VALUES ('03', 0);
INSERT INTO `is_hour` VALUES ('04', 0);
INSERT INTO `is_hour` VALUES ('05', 0);
INSERT INTO `is_hour` VALUES ('06', 0);
INSERT INTO `is_hour` VALUES ('07', 0);
INSERT INTO `is_hour` VALUES ('08', 0);
INSERT INTO `is_hour` VALUES ('09', 0);
INSERT INTO `is_hour` VALUES ('10', 0);
INSERT INTO `is_hour` VALUES ('11', 0);
INSERT INTO `is_hour` VALUES ('12', 0);
INSERT INTO `is_hour` VALUES ('13', 0);
INSERT INTO `is_hour` VALUES ('14', 0);
INSERT INTO `is_hour` VALUES ('15', 0);
INSERT INTO `is_hour` VALUES ('16', 0);
INSERT INTO `is_hour` VALUES ('17', 0);
INSERT INTO `is_hour` VALUES ('18', 0);
INSERT INTO `is_hour` VALUES ('19', 0);
INSERT INTO `is_hour` VALUES ('20', 0);
INSERT INTO `is_hour` VALUES ('21', 0);
INSERT INTO `is_hour` VALUES ('22', 0);
INSERT INTO `is_hour` VALUES ('23', 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `is_ip`
-- 

CREATE TABLE `is_ip` (
  `ip` varchar(100) NOT NULL default '',
  `time` varchar(100) NOT NULL default ''
) TYPE=MyISAM;

-- 
-- Dumping data for table `is_ip`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `is_keyword`
-- 

CREATE TABLE `is_keyword` (
  `keyword` varchar(50) NOT NULL default '',
  `mthcount` int(10) NOT NULL default '0',
  `daycount` int(10) NOT NULL default '0',
  `start_time` int(10) NOT NULL, `count` int(10) NOT NULL default '0'
) TYPE=MyISAM;

-- 
-- Dumping data for table `is_keyword`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `is_last_visitor`
-- 

CREATE TABLE `is_last_visitor` (
  `info` varchar(255) NOT NULL default '',
  `hostname` varchar(200) NOT NULL default '',
  `country_code` varchar(5) NOT NULL default '',
  `country_name` varchar(50) NOT NULL default '',
  `referer` varchar(200) NOT NULL default '',
  `time` varchar(100) NOT NULL default ''
) TYPE=MyISAM;

-- 
-- Dumping data for table `is_last_visitor`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `is_mth`
-- 

CREATE TABLE `is_mth` (
  `mth` char(2) NOT NULL default '',
  `year` int(5) NOT NULL default '0',
  `count` int(10) NOT NULL default '0'
) TYPE=MyISAM;

-- 
-- Dumping data for table `is_mth`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `is_mth_days`
-- 

CREATE TABLE `is_mth_days` (
  `day` char(2) NOT NULL default '',
  `count` int(10) NOT NULL default '0'
) TYPE=MyISAM;

-- 
-- Dumping data for table `is_mth_days`
-- 

INSERT INTO `is_mth_days` VALUES ('01', 0);
INSERT INTO `is_mth_days` VALUES ('02', 0);
INSERT INTO `is_mth_days` VALUES ('03', 0);
INSERT INTO `is_mth_days` VALUES ('04', 0);
INSERT INTO `is_mth_days` VALUES ('05', 0);
INSERT INTO `is_mth_days` VALUES ('06', 0);
INSERT INTO `is_mth_days` VALUES ('07', 0);
INSERT INTO `is_mth_days` VALUES ('08', 0);
INSERT INTO `is_mth_days` VALUES ('09', 0);
INSERT INTO `is_mth_days` VALUES ('10', 0);
INSERT INTO `is_mth_days` VALUES ('11', 0);
INSERT INTO `is_mth_days` VALUES ('12', 0);
INSERT INTO `is_mth_days` VALUES ('13', 0);
INSERT INTO `is_mth_days` VALUES ('14', 0);
INSERT INTO `is_mth_days` VALUES ('15', 0);
INSERT INTO `is_mth_days` VALUES ('16', 0);
INSERT INTO `is_mth_days` VALUES ('17', 0);
INSERT INTO `is_mth_days` VALUES ('18', 0);
INSERT INTO `is_mth_days` VALUES ('19', 0);
INSERT INTO `is_mth_days` VALUES ('20', 0);
INSERT INTO `is_mth_days` VALUES ('21', 0);
INSERT INTO `is_mth_days` VALUES ('22', 0);
INSERT INTO `is_mth_days` VALUES ('23', 0);
INSERT INTO `is_mth_days` VALUES ('24', 0);
INSERT INTO `is_mth_days` VALUES ('25', 0);
INSERT INTO `is_mth_days` VALUES ('26', 0);
INSERT INTO `is_mth_days` VALUES ('27', 0);
INSERT INTO `is_mth_days` VALUES ('28', 0);
INSERT INTO `is_mth_days` VALUES ('29', 0);
INSERT INTO `is_mth_days` VALUES ('30', 0);
INSERT INTO `is_mth_days` VALUES ('31', 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `is_os`
-- 

CREATE TABLE `is_os` (
  `os` varchar(30) NOT NULL default '',
  `count` int(10) NOT NULL default '0'
) TYPE=MyISAM;

-- 
-- Dumping data for table `is_os`
-- 

INSERT INTO `is_os` VALUES ('Windows XP', 0);
INSERT INTO `is_os` VALUES ('Windows 2000', 0);
INSERT INTO `is_os` VALUES ('Windows NT 4.0', 0);
INSERT INTO `is_os` VALUES ('Windows 9x', 0);
INSERT INTO `is_os` VALUES ('Windows Me', 0);
INSERT INTO `is_os` VALUES ('Linux', 0);
INSERT INTO `is_os` VALUES ('Other', 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `is_page`
-- 

CREATE TABLE `is_page` (
  `page` varchar(100) NOT NULL default '',
  `count` int(10) NOT NULL default '0'
) TYPE=MyISAM;

-- 
-- Dumping data for table `is_page`
-- 

INSERT INTO `is_page` VALUES ('/', 1);

-- --------------------------------------------------------

-- 
-- Table structure for table `is_ref_site`
-- 

CREATE TABLE `is_ref_site` (
  `domain` varchar(255) NOT NULL default '',
  `mthcount` int(10) NOT NULL default '0',
  `daycount` int(10) NOT NULL default '0',
  `start_time` int(10) NOT NULL, `count` int(10) NOT NULL default '0'
) TYPE=MyISAM;

-- 
-- Dumping data for table `is_ref_site`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `is_referer`
-- 

CREATE TABLE `is_referer` (
  `url` varchar(255) NOT NULL default '',
  `count` int(10) NOT NULL default '0'
) TYPE=MyISAM;

-- 
-- Dumping data for table `is_referer`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `is_screen`
-- 

CREATE TABLE `is_screen` (
  `width` varchar(20) NOT NULL default '',
  `count` int(10) NOT NULL default '0'
) TYPE=MyISAM;

-- 
-- Dumping data for table `is_screen`
-- 

INSERT INTO `is_screen` VALUES ('640 x 480', 0);
INSERT INTO `is_screen` VALUES ('800 x 600', 0);
INSERT INTO `is_screen` VALUES ('1024 x 768', 0);
INSERT INTO `is_screen` VALUES ('1152 x 864', 0);
INSERT INTO `is_screen` VALUES ('1280 x 1024', 0);
INSERT INTO `is_screen` VALUES ('Unknow', 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `is_session`
-- 

CREATE TABLE `is_session` (
  `hash` varchar(100) NOT NULL default '',
  `time` int(10) NOT NULL default '0'
) TYPE=MyISAM;

-- 
-- Dumping data for table `is_session`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `is_spider`
-- 

CREATE TABLE `is_spider` (
  `name` varchar(50) NOT NULL default '',
  `time` datetime NOT NULL default '0000-00-00 00:00:00'
) TYPE=MyISAM;

-- 
-- Dumping data for table `is_spider`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `is_today_hour`
-- 

CREATE TABLE `is_today_hour` (
  `hour` char(2) NOT NULL default '',
  `count` int(10) NOT NULL default '0'
) TYPE=MyISAM;

-- 
-- Dumping data for table `is_today_hour`
-- 

INSERT INTO `is_today_hour` VALUES ('00', 0);
INSERT INTO `is_today_hour` VALUES ('01', 0);
INSERT INTO `is_today_hour` VALUES ('02', 0);
INSERT INTO `is_today_hour` VALUES ('03', 0);
INSERT INTO `is_today_hour` VALUES ('04', 0);
INSERT INTO `is_today_hour` VALUES ('05', 0);
INSERT INTO `is_today_hour` VALUES ('06', 0);
INSERT INTO `is_today_hour` VALUES ('07', 0);
INSERT INTO `is_today_hour` VALUES ('08', 0);
INSERT INTO `is_today_hour` VALUES ('09', 0);
INSERT INTO `is_today_hour` VALUES ('10', 0);
INSERT INTO `is_today_hour` VALUES ('11', 0);
INSERT INTO `is_today_hour` VALUES ('12', 0);
INSERT INTO `is_today_hour` VALUES ('13', 0);
INSERT INTO `is_today_hour` VALUES ('14', 0);
INSERT INTO `is_today_hour` VALUES ('15', 0);
INSERT INTO `is_today_hour` VALUES ('16', 0);
INSERT INTO `is_today_hour` VALUES ('17', 0);
INSERT INTO `is_today_hour` VALUES ('18', 0);
INSERT INTO `is_today_hour` VALUES ('19', 0);
INSERT INTO `is_today_hour` VALUES ('20', 0);
INSERT INTO `is_today_hour` VALUES ('21', 0);
INSERT INTO `is_today_hour` VALUES ('22', 0);
INSERT INTO `is_today_hour` VALUES ('23', 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `is_week`
-- 

CREATE TABLE `is_week` (
  `week` char(2) NOT NULL default '',
  `year` int(5) NOT NULL default '0',
  `date` varchar(20) NOT NULL default '',
  `count` int(10) NOT NULL default '0'
) TYPE=MyISAM;

-- 
-- Dumping data for table `is_week`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `is_week_days`
-- 

CREATE TABLE `is_week_days` (
  `day` int(2) NOT NULL default '0',
  `count` int(10) NOT NULL default '0'
) TYPE=MyISAM;

-- 
-- Dumping data for table `is_week_days`
-- 

INSERT INTO `is_week_days` VALUES (0, 0);
INSERT INTO `is_week_days` VALUES (1, 0);
INSERT INTO `is_week_days` VALUES (2, 0);
INSERT INTO `is_week_days` VALUES (3, 0);
INSERT INTO `is_week_days` VALUES (4, 0);
INSERT INTO `is_week_days` VALUES (5, 0);
INSERT INTO `is_week_days` VALUES (6, 0);
