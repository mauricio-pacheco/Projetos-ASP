CREATE TABLE `kayapo_authors` (
  `aid` varchar(25) NOT NULL default '',
  `name` varchar(50) default NULL,
  `url` varchar(255) NOT NULL default '',
  `email` varchar(255) NOT NULL default '',
  `pwd` varchar(40) default NULL,
  `counter` int(11) NOT NULL default '0',
  `radminsuper` tinyint(1) NOT NULL default '1',
  `admlanguage` varchar(30) NOT NULL default '',
  PRIMARY KEY  (`aid`),
  KEY `aid` (`aid`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_autonews` (
  `anid` int(11) NOT NULL auto_increment,
  `catid` int(11) NOT NULL default '0',
  `aid` varchar(30) NOT NULL default '',
  `title` varchar(80) NOT NULL default '',
  `time` varchar(19) NOT NULL default '',
  `hometext` text NOT NULL,
  `bodytext` text NOT NULL,
  `topic` int(3) NOT NULL default '1',
  `informant` varchar(20) NOT NULL default '',
  `notes` text NOT NULL,
  `ihome` int(1) NOT NULL default '0',
  `alanguage` varchar(30) NOT NULL default '',
  `acomm` int(1) NOT NULL default '0',
  `associated` text NOT NULL,
  PRIMARY KEY  (`anid`),
  KEY `anid` (`anid`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_banned_ip` (
  `id` int(11) NOT NULL auto_increment,
  `ip_address` varchar(15) NOT NULL default '',
  `reason` varchar(255) NOT NULL default '',
  `date` date NOT NULL default '0000-00-00',
  PRIMARY KEY  (`id`),
  KEY `id` (`id`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_banner` (
  `bid` int(11) NOT NULL auto_increment,
  `cid` int(11) NOT NULL default '0',
  `imptotal` int(11) NOT NULL default '0',
  `impmade` int(11) NOT NULL default '0',
  `clicks` int(11) NOT NULL default '0',
  `imageurl` varchar(100) NOT NULL default '',
  `clickurl` varchar(200) NOT NULL default '',
  `alttext` varchar(255) NOT NULL default '',
  `date` datetime default NULL,
  `dateend` datetime default NULL,
  `type` tinyint(1) NOT NULL default '0',
  `active` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`bid`),
  KEY `bid` (`bid`),
  KEY `cid` (`cid`)
) TYPE=MyISAM;

INSERT INTO `kayapo_banner` VALUES (1, 1, 0, 1, 0, 'http://kayapo.phpnuke.org.br/images/banner01.gif', 'kayapo.phpnuke.org.br', 'Kayapó! Toda a força do PHP-Nuke...', '2005-01-13 16:27:39', '0000-00-00 00:00:00', 0, 1);

CREATE TABLE `kayapo_bannerclient` (
  `cid` int(11) NOT NULL auto_increment,
  `name` varchar(60) NOT NULL default '',
  `contact` varchar(60) NOT NULL default '',
  `email` varchar(60) NOT NULL default '',
  `login` varchar(10) NOT NULL default '',
  `passwd` varchar(10) NOT NULL default '',
  `extrainfo` text NOT NULL,
  PRIMARY KEY  (`cid`),
  KEY `cid` (`cid`)
) TYPE=MyISAM;

INSERT INTO `kayapo_bannerclient` VALUES (1, 'Kayapó', 'Kayapó', 'kayapo@phpnuke.org.br', 'kayapo', 'kanyanpob', '@;D');

CREATE TABLE `kayapo_bbauth_access` (
  `group_id` mediumint(8) NOT NULL default '0',
  `forum_id` smallint(5) unsigned NOT NULL default '0',
  `auth_view` tinyint(1) NOT NULL default '0',
  `auth_read` tinyint(1) NOT NULL default '0',
  `auth_post` tinyint(1) NOT NULL default '0',
  `auth_reply` tinyint(1) NOT NULL default '0',
  `auth_edit` tinyint(1) NOT NULL default '0',
  `auth_delete` tinyint(1) NOT NULL default '0',
  `auth_sticky` tinyint(1) NOT NULL default '0',
  `auth_announce` tinyint(1) NOT NULL default '0',
  `auth_vote` tinyint(1) NOT NULL default '0',
  `auth_pollcreate` tinyint(1) NOT NULL default '0',
  `auth_attachments` tinyint(1) NOT NULL default '0',
  `auth_mod` tinyint(1) NOT NULL default '0',
  KEY `group_id` (`group_id`),
  KEY `forum_id` (`forum_id`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_bbbanlist` (
  `ban_id` mediumint(8) unsigned NOT NULL auto_increment,
  `ban_userid` mediumint(8) NOT NULL default '0',
  `ban_ip` varchar(8) NOT NULL default '',
  `ban_email` varchar(255) default NULL,
  `ban_time` int(11) default NULL,
  `ban_expire_time` int(11) default NULL,
  `ban_by_userid` mediumint(8) default NULL,
  `ban_priv_reason` text,
  `ban_pub_reason_mode` tinyint(1) default NULL,
  `ban_pub_reason` text,
  PRIMARY KEY  (`ban_id`),
  KEY `ban_ip_user_id` (`ban_ip`,`ban_userid`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_bbcategories` (
  `cat_id` mediumint(8) unsigned NOT NULL auto_increment,
  `cat_title` varchar(100) default NULL,
  `cat_order` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`cat_id`),
  KEY `cat_order` (`cat_order`)
) TYPE=MyISAM; 

CREATE TABLE `kayapo_bbconfig` (
  `config_name` varchar(255) NOT NULL default '',
  `config_value` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`config_name`)
) TYPE=MyISAM;

INSERT INTO `kayapo_bbconfig` VALUES ('config_id', '1');
INSERT INTO `kayapo_bbconfig` VALUES ('board_disable', '0');
INSERT INTO `kayapo_bbconfig` VALUES ('sitename', 'meusite.com.br');
INSERT INTO `kayapo_bbconfig` VALUES ('site_desc', 'Site feito com PHP-Nuke 7.5 CNB - Kayapó');
INSERT INTO `kayapo_bbconfig` VALUES ('cookie_name', 'phpbb2mysql');
INSERT INTO `kayapo_bbconfig` VALUES ('cookie_path', '/');
INSERT INTO `kayapo_bbconfig` VALUES ('cookie_domain', 'meysite.com.br');
INSERT INTO `kayapo_bbconfig` VALUES ('cookie_secure', '0');
INSERT INTO `kayapo_bbconfig` VALUES ('session_length', '3600');
INSERT INTO `kayapo_bbconfig` VALUES ('allow_html', '1');
INSERT INTO `kayapo_bbconfig` VALUES ('allow_html_tags', 'b,i,u,pre');
INSERT INTO `kayapo_bbconfig` VALUES ('allow_bbcode', '1');
INSERT INTO `kayapo_bbconfig` VALUES ('allow_smilies', '1');
INSERT INTO `kayapo_bbconfig` VALUES ('allow_sig', '1');
INSERT INTO `kayapo_bbconfig` VALUES ('allow_namechange', '0');
INSERT INTO `kayapo_bbconfig` VALUES ('allow_theme_create', '0');
INSERT INTO `kayapo_bbconfig` VALUES ('allow_avatar_local', '1');
INSERT INTO `kayapo_bbconfig` VALUES ('allow_avatar_remote', '0');
INSERT INTO `kayapo_bbconfig` VALUES ('allow_avatar_upload', '0');
INSERT INTO `kayapo_bbconfig` VALUES ('override_user_style', '1');
INSERT INTO `kayapo_bbconfig` VALUES ('posts_per_page', '15');
INSERT INTO `kayapo_bbconfig` VALUES ('topics_per_page', '50');
INSERT INTO `kayapo_bbconfig` VALUES ('hot_threshold', '25');
INSERT INTO `kayapo_bbconfig` VALUES ('max_poll_options', '10');
INSERT INTO `kayapo_bbconfig` VALUES ('max_sig_chars', '255');
INSERT INTO `kayapo_bbconfig` VALUES ('max_inbox_privmsgs', '100');
INSERT INTO `kayapo_bbconfig` VALUES ('max_sentbox_privmsgs', '100');
INSERT INTO `kayapo_bbconfig` VALUES ('max_savebox_privmsgs', '100');
INSERT INTO `kayapo_bbconfig` VALUES ('board_email_sig', 'Thanks, Webmaster@MySite.com');
INSERT INTO `kayapo_bbconfig` VALUES ('board_email', 'Webmaster@MySite.com');
INSERT INTO `kayapo_bbconfig` VALUES ('smtp_delivery', '0');
INSERT INTO `kayapo_bbconfig` VALUES ('smtp_host', '');
INSERT INTO `kayapo_bbconfig` VALUES ('require_activation', '0');
INSERT INTO `kayapo_bbconfig` VALUES ('flood_interval', '15');
INSERT INTO `kayapo_bbconfig` VALUES ('board_email_form', '0');
INSERT INTO `kayapo_bbconfig` VALUES ('avatar_filesize', '6144');
INSERT INTO `kayapo_bbconfig` VALUES ('avatar_max_width', '80');
INSERT INTO `kayapo_bbconfig` VALUES ('avatar_max_height', '80');
INSERT INTO `kayapo_bbconfig` VALUES ('avatar_path', 'modules/Forums/images/avatars');
INSERT INTO `kayapo_bbconfig` VALUES ('avatar_gallery_path', 'modules/Forums/images/avatars');
INSERT INTO `kayapo_bbconfig` VALUES ('smilies_path', 'modules/Forums/images/smiles');
INSERT INTO `kayapo_bbconfig` VALUES ('default_style', '2');
INSERT INTO `kayapo_bbconfig` VALUES ('default_dateformat', 'D M d, Y g:i a');
INSERT INTO `kayapo_bbconfig` VALUES ('board_timezone', '-3');
INSERT INTO `kayapo_bbconfig` VALUES ('prune_enable', '0');
INSERT INTO `kayapo_bbconfig` VALUES ('privmsg_disable', '0');
INSERT INTO `kayapo_bbconfig` VALUES ('gzip_compress', '0');
INSERT INTO `kayapo_bbconfig` VALUES ('coppa_fax', '');
INSERT INTO `kayapo_bbconfig` VALUES ('coppa_mail', '');
INSERT INTO `kayapo_bbconfig` VALUES ('board_startdate', '1013908210');
INSERT INTO `kayapo_bbconfig` VALUES ('default_lang', 'brazilian');
INSERT INTO `kayapo_bbconfig` VALUES ('smtp_username', '');
INSERT INTO `kayapo_bbconfig` VALUES ('smtp_password', '');
INSERT INTO `kayapo_bbconfig` VALUES ('record_online_users', '');
INSERT INTO `kayapo_bbconfig` VALUES ('record_online_date', '');
INSERT INTO `kayapo_bbconfig` VALUES ('server_name', 'Kayapó WebSite');
INSERT INTO `kayapo_bbconfig` VALUES ('server_port', '80');
INSERT INTO `kayapo_bbconfig` VALUES ('script_path', '/modules/Forums/');
INSERT INTO `kayapo_bbconfig` VALUES ('version', '.0.10');
INSERT INTO `kayapo_bbconfig` VALUES ('enable_confirm', '0');
INSERT INTO `kayapo_bbconfig` VALUES ('sendmail_fix', '0');

CREATE TABLE `kayapo_bbdisallow` (
  `disallow_id` mediumint(8) unsigned NOT NULL auto_increment,
  `disallow_username` varchar(25) default NULL,
  PRIMARY KEY  (`disallow_id`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_bbforum_prune` (
  `prune_id` mediumint(8) unsigned NOT NULL auto_increment,
  `forum_id` smallint(5) unsigned NOT NULL default '0',
  `prune_days` tinyint(4) unsigned NOT NULL default '0',
  `prune_freq` tinyint(4) unsigned NOT NULL default '0',
  PRIMARY KEY  (`prune_id`),
  KEY `forum_id` (`forum_id`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_bbforums` (
  `forum_id` smallint(5) unsigned NOT NULL auto_increment,
  `cat_id` mediumint(8) unsigned NOT NULL default '0',
  `forum_name` varchar(150) default NULL,
  `forum_desc` text,
  `forum_status` tinyint(4) NOT NULL default '0',
  `forum_order` mediumint(8) unsigned NOT NULL default '1',
  `forum_posts` mediumint(8) unsigned NOT NULL default '0',
  `forum_topics` mediumint(8) unsigned NOT NULL default '0',
  `forum_last_post_id` mediumint(8) unsigned NOT NULL default '0',
  `prune_next` int(11) default NULL,
  `prune_enable` tinyint(1) NOT NULL default '1',
  `auth_view` tinyint(2) NOT NULL default '0',
  `auth_read` tinyint(2) NOT NULL default '0',
  `auth_post` tinyint(2) NOT NULL default '0',
  `auth_reply` tinyint(2) NOT NULL default '0',
  `auth_edit` tinyint(2) NOT NULL default '0',
  `auth_delete` tinyint(2) NOT NULL default '0',
  `auth_sticky` tinyint(2) NOT NULL default '0',
  `auth_announce` tinyint(2) NOT NULL default '0',
  `auth_vote` tinyint(2) NOT NULL default '0',
  `auth_pollcreate` tinyint(2) NOT NULL default '0',
  `auth_attachments` tinyint(2) NOT NULL default '0',
  PRIMARY KEY  (`forum_id`),
  KEY `forums_order` (`forum_order`),
  KEY `cat_id` (`cat_id`),
  KEY `forum_last_post_id` (`forum_last_post_id`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_bbgroups` (
  `group_id` mediumint(8) NOT NULL auto_increment,
  `group_type` tinyint(4) NOT NULL default '1',
  `group_name` varchar(40) NOT NULL default '',
  `group_description` varchar(255) NOT NULL default '',
  `group_moderator` mediumint(8) NOT NULL default '0',
  `group_single_user` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`group_id`),
  KEY `group_single_user` (`group_single_user`)
) TYPE=MyISAM;

INSERT INTO `kayapo_bbgroups` VALUES (1, 1, 'Anonymous', 'Personal User', 0, 1);

CREATE TABLE `kayapo_bbposts` (
  `post_id` mediumint(8) unsigned NOT NULL auto_increment,
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `forum_id` smallint(5) unsigned NOT NULL default '0',
  `poster_id` mediumint(8) NOT NULL default '0',
  `post_time` int(11) NOT NULL default '0',
  `poster_ip` varchar(8) NOT NULL default '',
  `post_username` varchar(25) default NULL,
  `enable_bbcode` tinyint(1) NOT NULL default '1',
  `enable_html` tinyint(1) NOT NULL default '0',
  `enable_smilies` tinyint(1) NOT NULL default '1',
  `enable_sig` tinyint(1) NOT NULL default '1',
  `post_edit_time` int(11) default NULL,
  `post_edit_count` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`post_id`),
  KEY `forum_id` (`forum_id`),
  KEY `topic_id` (`topic_id`),
  KEY `poster_id` (`poster_id`),
  KEY `post_time` (`post_time`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_bbposts_text` (
  `post_id` mediumint(8) unsigned NOT NULL default '0',
  `bbcode_uid` varchar(10) NOT NULL default '',
  `post_subject` varchar(60) default NULL,
  `post_text` text,
  PRIMARY KEY  (`post_id`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_bbprivmsgs` (
  `privmsgs_id` mediumint(8) unsigned NOT NULL auto_increment,
  `privmsgs_type` tinyint(4) NOT NULL default '0',
  `privmsgs_subject` varchar(255) NOT NULL default '0',
  `privmsgs_from_userid` mediumint(8) NOT NULL default '0',
  `privmsgs_to_userid` mediumint(8) NOT NULL default '0',
  `privmsgs_date` int(11) NOT NULL default '0',
  `privmsgs_ip` varchar(8) NOT NULL default '',
  `privmsgs_enable_bbcode` tinyint(1) NOT NULL default '1',
  `privmsgs_enable_html` tinyint(1) NOT NULL default '0',
  `privmsgs_enable_smilies` tinyint(1) NOT NULL default '1',
  `privmsgs_attach_sig` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`privmsgs_id`),
  KEY `privmsgs_from_userid` (`privmsgs_from_userid`),
  KEY `privmsgs_to_userid` (`privmsgs_to_userid`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_bbprivmsgs_text` (
  `privmsgs_text_id` mediumint(8) unsigned NOT NULL default '0',
  `privmsgs_bbcode_uid` varchar(10) NOT NULL default '0',
  `privmsgs_text` text,
  PRIMARY KEY  (`privmsgs_text_id`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_bbranks` (
  `rank_id` smallint(5) unsigned NOT NULL auto_increment,
  `rank_title` varchar(50) NOT NULL default '',
  `rank_min` mediumint(8) NOT NULL default '0',
  `rank_max` mediumint(8) NOT NULL default '0',
  `rank_special` tinyint(1) default '0',
  `rank_image` varchar(255) default NULL,
  PRIMARY KEY  (`rank_id`)
) TYPE=MyISAM;

INSERT INTO `kayapo_bbranks` VALUES (1, 'Site Admin', -1, -1, 1, 'modules/Forums/images/ranks/6stars.gif');
INSERT INTO `kayapo_bbranks` VALUES (2, 'Newbie', 1, 0, 0, 'modules/Forums/images/ranks/1star.gif');

CREATE TABLE `kayapo_bbsearch_results` (
  `search_id` int(11) unsigned NOT NULL default '0',
  `session_id` varchar(32) NOT NULL default '',
  `search_array` text NOT NULL,
  PRIMARY KEY  (`search_id`),
  KEY `session_id` (`session_id`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_bbsearch_wordlist` (
  `word_text` varchar(50) binary NOT NULL default '',
  `word_id` mediumint(8) unsigned NOT NULL auto_increment,
  `word_common` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`word_text`),
  KEY `word_id` (`word_id`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_bbsearch_wordmatch` (
  `post_id` mediumint(8) unsigned NOT NULL default '0',
  `word_id` mediumint(8) unsigned NOT NULL default '0',
  `title_match` tinyint(1) NOT NULL default '0',
  KEY `word_id` (`word_id`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_bbsessions` (
  `session_id` char(32) NOT NULL default '',
  `session_user_id` mediumint(8) NOT NULL default '0',
  `session_start` int(11) NOT NULL default '0',
  `session_time` int(11) NOT NULL default '0',
  `session_ip` char(8) NOT NULL default '0',
  `session_page` int(11) NOT NULL default '0',
  `session_logged_in` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`session_id`),
  KEY `session_user_id` (`session_user_id`),
  KEY `session_id_ip_user_id` (`session_id`,`session_ip`,`session_user_id`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_bbsmilies` (
  `smilies_id` smallint(5) unsigned NOT NULL auto_increment,
  `code` varchar(50) default NULL,
  `smile_url` varchar(100) default NULL,
  `emoticon` varchar(75) default NULL,
  PRIMARY KEY  (`smilies_id`)
) TYPE=MyISAM;

INSERT INTO `kayapo_bbsmilies` VALUES (1, ':D', 'icon_biggrin.gif', 'Very Happy');
INSERT INTO `kayapo_bbsmilies` VALUES (2, ':-D', 'icon_biggrin.gif', 'Very Happy');
INSERT INTO `kayapo_bbsmilies` VALUES (3, ':grin:', 'icon_biggrin.gif', 'Very Happy');
INSERT INTO `kayapo_bbsmilies` VALUES (4, ':)', 'icon_smile.gif', 'Smile');
INSERT INTO `kayapo_bbsmilies` VALUES (5, ':-)', 'icon_smile.gif', 'Smile');
INSERT INTO `kayapo_bbsmilies` VALUES (6, ':smile:', 'icon_smile.gif', 'Smile');
INSERT INTO `kayapo_bbsmilies` VALUES (7, ':(', 'icon_sad.gif', 'Sad');
INSERT INTO `kayapo_bbsmilies` VALUES (8, ':-(', 'icon_sad.gif', 'Sad');
INSERT INTO `kayapo_bbsmilies` VALUES (9, ':sad:', 'icon_sad.gif', 'Sad');
INSERT INTO `kayapo_bbsmilies` VALUES (10, ':o', 'icon_surprised.gif', 'Surprised');
INSERT INTO `kayapo_bbsmilies` VALUES (11, ':-o', 'icon_surprised.gif', 'Surprised');
INSERT INTO `kayapo_bbsmilies` VALUES (12, ':eek:', 'icon_surprised.gif', 'Surprised');
INSERT INTO `kayapo_bbsmilies` VALUES (13, '8O', 'icon_eek.gif', 'Shocked');
INSERT INTO `kayapo_bbsmilies` VALUES (14, '8-O', 'icon_eek.gif', 'Shocked');
INSERT INTO `kayapo_bbsmilies` VALUES (15, ':shock:', 'icon_eek.gif', 'Shocked');
INSERT INTO `kayapo_bbsmilies` VALUES (16, ':?', 'icon_confused.gif', 'Confused');
INSERT INTO `kayapo_bbsmilies` VALUES (17, ':-?', 'icon_confused.gif', 'Confused');
INSERT INTO `kayapo_bbsmilies` VALUES (18, ':???:', 'icon_confused.gif', 'Confused');
INSERT INTO `kayapo_bbsmilies` VALUES (19, '8)', 'icon_cool.gif', 'Cool');
INSERT INTO `kayapo_bbsmilies` VALUES (20, '8-)', 'icon_cool.gif', 'Cool');
INSERT INTO `kayapo_bbsmilies` VALUES (21, ':cool:', 'icon_cool.gif', 'Cool');
INSERT INTO `kayapo_bbsmilies` VALUES (22, ':lol:', 'icon_lol.gif', 'Laughing');
INSERT INTO `kayapo_bbsmilies` VALUES (23, ':x', 'icon_mad.gif', 'Mad');
INSERT INTO `kayapo_bbsmilies` VALUES (24, ':-x', 'icon_mad.gif', 'Mad');
INSERT INTO `kayapo_bbsmilies` VALUES (25, ':mad:', 'icon_mad.gif', 'Mad');
INSERT INTO `kayapo_bbsmilies` VALUES (26, ':P', 'icon_razz.gif', 'Razz');
INSERT INTO `kayapo_bbsmilies` VALUES (27, ':-P', 'icon_razz.gif', 'Razz');
INSERT INTO `kayapo_bbsmilies` VALUES (28, ':razz:', 'icon_razz.gif', 'Razz');
INSERT INTO `kayapo_bbsmilies` VALUES (29, ':oops:', 'icon_redface.gif', 'Embarassed');
INSERT INTO `kayapo_bbsmilies` VALUES (30, ':cry:', 'icon_cry.gif', 'Crying or Very sad');
INSERT INTO `kayapo_bbsmilies` VALUES (31, ':evil:', 'icon_evil.gif', 'Evil or Very Mad');
INSERT INTO `kayapo_bbsmilies` VALUES (32, ':twisted:', 'icon_twisted.gif', 'Twisted Evil');
INSERT INTO `kayapo_bbsmilies` VALUES (33, ':roll:', 'icon_rolleyes.gif', 'Rolling Eyes');
INSERT INTO `kayapo_bbsmilies` VALUES (34, ':wink:', 'icon_wink.gif', 'Wink');
INSERT INTO `kayapo_bbsmilies` VALUES (35, ';)', 'icon_wink.gif', 'Wink');
INSERT INTO `kayapo_bbsmilies` VALUES (36, ';-)', 'icon_wink.gif', 'Wink');
INSERT INTO `kayapo_bbsmilies` VALUES (37, ':!:', 'icon_exclaim.gif', 'Exclamation');
INSERT INTO `kayapo_bbsmilies` VALUES (38, ':?:', 'icon_question.gif', 'Question');
INSERT INTO `kayapo_bbsmilies` VALUES (39, ':idea:', 'icon_idea.gif', 'Idea');
INSERT INTO `kayapo_bbsmilies` VALUES (40, ':arrow:', 'icon_arrow.gif', 'Arrow');
INSERT INTO `kayapo_bbsmilies` VALUES (41, ':|', 'icon_neutral.gif', 'Neutral');
INSERT INTO `kayapo_bbsmilies` VALUES (42, ':-|', 'icon_neutral.gif', 'Neutral');
INSERT INTO `kayapo_bbsmilies` VALUES (43, ':neutral:', 'icon_neutral.gif', 'Neutral');
INSERT INTO `kayapo_bbsmilies` VALUES (44, ':mrgreen:', 'icon_mrgreen.gif', 'Mr. Green');

CREATE TABLE `kayapo_bbthemes` (
  `themes_id` mediumint(8) unsigned NOT NULL auto_increment,
  `template_name` varchar(30) NOT NULL default '',
  `style_name` varchar(30) NOT NULL default '',
  `head_stylesheet` varchar(100) default NULL,
  `body_background` varchar(100) default NULL,
  `body_bgcolor` varchar(6) default NULL,
  `body_text` varchar(6) default NULL,
  `body_link` varchar(6) default NULL,
  `body_vlink` varchar(6) default NULL,
  `body_alink` varchar(6) default NULL,
  `body_hlink` varchar(6) default NULL,
  `tr_color1` varchar(6) default NULL,
  `tr_color2` varchar(6) default NULL,
  `tr_color3` varchar(6) default NULL,
  `tr_class1` varchar(25) default NULL,
  `tr_class2` varchar(25) default NULL,
  `tr_class3` varchar(25) default NULL,
  `th_color1` varchar(6) default NULL,
  `th_color2` varchar(6) default NULL,
  `th_color3` varchar(6) default NULL,
  `th_class1` varchar(25) default NULL,
  `th_class2` varchar(25) default NULL,
  `th_class3` varchar(25) default NULL,
  `td_color1` varchar(6) default NULL,
  `td_color2` varchar(6) default NULL,
  `td_color3` varchar(6) default NULL,
  `td_class1` varchar(25) default NULL,
  `td_class2` varchar(25) default NULL,
  `td_class3` varchar(25) default NULL,
  `fontface1` varchar(50) default NULL,
  `fontface2` varchar(50) default NULL,
  `fontface3` varchar(50) default NULL,
  `fontsize1` tinyint(4) default NULL,
  `fontsize2` tinyint(4) default NULL,
  `fontsize3` tinyint(4) default NULL,
  `fontcolor1` varchar(6) default NULL,
  `fontcolor2` varchar(6) default NULL,
  `fontcolor3` varchar(6) default NULL,
  `span_class1` varchar(25) default NULL,
  `span_class2` varchar(25) default NULL,
  `span_class3` varchar(25) default NULL,
  `img_size_poll` smallint(5) unsigned default NULL,
  `img_size_privmsg` smallint(5) unsigned default NULL,
  PRIMARY KEY  (`themes_id`)
) TYPE=MyISAM;

INSERT INTO `kayapo_bbthemes` VALUES (2, 'subSilver', 'CNB', 'forums', '', 'FFFFFF', '000000', '000000', '000000', 'FF0000', 'F44903', 'ECECEC', 'CACCCB', 'CACCCB', '', '', '', 'ECECEC', 'CACCCB', 'ECECEC', '', '', '', 'A3A2A2', 'ECECEC', 'ECECEC', '', '', '', 'Verdana', 'Arial', 'Sans-Serif', 10, 11, 10, '000000', '000000', 'F44903', '', '', '', NULL, NULL);

CREATE TABLE `kayapo_bbthemes_name` (
  `themes_id` smallint(5) unsigned NOT NULL default '0',
  `tr_color1_name` char(50) default NULL,
  `tr_color2_name` char(50) default NULL,
  `tr_color3_name` char(50) default NULL,
  `tr_class1_name` char(50) default NULL,
  `tr_class2_name` char(50) default NULL,
  `tr_class3_name` char(50) default NULL,
  `th_color1_name` char(50) default NULL,
  `th_color2_name` char(50) default NULL,
  `th_color3_name` char(50) default NULL,
  `th_class1_name` char(50) default NULL,
  `th_class2_name` char(50) default NULL,
  `th_class3_name` char(50) default NULL,
  `td_color1_name` char(50) default NULL,
  `td_color2_name` char(50) default NULL,
  `td_color3_name` char(50) default NULL,
  `td_class1_name` char(50) default NULL,
  `td_class2_name` char(50) default NULL,
  `td_class3_name` char(50) default NULL,
  `fontface1_name` char(50) default NULL,
  `fontface2_name` char(50) default NULL,
  `fontface3_name` char(50) default NULL,
  `fontsize1_name` char(50) default NULL,
  `fontsize2_name` char(50) default NULL,
  `fontsize3_name` char(50) default NULL,
  `fontcolor1_name` char(50) default NULL,
  `fontcolor2_name` char(50) default NULL,
  `fontcolor3_name` char(50) default NULL,
  `span_class1_name` char(50) default NULL,
  `span_class2_name` char(50) default NULL,
  `span_class3_name` char(50) default NULL,
  PRIMARY KEY  (`themes_id`)
) TYPE=MyISAM;

INSERT INTO `kayapo_bbthemes_name` VALUES (2, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

CREATE TABLE `kayapo_bbtopics` (
  `topic_id` mediumint(8) unsigned NOT NULL auto_increment,
  `forum_id` smallint(8) unsigned NOT NULL default '0',
  `topic_title` char(60) NOT NULL default '',
  `topic_poster` mediumint(8) NOT NULL default '0',
  `topic_time` int(11) NOT NULL default '0',
  `topic_views` mediumint(8) unsigned NOT NULL default '0',
  `topic_replies` mediumint(8) unsigned NOT NULL default '0',
  `topic_status` tinyint(3) NOT NULL default '0',
  `topic_vote` tinyint(1) NOT NULL default '0',
  `topic_type` tinyint(3) NOT NULL default '0',
  `topic_last_post_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_first_post_id` mediumint(8) unsigned NOT NULL default '0',
  `topic_moved_id` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`topic_id`),
  KEY `forum_id` (`forum_id`),
  KEY `topic_moved_id` (`topic_moved_id`),
  KEY `topic_status` (`topic_status`),
  KEY `topic_type` (`topic_type`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_bbtopics_watch` (
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `user_id` mediumint(8) NOT NULL default '0',
  `notify_status` tinyint(1) NOT NULL default '0',
  KEY `topic_id` (`topic_id`),
  KEY `user_id` (`user_id`),
  KEY `notify_status` (`notify_status`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_bbuser_group` (
  `group_id` mediumint(8) NOT NULL default '0',
  `user_id` mediumint(8) NOT NULL default '0',
  `user_pending` tinyint(1) default NULL,
  KEY `group_id` (`group_id`),
  KEY `user_id` (`user_id`)
) TYPE=MyISAM;

INSERT INTO `kayapo_bbuser_group` VALUES (1, -1, 0);

CREATE TABLE `kayapo_bbvote_desc` (
  `vote_id` mediumint(8) unsigned NOT NULL auto_increment,
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `vote_text` text NOT NULL,
  `vote_start` int(11) NOT NULL default '0',
  `vote_length` int(11) NOT NULL default '0',
  PRIMARY KEY  (`vote_id`),
  KEY `topic_id` (`topic_id`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_bbvote_results` (
  `vote_id` mediumint(8) unsigned NOT NULL default '0',
  `vote_option_id` tinyint(4) unsigned NOT NULL default '0',
  `vote_option_text` varchar(255) NOT NULL default '',
  `vote_result` int(11) NOT NULL default '0',
  KEY `vote_option_id` (`vote_option_id`),
  KEY `vote_id` (`vote_id`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_bbvote_voters` (
  `vote_id` mediumint(8) unsigned NOT NULL default '0',
  `vote_user_id` mediumint(8) NOT NULL default '0',
  `vote_user_ip` char(8) NOT NULL default '',
  KEY `vote_id` (`vote_id`),
  KEY `vote_user_id` (`vote_user_id`),
  KEY `vote_user_ip` (`vote_user_ip`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_bbwords` (
  `word_id` mediumint(8) unsigned NOT NULL auto_increment,
  `word` char(100) NOT NULL default '',
  `replacement` char(100) NOT NULL default '',
  PRIMARY KEY  (`word_id`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_blocks` (
  `bid` int(10) NOT NULL auto_increment,
  `bkey` varchar(15) NOT NULL default '',
  `title` varchar(60) NOT NULL default '',
  `content` text NOT NULL,
  `url` varchar(200) NOT NULL default '',
  `bposition` char(1) NOT NULL default '',
  `weight` int(10) NOT NULL default '1',
  `active` int(1) NOT NULL default '1',
  `refresh` int(10) NOT NULL default '0',
  `time` varchar(14) NOT NULL default '0',
  `blanguage` varchar(30) NOT NULL default '',
  `blockfile` varchar(255) NOT NULL default '',
  `view` int(1) NOT NULL default '0',
  `groups` text NOT NULL,
  `expire` varchar(14) NOT NULL default '0',
  `action` char(1) NOT NULL default '',
  `subscription` int(1) NOT NULL default '0',
  PRIMARY KEY  (`bid`),
  KEY `bid` (`bid`),
  KEY `title` (`title`)
) TYPE=MyISAM;

INSERT INTO `kayapo_blocks` VALUES (1, '', 'Módulos', '', '', 'l', 2, 1, 0, '', '', 'block-Modules.php', 0, '', '0', 'd', 0);
INSERT INTO `kayapo_blocks` VALUES (2, 'admin', 'Administração', '<strong><big>·</big></strong> <a href="admin.php">Menu de Administração</a><br>\r\n<strong><big>·</big></strong> <a href="admin.php?op=FCKadminStory">Nova Notícia</a><br>\r\n<strong><big>·</big></strong> <a href="admin.php?op=create">Alterar Enquete</a><br>\r\n<strong><big>·</big></strong> <a href="admin.php?op=content">Inserir Conteúdo</a><br>\r\n<strong><big>·</big></strong> <a href="admin.php?op=logout">Logout</a><center>', '', 'l', 1, 1, 0, '985591188', '', '', 2, '', '0', 'd', 0);
INSERT INTO `kayapo_blocks` VALUES (3, '', 'Quem está on-line?', '', '', 'l', 3, 1, 0, '', '', 'block-Who_is_Online.php', 0, '', '0', 'd', 0);
INSERT INTO `kayapo_blocks` VALUES (4, '', 'Notícias CNB', '<font class="content"><strong><big>&middot;</big></strong><a href="http://phpnuke.org.br/modules.php?name=News&amp;file=article&amp;sid=1578" 
target="new">Gates, da Microsoft, quer se reunir com presidente Lula</a><br>\n<strong><big>&middot;</big></strong><a href="http://phpnuke.org.br/modules.php?name=News&amp;file=article&amp;sid=1577" target="new">Nuke Lite 1.0</a><br>\n<strong><big>&middot;</big></strong><a href="http://phpnuke.org.br/modules.php?name=News&amp;file=article&amp;sid=1576" target="new">Bloco Fórum Invision p/ Nukes</a><br>\n<strong><big>&middot;</big></strong><a href="http://phpnuke.org.br/modules.php?name=News&amp;file=article&amp;sid=1575" target="new">Procura-se Webmaster com experiência em NUKE para novo projeto de portal p2p.</a><br>\n<strong><big>&middot;</big></strong><a href="http://phpnuke.org.br/modules.php?name=News&amp;file=article&amp;sid=1574" target="new">MotoCoder - Mais um Portal em PHP-Nuke</a><br>\n<strong><big>&middot;</big></strong><a href="http://phpnuke.org.br/modules.php?name=News&amp;file=article&amp;sid=1573" target="new">CNB Conteudo 3.0</a><br>\n<strong><big>&middot;</big></strong><a href="http://phpnuke.org.br/modules.php?name=News&amp;file=article&amp;sid=1572" target="new">Scripts de Manipulação de Contas de Email no CPANEL</a><br>\n<strong><big>&middot;</big></strong><a href="http://phpnuke.org.br/modules.php?name=News&amp;file=article&amp;sid=1571" target="new">Tela azul aparece durante conferência de Gates</a><br>\n<strong><big>&middot;</big></strong><a href="http://phpnuke.org.br/modules.php?name=News&amp;file=article&amp;sid=1570" target="new">Antivirus da Microsoft no dia 11/Jan ?</a><br>\n<strong><big>&middot;</big></strong><a href="http://phpnuke.org.br/modules.php?name=News&amp;file=article&amp;sid=1569" target="new">AMD planeja sua própria conferência para desenvolvedores</a><br>\n', 'http://phpnuke.org.br/backend.php', 'l', 4, 1, 3600, '1106190118', '', '', 0, '', '0', 'd', 0);
INSERT INTO `kayapo_blocks` VALUES (5, 'userbox', 'Bloco do Usuário', '', '', 'r', 1, 1, 0, '', '', '', 1, '', '0', 'd', 0);
INSERT INTO `kayapo_blocks` VALUES (6, '', 'Enquete', '', '', 'r', 2, 1, 0, '', '', 'block-Survey.php', 0, '', '0', 'd', 0);
INSERT INTO `kayapo_blocks` VALUES (7, '', 'Login', '', '', 'r', 3, 1, 3600, '', '', 'block-Login.php', 3, '', '0', 'd', 0);
INSERT INTO `kayapo_blocks` VALUES (8, '', 'Informações', '<center>\r\n<a href="http://phpnuke.org.br"><img src="http://phpnuke.org.br/images/minibanner.gif" border="0" alt="Comunidade PHP-Nuke Brasil 
- CNB"></a>\r\n<br><br>\r\n<a href="http://jigsaw.w3.org/css-validator/validator?uri=http://kayapo.phpnuke.org.br/themes/Kayapo/style/style.css"><img src="images/css.gif" width="88" height="31" 
alt="Nosso CSS é Válido!!!" title="Nosso CSS é Válido!!!" border="0"></a></center>', '', 'r', 6, 1, 0, '', '', '', 0, '', '0', 'd', 0);

CREATE TABLE `kayapo_cnbya_config` (
  `config_name` varchar(255) NOT NULL default '',
  `config_value` longtext,
  UNIQUE KEY `config_name` (`config_name`)
) TYPE=MyISAM;

INSERT INTO `kayapo_cnbya_config` VALUES ('sendaddmail', '0');
INSERT INTO `kayapo_cnbya_config` VALUES ('senddeletemail', '0');
INSERT INTO `kayapo_cnbya_config` VALUES ('allowuserdelete', '0');
INSERT INTO `kayapo_cnbya_config` VALUES ('allowusertheme', '0');
INSERT INTO `kayapo_cnbya_config` VALUES ('allowuserreg', '0');
INSERT INTO `kayapo_cnbya_config` VALUES ('allowmailchange', '0');
INSERT INTO `kayapo_cnbya_config` VALUES ('emailvalidate', '1');
INSERT INTO `kayapo_cnbya_config` VALUES ('requireadmin', '0');
INSERT INTO `kayapo_cnbya_config` VALUES ('servermail', '0');
INSERT INTO `kayapo_cnbya_config` VALUES ('useactivate', '0');
INSERT INTO `kayapo_cnbya_config` VALUES ('usegfxcheck', '0');
INSERT INTO `kayapo_cnbya_config` VALUES ('autosuspend', '0');
INSERT INTO `kayapo_cnbya_config` VALUES ('perpage', '100');
INSERT INTO `kayapo_cnbya_config` VALUES ('expiring', '86400');
INSERT INTO `kayapo_cnbya_config` VALUES ('nick_min', '4');
INSERT INTO `kayapo_cnbya_config` VALUES ('nick_max', '20');
INSERT INTO `kayapo_cnbya_config` VALUES ('pass_min', '4');
INSERT INTO `kayapo_cnbya_config` VALUES ('pass_max', '20');
INSERT INTO `kayapo_cnbya_config` VALUES ('bad_mail', 'yoursite.com\r\nmysite.com');
INSERT INTO `kayapo_cnbya_config` VALUES ('bad_nick', 'adm\r\nadmin\r\nanonimo\r\nanonymous\r\nanónimo\r\ngod\r\nlinux\r\nnobody\r\noperator\r\nroot\r\nstaff\r\nwebmaster');
INSERT INTO `kayapo_cnbya_config` VALUES ('coppa', '0');
INSERT INTO `kayapo_cnbya_config` VALUES ('tos', '0');
INSERT INTO `kayapo_cnbya_config` VALUES ('tosall', '1');
INSERT INTO `kayapo_cnbya_config` VALUES ('cookiecheck', '1');
INSERT INTO `kayapo_cnbya_config` VALUES ('cookiecleaner', '1');
INSERT INTO `kayapo_cnbya_config` VALUES ('cookietimelife', '2592000');
INSERT INTO `kayapo_cnbya_config` VALUES ('cookiepath', '');
INSERT INTO `kayapo_cnbya_config` VALUES ('cookieinactivity', '-');
INSERT INTO `kayapo_cnbya_config` VALUES ('autosuspendmain', '0');
INSERT INTO `kayapo_cnbya_config` VALUES ('codesize', '6');
INSERT INTO `kayapo_cnbya_config` VALUES ('version', '4.4.0 b2');

CREATE TABLE `kayapo_cnbya_field` (
  `fid` int(10) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default 'field',
  `value` varchar(255) default NULL,
  `size` int(3) default NULL,
  `need` int(1) NOT NULL default '1',
  `pos` int(3) default NULL,
  `public` int(1) NOT NULL default '1',
  PRIMARY KEY  (`fid`),
  KEY `fid` (`fid`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_cnbya_value` (
  `vid` int(10) NOT NULL auto_increment,
  `uid` int(10) NOT NULL default '0',
  `fid` int(10) NOT NULL default '0',
  `value` varchar(255) default NULL,
  PRIMARY KEY  (`vid`),
  KEY `vid` (`vid`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_cnbya_value_temp` (
  `vid` int(10) NOT NULL auto_increment,
  `uid` int(10) NOT NULL default '0',
  `fid` int(10) NOT NULL default '0',
  `value` varchar(255) default NULL,
  PRIMARY KEY  (`vid`),
  KEY `vid` (`vid`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_comments` (
  `tid` int(11) NOT NULL auto_increment,
  `pid` int(11) NOT NULL default '0',
  `sid` int(11) NOT NULL default '0',
  `date` datetime default NULL,
  `name` varchar(60) NOT NULL default '',
  `email` varchar(60) default NULL,
  `url` varchar(60) default NULL,
  `host_name` varchar(60) default NULL,
  `subject` varchar(85) NOT NULL default '',
  `comment` text NOT NULL,
  `score` tinyint(4) NOT NULL default '0',
  `reason` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`tid`),
  KEY `tid` (`tid`),
  KEY `pid` (`pid`),
  KEY `sid` (`sid`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_config` (
  `sitename` varchar(255) NOT NULL default '',
  `nukeurl` varchar(255) NOT NULL default '',
  `site_logo` varchar(255) NOT NULL default '',
  `slogan` varchar(255) NOT NULL default '',
  `startdate` varchar(50) NOT NULL default '',
  `adminmail` varchar(255) NOT NULL default '',
  `anonpost` tinyint(1) NOT NULL default '0',
  `Default_Theme` varchar(255) NOT NULL default '',
  `foot1` text NOT NULL,
  `foot2` text NOT NULL,
  `foot3` text NOT NULL,
  `commentlimit` int(9) NOT NULL default '4096',
  `anonymous` varchar(255) NOT NULL default '',
  `minpass` tinyint(1) NOT NULL default '5',
  `pollcomm` tinyint(1) NOT NULL default '1',
  `articlecomm` tinyint(1) NOT NULL default '1',
  `broadcast_msg` tinyint(1) NOT NULL default '1',
  `my_headlines` tinyint(1) NOT NULL default '1',
  `top` int(3) NOT NULL default '10',
  `storyhome` int(2) NOT NULL default '10',
  `user_news` tinyint(1) NOT NULL default '1',
  `oldnum` int(2) NOT NULL default '30',
  `ultramode` tinyint(1) NOT NULL default '0',
  `banners` tinyint(1) NOT NULL default '1',
  `backend_title` varchar(255) NOT NULL default '',
  `backend_language` varchar(10) NOT NULL default '',
  `language` varchar(100) NOT NULL default '',
  `locale` varchar(10) NOT NULL default '',
  `multilingual` tinyint(1) NOT NULL default '0',
  `useflags` tinyint(1) NOT NULL default '0',
  `notify` tinyint(1) NOT NULL default '0',
  `notify_email` varchar(255) NOT NULL default '',
  `notify_subject` varchar(255) NOT NULL default '',
  `notify_message` varchar(255) NOT NULL default '',
  `notify_from` varchar(255) NOT NULL default '',
  `moderate` tinyint(1) NOT NULL default '0',
  `admingraphic` tinyint(1) NOT NULL default '1',
  `httpref` tinyint(1) NOT NULL default '1',
  `httprefmax` int(5) NOT NULL default '1000',
  `CensorMode` tinyint(1) NOT NULL default '3',
  `CensorReplace` varchar(10) NOT NULL default '',
  `copyright` text NOT NULL,
  `Version_Num` varchar(10) NOT NULL default '',
  PRIMARY KEY  (`sitename`)
) TYPE=MyISAM;

INSERT INTO `kayapo_config` VALUES ('PHP-Nuke 7.5  -  CNB KAYAP&Oacute;', 'http://phpnuke.org.br', 'logo.gif', 'Melhorando a cada dia', 'Dezembro de 2004', 'webmaster@phpnuke.org', 0, 'Kayapo', '', '', '', 4096, 'Anônimo', 5, 1, 1, 1, 1, 10, 10, 1, 30, 0, 1, 'PHP-Nuke 7.5 - CNB KAYAP&Oacute;', 'pt-br', 'brazilian', 'pt_BR', 0, 0, 0, 'e-mail@phpnuke.org.br', 'Algu&eacute;m enviou uma not&iacute;cia!!!', 'Olá\r\n\\n\\n\r\nAlguém enviou uma notícia para seu portal!', 'webmaster', 0, 1, 1, 2000, 3, '*****', 'PHP-Nuke Copyright &copy; 2004 by Francisco Burzi. This is free software, and you may redistribute it under the <a href="http://phpnuke.org/files/gpl.txt"><font class="footmsg_l">GPL</font></a>. PHP-Nuke comes with absolutely no warranty, for details, see the <a href="http://phpnuke.org/files/gpl.txt"><font class="footmsg_l">license</font></a>.', '7.5 Kayapó'); 

CREATE TABLE `kayapo_confirm` (
  `confirm_id` char(32) NOT NULL default '',
  `session_id` char(32) NOT NULL default '',
  `code` char(6) NOT NULL default '',
  PRIMARY KEY  (`session_id`,`confirm_id`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_counter` (
  `type` varchar(80) NOT NULL default '',
  `var` varchar(80) NOT NULL default '',
  `count` int(10) unsigned NOT NULL default '0'
) TYPE=MyISAM;

INSERT INTO `kayapo_counter` VALUES ('total', 'hits', 0);
INSERT INTO `kayapo_counter` VALUES ('browser', 'WebTV', 0);
INSERT INTO `kayapo_counter` VALUES ('browser', 'Lynx', 0);
INSERT INTO `kayapo_counter` VALUES ('browser', 'MSIE', 0);
INSERT INTO `kayapo_counter` VALUES ('browser', 'Opera', 0);
INSERT INTO `kayapo_counter` VALUES ('browser', 'Konqueror', 0);
INSERT INTO `kayapo_counter` VALUES ('browser', 'Netscape', 0);
INSERT INTO `kayapo_counter` VALUES ('browser', 'Bot', 0);
INSERT INTO `kayapo_counter` VALUES ('browser', 'Other', 0);
INSERT INTO `kayapo_counter` VALUES ('os', 'Windows', 0);
INSERT INTO `kayapo_counter` VALUES ('os', 'Linux', 0);
INSERT INTO `kayapo_counter` VALUES ('os', 'Mac', 0);
INSERT INTO `kayapo_counter` VALUES ('os', 'FreeBSD', 0);
INSERT INTO `kayapo_counter` VALUES ('os', 'SunOS', 0);
INSERT INTO `kayapo_counter` VALUES ('os', 'IRIX', 0);
INSERT INTO `kayapo_counter` VALUES ('os', 'BeOS', 0);
INSERT INTO `kayapo_counter` VALUES ('os', 'OS/2', 0);
INSERT INTO `kayapo_counter` VALUES ('os', 'AIX', 0);
INSERT INTO `kayapo_counter` VALUES ('os', 'Other', 0);

CREATE TABLE `kayapo_encyclopedia` (
  `eid` int(10) NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `description` text NOT NULL,
  `elanguage` varchar(30) NOT NULL default '',
  `active` int(1) NOT NULL default '0',
  PRIMARY KEY  (`eid`),
  KEY `eid` (`eid`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_encyclopedia_text` (
  `tid` int(10) NOT NULL auto_increment,
  `eid` int(10) NOT NULL default '0',
  `title` varchar(255) NOT NULL default '',
  `text` text NOT NULL,
  `counter` int(10) NOT NULL default '0',
  PRIMARY KEY  (`tid`),
  KEY `tid` (`tid`),
  KEY `eid` (`eid`),
  KEY `title` (`title`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_events` (
  `eid` bigint(20) NOT NULL auto_increment,
  `aid` varchar(30) NOT NULL default '',
  `title` varchar(150) default NULL,
  `time` datetime default NULL,
  `hometext` blob,
  `comments` int(11) default '0',
  `counter` mediumint(8) unsigned default NULL,
  `topic` int(3) NOT NULL default '1',
  `informant` varchar(20) NOT NULL default '',
  `eventDate` date NOT NULL default '0000-00-00',
  `endDate` date NOT NULL default '0000-00-00',
  `startTime` time default NULL,
  `endTime` time default NULL,
  `alldayevent` int(1) NOT NULL default '0',
  `barcolor` char(1) default NULL,
  PRIMARY KEY  (`eid`)
) TYPE=MyISAM; 

CREATE TABLE `kayapo_events_comments` (
  `cid` int(10) unsigned NOT NULL auto_increment,
  `eid` int(10) unsigned NOT NULL default '0',
  `comment` varchar(255) NOT NULL default '',
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`cid`),
  UNIQUE KEY `cid` (`cid`),
  KEY `cid_2` (`cid`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_events_queue` (
  `qid` bigint(20) NOT NULL auto_increment,
  `uid` mediumint(9) NOT NULL default '0',
  `uname` varchar(40) NOT NULL default '',
  `title` varchar(150) NOT NULL default '',
  `story` blob,
  `timestamp` datetime NOT NULL default '0000-00-00 00:00:00',
  `topic` varchar(20) NOT NULL default '',
  `eventDate` date NOT NULL default '0000-00-00',
  `endDate` date NOT NULL default '0000-00-00',
  `startTime` time default NULL,
  `endTime` time default NULL,
  `alldayevent` int(1) NOT NULL default '0',
  `barcolor` char(1) default NULL,
  PRIMARY KEY  (`qid`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_faqanswer` (
  `id` tinyint(4) NOT NULL auto_increment,
  `id_cat` tinyint(4) NOT NULL default '0',
  `question` varchar(255) default '',
  `answer` text,
  PRIMARY KEY  (`id`),
  KEY `id` (`id`),
  KEY `id_cat` (`id_cat`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_faqcategories` (
  `id_cat` tinyint(3) NOT NULL auto_increment,
  `categories` varchar(255) default NULL,
  `flanguage` varchar(30) NOT NULL default '',
  PRIMARY KEY  (`id_cat`),
  KEY `id_cat` (`id_cat`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_gallery_categories` (
  `gallid` int(11) NOT NULL auto_increment,
  `gallname` varchar(30) default NULL,
  `gallimg` varchar(50) default NULL,
  `galloc` blob,
  `description` blob,
  `parent` int(11) default NULL,
  `visible` int(11) default NULL,
  `template` int(11) default NULL,
  `thumbwidth` int(11) default NULL,
  `numcol` int(11) default NULL,
  `total` int(11) default NULL,
  `lastadd` date default NULL,
  PRIMARY KEY  (`gallid`)
) TYPE=MyISAM;

INSERT INTO `kayapo_gallery_categories` VALUES (2, 'Kayapo', 'logo.gif', 0x6b617961706f, 0x496d6167656e7320646520cd6e64696f73204b61796170f3732e, -1, 2, 0, 135, 3, 1, '2004-12-21'); 

CREATE TABLE `kayapo_gallery_comments` (
  `cid` int(11) NOT NULL auto_increment,
  `pid` int(11) default NULL,
  `comment` blob,
  `date` datetime default NULL,
  `name` varchar(255) default NULL,
  `member` int(11) default NULL,
  PRIMARY KEY  (`cid`),
  KEY `pid` (`pid`)
) TYPE=MyISAM;

INSERT INTO `kayapo_gallery_comments` VALUES (1, 1, 0x636f6f6c20617274, '2000-12-19 12:18:53', 'dgrabows', 0);
INSERT INTO `kayapo_gallery_comments` VALUES (2, 1, 0x476f6f64206a6f622062757420636f756c6420626520626574746572, '2001-05-18 17:50:04', 'MarsIsHere', 0);
INSERT INTO `kayapo_gallery_comments` VALUES (3, 1, 0x457420766f696ce0212121, '2001-05-18 17:58:51', 'Webmaster', 1);
INSERT INTO `kayapo_gallery_comments` VALUES (4, 1, 0x726f726f726f, '2001-09-24 21:18:10', 'tororo', 0);

CREATE TABLE `kayapo_gallery_media_class` (
  `id` int(11) NOT NULL auto_increment,
  `class` varchar(10) default NULL,
  PRIMARY KEY  (`id`)
) TYPE=MyISAM;

INSERT INTO `kayapo_gallery_media_class` VALUES (1, 'Image');
INSERT INTO `kayapo_gallery_media_class` VALUES (2, 'Audio');
INSERT INTO `kayapo_gallery_media_class` VALUES (3, 'Video');

CREATE TABLE `kayapo_gallery_media_types` (
  `extension` varchar(10) NOT NULL default '',
  `description` blob,
  `filetype` varchar(20) default NULL,
  `displaytag` blob,
  `thumbnail` varchar(255) default NULL,
  PRIMARY KEY  (`extension`)
) TYPE=MyISAM;

INSERT INTO `kayapo_gallery_media_types` VALUES ('bmp', 0x496d6167652f424d50, '1', 0x3c696d67207372633d223c3a46494c454e414d453a3e2220626f726465723d22302220616c743d223c3a4445534352495054494f4e3a3e223e, 'image_gif.gif');
INSERT INTO `kayapo_gallery_media_types` VALUES ('gif', 0x496d6167652f474946, '1', 0x3c696d67207372633d223c3a46494c454e414d453a3e2220626f726465723d2231222077696474683d223c3a57494454483a3e22206865696768743d223c3a4845494748543a3e2220616c743d223c3a4445534352495054494f4e3a3e223e, 'image_gif.gif');
INSERT INTO `kayapo_gallery_media_types` VALUES ('jpg', 0x496d6167652f4a504547, '1', 0x3c696d67207372633d223c3a46494c454e414d453a3e2220626f726465723d2231222077696474683d223c3a57494454483a3e22206865696768743d223c3a4845494748543a3e2220616c743d223c3a4445534352495054494f4e3a3e223e, 'image_jpg.gif');
INSERT INTO `kayapo_gallery_media_types` VALUES ('png', 0x496d6167652f504e47, '1', 0x3c696d67207372633d223c3a46494c454e414d453a3e2220626f726465723d2231222077696474683d223c3a57494454483a3e22206865696768743d223c3a4845494748543a3e2220616c743d223c3a4445534352495054494f4e3a3e223e, 'image_png.gif');
INSERT INTO `kayapo_gallery_media_types` VALUES ('mov', 0x566964656f2f517569636b74696d65, '3', 0x3c656d62656420636f6e74726f6c6c65723d2274727565222077696474683d223c3a57494454483a3e22206865696768743d223c3a4845494748543a3e22207372633d223c3a46494c454e414d453a3e2220626f726465723d22302220706c7567696e73706167653d22687474703a2f2f7777772e6170706c652e636f6d2f717569636b74696d652f646f776e6c6f61642f696e646578742e68746d6c223e3c2f656d6265643e, 'video_mov.gif');
INSERT INTO `kayapo_gallery_media_types` VALUES ('avi', 0x566964656f2f415649, '3', 0x3c656d626564207372633d223c3a46494c454e414d453a3e22207769647468203d2236343022206865696768743d2234383022207a6f6f6d3d22313030252220636f6e74726f6c6c65723d2274727565222073686f77646973706c61793d2230222073686f77636f6e74726f6c3d223122206175746f73697a653d2230222073686f777374617475736261723d22312220626f726465723d22302220747970653d226170706c69636174696f6e2f782d6d706c6179657232223e3c2f656d6265643e, 'video_avi.gif');
INSERT INTO `kayapo_gallery_media_types` VALUES ('mpg', 0x566964656f2f4d504547, '3', 0x3c656d626564207372633d223c3a46494c454e414d453a3e22207769647468203d2236343022206865696768743d2234383022207a6f6f6d3d22313030252220636f6e74726f6c6c65723d2274727565222073686f77646973706c61793d2230222073686f77636f6e74726f6c3d223122206175746f73697a653d2230222073686f777374617475736261723d22312220626f726465723d22302220747970653d226170706c69636174696f6e2f782d6d706c6179657232223e3c2f656d6265643e, 'video_mpg.gif');
INSERT INTO `kayapo_gallery_media_types` VALUES ('mp3', 0x417564696f2f4d5033, '2', 0x3c656d626564207372633d223c3a46494c454e414d453a3e2220747970653d226170706c69636174696f6e2f782d6d706c6179657232222068696464656e3d2266616c736522206175746f73746172743d227472756522206c6f6f703d2266616c7365222073686f77646973706c61793d2230222073686f77636f6e74726f6c3d223122206175746f73697a653d2230222073686f777374617475736261723d22312220626f726465723d223022203c2f656d6265643e, 'audio_mp3.gif');
INSERT INTO `kayapo_gallery_media_types` VALUES ('mid', 0x417564696f2f4d494449, '2', 0x3c656d626564207372633d223c3a46494c454e414d453a3e2220747970653d22617564696f2f6d696469222068696464656e3d2266616c736522206175746f73746172743d227472756522206c6f6f703d2266616c7365222073686f77646973706c61793d2230222073686f77636f6e74726f6c3d223122206175746f73697a653d2230222073686f777374617475736261723d22312220626f726465723d223022203c2f656d6265643e, 'audio_mid.gif');
INSERT INTO `kayapo_gallery_media_types` VALUES ('swf', 0x566964656f2f466c617368, '3', 0x3c656d626564207372633d223c3a46494c454e414d453a3e2220706c7567696e73706167653d22687474703a2f2f7777772e6d6163726f6d656469612e636f6d2f73686f636b776176652f646f776e6c6f61642f696e6465782e6367693f50315f50726f645f56657273696f6e3d53686f636b77617665466c6173682220747970653d226170706c69636174696f6e2f782d73686f636b776176652d666c617368222077696474683d223c3a57494454483a3e22206865696768743d223c3a4845494748543a3e2220706c61793d227472756522206c6f6f703d227472756522207175616c6974793d226869676822207363616c653d2273686f77616c6c22206d656e753d2274727565223e3c2f656d6265643e, 'video_swf.gif');
INSERT INTO `kayapo_gallery_media_types` VALUES ('wma', 0x417564696f2f574d41, '2', 0x3c656d626564207372633d223c3a46494c454e414d453a3e2220747970653d22617564696f2f6d696469222068696464656e3d2266616c736522206175746f73746172743d227472756522206c6f6f703d2266616c7365222073686f77646973706c61793d2230222073686f77636f6e74726f6c3d223122206175746f73697a653d2230222073686f777374617475736261723d22312220626f726465723d223022203c2f656d6265643e, 'audio_mid.gif');
INSERT INTO `kayapo_gallery_media_types` VALUES ('wmv', 0x566964656f2f4d6f766965, '3', 0x3c656d626564207372633d223c3a46494c454e414d453a3e2220207769647468203d2236343022206865696768743d223438302220636f6e74726f6c6c65723d2274727565222073686f77646973706c61793d2230222073686f77636f6e74726f6c3d223122206175746f73697a653d2230222073686f777374617475736261723d22312220626f726465723d22302220747970653d226170706c69636174696f6e2f782d6d706c6179657232223e3c2f656d6265643e, 'video_mpg.gif');

CREATE TABLE `kayapo_gallery_pictures` (
  `pid` int(11) NOT NULL auto_increment,
  `gid` int(11) default NULL,
  `img` varchar(255) default NULL,
  `counter` int(11) default NULL,
  `submitter` varchar(24) default NULL,
  `date` datetime default NULL,
  `name` varchar(255) default NULL,
  `description` blob,
  `votes` int(11) default NULL,
  `rate` double default NULL,
  `extension` varchar(10) default NULL,
  `width` int(11) default NULL,
  `height` int(11) default NULL,
  PRIMARY KEY  (`pid`),
  KEY `gid` (`gid`),
  KEY `counter` (`counter`),
  KEY `date` (`date`),
  KEY `votes` (`votes`),
  KEY `rate` (`rate`)
) TYPE=MyISAM;

INSERT INTO `kayapo_gallery_pictures` VALUES (7, 2, 'kayapo-card01.jpg', 16, 'Kayapó', '2004-12-21 10:52:05', 'Kayapo01', 0x496d6167656d20646520756d206a6f76656d20ed6e64696f204b61796170f32e0d0a0d0a4573746120696d6167656d20e920636f72746573696120646520476572686172642050726f6b6f702e, 0, 0, 'jpg', 430, 600);

CREATE TABLE `kayapo_gallery_pictures_newpicture` (
  `pid` int(11) NOT NULL auto_increment,
  `gid` int(11) default NULL,
  `img` varchar(255) default NULL,
  `counter` int(11) default NULL,
  `submitter` varchar(24) default NULL,
  `date` datetime default NULL,
  `name` varchar(255) default NULL,
  `description` blob,
  `votes` int(11) default NULL,
  `rate` double default NULL,
  `extension` varchar(10) default NULL,
  `width` int(11) default NULL,
  `height` int(11) default NULL,
  PRIMARY KEY  (`pid`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_gallery_rate_check` (
  `ip` varchar(20) default NULL,
  `time` varchar(14) default NULL,
  `pid` int(11) default NULL,
  KEY `ip` (`ip`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_gallery_template_types` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) default NULL,
  `type` int(11) default NULL,
  `templateCategory` blob,
  `templatePictures` blob,
  `templateCSS` blob,
  PRIMARY KEY  (`id`),
  KEY `type` (`type`)
) TYPE=MyISAM;

INSERT INTO `kayapo_gallery_template_types` VALUES (1, 'Default Main Page Template', 1, 0x3c7461626c6520616c69676e3d2263656e746572223e0d0a3c74723e0d0a093c746420636f6c7370616e3d2232223e0d0a09093c3a47414c4c4e414d453a3e0d0a093c2f74643e0d0a3c2f74723e0d0a3c74723e0d0a093c74643e0d0a09093c3a494d4147453a3e0d0a093c2f74643e0d0a093c74642076616c69676e3d22746f702220616c69676e3d226c656674223e0d0a09093c3a4445534352495054494f4e3a3e0d0a093c2f74643e0d0a3c2f74723e0d0a3c2f7461626c653e, 0x32, 0x2e636f6d6d6f6e5f746578745f626c61636b207b746578742d636f6c6f723a233030303030307d0d0a2e636f6d6d6f6e5f746578745f7768697465207b746578742d636f6c6f723a236666666666667d);
INSERT INTO `kayapo_gallery_template_types` VALUES (2, 'Default', 2, 0x3c7461626c6520626f726465723d2230222063656c6c70616464696e673d2230222063656c6c73706163696e673d2230223e0d0a3c74723e0d0a093c74643e0d0a09093c3a494d4147453a3e0d0a093c2f74643e0d0a093c74642076616c69676e3d22746f70223e0d0a09093c703e0d0a090909093c7461626c653e0d0a090909093c74723e0d0a09090909093c746420616c69676e3d2263656e746572223e0d0a0909090909093c3a444154453a3e0d0a09090909093c2f74643e0d0a09090909093c746420616c69676e3d2263656e746572223e0d0a0909090909093c3a524154453a3e0d0a09090909093c2f74643e0d0a09090909093c746420616c69676e3d2263656e746572223e0d0a0909090909093c3a484954533a3e0d0a09090909093c2f74643e0d0a09090909093c746420616c69676e3d2263656e746572223e0d0a0909090909093c3a4e45573a3e0d0a09090909093c2f74643e0d0a090909093c2f74723e0d0a090909093c2f7461626c653e0d0a09093c2f703e0d0a09093c703e0d0a090909093c3a4445534352495054494f4e3a3e0d0a09093c2f703e0d0a09093c703e0d0a090909093c3a4e42434f4d4d454e54533a3e207c203c3a464f524d41543a3e207c203c3a53495a453a3e0d0a09093c2f703e0d0a093c2f74643e0d0a3c2f74723e0d0a3c2f7461626c653e, 0x3c7461626c653e0d0a3c74723e0d0a093c74642076616c69676e3d22746f702220616c69676e3d2263656e746572223e0d0a09093c3a4e414d4553495a453a3e0d0a09093c62723e3c62723e0d0a09093c5441424c452043656c6c50616464696e673d2230222043656c6c53706163696e673d2230223e0d0a09093c54523e0d0a0909093c54442076616c69676e3d22746f70223e0d0a090909093c3a5355424d49545445523a3e0d0a090909093c3a444154453a3e0d0a090909093c3a484954533a3e0d0a090909093c3a524154453a3e0d0a0909093c2f54443e0d0a09093c2f54523e0d0a09093c2f7461626c653e3c62723e0d0a09093c3a524154494e474241523a3e3c62723e0d0a09093c3a504f5354434152443a3e3c62723e0d0a09093c3a444f574e4c4f41443a3e3c62723e0d0a09093c3a5052494e543a3e0d0a093c2f74643e0d0a093c74642077696474683d223830252220616c69676e3d2263656e746572223e0d0a09093c3a494d4147453a3e0d0a093c2f74643e0d0a3c2f74723e0d0a3c74723e0d0a093c746420636f6c7370616e3d2232223e3c3a4445534352495054494f4e3a3e3c2f74643e0d0a3c2f74723e0d0a3c74723e0d0a093c746420636f6c7370616e3d2232223e0d0a09093c3a434f4d4d454e54533a3e0d0a093c2f74643e0d0a3c2f74723e0d0a3c2f7461626c653e, 0x2e636f6d6d6f6e5f746578745f626c61636b207b746578742d636f6c6f723a233030303030307d0d0a2e636f6d6d6f6e5f746578745f7768697465207b746578742d636f6c6f723a236666666666667d);

CREATE TABLE `kayapo_groups` (
  `id` int(10) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `description` text NOT NULL,
  `points` int(10) NOT NULL default '0',
  KEY `id` (`id`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_groups_points` (
  `id` int(10) NOT NULL auto_increment,
  `points` int(10) NOT NULL default '0',
  KEY `id` (`id`)
) TYPE=MyISAM;

INSERT INTO `kayapo_groups_points` VALUES (1, 0);
INSERT INTO `kayapo_groups_points` VALUES (2, 0);
INSERT INTO `kayapo_groups_points` VALUES (3, 0);
INSERT INTO `kayapo_groups_points` VALUES (4, 0);
INSERT INTO `kayapo_groups_points` VALUES (5, 0);
INSERT INTO `kayapo_groups_points` VALUES (6, 0);
INSERT INTO `kayapo_groups_points` VALUES (7, 0);
INSERT INTO `kayapo_groups_points` VALUES (8, 0);
INSERT INTO `kayapo_groups_points` VALUES (9, 0);
INSERT INTO `kayapo_groups_points` VALUES (10, 0);
INSERT INTO `kayapo_groups_points` VALUES (11, 0);
INSERT INTO `kayapo_groups_points` VALUES (12, 0);
INSERT INTO `kayapo_groups_points` VALUES (13, 0);
INSERT INTO `kayapo_groups_points` VALUES (14, 0);
INSERT INTO `kayapo_groups_points` VALUES (15, 0);
INSERT INTO `kayapo_groups_points` VALUES (16, 0);
INSERT INTO `kayapo_groups_points` VALUES (17, 0);
INSERT INTO `kayapo_groups_points` VALUES (18, 0);
INSERT INTO `kayapo_groups_points` VALUES (19, 0);
INSERT INTO `kayapo_groups_points` VALUES (20, 0);
INSERT INTO `kayapo_groups_points` VALUES (21, 0);

CREATE TABLE `kayapo_headlines` (
  `hid` int(11) NOT NULL auto_increment,
  `sitename` varchar(30) NOT NULL default '',
  `headlinesurl` varchar(200) NOT NULL default '',
  PRIMARY KEY  (`hid`),
  KEY `hid` (`hid`)
) TYPE=MyISAM;

INSERT INTO `kayapo_headlines` VALUES (1, 'AbsoluteGames', 'http://files.gameaholic.com/agfa.rdf');
INSERT INTO `kayapo_headlines` VALUES (2, 'BSDToday', 'http://www.bsdtoday.com/backend/bt.rdf');
INSERT INTO `kayapo_headlines` VALUES (3, 'BrunchingShuttlecocks', 'http://www.brunching.com/brunching.rdf');
INSERT INTO `kayapo_headlines` VALUES (4, 'DailyDaemonNews', 'http://daily.daemonnews.org/ddn.rdf.php3');
INSERT INTO `kayapo_headlines` VALUES (5, 'DigitalTheatre', 'http://www.dtheatre.com/backend.php3?xml=yes');
INSERT INTO `kayapo_headlines` VALUES (6, 'DotKDE', 'http://dot.kde.org/rdf');
INSERT INTO `kayapo_headlines` VALUES (7, 'FreeDOS', 'http://www.freedos.org/channels/rss.cgi');
INSERT INTO `kayapo_headlines` VALUES (8, 'Freshmeat', 'http://freshmeat.net/backend/fm.rdf');
INSERT INTO `kayapo_headlines` VALUES (9, 'Gnome Desktop', 'http://www.gnomedesktop.org/backend.php');
INSERT INTO `kayapo_headlines` VALUES (10, 'HappyPenguin', 'http://happypenguin.org/html/news.rdf');
INSERT INTO `kayapo_headlines` VALUES (11, 'HollywoodBitchslap', 'http://hollywoodbitchslap.com/hbs.rdf');
INSERT INTO `kayapo_headlines` VALUES (12, 'Learning Linux', 'http://www.learninglinux.com/backend.php');
INSERT INTO `kayapo_headlines` VALUES (13, 'LinuxCentral', 'http://linuxcentral.com/backend/lcnew.rdf');
INSERT INTO `kayapo_headlines` VALUES (14, 'LinuxJournal', 'http://www.linuxjournal.com/news.rss');
INSERT INTO `kayapo_headlines` VALUES (15, 'LinuxWeelyNews', 'http://lwn.net/headlines/rss');
INSERT INTO `kayapo_headlines` VALUES (16, 'Listology', 'http://listology.com/recent.rdf');
INSERT INTO `kayapo_headlines` VALUES (17, 'MozillaNewsBot', 'http://www.mozilla.org/newsbot/newsbot.rdf');
INSERT INTO `kayapo_headlines` VALUES (18, 'NewsForge', 'http://www.newsforge.com/newsforge.rdf');
INSERT INTO `kayapo_headlines` VALUES (19, 'NukeResources', 'http://www.nukeresources.com/backend.php');
INSERT INTO `kayapo_headlines` VALUES (20, 'NukeScripts', 'http://www.nukescripts.net/backend.php');
INSERT INTO `kayapo_headlines` VALUES (21, 'PDABuzz', 'http://www.pdabuzz.com/netscape.txt');
INSERT INTO `kayapo_headlines` VALUES (22, 'PHP-Nuke', 'http://phpnuke.org/backend.php');
INSERT INTO `kayapo_headlines` VALUES (23, 'PHP.net', 'http://www.php.net/news.rss');
INSERT INTO `kayapo_headlines` VALUES (24, 'PHPBuilder', 'http://phpbuilder.com/rss_feed.php');
INSERT INTO `kayapo_headlines` VALUES (25, 'PerlMonks', 'http://www.perlmonks.org/headlines.rdf');
INSERT INTO `kayapo_headlines` VALUES (26, 'TheNextLevel', 'http://www.the-nextlevel.com/rdf/tnl.rdf');
INSERT INTO `kayapo_headlines` VALUES (27, 'WebReference', 'http://webreference.com/webreference.rdf');

CREATE TABLE `kayapo_journal` (
  `jid` int(11) NOT NULL auto_increment,
  `aid` varchar(30) NOT NULL default '',
  `title` varchar(80) default NULL,
  `bodytext` text NOT NULL,
  `mood` varchar(48) NOT NULL default '',
  `pdate` varchar(48) NOT NULL default '',
  `ptime` varchar(48) NOT NULL default '',
  `status` varchar(48) NOT NULL default '',
  `mtime` varchar(48) NOT NULL default '',
  `mdate` varchar(48) NOT NULL default '',
  PRIMARY KEY  (`jid`),
  KEY `jid` (`jid`),
  KEY `aid` (`aid`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_journal_comments` (
  `cid` int(11) NOT NULL auto_increment,
  `rid` varchar(48) NOT NULL default '',
  `aid` varchar(30) NOT NULL default '',
  `comment` text NOT NULL,
  `pdate` varchar(48) NOT NULL default '',
  `ptime` varchar(48) NOT NULL default '',
  PRIMARY KEY  (`cid`),
  KEY `cid` (`cid`),
  KEY `rid` (`rid`),
  KEY `aid` (`aid`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_journal_stats` (
  `id` int(11) NOT NULL auto_increment,
  `joid` varchar(48) NOT NULL default '',
  `nop` varchar(48) NOT NULL default '',
  `ldp` varchar(24) NOT NULL default '',
  `ltp` varchar(24) NOT NULL default '',
  `micro` varchar(128) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `id` (`id`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_links_categories` (
  `cid` int(11) NOT NULL auto_increment,
  `title` varchar(50) NOT NULL default '',
  `cdescription` text NOT NULL,
  `parentid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`cid`),
  KEY `cid` (`cid`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_links_editorials` (
  `linkid` int(11) NOT NULL default '0',
  `adminid` varchar(60) NOT NULL default '',
  `editorialtimestamp` datetime NOT NULL default '0000-00-00 00:00:00',
  `editorialtext` text NOT NULL,
  `editorialtitle` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`linkid`),
  KEY `linkid` (`linkid`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_links_links` (
  `lid` int(11) NOT NULL auto_increment,
  `cid` int(11) NOT NULL default '0',
  `sid` int(11) NOT NULL default '0',
  `title` varchar(100) NOT NULL default '',
  `url` varchar(100) NOT NULL default '',
  `description` text NOT NULL,
  `date` datetime default NULL,
  `name` varchar(100) NOT NULL default '',
  `email` varchar(100) NOT NULL default '',
  `hits` int(11) NOT NULL default '0',
  `submitter` varchar(60) NOT NULL default '',
  `linkratingsummary` double(6,4) NOT NULL default '0.0000',
  `totalvotes` int(11) NOT NULL default '0',
  `totalcomments` int(11) NOT NULL default '0',
  PRIMARY KEY  (`lid`),
  KEY `lid` (`lid`),
  KEY `cid` (`cid`),
  KEY `sid` (`sid`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_links_modrequest` (
  `requestid` int(11) NOT NULL auto_increment,
  `lid` int(11) NOT NULL default '0',
  `cid` int(11) NOT NULL default '0',
  `sid` int(11) NOT NULL default '0',
  `title` varchar(100) NOT NULL default '',
  `url` varchar(100) NOT NULL default '',
  `description` text NOT NULL,
  `modifysubmitter` varchar(60) NOT NULL default '',
  `brokenlink` int(3) NOT NULL default '0',
  PRIMARY KEY  (`requestid`),
  UNIQUE KEY `requestid` (`requestid`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_links_newlink` (
  `lid` int(11) NOT NULL auto_increment,
  `cid` int(11) NOT NULL default '0',
  `sid` int(11) NOT NULL default '0',
  `title` varchar(100) NOT NULL default '',
  `url` varchar(100) NOT NULL default '',
  `description` text NOT NULL,
  `name` varchar(100) NOT NULL default '',
  `email` varchar(100) NOT NULL default '',
  `submitter` varchar(60) NOT NULL default '',
  PRIMARY KEY  (`lid`),
  KEY `lid` (`lid`),
  KEY `cid` (`cid`),
  KEY `sid` (`sid`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_links_votedata` (
  `ratingdbid` int(11) NOT NULL auto_increment,
  `ratinglid` int(11) NOT NULL default '0',
  `ratinguser` varchar(60) NOT NULL default '',
  `rating` int(11) NOT NULL default '0',
  `ratinghostname` varchar(60) NOT NULL default '',
  `ratingcomments` text NOT NULL,
  `ratingtimestamp` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`ratingdbid`),
  KEY `ratingdbid` (`ratingdbid`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_main` (
  `main_module` varchar(255) NOT NULL default ''
) TYPE=MyISAM;

INSERT INTO `kayapo_main` VALUES ('News');

CREATE TABLE `kayapo_message` (
  `mid` int(11) NOT NULL auto_increment,
  `title` varchar(100) NOT NULL default '',
  `content` text NOT NULL,
  `date` varchar(14) NOT NULL default '',
  `expire` int(7) NOT NULL default '0',
  `active` int(1) NOT NULL default '1',
  `view` int(1) NOT NULL default '1',
  `groups` text NOT NULL,
  `mlanguage` varchar(30) NOT NULL default '',
  PRIMARY KEY  (`mid`),
  UNIQUE KEY `mid` (`mid`)
) TYPE=MyISAM;

INSERT INTO `kayapo_message` VALUES (1, 'Bem-vindo ao PHP-Nuke CNB 7.5 Kayapó!', 'Este é o PHP-Nuke CNB 7.5 Kayapó, desenvolvido pelos Administradores da Comunidade PHP-Nuke Brasil - 
CNB com o que há 
de melhor para o PHP-Nuke.\r\n<br><br>Para os créditos desta versão, acesse <a href="creditos.php">ESTE ARQUIVO</a>.\r\n<br><br>Nesta versão você terá a última versão do PHP-Nuke liberada 
para o público, adicionada de todos as correções de segurança e 
os aplicativos essenciais 
para um 
Portal PHP-Nuke rodar perfeitamente.\r\n<br><br>\r\n<b>Itens incluídos nesta versão:</b>\r\n<br><br>\r\n- PHP-Nuke 7.5 (patch 2.8) chatserv;\r\n<br>\r\n- NSN Sentinel 2.1.2\r\n<br>\r\n- NSN Groups Universal 7.5.1\r\n<br>\r\n- NSN Groups Downloads 7.5\r\n<br>\r\n- CNB Your_Account 4.4\r\n<br>\r\n- My_eGallery 2.8\r\n<br>\r\n- Event Calendar 2.1.3 (modificado para 7.5)\r\n<br><br>\r\nE muito mais...\r\n<br><br>\r\nEste Tema chama-se Kayapó, e foi adaptado do Tema CNB desenvolvido pela Comunidade PHP-Nuke Brasil - CNB especialmente para o lançamento deste pacote.', '993373194', 0, 1, 1, '', '');

CREATE TABLE `kayapo_modules` (
  `mid` int(10) NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `custom_title` varchar(255) NOT NULL default '',
  `active` int(1) NOT NULL default '0',
  `view` int(1) NOT NULL default '0',
  `groups` text NOT NULL,
  `inmenu` tinyint(1) NOT NULL default '1',
  `mod_group` int(10) default '0',
  `admins` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`mid`),
  KEY `mid` (`mid`),
  KEY `title` (`title`),
  KEY `custom_title` (`custom_title`)
) TYPE=MyISAM;

INSERT INTO `kayapo_modules` VALUES (1, 'AvantGo', 'AvantGo', 1, 0, '', 1, 0, '');
INSERT INTO `kayapo_modules` VALUES (2, 'Content', 'Conteúdo', 0, 0, '', 1, 0, '');
INSERT INTO `kayapo_modules` VALUES (3, 'Downloads', 'Downloads', 1, 0, '', 1, 0, '');
INSERT INTO `kayapo_modules` VALUES (4, 'Encyclopedia', 'Enciclopédia', 0, 0, '', 1, 0, '');
INSERT INTO `kayapo_modules` VALUES (5, 'FAQ', 'Perguntas Frequentes', 0, 0, '', 1, 0, '');
INSERT INTO `kayapo_modules` VALUES (6, 'Feedback', 'Contate-nos', 0, 0, '', 1, 0, '');
INSERT INTO `kayapo_modules` VALUES (7, 'Forums', 'Foros', 0, 0, '', 1, 0, '');
INSERT INTO `kayapo_modules` VALUES (8, 'Journal', 'Diário de Usuário', 1, 0, '', 1, 0, '');
INSERT INTO `kayapo_modules` VALUES (9, 'Members_List', 'Lista de Usuários', 0, 1, '', 1, 0, '');
INSERT INTO `kayapo_modules` VALUES (10, 'News', 'Notícias', 1, 0, '', 1, 0, '');
INSERT INTO `kayapo_modules` VALUES (11, 'Private_Messages', 'Mensagens Privadas', 1, 0, '', 1, 0, '');
INSERT INTO `kayapo_modules` VALUES (12, 'Recommend_Us', 'Recomende-nos', 1, 0, '', 1, 0, '');
INSERT INTO `kayapo_modules` VALUES (13, 'Reviews', 'Revisões', 0, 0, '', 1, 0, '');
INSERT INTO `kayapo_modules` VALUES (15, 'Statistics', 'Estatísticas', 1, 0, '', 1, 0, '');
INSERT INTO `kayapo_modules` VALUES (16, 'Stories_Archive', 'Arquivo de Notícias', 1, 0, '', 1, 0, '');
INSERT INTO `kayapo_modules` VALUES (18, 'Surveys', 'Enquetes', 1, 0, '', 1, 0, '');
INSERT INTO `kayapo_modules` VALUES (19, 'Top', 'Top 10', 1, 0, '', 1, 0, '');
INSERT INTO `kayapo_modules` VALUES (20, 'Topics', 'Tópicos', 1, 0, '', 1, 0, '');
INSERT INTO `kayapo_modules` VALUES (21, 'Web_Links', 'Web Links', 1, 0, '', 1, 0, '');
INSERT INTO `kayapo_modules` VALUES (22, 'Your_Account', 'Sua Conta', 1, 0, '', 1, 0, '');
INSERT INTO `kayapo_modules` VALUES (23, 'My_eGallery', 'Galeria de Fotos', 1, 0, '', 1, 0, '');
INSERT INTO `kayapo_modules` VALUES (24, 'Blocked_IPs', 'IPs Bloqueados', 0, 2, '', 1, 0, '');
INSERT INTO `kayapo_modules` VALUES (25, 'Blocked_Ranges', 'Faixas de IPs Bloqueados', 0, 2, '', 1, 0, '');
INSERT INTO `kayapo_modules` VALUES (26, 'Blocked_Referers', 'Referenciadores Bloqueados', 0, 2, '', 1, 0, '');
INSERT INTO `kayapo_modules` VALUES (27, 'Groups', 'Grupos de Usuários', 1, 0, '', 1, 0, '');
INSERT INTO `kayapo_modules` VALUES (29, 'Recherches', 'Busca Avançada', 1, 0, '1', 1, 0, '');
INSERT INTO `kayapo_modules` VALUES (32, 'Submit_Downloads', 'Enviar um Arquivo', 0, 1, '1', 1, 0, '');
INSERT INTO `kayapo_modules` VALUES (30, 'FCKeditor', 'Enviar Notícia', 1, 0, '1', 1, 0, '');
INSERT INTO `kayapo_modules` VALUES (31, 'Calendar', 'Calendário', 0, 0, '1', 1, 0, '');
INSERT INTO `kayapo_modules` VALUES (33, 'Banner_Ads', 'Banner Ads', 0, 0, '1', 0, 0, '');

CREATE TABLE `kayapo_nsnba_banners` (
  `bid` int(11) NOT NULL auto_increment,
  `cid` int(11) NOT NULL default '0',
  `pid` tinyint(1) NOT NULL default '0',
  `imptotal` int(11) NOT NULL default '0',
  `impmade` int(11) NOT NULL default '0',
  `clicks` int(11) NOT NULL default '0',
  `imageurl` varchar(200) NOT NULL default '',
  `clickurl` varchar(200) NOT NULL default '',
  `alttext` varchar(255) NOT NULL default '',
  `code` tinyint(1) NOT NULL default '0',
  `flash` tinyint(1) NOT NULL default '0',
  `height` int(4) NOT NULL default '60',
  `width` int(4) NOT NULL default '468',
  `datestr` date NOT NULL default '0000-00-00',
  `dateend` date NOT NULL default '0000-00-00',
  `active` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`bid`),
  KEY `bid` (`bid`),
  KEY `cid` (`cid`)
) TYPE=MyISAM;

INSERT INTO `kayapo_nsnba_banners` VALUES (1, 1, 1, 12000, 8, 0, 'http://kayapo.phpnuke.org.br/images/banners/banner01.gif', 'http://kayapo.phpnuke.org.br/images/banners', 'CNB Kayapó - A Força do PHP-Nuke no Brasil!', 0, 0, 60, 468, '2005-01-25', '2006-01-25', 1);

CREATE TABLE `kayapo_nsnba_clients` (
  `cid` int(11) NOT NULL auto_increment,
  `name` varchar(60) NOT NULL default '',
  `email` varchar(60) NOT NULL default '',
  `login` varchar(25) NOT NULL default '',
  `passwd` varchar(40) NOT NULL default '',
  PRIMARY KEY  (`cid`),
  KEY `cid` (`cid`)
) TYPE=MyISAM;

INSERT INTO `kayapo_nsnba_clients` VALUES (1, 'CNB', 'webmaster@phpnuke.org.br', 'CNB', 'b15edd567fcbdbb1991dd9c39c21c86b');

CREATE TABLE `kayapo_nsnba_config` (
  `id` tinyint(1) NOT NULL auto_increment,
  `ipp` tinyint(4) NOT NULL default '20',
  `impamnt` int(6) NOT NULL default '1000',
  `usegfxcheck` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `id` (`id`)
) TYPE=MyISAM; 

INSERT INTO `kayapo_nsnba_config` VALUES (1, 20, 1000, 0);

CREATE TABLE `kayapo_nsngd_accesses` (
  `username` varchar(60) NOT NULL default '',
  `downloads` int(11) NOT NULL default '0',
  `uploads` int(11) NOT NULL default '0',
  PRIMARY KEY  (`username`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_nsngd_categories` (
  `cid` int(11) NOT NULL auto_increment,
  `title` varchar(50) NOT NULL default '',
  `cdescription` text NOT NULL,
  `parentid` int(11) NOT NULL default '0',
  `whoadd` tinyint(2) NOT NULL default '0',
  `uploaddir` varchar(255) NOT NULL default '',
  `canupload` tinyint(2) NOT NULL default '0',
  `active` tinyint(2) NOT NULL default '1',
  PRIMARY KEY  (`cid`),
  KEY `cid` (`cid`),
  KEY `title` (`title`)
) TYPE=MyISAM; 

CREATE TABLE `kayapo_nsngd_config` (
  `config_name` varchar(255) NOT NULL default '',
  `config_value` text NOT NULL,
  PRIMARY KEY  (`config_name`)
) TYPE=MyISAM;

INSERT INTO `kayapo_nsngd_config` VALUES ('admperpage', '50');
INSERT INTO `kayapo_nsngd_config` VALUES ('blockunregmodify', '0');
INSERT INTO `kayapo_nsngd_config` VALUES ('dateformat', 'D M j G:i:s T Y');
INSERT INTO `kayapo_nsngd_config` VALUES ('mostpopular', '25');
INSERT INTO `kayapo_nsngd_config` VALUES ('mostpopulartrig', '0');
INSERT INTO `kayapo_nsngd_config` VALUES ('perpage', '10');
INSERT INTO `kayapo_nsngd_config` VALUES ('popular', '500');
INSERT INTO `kayapo_nsngd_config` VALUES ('results', '10');
INSERT INTO `kayapo_nsngd_config` VALUES ('show_links_num', '0');
INSERT INTO `kayapo_nsngd_config` VALUES ('usegfxcheck', '0');
INSERT INTO `kayapo_nsngd_config` VALUES ('show_download', '0');
INSERT INTO `kayapo_nsngd_config` VALUES ('version_number', '1.0.0');

CREATE TABLE `kayapo_nsngd_downloads` (
  `lid` int(11) NOT NULL auto_increment,
  `cid` int(11) NOT NULL default '0',
  `sid` int(11) NOT NULL default '0',
  `title` varchar(100) NOT NULL default '',
  `url` varchar(255) NOT NULL default '',
  `description` text NOT NULL,
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  `name` varchar(100) NOT NULL default '',
  `email` varchar(100) NOT NULL default '',
  `hits` int(11) NOT NULL default '0',
  `submitter` varchar(60) NOT NULL default '',
  `sub_ip` varchar(16) NOT NULL default '0.0.0.0',
  `filesize` bigint(20) NOT NULL default '0',
  `version` varchar(20) NOT NULL default '',
  `homepage` varchar(255) NOT NULL default '',
  `active` tinyint(2) NOT NULL default '1',
  PRIMARY KEY  (`lid`),
  KEY `lid` (`lid`),
  KEY `cid` (`cid`),
  KEY `sid` (`sid`),
  KEY `title` (`title`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_nsngd_extensions` (
  `eid` int(11) NOT NULL auto_increment,
  `ext` varchar(6) NOT NULL default '',
  `file` tinyint(1) NOT NULL default '0',
  `image` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`eid`),
  KEY `ext` (`eid`)
) TYPE=MyISAM;

INSERT INTO `kayapo_nsngd_extensions` VALUES (1, '.ace', 1, 0);
INSERT INTO `kayapo_nsngd_extensions` VALUES (2, '.arj', 1, 0);
INSERT INTO `kayapo_nsngd_extensions` VALUES (3, '.bz', 1, 0);
INSERT INTO `kayapo_nsngd_extensions` VALUES (4, '.bz2', 1, 0);
INSERT INTO `kayapo_nsngd_extensions` VALUES (5, '.cab', 1, 0);
INSERT INTO `kayapo_nsngd_extensions` VALUES (6, '.exe', 1, 0);
INSERT INTO `kayapo_nsngd_extensions` VALUES (7, '.gif', 0, 1);
INSERT INTO `kayapo_nsngd_extensions` VALUES (8, '.gz', 1, 0);
INSERT INTO `kayapo_nsngd_extensions` VALUES (9, '.iso', 1, 0);
INSERT INTO `kayapo_nsngd_extensions` VALUES (10, '.jpeg', 0, 1);
INSERT INTO `kayapo_nsngd_extensions` VALUES (11, '.jpg', 0, 1);
INSERT INTO `kayapo_nsngd_extensions` VALUES (12, '.lha', 1, 0);
INSERT INTO `kayapo_nsngd_extensions` VALUES (13, '.lzh', 1, 0);
INSERT INTO `kayapo_nsngd_extensions` VALUES (14, '.png', 0, 1);
INSERT INTO `kayapo_nsngd_extensions` VALUES (15, '.rar', 1, 0);
INSERT INTO `kayapo_nsngd_extensions` VALUES (16, '.tar', 1, 0);
INSERT INTO `kayapo_nsngd_extensions` VALUES (17, '.tgz', 1, 0);
INSERT INTO `kayapo_nsngd_extensions` VALUES (18, '.uue', 1, 0);
INSERT INTO `kayapo_nsngd_extensions` VALUES (19, '.zip', 1, 0);
INSERT INTO `kayapo_nsngd_extensions` VALUES (20, '.zoo', 1, 0);

CREATE TABLE `kayapo_nsngd_mods` (
  `rid` int(11) NOT NULL auto_increment,
  `lid` int(11) NOT NULL default '0',
  `cid` int(11) NOT NULL default '0',
  `sid` int(11) NOT NULL default '0',
  `title` varchar(100) NOT NULL default '',
  `url` varchar(255) NOT NULL default '',
  `description` text NOT NULL,
  `modifier` varchar(60) NOT NULL default '',
  `sub_ip` varchar(16) NOT NULL default '0.0.0.0',
  `brokendownload` int(3) NOT NULL default '0',
  `name` varchar(100) NOT NULL default '',
  `email` varchar(100) NOT NULL default '',
  `filesize` bigint(20) NOT NULL default '0',
  `version` varchar(20) NOT NULL default '',
  `homepage` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`rid`),
  UNIQUE KEY `rid` (`rid`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_nsngd_new` (
  `lid` int(11) NOT NULL auto_increment,
  `cid` int(11) NOT NULL default '0',
  `sid` int(11) NOT NULL default '0',
  `title` varchar(100) NOT NULL default '',
  `url` varchar(255) NOT NULL default '',
  `description` text NOT NULL,
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  `name` varchar(100) NOT NULL default '',
  `email` varchar(100) NOT NULL default '',
  `submitter` varchar(60) NOT NULL default '',
  `sub_ip` varchar(16) NOT NULL default '0.0.0.0',
  `filesize` bigint(20) NOT NULL default '0',
  `version` varchar(20) NOT NULL default '',
  `homepage` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`lid`),
  KEY `lid` (`lid`),
  KEY `cid` (`cid`),
  KEY `sid` (`sid`),
  KEY `title` (`title`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_nsngr_config` (
  `config_name` varchar(255) NOT NULL default '',
  `config_value` text NOT NULL,
  PRIMARY KEY  (`config_name`)
) TYPE=MyISAM;

INSERT INTO `kayapo_nsngr_config` VALUES ('perpage', '50');
INSERT INTO `kayapo_nsngr_config` VALUES ('date_format', 'Y-m-d');
INSERT INTO `kayapo_nsngr_config` VALUES ('send_notice', '1');
INSERT INTO `kayapo_nsngr_config` VALUES ('script_version', '1.5.0');

CREATE TABLE `kayapo_nsngr_groups` (
  `gid` int(11) NOT NULL auto_increment,
  `gname` varchar(32) NOT NULL default '',
  `gdesc` text NOT NULL,
  `gpublic` tinyint(1) NOT NULL default '0',
  `glimit` int(11) NOT NULL default '0',
  PRIMARY KEY  (`gid`)
) TYPE=MyISAM;

INSERT INTO `kayapo_nsngr_groups` VALUES (1, 'General', '', 0, 0);

CREATE TABLE `kayapo_nsngr_users` (
  `gid` int(11) NOT NULL default '0',
  `uid` int(11) NOT NULL default '0',
  `uname` varchar(25) NOT NULL default '',
  `trial` tinyint(1) NOT NULL default '0',
  `notice` tinyint(1) NOT NULL default '0',
  `sdate` int(14) NOT NULL default '0',
  `edate` int(14) NOT NULL default '0'
) TYPE=MyISAM;

CREATE TABLE `kayapo_nsnst_admins` (
  `aid` varchar(25) NOT NULL default '',
  `login` varchar(25) NOT NULL default '',
  `password` varchar(20) NOT NULL default '',
  `password_md5` varchar(60) NOT NULL default '',
  `password_crypt` varchar(60) NOT NULL default '',
  `protected` tinyint(2) NOT NULL default '0',
  PRIMARY KEY  (`aid`)
) TYPE=MyISAM;

INSERT INTO `kayapo_nsnst_admins` VALUES ('admin', 'admin', '', '', '', 1);

CREATE TABLE `kayapo_nsnst_blocked_ips` (
  `ip_addr` varchar(15) NOT NULL default '',
  `user_id` int(11) NOT NULL default '1',
  `username` varchar(60) NOT NULL default 'Anonymous',
  `user_agent` text NOT NULL,
  `date` int(20) NOT NULL default '0',
  `notes` text NOT NULL,
  `reason` tinyint(1) NOT NULL default '0',
  `query_string` text NOT NULL,
  `x_forward_for` varchar(32) NOT NULL default 'None',
  `client_ip` varchar(32) NOT NULL default 'None',
  `remote_addr` varchar(32) NOT NULL default '',
  `remote_port` varchar(11) NOT NULL default 'Unknown',
  `request_method` varchar(10) NOT NULL default '',
  `expires` int(20) NOT NULL default '0',
  `c2c` char(2) NOT NULL default '00',
  PRIMARY KEY  (`ip_addr`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_nsnst_blocked_ranges` (
  `ip_lo` int(10) unsigned NOT NULL default '0',
  `ip_hi` int(10) unsigned NOT NULL default '0',
  `date` int(20) NOT NULL default '0',
  `notes` text NOT NULL,
  `reason` tinyint(1) NOT NULL default '0',
  `expires` int(20) NOT NULL default '0',
  `c2c` char(2) NOT NULL default '00',
  KEY `code` (`ip_lo`,`ip_hi`,`c2c`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_nsnst_blockers` (
  `blocker` int(4) NOT NULL default '0',
  `block_name` varchar(20) NOT NULL default '',
  `activate` int(4) NOT NULL default '0',
  `block_type` int(4) NOT NULL default '0',
  `email_lookup` int(4) NOT NULL default '0',
  `forward` varchar(255) NOT NULL default '',
  `reason` varchar(20) NOT NULL default '',
  `template` varchar(255) NOT NULL default '',
  `duration` int(20) NOT NULL default '0',
  `htaccess` int(4) NOT NULL default '0',
  `list` longtext NOT NULL,
  PRIMARY KEY  (`blocker`)
) TYPE=MyISAM;

INSERT INTO `kayapo_nsnst_blockers` VALUES (0, 'other', 0, 0, 0, '', 'Abuse-Other', 'abuse_default.tpl', 0, 0, '');
INSERT INTO `kayapo_nsnst_blockers` VALUES (1, 'union', 0, 0, 0, '', 'Abuse-Union', 'abuse_union.tpl', 0, 0, '');
INSERT INTO `kayapo_nsnst_blockers` VALUES (2, 'clike', 0, 0, 0, '', 'Abuse-CLike', 'abuse_clike.tpl', 0, 0, '');
INSERT INTO `kayapo_nsnst_blockers` VALUES (3, 'harvester', 0, 0, 0, '', 'Abuse-Harvest', 'abuse_harvester.tpl', 0, 0, '@yahoo.com\r\nalexibot\r\nalligator\r\nanonymiz\r\nasterias\r\nbackdoorbot\r\nblack hole\r\nblackwidow\r\nblowfish\r\nbotalot\r\nbuiltbottough\r\nbullseye\r\nbunnyslippers\r\ncatch\r\ncegbfeieh\r\ncharon\r\ncheesebot\r\ncherrypicker\r\nchinaclaw\r\ncombine\r\ncopyrightcheck\r\ncosmos\r\ncrescent\r\ncurl\r\ndbrowse\r\ndisco\r\ndittospyder\r\ndlman\r\ndnloadmage\r\ndownload\r\ndreampassport\r\ndts agent\r\necatch\r\neirgrabber\r\nerocrawler\r\nexpress webpictures\r\nextractorpro\r\neyenetie\r\nfantombrowser\r\nfantomcrew browser\r\nfileheap\r\nfilehound\r\nflashget\r\nfoobot\r\nfranklin locator\r\nfreshdownload\r\nfscrawler\r\ngamespy_arcade\r\ngetbot\r\ngetright\r\ngetweb\r\ngo!zilla\r\ngo-ahead-got-it\r\ngrab\r\ngrafula\r\ngsa-crawler\r\nharvest\r\nhloader\r\nhmview\r\nhttplib\r\nhttpresume\r\nhttrack\r\nhumanlinks\r\nigetter\r\nimage stripper\r\nimage sucker\r\nindustry program\r\nindy library\r\ninfonavirobot\r\ninstallshield digitalwizard\r\ninterget\r\niria\r\nirvine\r\niupui research bot\r\njbh agent\r\njennybot\r\njetcar\r\njobo\r\njoc\r\nkapere\r\nkenjin spider\r\nkeyword density\r\nlarbin\r\nleechftp\r\nleechget\r\nlexibot\r\nlibweb/clshttp\r\nlibwww-perl\r\nlightningdownload\r\nlincoln state web browser\r\nlinkextractorpro\r\nlinkscan/8.1a.unix\r\nlinkwalker\r\nlwp-trivial\r\nlwp::simple\r\nmac finder\r\nmata hari\r\nmediasearch\r\nmetaproducts\r\nmicrosoft url control\r\nmidown tool\r\nmiixpc\r\nmissauga locate\r\nmissouri college browse\r\nmister pix\r\nmoget\r\nmozilla.*newt\r\nmozilla/3.0 (compatible)\r\nmozilla/3.mozilla/2.01\r\nmsie 4.0 (win95)\r\nmultiblocker browser\r\nmydaemon\r\nmygetright\r\nnabot\r\nnavroad\r\nnearsite\r\nnet vampire\r\nnetants\r\nnetmechanic\r\nnetpumper\r\nnetspider\r\nnewsearchengine\r\nnicerspro\r\nninja\r\nnitro downloader\r\nnpbot\r\noctopus\r\noffline explorer\r\noffline navigator\r\nopenfind\r\npagegrabber\r\npapa foto\r\npavuk\r\npbrowse\r\npcbrowser\r\npeval\r\npompos/\r\nprogram shareware\r\npropowerbot\r\nprowebwalker\r\npsurf\r\npuf\r\npuxarapido\r\nqueryn metasearch\r\nrealdownload\r\nreget\r\nrepomonkey\r\nrsurf\r\nrumours-agent\r\nsakura\r\nscan4mail\r\nsemanticdiscovery\r\nsitesnagger\r\nslysearch\r\nspankbot\r\nspanner \r\nspiderzilla\r\nsq webscanner\r\nstamina\r\nstar downloader\r\nsteeler\r\nsteeler\r\nstrip\r\nsuperbot\r\nsuperhttp\r\nsurfbot\r\nsuzuran\r\nswbot\r\nszukacz\r\ntakeout\r\nteleport\r\ntelesoft\r\ntest spider\r\nthe intraformant\r\nthenomad\r\ntighttwatbot\r\ntitan\r\ntocrawl/urldispatcher\r\ntrue_robot\r\ntsurf\r\nturing machine\r\nturingos\r\nurlblaze\r\nurlgetfile\r\nurly warning\r\nutilmind\r\nvci\r\nvoideye\r\nweb image collector\r\nweb sucker\r\nwebauto\r\nwebbandit\r\nwebcapture\r\nwebcollage\r\nwebcopier\r\nwebenhancer\r\nwebfetch\r\nwebgo\r\nwebleacher\r\nwebmasterworldforumbot\r\nwebql\r\nwebreaper\r\nwebsite extractor\r\nwebsite quester\r\nwebster\r\nwebstripper\r\nwebwhacker\r\nwep search\r\nwget\r\nwhizbang\r\nwidow\r\nwildsoft surfer\r\nwww-collector-e\r\nwww.netwu.com\r\nwwwoffle\r\nxaldon\r\nxenu\r\nzeus\r\nziggy\r\nzippy');
INSERT INTO `kayapo_nsnst_blockers` VALUES (4, 'script', 0, 0, 0, '', 'Abuse-Script', 'abuse_script.tpl', 0, 0, '');
INSERT INTO `kayapo_nsnst_blockers` VALUES (5, 'author', 0, 0, 0, '', 'Abuse-Author', 'abuse_author.tpl', 0, 0, '');
INSERT INTO `kayapo_nsnst_blockers` VALUES (6, 'referer', 0, 0, 0, '', 'Abuse-Referer', 'abuse_referer.tpl', 0, 0, '121hr.com\r\n1st-call.net\r\n1stcool.com\r\n5000n.com\r\n69-xxx.com\r\n9irl.com\r\n9uy.com\r\na-day-at-the-party.com\r\naccessthepeace.com\r\nadult-model-nude-pictures.com\r\nadult-sex-toys-free-porn.com\r\nagnitum.com\r\nalfonssackpfeiffe.com\r\nalongwayfrommars.com\r\nanime-sex-1.com\r\nanorex-sf-stimulant-free.com\r\nantibot.net\r\nantique-tokiwa.com\r\napotheke-heute.com\r\narmada31.com\r\nartark.com\r\nartlilei.com\r\nascendbtg.com\r\naschalaecheck.com\r\nasian-sex-free-sex.com\r\naslowspeeker.com\r\nassasinatedfrogs.com\r\nathirst-for-tranquillity.net\r\naubonpanier.com\r\navalonumc.com\r\nayingba.com\r\nbayofnoreturn.com\r\nbbw4phonesex.com\r\nbeersarenotfree.com\r\nbierikiuetsch.com\r\nbilingualannouncements.com\r\nblack-pussy-toon-clip-anal-lover-single.com\r\nblownapart.com\r\nblueroutes.com\r\nboasex.com\r\nbooksandpages.com\r\nbootyquake.com\r\nbossyhunter.com\r\nboyz-sex.com\r\nbrokersaandpokers.com\r\nbrowserwindowcleaner.com\r\nbudobytes.com\r\nbusiness2fun.com\r\nbuymyshitz.com\r\nbyuntaesex.com\r\ncaniputsomeloveintoyou.com\r\ncartoons.net.ru\r\ncaverunsailing.com\r\ncertainhealth.com\r\nclantea.com\r\nclose-protection-services.com\r\nclubcanino.com\r\nclubstic.com\r\ncobrakai-skf.com\r\ncollegefucktour.co.uk\r\ncommanderspank.com\r\ncoolenabled.com\r\ncrusecountryart.com\r\ncrusingforsex.co.uk\r\ncunt-twat-pussy-juice-clit-licking.com\r\ncustomerhandshaker.com\r\ncyborgrama.com\r\ndarkprofits.co.uk\r\ndatingforme.co.uk\r\ndatingmind.com\r\ndegree.org.ru\r\ndelorentos.com\r\ndiggydigger.com\r\ndinkydonkyaussie.com\r\ndjpritchard.com\r\ndjtop.com\r\ndraufgeschissen.com\r\ndreamerteens.co.uk\r\nebonyarchives.co.uk\r\nebonyplaya.co.uk\r\necobuilder2000.com\r\nemailandemail.com\r\nemedici.net\r\nengine-on-fire.com\r\nerocity.co.uk\r\nesport3.com\r\neteenbabes.com\r\neurofreepages.com\r\neurotexans.com\r\nevolucionweb.com\r\nfakoli.com\r\nfe4ba.com\r\nferienschweden.com\r\nfindly.com\r\nfirsttimeteadrinker.com\r\nfishing.net.ru\r\nflatwonkers.com\r\nflowershopentertainment.com\r\nflymario.com\r\nfree-xxx-pictures-porno-gallery.com\r\nfreebestporn.com\r\nfreefuckingmovies.co.uk\r\nfreexxxstuff.co.uk\r\nfruitologist.net\r\nfruitsandbolts.com\r\nfuck-cumshots-free-midget-movie-clips.com\r\nfuck-michaelmoore.com\r\nfundacep.com\r\ngadless.com\r\ngallapagosrangers.com\r\ngalleries4free.co.uk\r\ngalofu.com\r\ngaypixpost.co.uk\r\ngeomasti.com\r\ngirltime.co.uk\r\nglassrope.com\r\ngodjustblessyouall.com\r\ngoldenageresort.com\r\ngonnabedaddies.com\r\ngranadasexi.com\r\ngranadasexi.com\r\nguardingtheangels.com\r\nguyprofiles.co.uk\r\nhappy1225.com\r\nhappychappywacky.com\r\nhealth.org.ru\r\nhexplas.com\r\nhighheelsmodels4fun.com\r\nhillsweb.com\r\nhiptuner.com\r\nhistoryintospace.com\r\nhoa-tuoi.com\r\nhomebuyinginatlanta.com\r\nhorizonultra.com\r\nhorseminiature.net\r\nhotkiss.co.uk\r\nhotlivegirls.co.uk\r\nhotmatchup.co.uk\r\nhusler.co.uk\r\niaentertainment.com\r\niamnotsomeone.com\r\niconsofcorruption.com\r\nihavenotrustinyou.com\r\ninformat-systems.com\r\ninteriorproshop.com\r\nintersoftnetworks.com\r\ninthecrib.com\r\ninvestment4cashiers.com\r\niti-trailers.com\r\njackpot-hacker.com\r\njacks-world.com\r\njamesthesailorbasher.com\r\njesuislemonds.com\r\njustanotherdomainname.com\r\nkampelicka.com\r\nkanalrattenarsch.com\r\nkatzasher.com\r\nkerosinjunkie.com\r\nkillasvideo.com\r\nkoenigspisser.com\r\nkontorpara.com\r\nl8t.com\r\nlaestacion101.com\r\nlambuschlamppen.com\r\nlankasex.co.uk\r\nlaser-creations.com\r\nle-tour-du-monde.com\r\nlecraft.com\r\nledo-design.com\r\nleftregistration.com\r\nlekkikoomastas.com\r\nlepommeau.com\r\nlibr-animal.com\r\nlibraries.org.ru\r\nlikewaterlikewind.com\r\nlimbojumpers.com\r\nlink.ru\r\nlockportlinks.com\r\nloiproject.com\r\nlongtermalternatives.com\r\nlottoeco.com\r\nlucalozzi.com\r\nmaki-e-pens.com\r\nmalepayperview.co.uk\r\nmangaxoxo.com\r\nmaps.org.ru\r\nmarcofields.com\r\nmasterofcheese.com\r\nmasteroftheblasterhill.com\r\nmastheadwankers.com\r\nmegafrontier.com\r\nmeinschuppen.com\r\nmercurybar.com\r\nmetapannas.com\r\nmicelebre.com\r\nmidnightlaundries.com\r\nmikeapartment.co.uk\r\nmillenniumchorus.com\r\nmimundial2002.com\r\nminiaturegallerymm.com\r\nmixtaperadio.com\r\nmondialcoral.com\r\nmonja-wakamatsu.com\r\nmonstermonkey.net\r\nmouthfreshners.com\r\nmullensholiday.com\r\nmusilo.com\r\nmyhollowlog.com\r\nmyhomephonenumber.com\r\nmykeyboardisbroken.com\r\nmysofia.net\r\nnaked-cheaters.com\r\nnaked-old-women.com\r\nnastygirls.co.uk\r\nnationclan.net\r\nnatterratter.com\r\nnaughtyadam.com\r\nnestbeschmutzer.com\r\nnetwu.com\r\nnewrealeaseonline.com\r\nnewrealeasesonline.com\r\nnextfrontiersonline.com\r\nnikostaxi.com\r\nnotorious7.com\r\nnrecruiter.com\r\nnursingdepot.com\r\nnustramosse.com\r\nnuturalhicks.com\r\noccaz-auto49.com\r\nocean-db.net\r\noilburnerservice.net\r\nomburo.com\r\noneoz.com\r\nonepageahead.net\r\nonlinewithaline.com\r\norganizate.net\r\nourownweddingsong.com\r\nowen-music.com\r\np-partners.com\r\npaginadeautor.com\r\npakistandutyfree.com\r\npamanderson.co.uk\r\nparentsense.net\r\nparticlewave.net\r\npay-clic.com\r\npay4link.net\r\npcisp.com\r\npersist-pharma.com\r\npeteband.com\r\npetplusindia.com\r\npickabbw.co.uk\r\npicture-oral-position-lesbian.com\r\npl8again.com\r\nplaneting.net\r\npopusky.com\r\nporn-expert.com\r\npromoblitza.com\r\nproproducts-usa.com\r\nptcgzone.com\r\nptporn.com\r\npublishmybong.com\r\nputtingtogether.com\r\nqualifiedcancelations.com\r\nrahost.com\r\nrainbow21.com\r\nrakkashakka.com\r\nrandomfeeding.com\r\nrape-art.com\r\nrd-brains.com\r\nrealestateonthehill.net\r\nrebuscadobot\r\nrequested-stuff.com\r\nretrotrasher.com\r\nricopositive.com\r\nrisorseinrete.com\r\nrotatingcunts.com\r\nrunawayclicks.com\r\nrutalibre.com\r\ns-marche.com\r\nsabrosojazz.com\r\nsamuraidojo.com\r\nsanaldarbe.com\r\nsasseminars.com\r\nschlampenbruzzler.com\r\nsearchmybong.com\r\nseckur.com\r\nsex-asian-porn-interracial-photo.com\r\nsex-porn-fuck-hardcore-movie.com\r\nsexa3.net\r\nsexer.com\r\nsexintention.com\r\nsexnet24.tv\r\nsexomundo.com\r\nsharks.com.ru\r\nshells.com.ru\r\nshop-ecosafe.com\r\nshop-toon-hardcore-fuck-cum-pics.com\r\nsilverfussions.com\r\nsin-city-sex.net\r\nsluisvan.com\r\nsmutshots.com\r\nsnagglersmaggler.com\r\nsomethingtoforgetit.com\r\nsophiesplace.net\r\nsoursushi.com\r\nsouthernxstables.com\r\nspeed467.com\r\nspeedpal4you.com\r\nsporty.org.ru\r\nstopdriving.net\r\nstw.org.ru\r\nsufficientlife.com\r\nsussexboats.net\r\nswinger-party-free-dating-porn-sluts.com\r\nsydneyhay.com\r\nszmjht.com\r\nteninchtrout.com\r\nthebalancedfruits.com\r\ntheendofthesummit.com\r\nthiswillbeit.com\r\nthosethosethose.com\r\nticyclesofindia.com\r\ntits-gay-fagot-black-tits-bigtits-amateur.com\r\ntonius.com\r\ntoohsoft.com\r\ntoolvalley.com\r\ntooporno.net\r\ntoosexual.com\r\ntorngat.com\r\ntour.org.ru\r\ntowneluxury.com\r\ntrafficmogger.com\r\ntriacoach.net\r\ntrottinbob.com\r\ntttframes.com\r\ntvjukebox.net\r\nundercvr.com\r\nunfinished-desires.com\r\nunicornonero.com\r\nunionvillefire.com\r\nupsandowns.com\r\nupthehillanddown.com\r\nvallartavideo.com\r\nvietnamdatingservices.com\r\nvinegarlemonshots.com\r\nvizy.net.ru\r\nvnladiesdatingservices.com\r\nvomitandbusted.com\r\nwalkingthewalking.com\r\nwell-I-am-the-type-of-boy.com\r\nwhales.com.ru\r\nwhincer.net\r\nwhitpagesrippers.com\r\nwhois.sc\r\nwipperrippers.com\r\nwordfilebooklets.com\r\nworld-sexs.com\r\nxsay.com\r\nxxxchyangel.com\r\nxxxx:\r\nxxxzips.com\r\nyouarelostintransit.com\r\nyuppieslovestocks.com\r\nyuzhouhuagong.com\r\nzhaori-food.com\r\nzwiebelbacke.com');
INSERT INTO `kayapo_nsnst_blockers` VALUES (7, 'filter', 0, 0, 0, '', 'Abuse-Filter', 'abuse_filter.tpl', 0, 0, '');
INSERT INTO `kayapo_nsnst_blockers` VALUES (8, 'request', 0, 0, 0, '', 'Abuse-Request', 'abuse_request.tpl', 0, 0, '');
INSERT INTO `kayapo_nsnst_blockers` VALUES (9, 'string', 0, 0, 0, '', 'Abuse-String', 'abuse_string.tpl', 0, 0, '');
INSERT INTO `kayapo_nsnst_blockers` VALUES (10, 'admin', 0, 0, 0, '', 'Abuse-Admin', 'abuse_admin.tpl', 0, 0, '');

CREATE TABLE `kayapo_nsnst_config` (
  `config_name` varchar(255) NOT NULL default '',
  `config_value` longtext NOT NULL,
  PRIMARY KEY  (`config_name`)
) TYPE=MyISAM;

INSERT INTO `kayapo_nsnst_config` VALUES ('admin_contact', 'webmaster@yoursite.com');
INSERT INTO `kayapo_nsnst_config` VALUES ('block_perpage', '50');
INSERT INTO `kayapo_nsnst_config` VALUES ('block_sort_column', 'date');
INSERT INTO `kayapo_nsnst_config` VALUES ('block_sort_direction', 'desc');
INSERT INTO `kayapo_nsnst_config` VALUES ('crypt_salt', 'N$');
INSERT INTO `kayapo_nsnst_config` VALUES ('display_link', '3');
INSERT INTO `kayapo_nsnst_config` VALUES ('display_reason', '3');
INSERT INTO `kayapo_nsnst_config` VALUES ('force_nukeurl', '0');
INSERT INTO `kayapo_nsnst_config` VALUES ('help_switch', '1');
INSERT INTO `kayapo_nsnst_config` VALUES ('htaccess_path', '');
INSERT INTO `kayapo_nsnst_config` VALUES ('http_auth', '0');
INSERT INTO `kayapo_nsnst_config` VALUES ('lookup_link', 'http://dnsstuff.com/tools/whois.ch?cache=off&ip=');
INSERT INTO `kayapo_nsnst_config` VALUES ('prevent_dos', '0');
INSERT INTO `kayapo_nsnst_config` VALUES ('proxy_reason', 'admin_proxy_reason.tpl');
INSERT INTO `kayapo_nsnst_config` VALUES ('proxy_switch', '0');
INSERT INTO `kayapo_nsnst_config` VALUES ('search_block_perpage', '50');
INSERT INTO `kayapo_nsnst_config` VALUES ('search_block_sort_column', 'date');
INSERT INTO `kayapo_nsnst_config` VALUES ('search_block_sort_direction', 'desc');
INSERT INTO `kayapo_nsnst_config` VALUES ('search_track_perpage', '50');
INSERT INTO `kayapo_nsnst_config` VALUES ('search_track_sort_column', '6');
INSERT INTO `kayapo_nsnst_config` VALUES ('search_track_sort_direction', 'desc');
INSERT INTO `kayapo_nsnst_config` VALUES ('search_user_perpage', '50');
INSERT INTO `kayapo_nsnst_config` VALUES ('search_user_sort_column', 'username');
INSERT INTO `kayapo_nsnst_config` VALUES ('search_user_sort_direction', 'asc');
INSERT INTO `kayapo_nsnst_config` VALUES ('self_expire', '0');
INSERT INTO `kayapo_nsnst_config` VALUES ('site_reason', 'admin_site_reason.tpl');
INSERT INTO `kayapo_nsnst_config` VALUES ('site_switch', '0');
INSERT INTO `kayapo_nsnst_config` VALUES ('staccess_path', '');
INSERT INTO `kayapo_nsnst_config` VALUES ('track_active', '1');
INSERT INTO `kayapo_nsnst_config` VALUES ('track_del', '1000');
INSERT INTO `kayapo_nsnst_config` VALUES ('track_max', '10000');
INSERT INTO `kayapo_nsnst_config` VALUES ('track_perpage', '50');
INSERT INTO `kayapo_nsnst_config` VALUES ('track_sort_column', '6');
INSERT INTO `kayapo_nsnst_config` VALUES ('track_sort_direction', 'desc');
INSERT INTO `kayapo_nsnst_config` VALUES ('version_number', '2.1.2');

CREATE TABLE `kayapo_nsnst_countries` (
  `c2c` char(2) NOT NULL default '',
  `country` varchar(60) NOT NULL default '',
  KEY `c2c` (`c2c`)
) TYPE=MyISAM;

INSERT INTO `kayapo_nsnst_countries` VALUES ('00', 'Unknown');
INSERT INTO `kayapo_nsnst_countries` VALUES ('01', 'IANA Reserved');

CREATE TABLE `kayapo_nsnst_excluded_ranges` (
  `ip_lo` int(10) unsigned NOT NULL default '0',
  `ip_hi` int(10) unsigned NOT NULL default '0',
  `date` int(20) NOT NULL default '0',
  `notes` text NOT NULL,
  `c2c` char(2) NOT NULL default '00',
  KEY `code` (`ip_lo`,`ip_hi`,`c2c`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_nsnst_protected_ranges` (
  `ip_lo` int(10) unsigned NOT NULL default '0',
  `ip_hi` int(10) unsigned NOT NULL default '0',
  `date` int(20) NOT NULL default '0',
  `notes` text NOT NULL,
  `c2c` char(2) NOT NULL default '00',
  KEY `code` (`ip_lo`,`ip_hi`,`c2c`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_nsnst_reserved_ranges` (
  `ip_lo` int(10) unsigned NOT NULL default '0',
  `ip_hi` int(10) unsigned NOT NULL default '0',
  `date` int(20) NOT NULL default '0',
  `c2c` char(2) NOT NULL default '00',
  KEY `code` (`ip_lo`,`ip_hi`,`c2c`)
) TYPE=MyISAM;

INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (0, 16777215, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (16777216, 33554431, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (33554432, 50331647, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (83886080, 100663295, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (117440512, 134217727, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (167772160, 184549375, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (234881024, 251658239, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (385875968, 402653183, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (452984832, 469762047, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (520093696, 536870911, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (603979776, 620756991, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (620756992, 637534207, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (687865856, 704643071, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (704643072, 721420287, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (1224736768, 1241513983, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (1241513984, 1258291199, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (1258291200, 1275068415, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (1275068416, 1291845631, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (1291845632, 1308622847, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (1308622848, 1325400063, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (1325400064, 1342177279, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (1493172224, 1509949439, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (1509949440, 1526726655, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (1526726656, 1543503871, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (1543503872, 1560281087, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (1560281088, 1577058303, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (1577058304, 1593835519, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (1593835520, 1610612735, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (1610612736, 1627389951, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (1627389952, 1644167167, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (1644167168, 1660944383, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (1660944384, 1677721599, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (1677721600, 1694498815, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (1694498816, 1711276031, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (1711276032, 1728053247, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (1728053248, 1744830463, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (1744830464, 1761607679, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (1761607680, 1778384895, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (1778384896, 1795162111, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (1795162112, 1811939327, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (1811939328, 1828716543, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (1828716544, 1845493759, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (1845493760, 1862270975, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (1862270976, 1879048191, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (1879048192, 1895825407, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (1895825408, 1912602623, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (1912602624, 1929379839, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (1929379840, 1946157055, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (1946157056, 1962934271, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (1962934272, 1979711487, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (1979711488, 1996488703, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (1996488704, 2013265919, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (2013265920, 2030043135, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (2030043136, 2046820351, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (2046820352, 2063597567, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (2063597568, 2080374783, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (2080374784, 2097151999, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (2097152000, 2113929215, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (2113929216, 2130706431, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (2130706432, 2147483647, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (2851995648, 2852061183, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (2886729728, 2887778303, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (2902458368, 2919235583, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (2919235584, 2936012799, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (2936012800, 2952790015, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (2952790016, 2969567231, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (2969567232, 2986344447, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (2986344448, 3003121663, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (3003121664, 3019898879, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (3019898880, 3036676095, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (3036676096, 3053453311, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (3053453312, 3070230527, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (3070230528, 3087007743, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (3087007744, 3103784959, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (3103784960, 3120562175, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (3120562176, 3137339391, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (3137339392, 3154116607, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (3170893824, 3187671039, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (3187671040, 3204448255, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (3221225472, 3221258239, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (3232235520, 3232301055, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (3305111552, 3321888767, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (3741319168, 3758096383, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (3758096384, 3774873599, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (3774873600, 3791650815, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (3791650816, 3808428031, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (3808428032, 3825205247, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (3825205248, 3841982463, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (3841982464, 3858759679, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (3858759680, 3875536895, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (3875536896, 3892314111, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (3892314112, 3909091327, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (3909091328, 3925868543, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (3925868544, 3942645759, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (3942645760, 3959422975, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (3959422976, 3976200191, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (3976200192, 3992977407, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (3992977408, 4009754623, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (4009754624, 4026531839, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (4026531840, 4043309055, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (4043309056, 4060086271, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (4060086272, 4076863487, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (4076863488, 4093640703, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (4093640704, 4110417919, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (4110417920, 4127195135, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (4127195136, 4143972351, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (4143972352, 4160749567, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (4160749568, 4177526783, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (4177526784, 4194303999, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (4194304000, 4211081215, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (4211081216, 4227858431, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (4227858432, 4244635647, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (4244635648, 4261412863, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (4261412864, 4278190079, 1098424776, '01');
INSERT INTO `kayapo_nsnst_reserved_ranges` VALUES (4278190080, 4294967295, 1098424776, '01');

CREATE TABLE `kayapo_nsnst_tracked_ips` (
  `tid` int(10) NOT NULL auto_increment,
  `ip_addr` varchar(15) NOT NULL default '',
  `hostname` varchar(100) NOT NULL default '',
  `user_id` int(11) NOT NULL default '1',
  `username` varchar(60) NOT NULL default '',
  `user_agent` text NOT NULL,
  `date` int(20) NOT NULL default '0',
  `page` text NOT NULL,
  `x_forward_for` varchar(32) NOT NULL default '',
  `client_ip` varchar(32) NOT NULL default '',
  `remote_addr` varchar(32) NOT NULL default '',
  `remote_port` varchar(11) NOT NULL default '',
  `request_method` varchar(10) NOT NULL default '',
  `c2c` char(2) NOT NULL default '00',
  PRIMARY KEY  (`tid`),
  KEY `tid` (`tid`),
  KEY `maintracking` (`ip_addr`,`hostname`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_pages` (
  `pid` int(10) NOT NULL auto_increment,
  `cid` int(10) NOT NULL default '0',
  `title` varchar(255) NOT NULL default '',
  `subtitle` varchar(255) NOT NULL default '',
  `active` int(1) NOT NULL default '0',
  `page_header` text NOT NULL,
  `text` text NOT NULL,
  `page_footer` text NOT NULL,
  `signature` text NOT NULL,
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  `counter` int(10) NOT NULL default '0',
  `clanguage` varchar(30) NOT NULL default '',
  PRIMARY KEY  (`pid`),
  KEY `pid` (`pid`),
  KEY `cid` (`cid`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_pages_categories` (
  `cid` int(10) NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `description` text NOT NULL,
  PRIMARY KEY  (`cid`),
  KEY `cid` (`cid`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_poll_check` (
  `ip` varchar(20) NOT NULL default '',
  `time` varchar(14) NOT NULL default '',
  `pollID` int(10) NOT NULL default '0'
) TYPE=MyISAM;

CREATE TABLE `kayapo_poll_data` (
  `pollID` int(11) NOT NULL default '0',
  `optionText` char(50) NOT NULL default '',
  `optionCount` int(11) NOT NULL default '0',
  `voteID` int(11) NOT NULL default '0'
) TYPE=MyISAM;

INSERT INTO `kayapo_poll_data` VALUES (1, 'Hum... Nada mal!', 0, 1);
INSERT INTO `kayapo_poll_data` VALUES (1, 'Show!!!', 0, 2);
INSERT INTO `kayapo_poll_data` VALUES (1, 'Maravilhoso!!!', 0, 3);
INSERT INTO `kayapo_poll_data` VALUES (1, 'O melhor de todos!!!', 1, 4);
INSERT INTO `kayapo_poll_data` VALUES (1, 'Hum...', 0, 5);
INSERT INTO `kayapo_poll_data` VALUES (1, 'Não gostei!', 0, 6);
INSERT INTO `kayapo_poll_data` VALUES (1, 'Odiei!!!', 0, 7);
INSERT INTO `kayapo_poll_data` VALUES (1, '', 0, 8);
INSERT INTO `kayapo_poll_data` VALUES (1, '', 0, 9);
INSERT INTO `kayapo_poll_data` VALUES (1, '', 0, 10);
INSERT INTO `kayapo_poll_data` VALUES (1, '', 0, 11);
INSERT INTO `kayapo_poll_data` VALUES (1, '', 0, 12);

CREATE TABLE `kayapo_poll_desc` (
  `pollID` int(11) NOT NULL auto_increment,
  `pollTitle` varchar(100) NOT NULL default '',
  `timeStamp` int(11) NOT NULL default '0',
  `voters` mediumint(9) NOT NULL default '0',
  `planguage` varchar(30) NOT NULL default '',
  `artid` int(10) NOT NULL default '0',
  PRIMARY KEY  (`pollID`),
  KEY `pollID` (`pollID`)
) TYPE=MyISAM;

INSERT INTO `kayapo_poll_desc` VALUES (1, 'O que você achou deste site?', 961405160, 1, 'brazilian', 0);

CREATE TABLE `kayapo_pollcomments` (
  `tid` int(11) NOT NULL auto_increment,
  `pid` int(11) NOT NULL default '0',
  `pollID` int(11) NOT NULL default '0',
  `date` datetime default NULL,
  `name` varchar(60) NOT NULL default '',
  `email` varchar(60) default NULL,
  `url` varchar(60) default NULL,
  `host_name` varchar(60) default NULL,
  `subject` varchar(60) NOT NULL default '',
  `comment` text NOT NULL,
  `score` tinyint(4) NOT NULL default '0',
  `reason` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`tid`),
  KEY `tid` (`tid`),
  KEY `pid` (`pid`),
  KEY `pollID` (`pollID`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_public_messages` (
  `mid` int(10) NOT NULL auto_increment,
  `content` varchar(255) NOT NULL default '',
  `date` varchar(14) default NULL,
  `who` varchar(25) NOT NULL default '',
  PRIMARY KEY  (`mid`),
  KEY `mid` (`mid`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_queue` (
  `qid` smallint(5) unsigned NOT NULL auto_increment,
  `uid` mediumint(9) NOT NULL default '0',
  `uname` varchar(40) NOT NULL default '',
  `subject` varchar(100) NOT NULL default '',
  `story` text,
  `storyext` text NOT NULL,
  `timestamp` datetime NOT NULL default '0000-00-00 00:00:00',
  `topic` varchar(20) NOT NULL default '',
  `alanguage` varchar(30) NOT NULL default '',
  PRIMARY KEY  (`qid`),
  KEY `qid` (`qid`),
  KEY `uid` (`uid`),
  KEY `uname` (`uname`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_quotes` (
  `qid` int(10) unsigned NOT NULL auto_increment,
  `quote` text,
  PRIMARY KEY  (`qid`),
  KEY `qid` (`qid`)
) TYPE=MyISAM;

INSERT INTO `kayapo_quotes` VALUES (1, 'Nos morituri te salutamus - CBHS');

CREATE TABLE `kayapo_recherches` (
  `primkey` smallint(6) NOT NULL auto_increment,
  `ip` varchar(15) default NULL,
  `query` varchar(50) default NULL,
  `date` varchar(18) default NULL,
  `userid` varchar(20) default NULL,
  `total` varchar(10) default NULL,
  PRIMARY KEY  (`primkey`),
  UNIQUE KEY `primkey` (`primkey`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_referer` (
  `rid` int(11) NOT NULL auto_increment,
  `url` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`rid`),
  KEY `rid` (`rid`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_related` (
  `rid` int(11) NOT NULL auto_increment,
  `tid` int(11) NOT NULL default '0',
  `name` varchar(30) NOT NULL default '',
  `url` varchar(200) NOT NULL default '',
  PRIMARY KEY  (`rid`),
  KEY `rid` (`rid`),
  KEY `tid` (`tid`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_reviews` (
  `id` int(10) NOT NULL auto_increment,
  `date` date NOT NULL default '0000-00-00',
  `title` varchar(150) NOT NULL default '',
  `text` text NOT NULL,
  `reviewer` varchar(20) default NULL,
  `email` varchar(60) default NULL,
  `score` int(10) NOT NULL default '0',
  `cover` varchar(100) NOT NULL default '',
  `url` varchar(100) NOT NULL default '',
  `url_title` varchar(50) NOT NULL default '',
  `hits` int(10) NOT NULL default '0',
  `rlanguage` varchar(30) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `id` (`id`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_reviews_add` (
  `id` int(10) NOT NULL auto_increment,
  `date` date default NULL,
  `title` varchar(150) NOT NULL default '',
  `text` text NOT NULL,
  `reviewer` varchar(20) NOT NULL default '',
  `email` varchar(60) default NULL,
  `score` int(10) NOT NULL default '0',
  `url` varchar(100) NOT NULL default '',
  `url_title` varchar(50) NOT NULL default '',
  `rlanguage` varchar(30) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `id` (`id`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_reviews_comments` (
  `cid` int(10) NOT NULL auto_increment,
  `rid` int(10) NOT NULL default '0',
  `userid` varchar(25) NOT NULL default '',
  `date` datetime default NULL,
  `comments` text,
  `score` int(10) NOT NULL default '0',
  PRIMARY KEY  (`cid`),
  KEY `cid` (`cid`),
  KEY `rid` (`rid`),
  KEY `userid` (`userid`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_reviews_main` (
  `title` varchar(100) default NULL,
  `description` text
) TYPE=MyISAM;

INSERT INTO `kayapo_reviews_main` VALUES ('Reviews Section Title', 'Reviews Section Long Description');

CREATE TABLE `kayapo_session` (
  `uname` varchar(25) NOT NULL default '',
  `time` varchar(14) NOT NULL default '',
  `host_addr` varchar(48) NOT NULL default '',
  `guest` int(1) NOT NULL default '0',
  KEY `time` (`time`),
  KEY `guest` (`guest`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_stats_date` (
  `year` smallint(6) NOT NULL default '0',
  `month` tinyint(4) NOT NULL default '0',
  `date` tinyint(4) NOT NULL default '0',
  `hits` bigint(20) NOT NULL default '0'
) TYPE=MyISAM;

CREATE TABLE `kayapo_stats_hour` (
  `year` smallint(6) NOT NULL default '0',
  `month` tinyint(4) NOT NULL default '0',
  `date` tinyint(4) NOT NULL default '0',
  `hour` tinyint(4) NOT NULL default '0',
  `hits` int(11) NOT NULL default '0'
) TYPE=MyISAM;

CREATE TABLE `kayapo_stats_month` (
  `year` smallint(6) NOT NULL default '0',
  `month` tinyint(4) NOT NULL default '0',
  `hits` bigint(20) NOT NULL default '0'
) TYPE=MyISAM;

CREATE TABLE `kayapo_stats_year` (
  `year` smallint(6) NOT NULL default '0',
  `hits` bigint(20) NOT NULL default '0'
) TYPE=MyISAM;

CREATE TABLE `kayapo_stories` (
  `sid` int(11) NOT NULL auto_increment,
  `catid` int(11) NOT NULL default '0',
  `aid` varchar(30) NOT NULL default '',
  `title` varchar(80) default NULL,
  `time` datetime default NULL,
  `hometext` text,
  `bodytext` text NOT NULL,
  `comments` int(11) default '0',
  `counter` mediumint(8) unsigned default NULL,
  `topic` int(3) NOT NULL default '1',
  `informant` varchar(20) NOT NULL default '',
  `notes` text NOT NULL,
  `ihome` int(1) NOT NULL default '0',
  `alanguage` varchar(30) NOT NULL default '',
  `acomm` int(1) NOT NULL default '0',
  `haspoll` int(1) NOT NULL default '0',
  `pollID` int(10) NOT NULL default '0',
  `score` int(10) NOT NULL default '0',
  `ratings` int(10) NOT NULL default '0',
  `associated` text NOT NULL,
  PRIMARY KEY  (`sid`),
  KEY `sid` (`sid`),
  KEY `catid` (`catid`),
  KEY `counter` (`counter`),
  KEY `topic` (`topic`)
) TYPE=MyISAM;

INSERT INTO `kayapo_stories` VALUES (1, 0, 'admin', 'Bem-vindo ao Kayapó!', '2004-12-22 10:26:15', 'O PHP-Nuke Kayapó é uma compilação das melhores e mais atuais ferramentas desenvolvidas para PHP-Nuke, com a intenção de satisfazer a todos os usuários.\r\n<br><br>\r\nCaso haja dúvidas, comentários, relato de bugs e sugestões, por gentileza envie um e-mail para: <a href="mailto:kayapo@phpnuke.org.br">kayapo@phpnuke.org.br</a>.', ' É claro que esta tarefa, agradar a todos, seria um tanto presunçosa demais de nossa parte, mas acreditamos que conseguiremos agradar a muitos usuários, já que conseguimos reunir o que é mais utilizado em vários portais, sem nos esquecermos da segurança.\r\n<br><br>\r\nSua opinião, sugestão ou crítica são muito bem-vindas para nossos futuros lançamentos.\r\n<br><br>\r\nEnvie agora mesmo um e-mail com seus comentários para: <a href="mailto:webmaster@phpnuke.org.br">webmaster@phpnuke.org.br</a>.', 0, 20, 1, 'admin', '', 0, '', 0, 0, 0, 0, 0, '1-');

CREATE TABLE `kayapo_stories_cat` (
  `catid` int(11) NOT NULL auto_increment,
  `title` varchar(20) NOT NULL default '',
  `counter` int(11) NOT NULL default '0',
  PRIMARY KEY  (`catid`),
  KEY `catid` (`catid`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_subscriptions` (
  `id` int(10) NOT NULL auto_increment,
  `userid` int(10) default '0',
  `subscription_expire` varchar(50) NOT NULL default '',
  KEY `id` (`id`,`userid`)
) TYPE=MyISAM;

CREATE TABLE `kayapo_topics` (
  `topicid` int(3) NOT NULL auto_increment,
  `topicname` varchar(20) default NULL,
  `topicimage` varchar(20) default NULL,
  `topictext` varchar(40) default NULL,
  `counter` int(11) NOT NULL default '0',
  PRIMARY KEY  (`topicid`),
  KEY `topicid` (`topicid`)
) TYPE=MyISAM;

INSERT INTO `kayapo_topics` VALUES (1, 'phpnuke', 'phpnuke.gif', 'PHP-Nuke', 0);

CREATE TABLE `kayapo_users` (
  `user_id` int(11) NOT NULL auto_increment,
  `name` varchar(60) NOT NULL default '',
  `username` varchar(25) NOT NULL default '',
  `user_email` varchar(255) NOT NULL default '',
  `femail` varchar(255) NOT NULL default '',
  `user_website` varchar(255) NOT NULL default '',
  `user_avatar` varchar(255) NOT NULL default '',
  `user_regdate` varchar(20) NOT NULL default '',
  `user_icq` varchar(15) default NULL,
  `user_occ` varchar(100) default NULL,
  `user_from` varchar(100) default NULL,
  `user_interests` varchar(150) NOT NULL default '',
  `user_sig` varchar(255) default NULL,
  `user_viewemail` tinyint(2) default NULL,
  `user_theme` int(3) default NULL,
  `user_aim` varchar(18) default NULL,
  `user_yim` varchar(25) default NULL,
  `user_msnm` varchar(25) default NULL,
  `user_password` varchar(40) NOT NULL default '',
  `storynum` tinyint(4) NOT NULL default '10',
  `umode` varchar(10) NOT NULL default '',
  `uorder` tinyint(1) NOT NULL default '0',
  `thold` tinyint(1) NOT NULL default '0',
  `noscore` tinyint(1) NOT NULL default '0',
  `bio` tinytext NOT NULL,
  `ublockon` tinyint(1) NOT NULL default '0',
  `ublock` tinytext NOT NULL,
  `theme` varchar(255) NOT NULL default '',
  `commentmax` int(11) NOT NULL default '4096',
  `counter` int(11) NOT NULL default '0',
  `newsletter` int(1) NOT NULL default '0',
  `user_posts` int(10) NOT NULL default '0',
  `user_attachsig` int(2) NOT NULL default '0',
  `user_rank` int(10) NOT NULL default '0',
  `user_level` int(10) NOT NULL default '1',
  `broadcast` tinyint(1) NOT NULL default '1',
  `popmeson` tinyint(1) NOT NULL default '0',
  `user_active` tinyint(1) default '1',
  `user_session_time` int(11) NOT NULL default '0',
  `user_session_page` smallint(5) NOT NULL default '0',
  `user_lastvisit` int(11) NOT NULL default '0',
  `user_timezone` tinyint(4) NOT NULL default '10',
  `user_style` tinyint(4) default NULL,
  `user_lang` varchar(255) NOT NULL default 'brazilian',
  `user_dateformat` varchar(14) NOT NULL default 'D M d, Y g:i a',
  `user_new_privmsg` smallint(5) unsigned NOT NULL default '0',
  `user_unread_privmsg` smallint(5) unsigned NOT NULL default '0',
  `user_last_privmsg` int(11) NOT NULL default '0',
  `user_emailtime` int(11) default NULL,
  `user_allowhtml` tinyint(1) default '1',
  `user_allowbbcode` tinyint(1) default '1',
  `user_allowsmile` tinyint(1) default '1',
  `user_allowavatar` tinyint(1) NOT NULL default '1',
  `user_allow_pm` tinyint(1) NOT NULL default '1',
  `user_allow_viewonline` tinyint(1) NOT NULL default '1',
  `user_notify` tinyint(1) NOT NULL default '0',
  `user_notify_pm` tinyint(1) NOT NULL default '0',
  `user_popup_pm` tinyint(1) NOT NULL default '0',
  `user_avatar_type` tinyint(4) NOT NULL default '3',
  `user_sig_bbcode_uid` varchar(10) default NULL,
  `user_actkey` varchar(32) default NULL,
  `user_newpasswd` varchar(32) default NULL,
  `points` int(10) default '0',
  `last_ip` varchar(15) NOT NULL default '0',
  `agreedtos` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`user_id`),
  KEY `uid` (`user_id`),
  KEY `uname` (`username`),
  KEY `user_session_time` (`user_session_time`)
) TYPE=MyISAM;

INSERT INTO `kayapo_users` VALUES (1, '', 'Anonymous', '', '', '', 'blank.gif', 'Nov 10, 2000', '', '', '', '', '', 0, 0, '', '', '', '', 10, '', 0, 0, 0, '', 0, '', '', 4096, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 10, NULL, 'brazilian', 'D M d, Y g:i a', 0, 0, 0, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 0, 3, NULL, NULL, NULL, 0, '0', 0);

CREATE TABLE `kayapo_users_temp` (
  `user_id` int(10) NOT NULL auto_increment,
  `username` varchar(25) NOT NULL default '',
  `realname` varchar(255) NOT NULL default '',
  `user_email` varchar(255) NOT NULL default '',
  `user_password` varchar(40) NOT NULL default '',
  `user_regdate` varchar(20) NOT NULL default '',
  `check_num` varchar(50) NOT NULL default '',
  `time` varchar(14) NOT NULL default '',
  PRIMARY KEY  (`user_id`)
) TYPE=MyISAM;

