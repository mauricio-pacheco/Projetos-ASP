-- phpMyAdmin SQL Dump
-- version 2.6.0-pl3
-- http://www.phpmyadmin.net
-- 
-- Servidor: localhost:3306
-- Tempo de Generação: Jan 04, 2006 at 10:26 PM
-- Versão do Servidor: 4.1.12
-- Versão do PHP: 4.3.10
-- 
-- Banco de Dados: `frequencia`
-- 

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_authors`
-- 

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Extraindo dados da tabela `kayapo_authors`
-- 

INSERT INTO `kayapo_authors` VALUES ('Mandry', 'God', 'http://www.casadaweb.net', 'mandry@casadaweb.net', 'df8db813ac00dd0d9b91fb29f596417a', -1, 1, '');
INSERT INTO `kayapo_authors` VALUES ('Garopaba', 'Rádio Frequência', 'http://www.casadaweb.net', 'mandry@casadaweb.net', '25f9e794323b453885f5181f1b624d0b', 0, 1, '');

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_autonews`
-- 

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `kayapo_autonews`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_banned_ip`
-- 

CREATE TABLE `kayapo_banned_ip` (
  `id` int(11) NOT NULL auto_increment,
  `ip_address` varchar(15) NOT NULL default '',
  `reason` varchar(255) NOT NULL default '',
  `date` date NOT NULL default '0000-00-00',
  PRIMARY KEY  (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `kayapo_banned_ip`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_banner`
-- 

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- 
-- Extraindo dados da tabela `kayapo_banner`
-- 

INSERT INTO `kayapo_banner` VALUES (1, 1, 0, 92, 0, 'http://kayapo.phpnuke.org.br/images/banner01.gif', 'kayapo.phpnuke.org.br', 'Kayap?! Toda a for?a do PHP-Nuke...', '2005-01-13 16:27:39', '0000-00-00 00:00:00', 0, 1);

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_bannerclient`
-- 

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- 
-- Extraindo dados da tabela `kayapo_bannerclient`
-- 

INSERT INTO `kayapo_bannerclient` VALUES (1, 'Kayap?', 'Kayap?', 'kayapo@phpnuke.org.br', 'kayapo', 'kanyanpob', '@;D');

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_bbauth_access`
-- 

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Extraindo dados da tabela `kayapo_bbauth_access`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_bbbanlist`
-- 

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `kayapo_bbbanlist`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_bbcategories`
-- 

CREATE TABLE `kayapo_bbcategories` (
  `cat_id` mediumint(8) unsigned NOT NULL auto_increment,
  `cat_title` varchar(100) default NULL,
  `cat_order` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`cat_id`),
  KEY `cat_order` (`cat_order`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `kayapo_bbcategories`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_bbconfig`
-- 

CREATE TABLE `kayapo_bbconfig` (
  `config_name` varchar(255) NOT NULL default '',
  `config_value` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`config_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Extraindo dados da tabela `kayapo_bbconfig`
-- 

INSERT INTO `kayapo_bbconfig` VALUES ('config_id', '1');
INSERT INTO `kayapo_bbconfig` VALUES ('board_disable', '0');
INSERT INTO `kayapo_bbconfig` VALUES ('sitename', 'meusite.com.br');
INSERT INTO `kayapo_bbconfig` VALUES ('site_desc', 'Site feito com PHP-Nuke 7.5 CNB - Kayap?');
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
INSERT INTO `kayapo_bbconfig` VALUES ('record_online_users', '1');
INSERT INTO `kayapo_bbconfig` VALUES ('record_online_date', '1132322375');
INSERT INTO `kayapo_bbconfig` VALUES ('server_name', 'Kayap? WebSite');
INSERT INTO `kayapo_bbconfig` VALUES ('server_port', '80');
INSERT INTO `kayapo_bbconfig` VALUES ('script_path', '/modules/Forums/');
INSERT INTO `kayapo_bbconfig` VALUES ('version', '.0.10');
INSERT INTO `kayapo_bbconfig` VALUES ('enable_confirm', '0');
INSERT INTO `kayapo_bbconfig` VALUES ('sendmail_fix', '0');

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_bbdisallow`
-- 

CREATE TABLE `kayapo_bbdisallow` (
  `disallow_id` mediumint(8) unsigned NOT NULL auto_increment,
  `disallow_username` varchar(25) default NULL,
  PRIMARY KEY  (`disallow_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `kayapo_bbdisallow`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_bbforum_prune`
-- 

CREATE TABLE `kayapo_bbforum_prune` (
  `prune_id` mediumint(8) unsigned NOT NULL auto_increment,
  `forum_id` smallint(5) unsigned NOT NULL default '0',
  `prune_days` tinyint(4) unsigned NOT NULL default '0',
  `prune_freq` tinyint(4) unsigned NOT NULL default '0',
  PRIMARY KEY  (`prune_id`),
  KEY `forum_id` (`forum_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `kayapo_bbforum_prune`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_bbforums`
-- 

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `kayapo_bbforums`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_bbgroups`
-- 

CREATE TABLE `kayapo_bbgroups` (
  `group_id` mediumint(8) NOT NULL auto_increment,
  `group_type` tinyint(4) NOT NULL default '1',
  `group_name` varchar(40) NOT NULL default '',
  `group_description` varchar(255) NOT NULL default '',
  `group_moderator` mediumint(8) NOT NULL default '0',
  `group_single_user` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`group_id`),
  KEY `group_single_user` (`group_single_user`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- 
-- Extraindo dados da tabela `kayapo_bbgroups`
-- 

INSERT INTO `kayapo_bbgroups` VALUES (1, 1, 'Anonymous', 'Personal User', 0, 1);

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_bbposts`
-- 

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `kayapo_bbposts`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_bbposts_text`
-- 

CREATE TABLE `kayapo_bbposts_text` (
  `post_id` mediumint(8) unsigned NOT NULL default '0',
  `bbcode_uid` varchar(10) NOT NULL default '',
  `post_subject` varchar(60) default NULL,
  `post_text` text,
  PRIMARY KEY  (`post_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Extraindo dados da tabela `kayapo_bbposts_text`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_bbprivmsgs`
-- 

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `kayapo_bbprivmsgs`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_bbprivmsgs_text`
-- 

CREATE TABLE `kayapo_bbprivmsgs_text` (
  `privmsgs_text_id` mediumint(8) unsigned NOT NULL default '0',
  `privmsgs_bbcode_uid` varchar(10) NOT NULL default '0',
  `privmsgs_text` text,
  PRIMARY KEY  (`privmsgs_text_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Extraindo dados da tabela `kayapo_bbprivmsgs_text`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_bbranks`
-- 

CREATE TABLE `kayapo_bbranks` (
  `rank_id` smallint(5) unsigned NOT NULL auto_increment,
  `rank_title` varchar(50) NOT NULL default '',
  `rank_min` mediumint(8) NOT NULL default '0',
  `rank_max` mediumint(8) NOT NULL default '0',
  `rank_special` tinyint(1) default '0',
  `rank_image` varchar(255) default NULL,
  PRIMARY KEY  (`rank_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- 
-- Extraindo dados da tabela `kayapo_bbranks`
-- 

INSERT INTO `kayapo_bbranks` VALUES (1, 'Site Admin', -1, -1, 1, 'modules/Forums/images/ranks/6stars.gif');
INSERT INTO `kayapo_bbranks` VALUES (2, 'Newbie', 1, 0, 0, 'modules/Forums/images/ranks/1star.gif');

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_bbsearch_results`
-- 

CREATE TABLE `kayapo_bbsearch_results` (
  `search_id` int(11) unsigned NOT NULL default '0',
  `session_id` varchar(32) NOT NULL default '',
  `search_array` text NOT NULL,
  PRIMARY KEY  (`search_id`),
  KEY `session_id` (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Extraindo dados da tabela `kayapo_bbsearch_results`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_bbsearch_wordlist`
-- 

CREATE TABLE `kayapo_bbsearch_wordlist` (
  `word_text` varchar(50) character set latin1 collate latin1_bin NOT NULL default '',
  `word_id` mediumint(8) unsigned NOT NULL auto_increment,
  `word_common` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`word_text`),
  KEY `word_id` (`word_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `kayapo_bbsearch_wordlist`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_bbsearch_wordmatch`
-- 

CREATE TABLE `kayapo_bbsearch_wordmatch` (
  `post_id` mediumint(8) unsigned NOT NULL default '0',
  `word_id` mediumint(8) unsigned NOT NULL default '0',
  `title_match` tinyint(1) NOT NULL default '0',
  KEY `word_id` (`word_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Extraindo dados da tabela `kayapo_bbsearch_wordmatch`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_bbsessions`
-- 

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Extraindo dados da tabela `kayapo_bbsessions`
-- 

INSERT INTO `kayapo_bbsessions` VALUES ('0100f170595cf12ae43524b19e7c764e', 2, 1132100486, 1132100486, 'c9039c34', 0, 1);
INSERT INTO `kayapo_bbsessions` VALUES ('e42a6a5f745dedcccccf4b406dba89a1', 2, 1132101017, 1132101017, 'c9039c34', 0, 1);
INSERT INTO `kayapo_bbsessions` VALUES ('76d778b723a9a581a8ab0c273ba48674', 2, 1132101196, 1132101196, 'c9039c34', 0, 1);
INSERT INTO `kayapo_bbsessions` VALUES ('9ab521aace0ac0f087de91f6d5e0b7d1', 2, 1132322357, 1132322357, 'c8664a60', 0, 1);

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_bbsmilies`
-- 

CREATE TABLE `kayapo_bbsmilies` (
  `smilies_id` smallint(5) unsigned NOT NULL auto_increment,
  `code` varchar(50) default NULL,
  `smile_url` varchar(100) default NULL,
  `emoticon` varchar(75) default NULL,
  PRIMARY KEY  (`smilies_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=45 ;

-- 
-- Extraindo dados da tabela `kayapo_bbsmilies`
-- 

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

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_bbthemes`
-- 

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- 
-- Extraindo dados da tabela `kayapo_bbthemes`
-- 

INSERT INTO `kayapo_bbthemes` VALUES (2, 'subSilver', 'CNB', 'forums', '', 'FFFFFF', '000000', '000000', '000000', 'FF0000', 'F44903', 'ECECEC', 'CACCCB', 'CACCCB', '', '', '', 'ECECEC', 'CACCCB', 'ECECEC', '', '', '', 'A3A2A2', 'ECECEC', 'ECECEC', '', '', '', 'Verdana', 'Arial', 'Sans-Serif', 10, 11, 10, '000000', '000000', 'F44903', '', '', '', NULL, NULL);

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_bbthemes_name`
-- 

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Extraindo dados da tabela `kayapo_bbthemes_name`
-- 

INSERT INTO `kayapo_bbthemes_name` VALUES (2, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_bbtopics`
-- 

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `kayapo_bbtopics`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_bbtopics_watch`
-- 

CREATE TABLE `kayapo_bbtopics_watch` (
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `user_id` mediumint(8) NOT NULL default '0',
  `notify_status` tinyint(1) NOT NULL default '0',
  KEY `topic_id` (`topic_id`),
  KEY `user_id` (`user_id`),
  KEY `notify_status` (`notify_status`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Extraindo dados da tabela `kayapo_bbtopics_watch`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_bbuser_group`
-- 

CREATE TABLE `kayapo_bbuser_group` (
  `group_id` mediumint(8) NOT NULL default '0',
  `user_id` mediumint(8) NOT NULL default '0',
  `user_pending` tinyint(1) default NULL,
  KEY `group_id` (`group_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Extraindo dados da tabela `kayapo_bbuser_group`
-- 

INSERT INTO `kayapo_bbuser_group` VALUES (1, -1, 0);

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_bbvote_desc`
-- 

CREATE TABLE `kayapo_bbvote_desc` (
  `vote_id` mediumint(8) unsigned NOT NULL auto_increment,
  `topic_id` mediumint(8) unsigned NOT NULL default '0',
  `vote_text` text NOT NULL,
  `vote_start` int(11) NOT NULL default '0',
  `vote_length` int(11) NOT NULL default '0',
  PRIMARY KEY  (`vote_id`),
  KEY `topic_id` (`topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `kayapo_bbvote_desc`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_bbvote_results`
-- 

CREATE TABLE `kayapo_bbvote_results` (
  `vote_id` mediumint(8) unsigned NOT NULL default '0',
  `vote_option_id` tinyint(4) unsigned NOT NULL default '0',
  `vote_option_text` varchar(255) NOT NULL default '',
  `vote_result` int(11) NOT NULL default '0',
  KEY `vote_option_id` (`vote_option_id`),
  KEY `vote_id` (`vote_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Extraindo dados da tabela `kayapo_bbvote_results`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_bbvote_voters`
-- 

CREATE TABLE `kayapo_bbvote_voters` (
  `vote_id` mediumint(8) unsigned NOT NULL default '0',
  `vote_user_id` mediumint(8) NOT NULL default '0',
  `vote_user_ip` char(8) NOT NULL default '',
  KEY `vote_id` (`vote_id`),
  KEY `vote_user_id` (`vote_user_id`),
  KEY `vote_user_ip` (`vote_user_ip`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Extraindo dados da tabela `kayapo_bbvote_voters`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_bbwords`
-- 

CREATE TABLE `kayapo_bbwords` (
  `word_id` mediumint(8) unsigned NOT NULL auto_increment,
  `word` char(100) NOT NULL default '',
  `replacement` char(100) NOT NULL default '',
  PRIMARY KEY  (`word_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `kayapo_bbwords`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_blocks`
-- 

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

-- 
-- Extraindo dados da tabela `kayapo_blocks`
-- 

INSERT INTO `kayapo_blocks` VALUES (1, '', 'M?dulos', '', '', 'l', 2, 0, 0, '', '', 'block-Modules.php', 0, '', '0', 'd', 0);
INSERT INTO `kayapo_blocks` VALUES (2, 'admin', 'Administra?', '<strong><big>?</big></strong> <a href="admin.php">Menu de Administra??o</a><br>\r\n<strong><big>?</big></strong> <a href="admin.php?op=FCKadminStory">Nova Not?cia</a><br>\r\n<strong><big>?</big></strong> <a href="admin.php?op=create">Alterar Enquete</a><br>\r\n<strong><big>?</big></strong> <a href="admin.php?op=content">Inserir Conte?do</a><br>\r\n<strong><big>?</big></strong> <a href="admin.php?op=logout">Logout</a><center>', '', 'l', 1, 0, 0, '985591188', '', '', 2, '', '0', 'd', 0);
INSERT INTO `kayapo_blocks` VALUES (10, '', 'Eventos Regionais', '', '', 'l', 4, 1, 0, '', '', 'block-Calendar2.php', 0, '', '0', 'd', 0);
INSERT INTO `kayapo_blocks` VALUES (11, '', 'Ouvintes', '', '', 'l', 5, 1, 0, '', '', 'block-User_Info.php', 0, '', '0', 'd', 0);
INSERT INTO `kayapo_blocks` VALUES (13, '', 'Tempo Agora', '<p align="center"><iframe src="http://www.tempoagora.com.br/selos/custom/selo.php?cid=Garopaba-SC;" name="seloGaropaba-SC" width="120" height="125" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe></p>', '', 'r', 4, 1, 3600, '', '', '', 0, '', '0', 'd', 0);
INSERT INTO `kayapo_blocks` VALUES (14, '', 'AO VIVO!', '<p align="center"><embed src="aovivo.swf" width="340" height="70"></embed></p>', '', 'c', 1, 1, 0, '', '', '', 0, '', '0', 'd', 0);
INSERT INTO `kayapo_blocks` VALUES (19, '', '', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">\r\n<html>\r\n<head>\r\n<title>Documento sem t?tulo</title>\r\n<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">\r\n</head>\r\n\r\n<body>\r\n<table width="100%" border="1" align="center" bordercolor="#f2f1ed">\r\n<tr><td align="center"><strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif">ÚLTIMAS \r\nNOTÍCIAS ONLINE </font></strong> </td></tr>\r\n<tr>\r\n   \r\n    <td height="100" bordercolor="#000000"> <MARQUEE behavior="scroll" align="left" direction="up" height="100" width="350" scrollamount="1" scrolldelay="10" onmouseover=''this.stop()'' onmouseout=''this.start()''>\r\n      <iframe src="news.php" width="350" height="400" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe>\r\n      </marquee> </td>\r\n  </tr>\r\n</table>\r\n</body>\r\n</html>\r\n', '', 'c', 2, 1, 0, '', '', '', 0, '', '0', 'd', 0);
INSERT INTO `kayapo_blocks` VALUES (5, 'userbox', 'Bloco do Usu?rio', '', '', 'r', 1, 1, 0, '', '', '', 1, '', '0', 'd', 0);
INSERT INTO `kayapo_blocks` VALUES (6, '', 'Enquete', '', '', 'r', 5, 1, 0, '', '', 'block-Survey.php', 0, '', '0', 'd', 0);
INSERT INTO `kayapo_blocks` VALUES (12, '', '', '<p align="center"><embed src="music.swf" width="150" height="120"></embed></p>', '', 'r', 2, 1, 0, '', '', '', 0, '', '0', 'd', 0);
INSERT INTO `kayapo_blocks` VALUES (8, '', 'Informa??es', '<center>\r\n<a href="http://phpnuke.org.br"><img src="http://phpnuke.org.br/images/minibanner.gif" border="0" alt="Comunidade PHP-Nuke Brasil \n- CNB"></a>\r\n<br><br>\r\n<a href="http://jigsaw.w3.org/css-validator/validator?uri=http://kayapo.phpnuke.org.br/themes/Kayapo/style/style.css"><img src="images/css.gif" width="88" height="31" \nalt="Nosso CSS ? V?lido!!!" title="Nosso CSS ? V?lido!!!" border="0"></a></center>', '', 'r', 3, 0, 0, '', '', '', 0, '', '0', 'd', 0);
INSERT INTO `kayapo_blocks` VALUES (17, '', '', '<p align="center"><img src="jor.jpg" width="350" height="50"></p>', '', 'c', 3, 1, 0, '', '', '', 0, '', '0', 'd', 0);
INSERT INTO `kayapo_blocks` VALUES (18, '', 'Menu', '<iframe src="menu.php" width="160" height="302" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe>', '', 'l', 3, 1, 0, '', '', '', 0, '', '0', 'd', 0);
INSERT INTO `kayapo_blocks` VALUES (20, '', 'Ao vivo Winamp', '<p><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><img src="winamp.gif" width="20" height="20"> \r\n  <a href="http://www.radiofrequencia.net/frequencia.m3u">AO VIVO</a></font></p>\r\n<p><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><img src="winamp.gif" width="20" height="20"> \r\n  <a href="http://download.nullsoft.com/winamp/client/winamp512_lite.exe">DOWNLOAD</a></font></p>', '', 'r', 6, 1, 3600, '', '', '', 0, '', '0', 'd', 0);

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_cnbya_config`
-- 

CREATE TABLE `kayapo_cnbya_config` (
  `config_name` varchar(255) NOT NULL default '',
  `config_value` longtext,
  UNIQUE KEY `config_name` (`config_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Extraindo dados da tabela `kayapo_cnbya_config`
-- 

INSERT INTO `kayapo_cnbya_config` VALUES ('sendaddmail', '0');
INSERT INTO `kayapo_cnbya_config` VALUES ('senddeletemail', '0');
INSERT INTO `kayapo_cnbya_config` VALUES ('allowuserdelete', '0');
INSERT INTO `kayapo_cnbya_config` VALUES ('allowusertheme', '1');
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
INSERT INTO `kayapo_cnbya_config` VALUES ('bad_mail', 'mysite.com\r\nyoursite.com');
INSERT INTO `kayapo_cnbya_config` VALUES ('bad_nick', 'adm\r\nadmin\r\nanonimo\r\nanonymous\r\nanônimo\r\ngod\r\nlinux\r\nnobody\r\noperator\r\nroot\r\nstaff\r\nwebmaster');
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

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_cnbya_field`
-- 

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `kayapo_cnbya_field`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_cnbya_value`
-- 

CREATE TABLE `kayapo_cnbya_value` (
  `vid` int(10) NOT NULL auto_increment,
  `uid` int(10) NOT NULL default '0',
  `fid` int(10) NOT NULL default '0',
  `value` varchar(255) default NULL,
  PRIMARY KEY  (`vid`),
  KEY `vid` (`vid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `kayapo_cnbya_value`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_cnbya_value_temp`
-- 

CREATE TABLE `kayapo_cnbya_value_temp` (
  `vid` int(10) NOT NULL auto_increment,
  `uid` int(10) NOT NULL default '0',
  `fid` int(10) NOT NULL default '0',
  `value` varchar(255) default NULL,
  PRIMARY KEY  (`vid`),
  KEY `vid` (`vid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `kayapo_cnbya_value_temp`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_comments`
-- 

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `kayapo_comments`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_config`
-- 

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Extraindo dados da tabela `kayapo_config`
-- 

INSERT INTO `kayapo_config` VALUES ('R&aacute;dio Frequ&ecirc;ncia AM', 'http://www.casadaweb.net/garopaba/', '', 'Como uma onda no ar...', 'Dezembro de 2005', 'mandry@casadaweb.net', 0, 'ph2blue', '', '', '', 4096, 'Anônimo', 5, 1, 0, 0, 0, 10, 10, 0, 30, 0, 1, 'R&aacute;dio Frequ&ecirc;ncia AM', 'pt-br', 'brazilian', 'pt_BR', 0, 0, 0, 'e-mail@phpnuke.org.br', 'Algu&eacute;m enviou uma not&iacute;cia!!!', 'Ol?\r\n\\n\\n\r\nAlgu?m enviou uma not?cia para seu portal!', 'webmaster', 0, 1, 1, 2000, 3, '*****', 'PHP-Nuke Copyright &copy; 2004 by Francisco Burzi. This is free software, and you may redistribute it under the <a href="http://phpnuke.org/files/gpl.txt"><font class="footmsg_l">GPL</font></a>. PHP-Nuke comes with absolutely no warranty, for details, see the <a href="http://phpnuke.org/files/gpl.txt"><font class="footmsg_l">license</font></a>.', '7.5 Kayap?');

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_confirm`
-- 

CREATE TABLE `kayapo_confirm` (
  `confirm_id` char(32) NOT NULL default '',
  `session_id` char(32) NOT NULL default '',
  `code` char(6) NOT NULL default '',
  PRIMARY KEY  (`session_id`,`confirm_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Extraindo dados da tabela `kayapo_confirm`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_counter`
-- 

CREATE TABLE `kayapo_counter` (
  `type` varchar(80) NOT NULL default '',
  `var` varchar(80) NOT NULL default '',
  `count` int(10) unsigned NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Extraindo dados da tabela `kayapo_counter`
-- 

INSERT INTO `kayapo_counter` VALUES ('total', 'hits', 788);
INSERT INTO `kayapo_counter` VALUES ('browser', 'WebTV', 0);
INSERT INTO `kayapo_counter` VALUES ('browser', 'Lynx', 0);
INSERT INTO `kayapo_counter` VALUES ('browser', 'MSIE', 788);
INSERT INTO `kayapo_counter` VALUES ('browser', 'Opera', 0);
INSERT INTO `kayapo_counter` VALUES ('browser', 'Konqueror', 0);
INSERT INTO `kayapo_counter` VALUES ('browser', 'Netscape', 0);
INSERT INTO `kayapo_counter` VALUES ('browser', 'Bot', 0);
INSERT INTO `kayapo_counter` VALUES ('browser', 'Other', 0);
INSERT INTO `kayapo_counter` VALUES ('os', 'Windows', 788);
INSERT INTO `kayapo_counter` VALUES ('os', 'Linux', 0);
INSERT INTO `kayapo_counter` VALUES ('os', 'Mac', 0);
INSERT INTO `kayapo_counter` VALUES ('os', 'FreeBSD', 0);
INSERT INTO `kayapo_counter` VALUES ('os', 'SunOS', 0);
INSERT INTO `kayapo_counter` VALUES ('os', 'IRIX', 0);
INSERT INTO `kayapo_counter` VALUES ('os', 'BeOS', 0);
INSERT INTO `kayapo_counter` VALUES ('os', 'OS/2', 0);
INSERT INTO `kayapo_counter` VALUES ('os', 'AIX', 0);
INSERT INTO `kayapo_counter` VALUES ('os', 'Other', 0);

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_encyclopedia`
-- 

CREATE TABLE `kayapo_encyclopedia` (
  `eid` int(10) NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `description` text NOT NULL,
  `elanguage` varchar(30) NOT NULL default '',
  `active` int(1) NOT NULL default '0',
  PRIMARY KEY  (`eid`),
  KEY `eid` (`eid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `kayapo_encyclopedia`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_encyclopedia_text`
-- 

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `kayapo_encyclopedia_text`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_events`
-- 

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- 
-- Extraindo dados da tabela `kayapo_events`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_events_comments`
-- 

CREATE TABLE `kayapo_events_comments` (
  `cid` int(10) unsigned NOT NULL auto_increment,
  `eid` int(10) unsigned NOT NULL default '0',
  `comment` varchar(255) NOT NULL default '',
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`cid`),
  UNIQUE KEY `cid` (`cid`),
  KEY `cid_2` (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `kayapo_events_comments`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_events_queue`
-- 

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- 
-- Extraindo dados da tabela `kayapo_events_queue`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_faqanswer`
-- 

CREATE TABLE `kayapo_faqanswer` (
  `id` tinyint(4) NOT NULL auto_increment,
  `id_cat` tinyint(4) NOT NULL default '0',
  `question` varchar(255) default '',
  `answer` text,
  PRIMARY KEY  (`id`),
  KEY `id` (`id`),
  KEY `id_cat` (`id_cat`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `kayapo_faqanswer`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_faqcategories`
-- 

CREATE TABLE `kayapo_faqcategories` (
  `id_cat` tinyint(3) NOT NULL auto_increment,
  `categories` varchar(255) default NULL,
  `flanguage` varchar(30) NOT NULL default '',
  PRIMARY KEY  (`id_cat`),
  KEY `id_cat` (`id_cat`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `kayapo_faqcategories`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_gallery_categories`
-- 

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- 
-- Extraindo dados da tabela `kayapo_gallery_categories`
-- 

INSERT INTO `kayapo_gallery_categories` VALUES (2, 'Kayapo', 'logo.gif', 0x6b617961706f, 0x496d6167656e7320646520cd6e64696f73204b61796170f3732e, -1, 2, 0, 135, 3, 1, 0x323030342d31322d3231);

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_gallery_comments`
-- 

CREATE TABLE `kayapo_gallery_comments` (
  `cid` int(11) NOT NULL auto_increment,
  `pid` int(11) default NULL,
  `comment` blob,
  `date` datetime default NULL,
  `name` varchar(255) default NULL,
  `member` int(11) default NULL,
  PRIMARY KEY  (`cid`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- 
-- Extraindo dados da tabela `kayapo_gallery_comments`
-- 

INSERT INTO `kayapo_gallery_comments` VALUES (1, 1, 0x636f6f6c20617274, '2000-12-19 12:18:53', 'dgrabows', 0);
INSERT INTO `kayapo_gallery_comments` VALUES (2, 1, 0x476f6f64206a6f622062757420636f756c6420626520626574746572, '2001-05-18 17:50:04', 'MarsIsHere', 0);
INSERT INTO `kayapo_gallery_comments` VALUES (3, 1, 0x457420766f696ce0212121, '2001-05-18 17:58:51', 'Webmaster', 1);
INSERT INTO `kayapo_gallery_comments` VALUES (4, 1, 0x726f726f726f, '2001-09-24 21:18:10', 'tororo', 0);

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_gallery_media_class`
-- 

CREATE TABLE `kayapo_gallery_media_class` (
  `id` int(11) NOT NULL auto_increment,
  `class` varchar(10) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

-- 
-- Extraindo dados da tabela `kayapo_gallery_media_class`
-- 

INSERT INTO `kayapo_gallery_media_class` VALUES (1, 'Image');
INSERT INTO `kayapo_gallery_media_class` VALUES (2, 'Audio');
INSERT INTO `kayapo_gallery_media_class` VALUES (3, 'Video');

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_gallery_media_types`
-- 

CREATE TABLE `kayapo_gallery_media_types` (
  `extension` varchar(10) NOT NULL default '',
  `description` blob,
  `filetype` varchar(20) default NULL,
  `displaytag` blob,
  `thumbnail` varchar(255) default NULL,
  PRIMARY KEY  (`extension`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Extraindo dados da tabela `kayapo_gallery_media_types`
-- 

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

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_gallery_pictures`
-- 

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

-- 
-- Extraindo dados da tabela `kayapo_gallery_pictures`
-- 

INSERT INTO `kayapo_gallery_pictures` VALUES (7, 2, 'kayapo-card01.jpg', 16, 'Kayap?', '2004-12-21 10:52:05', 'Kayapo01', 0x496d6167656d20646520756d206a6f76656d20ed6e64696f204b61796170f32e0d0a0d0a4573746120696d6167656d20e920636f72746573696120646520476572686172642050726f6b6f702e, 0, 0, 'jpg', 430, 600);

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_gallery_pictures_newpicture`
-- 

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `kayapo_gallery_pictures_newpicture`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_gallery_rate_check`
-- 

CREATE TABLE `kayapo_gallery_rate_check` (
  `ip` varchar(20) default NULL,
  `time` varchar(14) default NULL,
  `pid` int(11) default NULL,
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Extraindo dados da tabela `kayapo_gallery_rate_check`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_gallery_template_types`
-- 

CREATE TABLE `kayapo_gallery_template_types` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) default NULL,
  `type` int(11) default NULL,
  `templateCategory` blob,
  `templatePictures` blob,
  `templateCSS` blob,
  PRIMARY KEY  (`id`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- 
-- Extraindo dados da tabela `kayapo_gallery_template_types`
-- 

INSERT INTO `kayapo_gallery_template_types` VALUES (1, 'Default Main Page Template', 1, 0x3c7461626c6520616c69676e3d2263656e746572223e0d0a3c74723e0d0a093c746420636f6c7370616e3d2232223e0d0a09093c3a47414c4c4e414d453a3e0d0a093c2f74643e0d0a3c2f74723e0d0a3c74723e0d0a093c74643e0d0a09093c3a494d4147453a3e0d0a093c2f74643e0d0a093c74642076616c69676e3d22746f702220616c69676e3d226c656674223e0d0a09093c3a4445534352495054494f4e3a3e0d0a093c2f74643e0d0a3c2f74723e0d0a3c2f7461626c653e, 0x32, 0x2e636f6d6d6f6e5f746578745f626c61636b207b746578742d636f6c6f723a233030303030307d0d0a2e636f6d6d6f6e5f746578745f7768697465207b746578742d636f6c6f723a236666666666667d);
INSERT INTO `kayapo_gallery_template_types` VALUES (2, 'Default', 2, 0x3c7461626c6520626f726465723d2230222063656c6c70616464696e673d2230222063656c6c73706163696e673d2230223e0d0a3c74723e0d0a093c74643e0d0a09093c3a494d4147453a3e0d0a093c2f74643e0d0a093c74642076616c69676e3d22746f70223e0d0a09093c703e0d0a090909093c7461626c653e0d0a090909093c74723e0d0a09090909093c746420616c69676e3d2263656e746572223e0d0a0909090909093c3a444154453a3e0d0a09090909093c2f74643e0d0a09090909093c746420616c69676e3d2263656e746572223e0d0a0909090909093c3a524154453a3e0d0a09090909093c2f74643e0d0a09090909093c746420616c69676e3d2263656e746572223e0d0a0909090909093c3a484954533a3e0d0a09090909093c2f74643e0d0a09090909093c746420616c69676e3d2263656e746572223e0d0a0909090909093c3a4e45573a3e0d0a09090909093c2f74643e0d0a090909093c2f74723e0d0a090909093c2f7461626c653e0d0a09093c2f703e0d0a09093c703e0d0a090909093c3a4445534352495054494f4e3a3e0d0a09093c2f703e0d0a09093c703e0d0a090909093c3a4e42434f4d4d454e54533a3e207c203c3a464f524d41543a3e207c203c3a53495a453a3e0d0a09093c2f703e0d0a093c2f74643e0d0a3c2f74723e0d0a3c2f7461626c653e, 0x3c7461626c653e0d0a3c74723e0d0a093c74642076616c69676e3d22746f702220616c69676e3d2263656e746572223e0d0a09093c3a4e414d4553495a453a3e0d0a09093c62723e3c62723e0d0a09093c5441424c452043656c6c50616464696e673d2230222043656c6c53706163696e673d2230223e0d0a09093c54523e0d0a0909093c54442076616c69676e3d22746f70223e0d0a090909093c3a5355424d49545445523a3e0d0a090909093c3a444154453a3e0d0a090909093c3a484954533a3e0d0a090909093c3a524154453a3e0d0a0909093c2f54443e0d0a09093c2f54523e0d0a09093c2f7461626c653e3c62723e0d0a09093c3a524154494e474241523a3e3c62723e0d0a09093c3a504f5354434152443a3e3c62723e0d0a09093c3a444f574e4c4f41443a3e3c62723e0d0a09093c3a5052494e543a3e0d0a093c2f74643e0d0a093c74642077696474683d223830252220616c69676e3d2263656e746572223e0d0a09093c3a494d4147453a3e0d0a093c2f74643e0d0a3c2f74723e0d0a3c74723e0d0a093c746420636f6c7370616e3d2232223e3c3a4445534352495054494f4e3a3e3c2f74643e0d0a3c2f74723e0d0a3c74723e0d0a093c746420636f6c7370616e3d2232223e0d0a09093c3a434f4d4d454e54533a3e0d0a093c2f74643e0d0a3c2f74723e0d0a3c2f7461626c653e, 0x2e636f6d6d6f6e5f746578745f626c61636b207b746578742d636f6c6f723a233030303030307d0d0a2e636f6d6d6f6e5f746578745f7768697465207b746578742d636f6c6f723a236666666666667d);

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_groups`
-- 

CREATE TABLE `kayapo_groups` (
  `id` int(10) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `description` text NOT NULL,
  `points` int(10) NOT NULL default '0',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `kayapo_groups`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_groups_points`
-- 

CREATE TABLE `kayapo_groups_points` (
  `id` int(10) NOT NULL auto_increment,
  `points` int(10) NOT NULL default '0',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

-- 
-- Extraindo dados da tabela `kayapo_groups_points`
-- 

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

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_headlines`
-- 

CREATE TABLE `kayapo_headlines` (
  `hid` int(11) NOT NULL auto_increment,
  `sitename` varchar(30) NOT NULL default '',
  `headlinesurl` varchar(200) NOT NULL default '',
  PRIMARY KEY  (`hid`),
  KEY `hid` (`hid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

-- 
-- Extraindo dados da tabela `kayapo_headlines`
-- 

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

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_journal`
-- 

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `kayapo_journal`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_journal_comments`
-- 

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `kayapo_journal_comments`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_journal_stats`
-- 

CREATE TABLE `kayapo_journal_stats` (
  `id` int(11) NOT NULL auto_increment,
  `joid` varchar(48) NOT NULL default '',
  `nop` varchar(48) NOT NULL default '',
  `ldp` varchar(24) NOT NULL default '',
  `ltp` varchar(24) NOT NULL default '',
  `micro` varchar(128) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `kayapo_journal_stats`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_links_categories`
-- 

CREATE TABLE `kayapo_links_categories` (
  `cid` int(11) NOT NULL auto_increment,
  `title` varchar(50) NOT NULL default '',
  `cdescription` text NOT NULL,
  `parentid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`cid`),
  KEY `cid` (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `kayapo_links_categories`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_links_editorials`
-- 

CREATE TABLE `kayapo_links_editorials` (
  `linkid` int(11) NOT NULL default '0',
  `adminid` varchar(60) NOT NULL default '',
  `editorialtimestamp` datetime NOT NULL default '0000-00-00 00:00:00',
  `editorialtext` text NOT NULL,
  `editorialtitle` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`linkid`),
  KEY `linkid` (`linkid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Extraindo dados da tabela `kayapo_links_editorials`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_links_links`
-- 

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `kayapo_links_links`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_links_modrequest`
-- 

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `kayapo_links_modrequest`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_links_newlink`
-- 

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `kayapo_links_newlink`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_links_votedata`
-- 

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `kayapo_links_votedata`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_main`
-- 

CREATE TABLE `kayapo_main` (
  `main_module` varchar(255) NOT NULL default ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Extraindo dados da tabela `kayapo_main`
-- 

INSERT INTO `kayapo_main` VALUES ('News');

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_message`
-- 

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- 
-- Extraindo dados da tabela `kayapo_message`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_modules`
-- 

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=34 ;

-- 
-- Extraindo dados da tabela `kayapo_modules`
-- 

INSERT INTO `kayapo_modules` VALUES (1, 'AvantGo', 'AvantGo', 0, 0, '', 0, 0, '');
INSERT INTO `kayapo_modules` VALUES (2, 'Content', 'Conteúdo', 1, 0, '', 1, 0, '');
INSERT INTO `kayapo_modules` VALUES (3, 'Downloads', 'Downloads', 0, 0, '', 0, 0, '');
INSERT INTO `kayapo_modules` VALUES (4, 'Encyclopedia', 'Enciclop?dia', 0, 0, '', 0, 0, '');
INSERT INTO `kayapo_modules` VALUES (5, 'FAQ', 'Perguntas Frequentes', 0, 0, '', 0, 0, '');
INSERT INTO `kayapo_modules` VALUES (6, 'Feedback', 'Contate-nos', 0, 0, '', 0, 0, '');
INSERT INTO `kayapo_modules` VALUES (7, 'Forums', 'Foros', 0, 0, '', 0, 0, '');
INSERT INTO `kayapo_modules` VALUES (8, 'Journal', 'Di?rio de Usu?rio', 0, 0, '', 1, 0, '');
INSERT INTO `kayapo_modules` VALUES (9, 'Members_List', 'Lista de Usuários', 1, 1, '', 1, 0, '');
INSERT INTO `kayapo_modules` VALUES (10, 'News', 'Notícias', 1, 0, '', 1, 0, '');
INSERT INTO `kayapo_modules` VALUES (11, 'Private_Messages', 'Mensagens Privadas', 1, 0, '', 1, 0, '');
INSERT INTO `kayapo_modules` VALUES (12, 'Recommend_Us', 'Recomende-nos', 0, 0, '', 1, 0, '');
INSERT INTO `kayapo_modules` VALUES (13, 'Reviews', 'Revis?es', 0, 0, '', 1, 0, '');
INSERT INTO `kayapo_modules` VALUES (15, 'Statistics', 'Estatísticas', 1, 0, '', 1, 0, '');
INSERT INTO `kayapo_modules` VALUES (16, 'Stories_Archive', 'Arquivo de Notícias', 1, 0, '', 1, 0, '');
INSERT INTO `kayapo_modules` VALUES (18, 'Surveys', 'Enquetes', 1, 0, '', 1, 0, '');
INSERT INTO `kayapo_modules` VALUES (19, 'Top', 'Top 10', 1, 0, '', 1, 0, '');
INSERT INTO `kayapo_modules` VALUES (20, 'Topics', 'Tópicos', 1, 0, '', 1, 0, '');
INSERT INTO `kayapo_modules` VALUES (21, 'Web_Links', 'Web Links', 0, 0, '', 1, 0, '');
INSERT INTO `kayapo_modules` VALUES (22, 'Your_Account', 'Sua Conta', 1, 0, '', 1, 0, '');
INSERT INTO `kayapo_modules` VALUES (23, 'My_eGallery', 'Galeria de Fotos', 1, 0, '', 1, 0, '');
INSERT INTO `kayapo_modules` VALUES (24, 'Blocked_IPs', 'IPs Bloqueados', 0, 2, '', 0, 0, '');
INSERT INTO `kayapo_modules` VALUES (25, 'Blocked_Ranges', 'Faixas de IPs Bloqueados', 0, 2, '', 0, 0, '');
INSERT INTO `kayapo_modules` VALUES (26, 'Blocked_Referers', 'Referenciadores Bloqueados', 0, 2, '', 0, 0, '');
INSERT INTO `kayapo_modules` VALUES (27, 'Groups', 'Grupos de Usu?rios', 0, 0, '', 1, 0, '');
INSERT INTO `kayapo_modules` VALUES (29, 'Recherches', 'Busca Avançada', 1, 0, '', 1, 0, '');
INSERT INTO `kayapo_modules` VALUES (32, 'Submit_Downloads', 'Enviar um Arquivo', 0, 1, '1', 1, 0, '');
INSERT INTO `kayapo_modules` VALUES (30, 'FCKeditor', 'Enviar Not?cia', 1, 0, '1', 1, 0, '');
INSERT INTO `kayapo_modules` VALUES (31, 'Calendar', 'Calendário', 1, 0, '', 1, 0, '');
INSERT INTO `kayapo_modules` VALUES (33, 'Banner_Ads', 'Banner Ads', 0, 0, '', 0, 0, '');

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_nsnba_banners`
-- 

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- 
-- Extraindo dados da tabela `kayapo_nsnba_banners`
-- 

INSERT INTO `kayapo_nsnba_banners` VALUES (1, 1, 1, 12000, 10, 0, 'http://kayapo.phpnuke.org.br/images/banners/banner01.gif', 'http://kayapo.phpnuke.org.br/images/banners', 'CNB Kayap? - A For?a do PHP-Nuke no Brasil!', 0, 0, 60, 468, 0x323030352d30312d3235, 0x323030362d30312d3235, 1);

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_nsnba_clients`
-- 

CREATE TABLE `kayapo_nsnba_clients` (
  `cid` int(11) NOT NULL auto_increment,
  `name` varchar(60) NOT NULL default '',
  `email` varchar(60) NOT NULL default '',
  `login` varchar(25) NOT NULL default '',
  `passwd` varchar(40) NOT NULL default '',
  PRIMARY KEY  (`cid`),
  KEY `cid` (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- 
-- Extraindo dados da tabela `kayapo_nsnba_clients`
-- 

INSERT INTO `kayapo_nsnba_clients` VALUES (1, 'CNB', 'webmaster@phpnuke.org.br', 'CNB', 'b15edd567fcbdbb1991dd9c39c21c86b');

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_nsnba_config`
-- 

CREATE TABLE `kayapo_nsnba_config` (
  `id` tinyint(1) NOT NULL auto_increment,
  `ipp` tinyint(4) NOT NULL default '20',
  `impamnt` int(6) NOT NULL default '1000',
  `usegfxcheck` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- 
-- Extraindo dados da tabela `kayapo_nsnba_config`
-- 

INSERT INTO `kayapo_nsnba_config` VALUES (1, 20, 1000, 0);

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_nsngd_accesses`
-- 

CREATE TABLE `kayapo_nsngd_accesses` (
  `username` varchar(60) NOT NULL default '',
  `downloads` int(11) NOT NULL default '0',
  `uploads` int(11) NOT NULL default '0',
  PRIMARY KEY  (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Extraindo dados da tabela `kayapo_nsngd_accesses`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_nsngd_categories`
-- 

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `kayapo_nsngd_categories`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_nsngd_config`
-- 

CREATE TABLE `kayapo_nsngd_config` (
  `config_name` varchar(255) NOT NULL default '',
  `config_value` text NOT NULL,
  PRIMARY KEY  (`config_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Extraindo dados da tabela `kayapo_nsngd_config`
-- 

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

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_nsngd_downloads`
-- 

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `kayapo_nsngd_downloads`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_nsngd_extensions`
-- 

CREATE TABLE `kayapo_nsngd_extensions` (
  `eid` int(11) NOT NULL auto_increment,
  `ext` varchar(6) NOT NULL default '',
  `file` tinyint(1) NOT NULL default '0',
  `image` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`eid`),
  KEY `ext` (`eid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

-- 
-- Extraindo dados da tabela `kayapo_nsngd_extensions`
-- 

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

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_nsngd_mods`
-- 

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `kayapo_nsngd_mods`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_nsngd_new`
-- 

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `kayapo_nsngd_new`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_nsngr_config`
-- 

CREATE TABLE `kayapo_nsngr_config` (
  `config_name` varchar(255) NOT NULL default '',
  `config_value` text NOT NULL,
  PRIMARY KEY  (`config_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Extraindo dados da tabela `kayapo_nsngr_config`
-- 

INSERT INTO `kayapo_nsngr_config` VALUES ('perpage', '50');
INSERT INTO `kayapo_nsngr_config` VALUES ('date_format', 'Y-m-d');
INSERT INTO `kayapo_nsngr_config` VALUES ('send_notice', '1');
INSERT INTO `kayapo_nsngr_config` VALUES ('script_version', '1.5.0');

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_nsngr_groups`
-- 

CREATE TABLE `kayapo_nsngr_groups` (
  `gid` int(11) NOT NULL auto_increment,
  `gname` varchar(32) NOT NULL default '',
  `gdesc` text NOT NULL,
  `gpublic` tinyint(1) NOT NULL default '0',
  `glimit` int(11) NOT NULL default '0',
  PRIMARY KEY  (`gid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- 
-- Extraindo dados da tabela `kayapo_nsngr_groups`
-- 

INSERT INTO `kayapo_nsngr_groups` VALUES (1, 'General', '', 0, 0);

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_nsngr_users`
-- 

CREATE TABLE `kayapo_nsngr_users` (
  `gid` int(11) NOT NULL default '0',
  `uid` int(11) NOT NULL default '0',
  `uname` varchar(25) NOT NULL default '',
  `trial` tinyint(1) NOT NULL default '0',
  `notice` tinyint(1) NOT NULL default '0',
  `sdate` int(14) NOT NULL default '0',
  `edate` int(14) NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Extraindo dados da tabela `kayapo_nsngr_users`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_nsnst_admins`
-- 

CREATE TABLE `kayapo_nsnst_admins` (
  `aid` varchar(25) NOT NULL default '',
  `login` varchar(25) NOT NULL default '',
  `password` varchar(20) NOT NULL default '',
  `password_md5` varchar(60) NOT NULL default '',
  `password_crypt` varchar(60) NOT NULL default '',
  `protected` tinyint(2) NOT NULL default '0',
  PRIMARY KEY  (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Extraindo dados da tabela `kayapo_nsnst_admins`
-- 

INSERT INTO `kayapo_nsnst_admins` VALUES ('admin', 'admin', '', '', '', 1);

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_nsnst_blocked_ips`
-- 

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Extraindo dados da tabela `kayapo_nsnst_blocked_ips`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_nsnst_blocked_ranges`
-- 

CREATE TABLE `kayapo_nsnst_blocked_ranges` (
  `ip_lo` int(10) unsigned NOT NULL default '0',
  `ip_hi` int(10) unsigned NOT NULL default '0',
  `date` int(20) NOT NULL default '0',
  `notes` text NOT NULL,
  `reason` tinyint(1) NOT NULL default '0',
  `expires` int(20) NOT NULL default '0',
  `c2c` char(2) NOT NULL default '00',
  KEY `code` (`ip_lo`,`ip_hi`,`c2c`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Extraindo dados da tabela `kayapo_nsnst_blocked_ranges`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_nsnst_blockers`
-- 

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Extraindo dados da tabela `kayapo_nsnst_blockers`
-- 

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

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_nsnst_config`
-- 

CREATE TABLE `kayapo_nsnst_config` (
  `config_name` varchar(255) NOT NULL default '',
  `config_value` longtext NOT NULL,
  PRIMARY KEY  (`config_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Extraindo dados da tabela `kayapo_nsnst_config`
-- 

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

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_nsnst_countries`
-- 

CREATE TABLE `kayapo_nsnst_countries` (
  `c2c` char(2) NOT NULL default '',
  `country` varchar(60) NOT NULL default '',
  KEY `c2c` (`c2c`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Extraindo dados da tabela `kayapo_nsnst_countries`
-- 

INSERT INTO `kayapo_nsnst_countries` VALUES ('00', 'Unknown');
INSERT INTO `kayapo_nsnst_countries` VALUES ('01', 'IANA Reserved');

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_nsnst_excluded_ranges`
-- 

CREATE TABLE `kayapo_nsnst_excluded_ranges` (
  `ip_lo` int(10) unsigned NOT NULL default '0',
  `ip_hi` int(10) unsigned NOT NULL default '0',
  `date` int(20) NOT NULL default '0',
  `notes` text NOT NULL,
  `c2c` char(2) NOT NULL default '00',
  KEY `code` (`ip_lo`,`ip_hi`,`c2c`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Extraindo dados da tabela `kayapo_nsnst_excluded_ranges`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_nsnst_protected_ranges`
-- 

CREATE TABLE `kayapo_nsnst_protected_ranges` (
  `ip_lo` int(10) unsigned NOT NULL default '0',
  `ip_hi` int(10) unsigned NOT NULL default '0',
  `date` int(20) NOT NULL default '0',
  `notes` text NOT NULL,
  `c2c` char(2) NOT NULL default '00',
  KEY `code` (`ip_lo`,`ip_hi`,`c2c`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Extraindo dados da tabela `kayapo_nsnst_protected_ranges`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_nsnst_reserved_ranges`
-- 

CREATE TABLE `kayapo_nsnst_reserved_ranges` (
  `ip_lo` int(10) unsigned NOT NULL default '0',
  `ip_hi` int(10) unsigned NOT NULL default '0',
  `date` int(20) NOT NULL default '0',
  `c2c` char(2) NOT NULL default '00',
  KEY `code` (`ip_lo`,`ip_hi`,`c2c`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Extraindo dados da tabela `kayapo_nsnst_reserved_ranges`
-- 

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

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_nsnst_tracked_ips`
-- 

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=950 ;

-- 
-- Extraindo dados da tabela `kayapo_nsnst_tracked_ips`
-- 

INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (1, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131971982, '/radio/admin.php', 'none', 'none', '127.0.0.1', '3163', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (2, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131972001, '/radio/admin.php', 'none', 'none', '127.0.0.1', '3171', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (3, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131972011, '/radio/admin.php', 'none', 'none', '127.0.0.1', '3171', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (4, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131972089, '/radio/admin.php?op=Configure', 'none', 'none', '127.0.0.1', '3178', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (5, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131972098, '/radio/admin.php', 'none', 'none', '127.0.0.1', '3178', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (6, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131972099, '/radio/admin.php?op=Configure', 'none', 'none', '127.0.0.1', '3178', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (7, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131972112, '/radio/index.php', 'none', 'none', '127.0.0.1', '3178', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (8, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131972374, '/radio/index.php', 'none', 'none', '127.0.0.1', '3202', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (9, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131972401, '/radio/index.php', 'none', 'none', '127.0.0.1', '3208', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (10, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131972433, '/radio/index.php', 'none', 'none', '127.0.0.1', '3214', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (11, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131972457, '/radio/index.php', 'none', 'none', '127.0.0.1', '3220', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (12, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131972532, '/radio/index.php', 'none', 'none', '127.0.0.1', '3228', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (13, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131972579, '/radio/index.php', 'none', 'none', '127.0.0.1', '3234', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (14, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131972613, '/radio/index.php', 'none', 'none', '127.0.0.1', '3240', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (15, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131972658, '/radio/index.php', 'none', 'none', '127.0.0.1', '3248', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (16, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131972704, '/radio/index.php', 'none', 'none', '127.0.0.1', '3257', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (17, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131972757, '/radio/index.php', 'none', 'none', '127.0.0.1', '3263', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (18, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131972778, '/radio/index.php', 'none', 'none', '127.0.0.1', '3270', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (19, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131972962, '/radio/admin.php', 'none', 'none', '127.0.0.1', '3295', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (20, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131972969, '/radio/admin.php?op=Configure', 'none', 'none', '127.0.0.1', '3295', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (21, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131972976, '/radio/admin.php', 'none', 'none', '127.0.0.1', '3295', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (22, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131972976, '/radio/admin.php?op=Configure', 'none', 'none', '127.0.0.1', '3295', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (23, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131973001, '/radio/admin.php', 'none', 'none', '127.0.0.1', '3302', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (24, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131973001, '/radio/admin.php?op=Configure', 'none', 'none', '127.0.0.1', '3302', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (25, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131973108, '/radio/admin.php?op=Configure', 'none', 'none', '127.0.0.1', '3317', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (26, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131973117, '/radio/admin.php', 'none', 'none', '127.0.0.1', '3317', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (27, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131973117, '/radio/admin.php?op=Configure', 'none', 'none', '127.0.0.1', '3317', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (28, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131973128, '/radio/admin.php?op=Configure', 'none', 'none', '127.0.0.1', '3317', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (29, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131973136, '/radio/admin.php', 'none', 'none', '127.0.0.1', '3317', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (30, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131973137, '/radio/admin.php?op=Configure', 'none', 'none', '127.0.0.1', '3321', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (31, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131973194, '/radio/admin.php?op=Configure', 'none', 'none', '127.0.0.1', '3331', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (32, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131973201, '/radio/admin.php', 'none', 'none', '127.0.0.1', '3331', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (33, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131973202, '/radio/admin.php?op=Configure', 'none', 'none', '127.0.0.1', '3331', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (34, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131973211, '/radio/admin.php', 'none', 'none', '127.0.0.1', '3335', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (35, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131973211, '/radio/admin.php?op=Configure', 'none', 'none', '127.0.0.1', '3331', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (36, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131973280, '/radio/admin.php?op=Configure', 'none', 'none', '127.0.0.1', '3345', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (37, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131973288, '/radio/admin.php', 'none', 'none', '127.0.0.1', '3345', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (38, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131973288, '/radio/admin.php?op=Configure', 'none', 'none', '127.0.0.1', '3345', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (39, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131973297, '/radio/admin.php', 'none', 'none', '127.0.0.1', '3349', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (40, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131973297, '/radio/admin.php?op=Configure', 'none', 'none', '127.0.0.1', '3345', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (41, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131973301, '/radio/index.php', 'none', 'none', '127.0.0.1', '3345', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (42, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131973320, '/radio/index.php', 'none', 'none', '127.0.0.1', '3354', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (43, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131973331, '/radio/index.php', 'none', 'none', '127.0.0.1', '3354', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (44, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131973347, '/radio/index.php', 'none', 'none', '127.0.0.1', '3354', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (45, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131973364, '/radio/index.php', 'none', 'none', '127.0.0.1', '3369', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (46, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131973386, '/radio/index.php', 'none', 'none', '127.0.0.1', '3375', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (47, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131973408, '/radio/index.php', 'none', 'none', '127.0.0.1', '3383', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (48, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131973476, '/radio/index.php', 'none', 'none', '127.0.0.1', '3392', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (49, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131973490, '/radio/index.php', 'none', 'none', '127.0.0.1', '3392', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (50, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131973508, '/radio/admin.php', 'none', 'none', '127.0.0.1', '3402', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (51, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131973541, '/radio/admin.php?op=BlocksAdmin', 'none', 'none', '127.0.0.1', '3404', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (52, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131973571, '/radio/index.php', 'none', 'none', '127.0.0.1', '3407', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (53, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131973665, '/radio/index.php', 'none', 'none', '127.0.0.1', '3410', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (54, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131973699, '/radio/index.php', 'none', 'none', '127.0.0.1', '3415', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (55, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131973713, '/radio/index.php', 'none', 'none', '127.0.0.1', '3417', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (56, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131973755, '/radio/index.php', 'none', 'none', '127.0.0.1', '3423', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (57, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131973767, '/radio/index.php', 'none', 'none', '127.0.0.1', '3423', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (58, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131973795, '/radio/index.php', 'none', 'none', '127.0.0.1', '3434', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (59, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131973959, '/radio/index.php', 'none', 'none', '127.0.0.1', '3444', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (60, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131974038, '/radio/index.php', 'none', 'none', '127.0.0.1', '3452', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (61, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131974062, '/radio/index.php', 'none', 'none', '127.0.0.1', '3458', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (62, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131974111, '/radio/index.php', 'none', 'none', '127.0.0.1', '3468', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (63, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131974162, '/radio/index.php', 'none', 'none', '127.0.0.1', '3480', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (64, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131974183, '/radio/index.php', 'none', 'none', '127.0.0.1', '3491', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (65, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131974215, '/radio/index.php', 'none', 'none', '127.0.0.1', '3500', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (66, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131974308, '/radio/index.php', 'none', 'none', '127.0.0.1', '3516', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (67, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131974329, '/radio/index.php', 'none', 'none', '127.0.0.1', '3526', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (68, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131974368, '/radio/index.php', 'none', 'none', '127.0.0.1', '3532', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (69, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131974391, '/radio/index.php', 'none', 'none', '127.0.0.1', '3539', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (70, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131974421, '/radio/index.php', 'none', 'none', '127.0.0.1', '3550', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (71, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131974447, '/radio/index.php', 'none', 'none', '127.0.0.1', '3556', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (72, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131974523, '/radio/index.php', 'none', 'none', '127.0.0.1', '3569', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (73, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131974594, '/radio/modules.php?name=News&file=article&sid=1', 'none', 'none', '127.0.0.1', '3575', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (74, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131974629, '/radio/modules.php?name=News&file=article&sid=1', 'none', 'none', '127.0.0.1', '3578', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (75, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131974648, '/radio/modules.php?name=News&file=article&sid=1', 'none', 'none', '127.0.0.1', '3580', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (76, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131974697, '/radio/modules.php?name=News&file=article&sid=1', 'none', 'none', '127.0.0.1', '3583', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (77, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131974814, '/radio/modules.php?name=News&file=article&sid=1', 'none', 'none', '127.0.0.1', '3588', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (78, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131974927, '/radio/modules.php?name=News&file=article&sid=1', 'none', 'none', '127.0.0.1', '3604', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (79, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131974956, '/radio/modules.php?name=News&file=article&sid=1', 'none', 'none', '127.0.0.1', '3607', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (80, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975002, '/radio/modules.php?name=News&file=article&sid=1', 'none', 'none', '127.0.0.1', '3610', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (81, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975025, '/radio/modules.php?name=News&file=article&sid=1', 'none', 'none', '127.0.0.1', '3613', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (82, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975053, '/radio/modules.php?name=News&file=article&sid=1', 'none', 'none', '127.0.0.1', '3616', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (83, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975138, '/radio/modules.php?name=News&file=article&sid=1', 'none', 'none', '127.0.0.1', '3620', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (84, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975245, '/radio/modules.php?name=News&file=article&sid=1', 'none', 'none', '127.0.0.1', '3628', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (85, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975296, '/radio/modules.php?name=News&file=article&sid=1', 'none', 'none', '127.0.0.1', '3632', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (86, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975339, '/radio/index.php', 'none', 'none', '127.0.0.1', '3636', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (87, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975362, '/radio/admin.php', 'none', 'none', '127.0.0.1', '3639', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (88, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975370, '/radio/admin.php?op=messages', 'none', 'none', '127.0.0.1', '3641', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (89, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975374, '/radio/admin.php?op=deletemsg&mid=1', 'none', 'none', '127.0.0.1', '3641', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (90, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975376, '/radio/admin.php?op=deletemsg&mid=1&ok=1', 'none', 'none', '127.0.0.1', '3641', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (91, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975377, '/radio/admin.php?op=messages', 'none', 'none', '127.0.0.1', '3639', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (92, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975383, '/radio/admin.php?op=BlocksAdmin', 'none', 'none', '127.0.0.1', '3639', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (93, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975387, '/radio/admin.php?op=ChangeStatus&bid=2', 'none', 'none', '127.0.0.1', '3639', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (94, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975387, '/radio/admin.php?op=BlocksAdmin', 'none', 'none', '127.0.0.1', '3641', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (95, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975390, '/radio/admin.php?op=ChangeStatus&bid=1', 'none', 'none', '127.0.0.1', '3641', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (96, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975391, '/radio/admin.php?op=BlocksAdmin', 'none', 'none', '127.0.0.1', '3639', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (97, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975394, '/radio/admin.php?op=BlocksDelete&bid=3', 'none', 'none', '127.0.0.1', '3639', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (98, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975396, '/radio/admin.php?op=BlocksDelete&bid=3&ok=1', 'none', 'none', '127.0.0.1', '3639', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (99, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975397, '/radio/admin.php?op=BlocksAdmin', 'none', 'none', '127.0.0.1', '3641', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (100, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975400, '/radio/admin.php?op=BlocksDelete&bid=4', 'none', 'none', '127.0.0.1', '3641', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (101, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975403, '/radio/admin.php?op=BlocksDelete&bid=4&ok=1', 'none', 'none', '127.0.0.1', '3641', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (102, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975403, '/radio/admin.php?op=BlocksAdmin', 'none', 'none', '127.0.0.1', '3639', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (103, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975481, '/radio/admin.php', 'none', 'none', '127.0.0.1', '3670', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (104, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975482, '/radio/admin.php?op=BlocksAdmin', 'none', 'none', '127.0.0.1', '3670', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (105, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975553, '/radio/admin.php?op=BlocksEdit&bid=6', 'none', 'none', '127.0.0.1', '3685', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (106, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975557, '/radio/admin.php', 'none', 'none', '127.0.0.1', '3685', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (107, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975558, '/radio/admin.php?op=BlocksAdmin', 'none', 'none', '127.0.0.1', '3685', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (108, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975563, '/radio/admin.php?op=BlockOrder&weight=2&bidori=6&weightrep=3&bidrep=1', 'none', 'none', '127.0.0.1', '3685', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (109, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975563, '/radio/admin.php?op=BlocksAdmin', 'none', 'none', '127.0.0.1', '3685', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (110, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975567, '/radio/admin.php?op=BlockOrder&weight=3&bidori=6&weightrep=4&bidrep=9', 'none', 'none', '127.0.0.1', '3685', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (111, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975568, '/radio/admin.php?op=BlocksAdmin', 'none', 'none', '127.0.0.1', '3691', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (112, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975612, '/radio/admin.php', 'none', 'none', '127.0.0.1', '3703', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (113, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975612, '/radio/admin.php?op=BlocksAdmin', 'none', 'none', '127.0.0.1', '3703', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (114, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975629, '/radio/admin.php?op=BlocksEdit&bid=10', 'none', 'none', '127.0.0.1', '3707', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (115, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975633, '/radio/admin.php', 'none', 'none', '127.0.0.1', '3707', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (116, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975634, '/radio/admin.php?op=BlocksAdmin', 'none', 'none', '127.0.0.1', '3707', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (117, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975657, '/radio/index.php', 'none', 'none', '127.0.0.1', '3712', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (118, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975680, '/radio/admin.php', 'none', 'none', '127.0.0.1', '3717', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (119, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975680, '/radio/admin.php?op=BlocksAdmin', 'none', 'none', '127.0.0.1', '3717', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (120, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975685, '/radio/index.php', 'none', 'none', '127.0.0.1', '3720', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (121, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975693, '/radio/admin.php?op=ChangeStatus&bid=8', 'none', 'none', '127.0.0.1', '3717', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (122, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975694, '/radio/admin.php?op=BlocksAdmin', 'none', 'none', '127.0.0.1', '3717', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (123, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975698, '/radio/admin.php?op=BlocksDelete&bid=7', 'none', 'none', '127.0.0.1', '3717', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (124, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975701, '/radio/admin.php?op=BlocksDelete&bid=7&ok=1', 'none', 'none', '127.0.0.1', '3717', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (125, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975701, '/radio/admin.php?op=BlocksAdmin', 'none', 'none', '127.0.0.1', '3717', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (126, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975705, '/radio/index.php', 'none', 'none', '127.0.0.1', '3730', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (127, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975750, '/radio/admin.php', 'none', 'none', '127.0.0.1', '3741', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (128, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975750, '/radio/admin.php?op=BlocksAdmin', 'none', 'none', '127.0.0.1', '3741', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (129, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975754, '/radio/index.php', 'none', 'none', '127.0.0.1', '3744', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (130, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975805, '/radio/admin.php', 'none', 'none', '127.0.0.1', '3756', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (131, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975805, '/radio/admin.php?op=BlocksAdmin', 'none', 'none', '127.0.0.1', '3756', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (132, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975809, '/radio/admin.php?op=BlockOrder&weight=5&bidori=13&weightrep=4&bidrep=12', 'none', 'none', '127.0.0.1', '3756', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (133, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975809, '/radio/admin.php?op=BlocksAdmin', 'none', 'none', '127.0.0.1', '3756', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (134, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975812, '/radio/admin.php?op=BlockOrder&weight=5&bidori=12&weightrep=4&bidrep=13', 'none', 'none', '127.0.0.1', '3756', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (135, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975812, '/radio/admin.php?op=BlocksAdmin', 'none', 'none', '127.0.0.1', '3756', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (136, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975815, '/radio/admin.php?op=BlockOrder&weight=4&bidori=12&weightrep=3&bidrep=8', 'none', 'none', '127.0.0.1', '3756', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (137, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975816, '/radio/admin.php?op=BlocksAdmin', 'none', 'none', '127.0.0.1', '3756', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (138, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975821, '/radio/admin.php?op=BlockOrder&weight=3&bidori=12&weightrep=2&bidrep=11', 'none', 'none', '127.0.0.1', '3756', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (139, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975822, '/radio/admin.php?op=BlocksAdmin', 'none', 'none', '127.0.0.1', '3756', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (140, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975826, '/radio/admin.php?op=BlockOrder&weight=3&bidori=11&weightrep=4&bidrep=8', 'none', 'none', '127.0.0.1', '3756', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (141, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975826, '/radio/admin.php?op=BlocksAdmin', 'none', 'none', '127.0.0.1', '3756', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (142, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975829, '/radio/admin.php?op=BlockOrder&weight=4&bidori=11&weightrep=5&bidrep=13', 'none', 'none', '127.0.0.1', '3756', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (143, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975830, '/radio/admin.php?op=BlocksAdmin', 'none', 'none', '127.0.0.1', '3756', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (144, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975833, '/radio/index.php', 'none', 'none', '127.0.0.1', '3771', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (145, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975844, '/radio/index.php', 'none', 'none', '127.0.0.1', '3771', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (146, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975880, '/radio/index.php', 'none', 'none', '127.0.0.1', '3782', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (147, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975923, '/radio/index.php', 'none', 'none', '127.0.0.1', '3789', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (148, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975937, '/radio/modules.php?name=News&file=article&sid=1', 'none', 'none', '127.0.0.1', '3789', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (149, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975968, '/radio/modules.php?name=News&file=article&sid=1', 'none', 'none', '127.0.0.1', '3797', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (150, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131975995, '/radio/modules.php?name=News&file=article&sid=1', 'none', 'none', '127.0.0.1', '3800', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (151, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131976015, '/radio/index.php', 'none', 'none', '127.0.0.1', '3803', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (152, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131976063, '/radio/admin.php', 'none', 'none', '127.0.0.1', '3816', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (153, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131976064, '/radio/admin.php?op=BlocksAdmin', 'none', 'none', '127.0.0.1', '3816', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (154, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131976102, '/radio/admin.php', 'none', 'none', '127.0.0.1', '3826', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (155, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131976102, '/radio/admin.php?op=BlocksAdmin', 'none', 'none', '127.0.0.1', '3826', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (156, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131976106, '/radio/index.php', 'none', 'none', '127.0.0.1', '3829', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (157, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131976155, '/radio/admin.php', 'none', 'none', '127.0.0.1', '3842', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (158, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131976155, '/radio/admin.php?op=BlocksAdmin', 'none', 'none', '127.0.0.1', '3842', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (159, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131976159, '/radio/index.php', 'none', 'none', '127.0.0.1', '3846', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (160, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131976212, '/radio/index.php', 'none', 'none', '127.0.0.1', '3860', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (161, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131976477, '/radio/index.php', 'none', 'none', '127.0.0.1', '3873', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (162, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131976499, '/radio/admin.php?op=BlocksEdit&bid=16', 'none', 'none', '127.0.0.1', '3878', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (163, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131976513, '/radio/admin.php', 'none', 'none', '127.0.0.1', '3878', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (164, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131976514, '/radio/admin.php?op=BlocksAdmin', 'none', 'none', '127.0.0.1', '3880', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (165, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131976518, '/radio/index.php', 'none', 'none', '127.0.0.1', '3884', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (166, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131976537, '/radio/admin.php?op=BlocksDelete&bid=16', 'none', 'none', '127.0.0.1', '3889', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (167, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131976539, '/radio/admin.php?op=BlocksDelete&bid=16&ok=1', 'none', 'none', '127.0.0.1', '3889', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (168, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131976539, '/radio/admin.php?op=BlocksAdmin', 'none', 'none', '127.0.0.1', '3889', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (169, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131976543, '/radio/admin.php?op=BlocksEdit&bid=14', 'none', 'none', '127.0.0.1', '3889', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (170, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131976552, '/radio/admin.php', 'none', 'none', '127.0.0.1', '3889', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (171, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131976552, '/radio/admin.php?op=BlocksAdmin', 'none', 'none', '127.0.0.1', '3889', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (172, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131976558, '/radio/index.php', 'none', 'none', '127.0.0.1', '3896', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (173, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131976563, '/radio/admin.php?op=BlocksEdit&bid=14', 'none', 'none', '127.0.0.1', '3889', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (174, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131976571, '/radio/admin.php', 'none', 'none', '127.0.0.1', '3889', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (175, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131976572, '/radio/admin.php?op=BlocksAdmin', 'none', 'none', '127.0.0.1', '3889', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (176, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131976575, '/radio/index.php', 'none', 'none', '127.0.0.1', '3904', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (177, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131976729, '/radio/index.php', 'none', 'none', '127.0.0.1', '3916', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (178, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131976756, '/radio/index.php', 'none', 'none', '127.0.0.1', '3923', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (179, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131976792, '/radio/admin.php?op=BlocksEdit&bid=15', 'none', 'none', '127.0.0.1', '3929', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (180, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131976820, '/radio/admin.php', 'none', 'none', '127.0.0.1', '3932', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (181, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131976820, '/radio/admin.php?op=BlocksAdmin', 'none', 'none', '127.0.0.1', '3932', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (182, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131976823, '/radio/index.php', 'none', 'none', '127.0.0.1', '3935', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (183, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131979477, '/radio/index.php', 'none', 'none', '127.0.0.1', '3977', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (184, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131979528, '/radio/admin.php?op=BlocksEdit&bid=14', 'none', 'none', '127.0.0.1', '3986', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (185, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131979536, '/radio/admin.php', 'none', 'none', '127.0.0.1', '3986', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (186, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131979537, '/radio/admin.php?op=BlocksAdmin', 'none', 'none', '127.0.0.1', '3986', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (187, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131979540, '/radio/index.php', 'none', 'none', '127.0.0.1', '3990', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (188, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131979567, '/radio/admin.php?op=BlocksEdit&bid=14', 'none', 'none', '127.0.0.1', '3996', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (189, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131979573, '/radio/admin.php', 'none', 'none', '127.0.0.1', '3996', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (190, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131979574, '/radio/admin.php?op=BlocksAdmin', 'none', 'none', '127.0.0.1', '3996', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (191, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131979576, '/radio/index.php', 'none', 'none', '127.0.0.1', '4000', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (192, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131979597, '/radio/admin.php?op=BlocksEdit&bid=15', 'none', 'none', '127.0.0.1', '4007', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (193, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131979618, '/radio/admin.php', 'none', 'none', '127.0.0.1', '4010', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (194, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131979618, '/radio/admin.php?op=BlocksAdmin', 'none', 'none', '127.0.0.1', '4010', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (195, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131979622, '/radio/index.php', 'none', 'none', '127.0.0.1', '4013', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (196, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131979835, '/radio/index.php', 'none', 'none', '127.0.0.1', '4021', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (197, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131979898, '/radio/index.php', 'none', 'none', '127.0.0.1', '4029', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (198, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131979978, '/radio/index.php', 'none', 'none', '127.0.0.1', '4036', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (199, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131980003, '/radio/index.php', 'none', 'none', '127.0.0.1', '4042', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (200, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131980018, '/radio/index.php', 'none', 'none', '127.0.0.1', '4044', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (201, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131980083, '/radio/index.php', 'none', 'none', '127.0.0.1', '4052', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (202, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131980091, '/radio/index.php', 'none', 'none', '127.0.0.1', '4052', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (203, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131980309, '/radio/admin.php?op=topicsmanager', 'none', 'none', '127.0.0.1', '4069', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (204, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131980327, '/radio/admin.php', 'none', 'none', '127.0.0.1', '4072', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (205, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131980327, '/radio/admin.php?op=topicsmanager', 'none', 'none', '127.0.0.1', '4072', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (206, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131980330, '/radio/admin.php?op=topicedit&topicid=1', 'none', 'none', '127.0.0.1', '4072', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (207, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131980333, '/radio/admin.php?op=topicdelete&topicid=1', 'none', 'none', '127.0.0.1', '4072', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (208, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131980335, '/radio/admin.php?op=topicdelete&topicid=1&ok=1', 'none', 'none', '127.0.0.1', '4072', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (209, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131980336, '/radio/admin.php?op=topicsmanager', 'none', 'none', '127.0.0.1', '4072', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (210, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131980380, '/radio/admin.php?op=FCKadminStory', 'none', 'none', '127.0.0.1', '4079', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (211, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131980402, '/radio/index.php', 'none', 'none', '127.0.0.1', '4084', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (212, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131980531, '/radio/admin.php', 'none', 'none', '127.0.0.1', '4109', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (213, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131980550, '/radio/admin.php?op=FCKadminStory', 'none', 'none', '127.0.0.1', '4115', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (214, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131980872, '/radio/admin.php', 'none', 'none', '127.0.0.1', '4142', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (215, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131980872, '/radio/admin.php?op=adminMain', 'none', 'none', '127.0.0.1', '4142', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (216, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131980887, '/radio/index.php', 'none', 'none', '127.0.0.1', '4147', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (217, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131980997, '/radio/admin.php?op=FCKadminStory', 'none', 'none', '127.0.0.1', '4156', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (218, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131981009, '/radio/admin.php', 'none', 'none', '127.0.0.1', '4156', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (219, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131981013, '/radio/admin.php?op=EditStory&sid=2', 'none', 'none', '127.0.0.1', '4156', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (220, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131981031, '/radio/admin.php', 'none', 'none', '127.0.0.1', '4162', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (221, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131981032, '/radio/admin.php?op=adminMain', 'none', 'none', '127.0.0.1', '4162', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (222, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131981036, '/radio/index.php', 'none', 'none', '127.0.0.1', '4165', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (223, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131981096, '/radio/index.php', 'none', 'none', '127.0.0.1', '4173', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (224, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131981180, '/radio/index.php', 'none', 'none', '127.0.0.1', '4208', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (225, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131981248, '/radio/admin.php?op=FCKadminStory', 'none', 'none', '127.0.0.1', '4217', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (226, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131981270, '/radio/admin.php', 'none', 'none', '127.0.0.1', '4223', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (227, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131981283, '/radio/admin.php?op=EditStory&sid=2', 'none', 'none', '127.0.0.1', '4223', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (228, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131981534, '/radio/admin.php', 'none', 'none', '127.0.0.1', '4228', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (229, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131981534, '/radio/admin.php?op=adminMain', 'none', 'none', '127.0.0.1', '4228', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (230, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131981539, '/radio/index.php', 'none', 'none', '127.0.0.1', '4231', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (231, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131981619, '/radio/admin.php?op=EditStory&sid=2', 'none', 'none', '127.0.0.1', '4240', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (232, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131981643, '/radio/admin.php', 'none', 'none', '127.0.0.1', '4242', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (233, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131981643, '/radio/admin.php?op=adminMain', 'none', 'none', '127.0.0.1', '4242', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (234, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131981650, '/radio/index.php', 'none', 'none', '127.0.0.1', '4247', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (235, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131981677, '/radio/admin.php?op=EditStory&sid=2', 'none', 'none', '127.0.0.1', '4257', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (236, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131981701, '/radio/admin.php', 'none', 'none', '127.0.0.1', '4259', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (237, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131981701, '/radio/admin.php?op=adminMain', 'none', 'none', '127.0.0.1', '4259', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (238, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131981705, '/radio/index.php', 'none', 'none', '127.0.0.1', '4262', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (239, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131981710, '/radio/modules.php?name=News&file=article&sid=2', 'none', 'none', '127.0.0.1', '4264', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (240, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131981719, '/radio/index.php', 'none', 'none', '127.0.0.1', '4264', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (241, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131982091, '/radio/index.php', 'none', 'none', '127.0.0.1', '4278', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (242, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131982105, '/radio/modules.php?name=News&file=article&sid=2', 'none', 'none', '127.0.0.1', '4278', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (243, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131982226, '/radio/index.php', 'none', 'none', '127.0.0.1', '4290', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (244, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131982255, '/radio/index.php', 'none', 'none', '127.0.0.1', '4295', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (245, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131982268, '/radio/index.php', 'none', 'none', '127.0.0.1', '4297', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (246, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131982313, '/radio/index.php', 'none', 'none', '127.0.0.1', '4307', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (247, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131982327, '/radio/index.php', 'none', 'none', '127.0.0.1', '4307', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (248, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131982357, '/radio/index.php', 'none', 'none', '127.0.0.1', '4319', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (249, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131982390, '/radio/index.php', 'none', 'none', '127.0.0.1', '4326', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (250, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131982439, '/radio/index.php', 'none', 'none', '127.0.0.1', '4335', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (251, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131982460, '/radio/index.php', 'none', 'none', '127.0.0.1', '4344', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (252, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131982941, '/radio/index.php', 'none', 'none', '127.0.0.1', '4378', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (253, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131982973, '/radio/index.php', 'none', 'none', '127.0.0.1', '4385', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (254, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131982993, '/radio/index.php', 'none', 'none', '127.0.0.1', '4392', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (255, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131983573, '/radio/admin.php', 'none', 'none', '127.0.0.1', '4430', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (256, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131983577, '/radio/admin.php?op=Configure', 'none', 'none', '127.0.0.1', '4430', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (257, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131983650, '/radio/admin.php', 'none', 'none', '127.0.0.1', '4434', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (258, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131983650, '/radio/admin.php?op=Configure', 'none', 'none', '127.0.0.1', '4434', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (259, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131983661, '/radio/index.php', 'none', 'none', '127.0.0.1', '4438', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (260, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131983665, '/radio/index.php', 'none', 'none', '127.0.0.1', '4438', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (261, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131983735, '/radio/index.php', 'none', 'none', '127.0.0.1', '4450', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (262, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131983749, '/radio/modules.php?name=News&file=article&sid=2', 'none', 'none', '127.0.0.1', '4450', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (263, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131983755, '/radio/index.php', 'none', 'none', '127.0.0.1', '4452', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (264, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131987125, '/radio/admin.php?op=BlocksAdmin', 'none', 'none', '127.0.0.1', '4753', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (265, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131987157, '/radio/index.php', 'none', 'none', '127.0.0.1', '4756', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (266, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131987188, '/radio/admin.php', 'none', 'none', '127.0.0.1', '4763', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (267, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131987192, '/radio/admin.php?op=BlocksAdmin', 'none', 'none', '127.0.0.1', '4763', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (268, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131987197, '/radio/admin.php?op=BlocksEdit&bid=10', 'none', 'none', '127.0.0.1', '4763', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (269, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131987203, '/radio/admin.php', 'none', 'none', '127.0.0.1', '4763', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (270, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131987204, '/radio/admin.php?op=BlocksAdmin', 'none', 'none', '127.0.0.1', '4763', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (271, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131987321, '/radio/index.php', 'none', 'none', '127.0.0.1', '4775', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (272, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131987345, '/radio/index.php', 'none', 'none', '127.0.0.1', '4783', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (273, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131987476, '/radio/index.php', 'none', 'none', '127.0.0.1', '4791', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (274, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131987529, '/radio/index.php', 'none', 'none', '127.0.0.1', '4798', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (275, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131987547, '/radio/index.php', 'none', 'none', '127.0.0.1', '4805', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (276, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131987563, '/radio/index.php', 'none', 'none', '127.0.0.1', '4805', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (277, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131987572, '/radio/index.php', 'none', 'none', '127.0.0.1', '4805', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (278, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131988823, '/radio/index.php', 'none', 'none', '127.0.0.1', '4847', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (279, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131988888, '/radio/index.php', 'none', 'none', '127.0.0.1', '4854', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (280, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131988906, '/radio/index.php', 'none', 'none', '127.0.0.1', '4861', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (281, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131988927, '/radio/index.php', 'none', 'none', '127.0.0.1', '4869', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (282, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131989071, '/radio/index.php', 'none', 'none', '127.0.0.1', '4880', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (283, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131989095, '/radio/index.php', 'none', 'none', '127.0.0.1', '4888', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (284, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131994274, '/frequencia/index.php', 'none', 'none', '127.0.0.1', '3754', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (285, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131994391, '/frequencia/index.php', 'none', 'none', '127.0.0.1', '3769', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (286, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131994471, '/frequencia/index.php', 'none', 'none', '127.0.0.1', '3779', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (287, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131994679, '/frequencia/index.php', 'none', 'none', '127.0.0.1', '3867', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (288, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131994714, '/frequencia/admin.php', 'none', 'none', '127.0.0.1', '3876', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (289, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131994722, '/frequencia/admin.php', 'none', 'none', '127.0.0.1', '3876', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (290, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131994731, '/frequencia/admin.php?op=BlocksAdmin', 'none', 'none', '127.0.0.1', '3878', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (291, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131994907, '/frequencia/modules.php?name=Calendar&file=index&Date=11/1/2005&type=day', 'none', 'none', '127.0.0.1', '3905', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (292, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131994964, '/frequencia/modules.php?name=Calendar&file=index&Date=11/1/2005&type=day', 'none', 'none', '127.0.0.1', '3917', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (293, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131994983, '/frequencia/admin.php?op=BlocksEdit&bid=10', 'none', 'none', '127.0.0.1', '3921', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (294, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131994997, '/frequencia/admin.php', 'none', 'none', '127.0.0.1', '3921', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (295, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131994999, '/frequencia/admin.php?op=BlocksAdmin', 'none', 'none', '127.0.0.1', '3921', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (296, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131995004, '/frequencia/modules.php?name=Calendar&file=index&Date=11/1/2005&type=day', 'none', 'none', '127.0.0.1', '3927', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (297, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131995045, '/frequencia/admin.php?op=BlocksEdit&bid=9', 'none', 'none', '127.0.0.1', '3935', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (298, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1131995055, '/frequencia/index.php', 'none', 'none', '127.0.0.1', '3935', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (299, 'none', '', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132079976, '/frequencia/index.php', 'none', 'none', '127.0.0.1', '2190', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (300, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132090530, '/garopaba/Index.php', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (301, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132090582, '/garopaba/admin.php', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (302, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132090593, '/garopaba/admin.php', 'none', 'none', '201.3.156.52', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (303, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132090610, '/garopaba/admin.php?op=BlocksAdmin', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (304, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132090615, '/garopaba/admin.php?op=BlocksEdit&bid=15', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (305, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132090625, '/garopaba/admin.php', 'none', 'none', '201.3.156.52', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (306, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132090626, '/garopaba/admin.php?op=BlocksAdmin', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (307, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132090632, '/garopaba/admin.php?op=BlocksEdit&bid=9', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (308, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132090713, '/garopaba/admin.php', 'none', 'none', '201.3.156.52', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (309, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132090714, '/garopaba/admin.php?op=BlocksAdmin', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (310, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132090729, '/garopaba/admin.php?op=BlocksEdit&bid=12', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (311, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132090741, '/garopaba/admin.php', 'none', 'none', '201.3.156.52', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (312, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132090741, '/garopaba/admin.php?op=BlocksAdmin', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (313, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132090746, '/garopaba/admin.php?op=BlocksEdit&bid=6', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (314, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132090753, '/garopaba/modules.php?name=Surveys&op=results&pollID=1&mode=&order=&thold=', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (315, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132090765, '/garopaba/admin.php?op=polledit&pollID=1', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (316, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132090776, '/garopaba/admin.php', 'none', 'none', '201.3.156.52', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (317, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132090777, '/garopaba/admin.php', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (318, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132090779, '/garopaba/index.php', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (319, '201.2.254.226', '201-2-254-226.fnsce701.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132091954, '/garopaba/Index.php', 'none', 'none', '201.2.254.226', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (320, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132092565, '/garopaba/modules.php?name=News&file=article&sid=2', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (321, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132092574, '/garopaba/index.php', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (322, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132092578, '/garopaba/modules.php?name=News&file=article&sid=2', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (323, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132092596, '/garopaba/index.php', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (324, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132100346, '/garopaba/Index.php', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (325, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132100395, '/garopaba/modules.php?name=Your_Account', 'none', 'none', '201.3.156.52', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (326, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132100395, '/garopaba/modules.php?name=Your_Account&op=userinfo&bypass=1&username=Mandry', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (327, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132100412, '/garopaba/admin.php', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (328, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132100434, '/garopaba/modules.php?name=Your_Account&file=admin', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (329, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132100440, '/garopaba/modules.php?name=Your_Account&file=admin&op=UsersConfig', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (330, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132100473, '/garopaba/modules.php?name=Your_Account&file=admin', 'none', 'none', '201.3.156.52', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (331, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132100486, '/garopaba/modules.php?name=Private_Messages', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (332, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132100506, '/garopaba/modules.php?name=Private_Messages&file=index&mode=post&sid=0100f170595cf12ae43524b19e7c764e', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (333, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132100690, '/garopaba/modules.php?name=Your_Account&op=userinfo&bypass=1&username=Mandry', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (334, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132100732, '/garopaba/modules.php?name=Journal&file=edit', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (335, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132100747, '/garopaba/admin.php', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (336, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132100755, '/garopaba/admin.php?op=modules', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (337, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132100763, '/garopaba/admin.php?op=module_status&mid=1&active=0', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (338, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132100764, '/garopaba/admin.php?op=modules', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (339, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132100772, '/garopaba/admin.php?op=module_edit&mid=33', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (340, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132100779, '/garopaba/admin.php', 'none', 'none', '201.3.156.52', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (341, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132100780, '/garopaba/admin.php?op=modules', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (342, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132100787, '/garopaba/admin.php?op=module_status&mid=33&active=1', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (343, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132100788, '/garopaba/admin.php?op=modules', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (344, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132100799, '/garopaba/admin.php?op=module_edit&mid=31', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (345, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132100809, '/garopaba/admin.php', 'none', 'none', '201.3.156.52', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (346, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132100809, '/garopaba/admin.php?op=modules', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (347, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132100819, '/garopaba/admin.php?op=module_status&mid=31&active=1', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (348, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132100820, '/garopaba/admin.php?op=modules', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (349, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132100828, '/garopaba/admin.php?op=module_edit&mid=2', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (350, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132100836, '/garopaba/admin.php', 'none', 'none', '201.3.156.52', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (351, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132100837, '/garopaba/admin.php?op=modules', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (352, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132100845, '/garopaba/admin.php?op=module_status&mid=2&active=1', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (353, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132100845, '/garopaba/admin.php?op=modules', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (354, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132100864, '/garopaba/admin.php?op=module_status&mid=27&active=0', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (355, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132100868, '/garopaba/admin.php?op=modules', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (356, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132100883, '/garopaba/admin.php?op=module_edit&mid=9', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (357, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132100890, '/garopaba/admin.php', 'none', 'none', '201.3.156.52', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (358, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132100891, '/garopaba/admin.php?op=modules', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (359, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132100907, '/garopaba/admin.php?op=module_status&mid=8&active=0', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (360, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132100908, '/garopaba/admin.php?op=modules', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (361, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132100921, '/garopaba/admin.php?op=module_status&mid=9&active=1', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (362, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132100922, '/garopaba/admin.php?op=modules', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (363, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132100932, '/garopaba/admin.php?op=module_edit&mid=29', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (364, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132100939, '/garopaba/admin.php', 'none', 'none', '201.3.156.52', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (365, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132100940, '/garopaba/admin.php?op=modules', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (366, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132100949, '/garopaba/admin.php?op=module_status&mid=12&active=0', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (367, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132100950, '/garopaba/admin.php?op=modules', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (368, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132100966, '/garopaba/admin.php?op=module_edit&mid=16', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (369, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132100974, '/garopaba/admin.php', 'none', 'none', '201.3.156.52', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (370, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132100975, '/garopaba/admin.php?op=modules', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (371, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132100991, '/garopaba/admin.php?op=module_edit&mid=20', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (372, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132100997, '/garopaba/admin.php', 'none', 'none', '201.3.156.52', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (373, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132100998, '/garopaba/admin.php?op=modules', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (374, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132101006, '/garopaba/modules.php?name=Your_Account', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (375, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132101007, '/garopaba/modules.php?name=Your_Account&op=userinfo&username=Mandry', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (376, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132101017, '/garopaba/modules.php?name=Private_Messages', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (377, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132101195, '/garopaba/modules.php?name=Private_Messages', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (378, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132101214, '/garopaba/modules.php?name=Private_Messages&file=index&mode=post&sid=76d778b723a9a581a8ab0c273ba48674', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (379, '201.3.156.52', '201-3-156-52.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132101222, '/garopaba/index.php', 'none', 'none', '201.3.156.52', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (380, '201.11.222.133', '201.11.222.133', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132147537, '/garopaba/Index.php', 'none', 'none', '201.11.222.133', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (381, '201.11.222.133', '201.11.222.133', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132147599, '/garopaba/modules.php?name=Your_Account&op=new_user', 'none', 'none', '201.11.222.133', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (382, '201.11.222.133', '201.11.222.133', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132147604, '/garopaba/modules.php?name=Your_Account&op=userinfo&username=Mandry', 'none', 'none', '201.11.222.133', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (383, '200.203.24.27', '200-203-024-027.paemt7003.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132156506, '/garopaba/Index.php', 'none', 'none', '200.203.24.27', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (384, '201.15.171.151', '201-15-171-151.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132167346, '/garopaba/Index.php', 'none', 'none', '201.15.171.151', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (385, '201.15.171.151', '201-15-171-151.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132167629, '/garopaba/Index.php', 'none', 'none', '201.15.171.151', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (386, '201.15.171.151', '201-15-171-151.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132167672, '/garopaba/modules.php?name=Your_Account&op=new_user', 'none', 'none', '201.15.171.151', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (387, '201.15.171.151', '201-15-171-151.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132167673, '/garopaba/modules.php?name=Your_Account&op=userinfo&username=Mandry', 'none', 'none', '201.15.171.151', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (388, '201.15.171.151', '201-15-171-151.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132168357, '/garopaba/modules.php?name=News&file=article&sid=2&mode=&order=0&thold=0', 'none', 'none', '201.15.171.151', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (389, '201.15.171.151', '201-15-171-151.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132168366, '/garopaba/index.php', 'none', 'none', '201.15.171.151', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (390, '201.11.82.100', '201-11-82-100.fnsce701.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132180707, '/garopaba/Index.php', 'none', 'none', '201.11.82.100', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (391, '200.96.105.168', '200.96.105.168', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132232430, '/garopaba/admin.php', 'none', 'none', '200.96.105.168', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (392, '200.96.105.168', '200.96.105.168', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132232448, '/garopaba/admin.php?op=BlocksAdmin', 'none', 'none', '200.96.105.168', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (393, '200.96.105.168', '200.96.105.168', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132232464, '/garopaba/admin.php?op=BlocksEdit&bid=15', 'none', 'none', '200.96.105.168', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (394, '200.96.105.168', '200.96.105.168', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132232615, '/garopaba/Index.php', 'none', 'none', '200.96.105.168', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (395, '200.96.105.168', '200.96.105.168', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132232648, '/garopaba/Index.php', 'none', 'none', '200.96.105.168', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (396, '200.96.105.168', '200.96.105.168', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132233028, '/garopaba/Index.php', 'none', 'none', '200.96.105.168', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (397, '200.96.105.168', '200.96.105.168', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132233198, '/garopaba/admin.php?op=BlocksAdmin', 'none', 'none', '200.96.105.168', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (398, '200.96.105.168', '200.96.105.168', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132233341, '/garopaba/admin.php?op=BlocksEdit&bid=15', 'none', 'none', '200.96.105.168', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (399, '200.96.105.168', '200.96.105.168', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132233642, '/garopaba/index.php', 'none', 'none', '200.96.105.168', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (400, '200.96.105.168', '200.96.105.168', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132233700, '/garopaba/admin.php', 'none', 'none', '200.96.105.168', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (401, '200.96.105.168', '200.96.105.168', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132233706, '/garopaba/admin.php?op=BlocksAdmin', 'none', 'none', '200.96.105.168', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (402, '200.96.105.168', '200.96.105.168', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132233732, '/garopaba/index.php', 'none', 'none', '200.96.105.168', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (403, '200.96.105.168', '200.96.105.168', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132234902, '/garopaba/admin.php?op=BlocksEdit&bid=15', 'none', 'none', '200.96.105.168', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (404, '200.96.105.168', '200.96.105.168', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132235170, '/garopaba/index.php', 'none', 'none', '200.96.105.168', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (405, '201.3.156.38', '201-3-156-38.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132238178, '/garopaba/Index.php', 'none', 'none', '201.3.156.38', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (406, '201.3.156.38', '201-3-156-38.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132238250, '/garopaba/admin.php?op=BlocksAdmin', 'none', 'none', '201.3.156.38', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (407, '201.3.156.38', '201-3-156-38.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132238352, '/garopaba/admin.php?op=BlocksEdit&bid=15', 'none', 'none', '201.3.156.38', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (408, '201.3.156.38', '201-3-156-38.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132238390, '/garopaba/admin.php', 'none', 'none', '201.3.156.38', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (409, '201.3.156.38', '201-3-156-38.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132238391, '/garopaba/admin.php?op=BlocksAdmin', 'none', 'none', '201.3.156.38', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (410, '201.3.156.38', '201-3-156-38.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132238402, '/garopaba/index.php', 'none', 'none', '201.3.156.38', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (411, '201.3.156.38', '201-3-156-38.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132249118, '/garopaba/Index.php', 'none', 'none', '201.3.156.38', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (412, '200.102.74.96', '200-102-074-096.paemt7014.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132322306, '/garopaba/Index.php', 'none', 'none', '200.102.74.96', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (413, '200.102.74.96', '200-102-074-096.paemt7014.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132322357, '/garopaba/modules.php?name=Private_Messages', 'none', 'none', '200.102.74.96', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (414, '200.102.74.96', '200-102-074-096.paemt7014.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132322369, '/garopaba/modules.php?name=Private_Messages&file=index&mode=post&sid=9ab521aace0ac0f087de91f6d5e0b7d1', 'none', 'none', '200.102.74.96', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (415, '200.102.74.96', '200-102-074-096.paemt7014.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132322375, '/garopaba/modules.php?name=Forums&file=search&mode=searchuser&popup=1&sid=9ab521aace0ac0f087de91f6d5e0b7d1', 'none', 'none', '200.102.74.96', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (416, '200.102.74.96', '200-102-074-096.paemt7014.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132322379, '/garopaba/modules.php?name=Forums&file=search&mode=searchuser&popup=1&sid=9ab521aace0ac0f087de91f6d5e0b7d1', 'none', 'none', '200.102.74.96', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (417, '200.102.74.96', '200-102-074-096.paemt7014.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132322390, '/garopaba/modules.php?name=Your_Account&op=edituser', 'none', 'none', '200.102.74.96', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (418, '200.102.74.96', '200-102-074-096.paemt7014.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132322398, '/garopaba/modules.php?name=Your_Account&op=avatarlist', 'none', 'none', '200.102.74.96', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (419, '200.102.74.96', '200-102-074-096.paemt7014.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132322413, '/garopaba/index.php', 'none', 'none', '200.102.74.96', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (420, '200.102.74.96', '200-102-074-096.paemt7014.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132328160, '/garopaba/Index.php', 'none', 'none', '200.102.74.96', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (421, '200.102.169.55', '200-102-169-055.paemt7011.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132334950, '/garopaba/Index.php', 'none', 'none', '200.102.169.55', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (422, '200.102.169.55', '200-102-169-055.paemt7011.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132335205, '/garopaba/modules.php?name=Statistics', 'none', 'none', '200.102.169.55', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (423, '200.102.169.55', '200-102-169-055.paemt7011.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132335237, '/garopaba/admin.php', 'none', 'none', '200.102.169.55', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (424, '200.102.169.55', '200-102-169-055.paemt7011.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132335242, '/garopaba/admin.php?op=BlocksAdmin', 'none', 'none', '200.102.169.55', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (425, '200.102.169.55', '200-102-169-055.paemt7011.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132335278, '/garopaba/admin.php?op=BlocksEdit&bid=9', 'none', 'none', '200.102.169.55', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (426, '200.102.169.55', '200-102-169-055.paemt7011.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132335392, '/garopaba/modules.php?name=Surveys&op=results&pollID=1&mode=&order=0&thold=0', 'none', 'none', '200.102.169.55', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (427, '200.102.74.2', '200-102-074-002.paemt7014.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132335948, '/garopaba/Index.php', 'none', 'none', '200.102.74.2', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (428, '200.102.74.2', '200-102-074-002.paemt7014.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132335992, '/garopaba/admin.php', 'none', 'none', '200.102.74.2', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (429, '200.102.74.2', '200-102-074-002.paemt7014.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132336010, '/garopaba/admin.php?op=BlocksAdmin', 'none', 'none', '200.102.74.2', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (430, '200.102.74.2', '200-102-074-002.paemt7014.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132336022, '/garopaba/admin.php?op=BlocksEdit&bid=9', 'none', 'none', '200.102.74.2', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (431, '200.102.74.2', '200-102-074-002.paemt7014.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132336312, '/garopaba/admin.php', 'none', 'none', '200.102.74.2', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (432, '200.102.74.2', '200-102-074-002.paemt7014.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132336313, '/garopaba/admin.php?op=BlocksAdmin', 'none', 'none', '200.102.74.2', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (433, '200.102.74.2', '200-102-074-002.paemt7014.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132336318, '/garopaba/index.php', 'none', 'none', '200.102.74.2', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (434, '200.102.74.2', '200-102-074-002.paemt7014.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132336322, '/garopaba/index.php', 'none', 'none', '200.102.74.2', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (435, '200.102.74.2', '200-102-074-002.paemt7014.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132336375, '/garopaba/modules.php?name=Surveys', 'none', 'none', '200.102.74.2', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (436, '200.102.74.2', '200-102-074-002.paemt7014.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132336908, '/garopaba/modules.php?name=Surveys', 'none', 'none', '200.102.74.2', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (437, '200.102.74.2', '200-102-074-002.paemt7014.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132336926, '/garopaba/modules.php?name=Calendar', 'none', 'none', '200.102.74.2', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (438, '200.102.74.2', '200-102-074-002.paemt7014.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132337030, '/garopaba/modules.php?name=Calendar', 'none', 'none', '200.102.74.2', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (439, '200.102.74.2', '200-102-074-002.paemt7014.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132337123, '/garopaba/modules.php?name=Calendar', 'none', 'none', '200.102.74.2', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (440, '200.102.74.2', '200-102-074-002.paemt7014.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132337134, '/garopaba/modules.php?name=Calendar&file=index&type=month', 'none', 'none', '200.102.74.2', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (441, '200.102.74.2', '200-102-074-002.paemt7014.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132337139, '/garopaba/modules.php?name=Calendar&file=index&type=year', 'none', 'none', '200.102.74.2', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (442, '200.102.74.2', '200-102-074-002.paemt7014.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132337147, '/garopaba/modules.php?name=Calendar&file=index&type=day', 'none', 'none', '200.102.74.2', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (443, '200.102.74.2', '200-102-074-002.paemt7014.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132337247, '/garopaba/modules.php?name=Calendar&file=index&type=day', 'none', 'none', '200.102.74.2', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (444, '200.102.74.2', '200-102-074-002.paemt7014.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132337954, '/garopaba/modules.php?name=Calendar&file=index&type=day', 'none', 'none', '200.102.74.2', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (445, '200.102.74.2', '200-102-074-002.paemt7014.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132337964, '/garopaba/modules.php?name=Calendar&file=index&Date=11/19/2005&type=day', 'none', 'none', '200.102.74.2', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (446, '200.102.74.2', '200-102-074-002.paemt7014.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132337972, '/garopaba/index.php', 'none', 'none', '200.102.74.2', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (447, '200.102.18.7', '200-102-18-7.fnsce701.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132357170, '/garopaba/Index.php', 'none', 'none', '200.102.18.7', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (448, '200.102.74.2', '200-102-074-002.paemt7014.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132358046, '/garopaba/Index.php', 'none', 'none', '200.102.74.2', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (449, '200.102.74.2', '200-102-074-002.paemt7014.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132358058, '/garopaba/modules.php?name=Statistics', 'none', 'none', '200.102.74.2', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (450, '200.102.143.179', '200-102-143-179.paemt7013.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132424409, '/garopaba/Index.php', 'none', 'none', '200.102.143.179', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (451, '200.102.143.179', '200-102-143-179.paemt7013.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132424450, '/garopaba/modules.php?name=Statistics', 'none', 'none', '200.102.143.179', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (452, '200.102.143.179', '200-102-143-179.paemt7013.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132424459, '/garopaba/index.php', 'none', 'none', '200.102.143.179', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (453, '201.11.245.16', '201.11.245.16', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132434094, '/garopaba/Index.php', 'none', 'none', '201.11.245.16', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (454, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132572397, '/garopaba/Index.php', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (455, '201.24.112.164', '201-24-112-164.fnsce701.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132573072, '/garopaba/Index.php', 'none', 'none', '201.24.112.164', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (456, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132573890, '/garopaba/admin.php', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (457, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132573903, '/garopaba/admin.php?op=BlocksAdmin', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (458, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132573931, '/garopaba/Index.php', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (459, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132573976, '/garopaba/admin.php?op=BlocksEdit&bid=6', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (460, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132573982, '/garopaba/admin.php', 'none', 'none', '201.14.246.190', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (461, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132573982, '/garopaba/admin.php?op=BlocksAdmin', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (462, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132573991, '/garopaba/admin.php?op=BlocksEdit&bid=11', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (463, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132573997, '/garopaba/admin.php', 'none', 'none', '201.14.246.190', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (464, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132573998, '/garopaba/admin.php?op=BlocksAdmin', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (465, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132574003, '/garopaba/Index.php', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (466, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132574016, '/garopaba/admin.php?op=BlockOrder&weight=5&bidori=13&weightrep=4&bidrep=6', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (467, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132574017, '/garopaba/admin.php?op=BlocksAdmin', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (468, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132574022, '/garopaba/Index.php', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (469, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132574057, '/garopaba/admin.php?op=BlocksEdit&bid=9', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (470, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132574144, '/garopaba/admin.php', 'none', 'none', '201.14.246.190', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (471, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132574144, '/garopaba/admin.php?op=BlocksAdmin', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (472, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132574150, '/garopaba/Index.php', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (473, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132574170, '/garopaba/admin.php?op=BlocksEdit&bid=15', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (474, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132574186, '/garopaba/admin.php', 'none', 'none', '201.14.246.190', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (475, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132574186, '/garopaba/admin.php?op=BlocksAdmin', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (476, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132574190, '/garopaba/Index.php', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (477, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132574565, '/garopaba/admin.php', 'none', 'none', '201.14.246.190', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (478, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132574565, '/garopaba/admin.php?op=BlocksAdmin', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (479, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132574573, '/garopaba/Index.php', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (480, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132574646, '/garopaba/admin.php?op=BlocksEdit&bid=17', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (481, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132574654, '/garopaba/admin.php', 'none', 'none', '201.14.246.190', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (482, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132574655, '/garopaba/admin.php?op=BlocksAdmin', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (483, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132574672, '/garopaba/Index.php', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (484, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132574765, '/garopaba/Index.php', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (485, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132574943, '/garopaba/Index.php', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (486, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132575035, '/garopaba/admin.php?op=BlocksEdit&bid=9', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (487, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132575045, '/garopaba/admin.php', 'none', 'none', '201.14.246.190', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (488, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132575045, '/garopaba/admin.php?op=BlocksAdmin', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (489, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132575051, '/garopaba/Index.php', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (490, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132575219, '/garopaba/admin.php?op=BlocksEdit&bid=17', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (491, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132575227, '/garopaba/admin.php', 'none', 'none', '201.14.246.190', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (492, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132575228, '/garopaba/admin.php?op=BlocksAdmin', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (493, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132575240, '/garopaba/Index.php', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (494, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132575279, '/garopaba/Index.php', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (495, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132575734, '/garopaba/admin.php', 'none', 'none', '201.14.246.190', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (496, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132575735, '/garopaba/admin.php?op=BlocksAdmin', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (497, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132575750, '/garopaba/Index.php', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (498, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132575770, '/garopaba/admin.php?op=BlocksEdit&bid=9', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (499, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132575778, '/garopaba/admin.php?op=BlocksAdmin', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (500, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132575787, '/garopaba/admin.php?op=BlocksEdit&bid=18', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (501, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132575820, '/garopaba/admin.php', 'none', 'none', '201.14.246.190', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (502, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132575820, '/garopaba/admin.php?op=BlocksAdmin', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (503, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132575827, '/garopaba/admin.php?op=BlocksEdit&bid=18', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (504, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132575888, '/garopaba/admin.php', 'none', 'none', '201.14.246.190', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (505, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132575888, '/garopaba/admin.php?op=BlocksAdmin', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (506, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132575903, '/garopaba/Index.php', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (507, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132575913, '/garopaba/index.php', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (508, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132575954, '/garopaba/Index.php', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (509, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132575964, '/garopaba/index.php', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (510, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132576017, '/garopaba/admin.php?op=BlocksDelete&bid=9', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (511, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132576020, '/garopaba/admin.php?op=BlocksDelete&bid=9&ok=1', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (512, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132576021, '/garopaba/admin.php?op=BlocksAdmin', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (513, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132576026, '/garopaba/admin.php?op=BlockOrder&weight=5&bidori=18&weightrep=4&bidrep=11', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (514, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132576026, '/garopaba/admin.php?op=BlocksAdmin', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (515, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132576032, '/garopaba/admin.php?op=BlockOrder&weight=4&bidori=18&weightrep=3&bidrep=10', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (516, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132576033, '/garopaba/admin.php?op=BlocksAdmin', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (517, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132576040, '/garopaba/admin.php?op=BlocksEdit&bid=18', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (518, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132576049, '/garopaba/admin.php', 'none', 'none', '201.14.246.190', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (519, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132576049, '/garopaba/admin.php?op=BlocksAdmin', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (520, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132576057, '/garopaba/admin.php?op=BlocksEdit&bid=18', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (521, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132576063, '/garopaba/admin.php', 'none', 'none', '201.14.246.190', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (522, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132576063, '/garopaba/admin.php?op=BlocksAdmin', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (523, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132576070, '/garopaba/admin.php?op=BlocksEdit&bid=18', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (524, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132576076, '/garopaba/admin.php', 'none', 'none', '201.14.246.190', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (525, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132576077, '/garopaba/admin.php?op=BlocksAdmin', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (526, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132576086, '/garopaba/admin.php?op=BlocksEdit&bid=18', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (527, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132576096, '/garopaba/admin.php', 'none', 'none', '201.14.246.190', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (528, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132576096, '/garopaba/admin.php?op=BlocksAdmin', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (529, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132576105, '/garopaba/admin.php?op=BlocksEdit&bid=18', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (530, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132576111, '/garopaba/admin.php', 'none', 'none', '201.14.246.190', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (531, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132576111, '/garopaba/admin.php?op=BlocksAdmin', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (532, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132576143, '/garopaba/index.php', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (533, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132576155, '/garopaba/modules.php?name=Your_Account', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (534, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132576155, '/garopaba/modules.php?name=Your_Account&op=userinfo&username=Mandry', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (535, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132576161, '/garopaba/index.php', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (536, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132576504, '/garopaba/modules.php?name=News&file=article&sid=2&mode=&order=0&thold=0', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (537, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132576514, '/garopaba/index.php', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (538, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132576666, '/garopaba/index.php', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (539, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132576790, '/garopaba/index.php', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (540, '201.24.112.164', '201-24-112-164.fnsce701.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132576848, '/garopaba/Index.php', 'none', 'none', '201.24.112.164', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (541, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132577182, '/garopaba/admin.php?op=BlocksEdit&bid=15', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (542, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132577219, '/garopaba/admin.php', 'none', 'none', '201.14.246.190', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (543, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132577220, '/garopaba/admin.php?op=BlocksAdmin', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (544, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132577224, '/garopaba/index.php', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (545, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132577285, '/garopaba/admin.php?op=BlocksEdit&bid=17', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (546, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132577291, '/garopaba/admin.php?op=BlocksEdit&bid=15', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (547, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132577322, '/garopaba/admin.php', 'none', 'none', '201.14.246.190', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (548, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132577322, '/garopaba/admin.php?op=BlocksAdmin', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (549, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132577327, '/garopaba/index.php', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (550, '201.24.112.164', '201-24-112-164.fnsce701.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132577345, '/garopaba/Index.php', 'none', 'none', '201.24.112.164', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (551, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132577355, '/garopaba/admin.php?op=BlocksEdit&bid=15', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (552, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132577390, '/garopaba/admin.php?op=BlocksAdmin', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (553, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132577394, '/garopaba/admin.php?op=BlocksDelete&bid=15', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (554, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132577397, '/garopaba/admin.php?op=BlocksDelete&bid=15&ok=1', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (555, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132577398, '/garopaba/admin.php?op=BlocksAdmin', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (556, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132577406, '/garopaba/admin.php', 'none', 'none', '201.14.246.190', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (557, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132577407, '/garopaba/admin.php?op=BlocksAdmin', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (558, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132577414, '/garopaba/index.php', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (559, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132577428, '/garopaba/admin.php?op=BlockOrder&weight=3&bidori=19&weightrep=2&bidrep=17', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (560, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132577429, '/garopaba/admin.php?op=BlocksAdmin', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (561, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132577433, '/garopaba/index.php', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (562, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132577466, '/garopaba/admin.php?op=BlocksEdit&bid=19', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (563, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132577513, '/garopaba/admin.php', 'none', 'none', '201.14.246.190', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (564, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132577514, '/garopaba/admin.php?op=BlocksAdmin', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (565, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132577518, '/garopaba/index.php', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (566, '201.24.112.164', '201-24-112-164.fnsce701.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132577685, '/garopaba/Index.php', 'none', 'none', '201.24.112.164', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (567, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132577938, '/garopaba/index.php', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (568, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132578037, '/garopaba/index.php', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (569, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132578305, '/garopaba/modules.php?name=Calendar', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (570, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132578325, '/garopaba/index.php', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (571, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132578431, '/garopaba/admin.php?op=BlocksEdit&bid=10', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (572, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132578437, '/garopaba/index.php', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (573, '201.24.112.164', '201-24-112-164.fnsce701.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132578446, '/garopaba/Index.php', 'none', 'none', '201.24.112.164', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (574, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132578619, '/garopaba/admin.php', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (575, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132578630, '/garopaba/admin.php?op=BlocksAdmin', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (576, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132578637, '/garopaba/admin.php?op=BlocksEdit&bid=17', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (577, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132578644, '/garopaba/admin.php?op=BlocksEdit&bid=19', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (578, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132578677, '/garopaba/admin.php', 'none', 'none', '201.14.246.190', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (579, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132578677, '/garopaba/admin.php?op=BlocksAdmin', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (580, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132578681, '/garopaba/index.php', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (581, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132578694, '/garopaba/admin.php?op=BlocksEdit&bid=19', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (582, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132578707, '/garopaba/admin.php', 'none', 'none', '201.14.246.190', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (583, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132578707, '/garopaba/admin.php?op=BlocksAdmin', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (584, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132578710, '/garopaba/index.php', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (585, '201.24.112.164', '201-24-112-164.fnsce701.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132578818, '/garopaba/Index.php', 'none', 'none', '201.24.112.164', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (586, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132578934, '/garopaba/admin.php?op=BlocksEdit&bid=19', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (587, '201.24.112.164', '201-24-112-164.fnsce701.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132578980, '/garopaba/Index.php', 'none', 'none', '201.24.112.164', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (588, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132579108, '/garopaba/admin.php', 'none', 'none', '201.14.246.190', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (589, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132579109, '/garopaba/admin.php?op=BlocksAdmin', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (590, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132579112, '/garopaba/index.php', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (591, '201.24.112.164', '201-24-112-164.fnsce701.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132579133, '/garopaba/Index.php', 'none', 'none', '201.24.112.164', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (592, '201.14.246.190', '201-14-246-190.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132579263, '/garopaba/index.php', 'none', 'none', '201.14.246.190', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (593, '201.24.112.164', '201-24-112-164.fnsce701.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132580450, '/garopaba/Index.php', 'none', 'none', '201.24.112.164', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (594, '201.15.136.35', '201-15-136-35.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132585415, '/garopaba/Index.php', 'none', 'none', '201.15.136.35', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (595, '201.15.153.236', '201-15-153-236.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132591345, '/garopaba/Index.php', 'none', 'none', '201.15.153.236', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (596, '201.15.159.171', '201-15-159-171.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132602632, '/garopaba/Index.php', 'none', 'none', '201.15.159.171', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (597, '201.24.112.164', '201-24-112-164.fnsce701.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132602919, '/garopaba/Index.php', 'none', 'none', '201.24.112.164', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (598, '201.32.185.117', '20132185117.user.veloxzone.com.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322)', 1132604876, '/garopaba/Index.php', 'none', 'none', '201.32.185.117', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (599, '200.102.18.49', '200-102-18-49.fnsce701.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132614390, '/garopaba/Index.php', 'none', 'none', '200.102.18.49', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (600, '200.102.18.49', '200-102-18-49.fnsce701.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132614450, '/garopaba/modules.php?name=News&file=article&sid=2', 'none', 'none', '200.102.18.49', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (601, '200.102.18.49', '200-102-18-49.fnsce701.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132614459, '/garopaba/Index.php', 'none', 'none', '200.102.18.49', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (602, '200.203.24.186', '200-203-024-186.paemt7003.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132716665, '/garopaba/Index.php', 'none', 'none', '200.203.24.186', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (603, '200.203.24.186', '200-203-024-186.paemt7003.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132716733, '/garopaba/Index.php', 'none', 'none', '200.203.24.186', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (604, '201.24.112.164', '201-24-112-164.fnsce701.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132750444, '/garopaba/Index.php', 'none', 'none', '201.24.112.164', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (605, '201.11.238.14', '201.11.238.14', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132750470, '/garopaba/Index.php', 'none', 'none', '201.11.238.14', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (606, '201.11.238.14', '201.11.238.14', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132754910, '/garopaba/admin.php', 'none', 'none', '201.11.238.14', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (607, '201.11.238.14', '201.11.238.14', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132754921, '/garopaba/admin.php?op=BlocksAdmin', 'none', 'none', '201.11.238.14', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (608, '201.15.155.74', '201-15-155-74.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132856991, '/garopaba/Index.php', 'none', 'none', '201.15.155.74', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (609, '201.11.239.23', '201.11.239.23', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1132936699, '/garopaba/Index.php', 'none', 'none', '201.11.239.23', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (610, '200.96.109.80', '200-096-109-080.paemt7011.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133195336, '/garopaba/Index.php', 'none', 'none', '200.96.109.80', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (611, '201.11.222.57', '201.11.222.57', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133195572, '/garopaba/Index.php', 'none', 'none', '201.11.222.57', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (612, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133282070, '/garopaba/Index.php', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (613, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133282361, '/garopaba/admin.php', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (614, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133282366, '/garopaba/admin.php?op=mod_authors', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (615, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133282426, '/garopaba/admin.php', 'none', 'none', '201.3.128.217', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (616, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133282427, '/garopaba/admin.php?op=mod_authors', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (617, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133282433, '/garopaba/admin.php?op=logout', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (618, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133282438, '/garopaba/admin.php', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (619, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133282461, '/garopaba/admin.php', 'none', 'none', '201.3.128.217', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (620, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133282462, '/garopaba/admin.php', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (621, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133282481, '/garopaba/admin.php', 'none', 'none', '201.3.128.217', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (622, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133282510, '/garopaba/admin.php?op=logout', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (623, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133282515, '/garopaba/admin.php', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (624, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133282535, '/garopaba/admin.php', 'none', 'none', '201.3.128.217', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (625, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133282535, '/garopaba/admin.php', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (626, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133282543, '/garopaba/admin.php', 'none', 'none', '201.3.128.217', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (627, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133282551, '/garopaba/admin.php', 'none', 'none', '201.3.128.217', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (628, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133282552, '/garopaba/admin.php', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (629, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133282562, '/garopaba/admin.php', 'none', 'none', '201.3.128.217', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (630, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133282575, '/garopaba/admin.php?op=mod_authors', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (631, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133282606, '/garopaba/admin.php?op=modifyadmin&chng_aid=Garopaba', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (632, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133282684, '/garopaba/admin.php', 'none', 'none', '201.3.128.217', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (633, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133282684, '/garopaba/admin.php?op=mod_authors', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (634, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133282704, '/garopaba/admin.php?op=logout', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (635, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133282709, '/garopaba/admin.php', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (636, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133282721, '/garopaba/admin.php', 'none', 'none', '201.3.128.217', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (637, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133282722, '/garopaba/admin.php', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (638, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133282731, '/garopaba/admin.php', 'none', 'none', '201.3.128.217', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (639, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133282738, '/garopaba/modules.php?name=Calendar', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (640, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133282745, '/garopaba/modules.php?name=Calendar&file=submit', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (641, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133282767, '/garopaba/admin.php?op=logout', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (642, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133282772, '/garopaba/admin.php', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (643, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133282786, '/garopaba/admin.php', 'none', 'none', '201.3.128.217', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (644, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133282786, '/garopaba/admin.php', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (645, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133282795, '/garopaba/admin.php', 'none', 'none', '201.3.128.217', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (646, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133282800, '/garopaba/admin.php?op=topicsmanager', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (647, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133282814, '/garopaba/admin.php?op=topicedit&topicid=2', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (648, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133282826, '/garopaba/admin.php', 'none', 'none', '201.3.128.217', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (649, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133282826, '/garopaba/admin.php?op=topicedit&topicid=2', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (650, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133283341, '/garopaba/admin.php?op=topicsmanager', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (651, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133283366, '/garopaba/admin.php', 'none', 'none', '201.3.128.217', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (652, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133283367, '/garopaba/admin.php?op=topicsmanager#Add', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (653, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133283373, '/garopaba/admin.php?op=topicsmanager', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (654, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133283389, '/garopaba/admin.php?op=logout', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (655, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133283394, '/garopaba/admin.php', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (656, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133283411, '/garopaba/admin.php', 'none', 'none', '201.3.128.217', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (657, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133283416, '/garopaba/modules.php?name=Calendar', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (658, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133283429, '/garopaba/modules.php?name=Calendar&file=submit', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (659, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133283493, '/garopaba/modules.php?name=Calendar&file=submit', 'none', 'none', '201.3.128.217', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (660, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133283499, '/garopaba/modules.php?name=Calendar&file=submit', 'none', 'none', '201.3.128.217', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (661, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133283511, '/garopaba/modules.php?name=Calendar&file=index&type=month', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (662, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 2, 'Mandry', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133283514, '/garopaba/index.php', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (663, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133283561, '/garopaba/index.php', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (664, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133283565, '/garopaba/modules.php?name=Calendar', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (665, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133283570, '/garopaba/modules.php?name=Calendar&file=submit', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (666, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133283595, '/garopaba/modules.php?name=Calendar&file=submit', 'none', 'none', '201.3.128.217', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (667, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133283601, '/garopaba/modules.php?name=Calendar&file=submit', 'none', 'none', '201.3.128.217', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (668, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133283609, '/garopaba/index.php', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (669, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133283621, '/garopaba/admin.php', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (670, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133283630, '/garopaba/admin.php', 'none', 'none', '201.3.128.217', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (671, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133283646, '/garopaba/modules.php?name=Your_Account&file=admin', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (672, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133283649, '/garopaba/modules.php?name=Your_Account&file=admin&op=UsersConfig', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (673, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133283689, '/garopaba/modules.php?name=Your_Account&file=admin', 'none', 'none', '201.3.128.217', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (674, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133283693, '/garopaba/admin.php', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (675, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133283698, '/garopaba/admin.php?op=Configure', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (676, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133283726, '/garopaba/admin.php', 'none', 'none', '201.3.128.217', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (677, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133283726, '/garopaba/admin.php?op=Configure', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (678, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133283730, '/garopaba/admin.php?op=CalendarAdmin', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (679, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133283761, '/garopaba/admin.php?op=CalendarConfig', 'none', 'none', '201.3.128.217', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (680, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133283767, '/garopaba/admin.php?op=CalendarConfig', 'none', 'none', '201.3.128.217', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (681, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133283777, '/garopaba/admin.php?op=CalendarConfig', 'none', 'none', '201.3.128.217', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (682, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133283861, '/garopaba/index.php', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (683, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133283866, '/garopaba/modules.php?name=Calendar&file=index&type=view&eid=1', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (684, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133283872, '/garopaba/admin.php?op=CalendarRemoveStory&eid=1', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (685, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133283893, '/garopaba/modules.php?name=Calendar&file=index&type=view&eid=1', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (686, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133283899, '/garopaba/admin.php?op=CalendarEditStory&eid=1', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (687, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133284120, '/garopaba/admin.php?op=CalendarRemoveStory&eid=1', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (688, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133284129, '/garopaba/admin.php?op=logout', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (689, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133284134, '/garopaba/admin.php', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (690, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133284146, '/garopaba/admin.php', 'none', 'none', '201.3.128.217', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (691, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133284150, '/garopaba/modules.php?name=Calendar&file=index&type=view&eid=1', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (692, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133284153, '/garopaba/admin.php?op=CalendarRemoveStory&eid=1', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (693, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133284423, '/garopaba/admin.php?op=logout', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (694, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133284428, '/garopaba/admin.php', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (695, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133284433, '/garopaba/modules.php?name=Calendar', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (696, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133284439, '/garopaba/modules.php?name=Calendar&file=submit', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (697, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133284460, '/garopaba/modules.php?name=Calendar&file=submit', 'none', 'none', '201.3.128.217', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (698, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133284465, '/garopaba/modules.php?name=Calendar&file=submit', 'none', 'none', '201.3.128.217', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (699, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133284474, '/garopaba/index.php', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (700, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133284490, '/garopaba/admin.php', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (701, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133284503, '/garopaba/admin.php', 'none', 'none', '201.3.128.217', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (702, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133284503, '/garopaba/admin.php', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (703, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133284522, '/garopaba/admin.php', 'none', 'none', '201.3.128.217', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (704, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133284773, '/garopaba/modules.php?name=Calendar&file=index&Date=11/30/2005&type=day', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (705, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133284776, '/garopaba/modules.php?name=Calendar&file=index&type=view&eid=2', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (706, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133284781, '/garopaba/admin.php?op=CalendarRemoveStory&eid=2', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (707, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133284787, '/garopaba/admin.php?op=CalendarEditStory&eid=2', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (708, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133285212, '/garopaba/admin.php', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (709, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133285216, '/garopaba/admin.php?op=logout', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (710, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133285222, '/garopaba/admin.php', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (711, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133285238, '/garopaba/admin.php', 'none', 'none', '201.3.128.217', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (712, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133285244, '/garopaba/modules.php?name=Calendar&file=index&type=view&eid=1', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (713, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133285248, '/garopaba/admin.php?op=CalendarRemoveStory&eid=1', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (714, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133285273, '/garopaba/admin.php?op=CalendarRemoveStory&eid=1', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (715, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133285363, '/garopaba/modules.php?name=Calendar&file=index&type=view&eid=1', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (716, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133285368, '/garopaba/admin.php?op=CalendarRemoveStory&eid=1', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (717, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133285372, '/garopaba/admin.php?op=CalendarRemoveStory&eid=1&ok=1', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (718, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133285373, '/garopaba/modules.php?op=modload&name=Calendar&file=index', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (719, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133285380, '/garopaba/modules.php?name=Calendar&file=index&type=view&eid=2', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (720, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133285383, '/garopaba/admin.php?op=CalendarRemoveStory&eid=2', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (721, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133285402, '/garopaba/admin.php?op=CalendarRemoveStory&eid=2&ok=1', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (722, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133285403, '/garopaba/modules.php?op=modload&name=Calendar&file=index', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (723, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133285695, '/garopaba/index.php', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (724, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133286068, '/garopaba/admin.php?op=modules', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (725, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133286092, '/garopaba/admin.php?op=module_status&mid=33&active=0', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (726, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133286093, '/garopaba/admin.php?op=modules', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (727, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133286098, '/garopaba/admin.php?op=module_edit&mid=1', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (728, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133286104, '/garopaba/admin.php', 'none', 'none', '201.3.128.217', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (729, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133286105, '/garopaba/admin.php?op=modules', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (730, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133286110, '/garopaba/admin.php?op=module_edit&mid=33', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (731, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133286114, '/garopaba/admin.php', 'none', 'none', '201.3.128.217', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (732, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133286115, '/garopaba/admin.php?op=modules', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (733, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133286120, '/garopaba/admin.php?op=module_edit&mid=24', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (734, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133286125, '/garopaba/admin.php', 'none', 'none', '201.3.128.217', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (735, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133286126, '/garopaba/admin.php?op=modules', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (736, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133286131, '/garopaba/admin.php?op=module_edit&mid=25', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (737, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133286136, '/garopaba/admin.php', 'none', 'none', '201.3.128.217', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (738, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133286136, '/garopaba/admin.php?op=modules', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (739, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133286142, '/garopaba/admin.php?op=module_edit&mid=26', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (740, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133286146, '/garopaba/admin.php', 'none', 'none', '201.3.128.217', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (741, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133286147, '/garopaba/admin.php?op=modules', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (742, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133286156, '/garopaba/admin.php?op=module_status&mid=3&active=0', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (743, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133286157, '/garopaba/admin.php?op=modules', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (744, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133286163, '/garopaba/admin.php?op=module_edit&mid=3', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (745, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133286169, '/garopaba/admin.php', 'none', 'none', '201.3.128.217', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (746, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133286170, '/garopaba/admin.php?op=modules', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (747, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133286177, '/garopaba/admin.php?op=module_edit&mid=4', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (748, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133286181, '/garopaba/admin.php', 'none', 'none', '201.3.128.217', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (749, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133286181, '/garopaba/admin.php?op=modules', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (750, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133286187, '/garopaba/admin.php?op=module_edit&mid=5', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (751, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133286191, '/garopaba/admin.php', 'none', 'none', '201.3.128.217', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (752, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133286191, '/garopaba/admin.php?op=modules', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (753, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133286198, '/garopaba/admin.php?op=module_edit&mid=6', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (754, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133286204, '/garopaba/admin.php', 'none', 'none', '201.3.128.217', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (755, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133286204, '/garopaba/admin.php?op=modules', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (756, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133286218, '/garopaba/admin.php?op=module_edit&mid=7', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (757, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133286223, '/garopaba/admin.php', 'none', 'none', '201.3.128.217', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (758, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133286223, '/garopaba/admin.php?op=modules', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (759, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133286236, '/garopaba/admin.php?op=module_edit&mid=10', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (760, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133286256, '/garopaba/admin.php', 'none', 'none', '201.3.128.217', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (761, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133286256, '/garopaba/admin.php?op=modules', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (762, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133286278, '/garopaba/admin.php?op=module_edit&mid=15', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (763, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133286285, '/garopaba/admin.php', 'none', 'none', '201.3.128.217', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (764, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133286285, '/garopaba/admin.php?op=modules', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (765, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133286301, '/garopaba/admin.php?op=module_status&mid=21&active=0', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (766, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133286301, '/garopaba/admin.php?op=modules', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (767, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133286426, '/garopaba/admin.php?op=modules', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (768, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133286690, '/garopaba/admin.php?op=modules', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (769, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133286792, '/garopaba/admin.php?op=modules', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (770, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133286823, '/garopaba/admin.php?op=modules', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (771, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133286827, '/garopaba/admin.php?op=mod_authors', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (772, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133286832, '/garopaba/admin.php?op=modifyadmin&chng_aid=Garopaba', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (773, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133286847, '/garopaba/admin.php', 'none', 'none', '201.3.128.217', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (774, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133286848, '/garopaba/admin.php?op=mod_authors', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (775, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133286864, '/garopaba/admin.php?op=mod_authors', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (776, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133286880, '/garopaba/admin.php?op=FCKsubmissions', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (777, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133286947, '/garopaba/admin.php?op=FCKsubmissions', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (778, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133286963, '/garopaba/admin.php?op=FCKsubmissions', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (779, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133286995, '/garopaba/modules.php?name=Calendar', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (780, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133287001, '/garopaba/admin.php?op=logout', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (781, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133287007, '/garopaba/admin.php', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (782, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133287022, '/garopaba/admin.php', 'none', 'none', '201.3.128.217', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (783, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133287029, '/garopaba/modules.php?name=Calendar', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (784, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133287034, '/garopaba/modules.php?name=Calendar&file=submit', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (785, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133287051, '/garopaba/modules.php?name=Calendar&file=submit', 'none', 'none', '201.3.128.217', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (786, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133287055, '/garopaba/modules.php?name=Calendar&file=submit', 'none', 'none', '201.3.128.217', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (787, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133287071, '/garopaba/admin.php', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (788, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133287075, '/garopaba/admin.php?op=CalendarAdmin', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (789, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133287083, '/garopaba/admin.php?op=CalendarDeleteStory&qid=2', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (790, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133287083, '/garopaba/admin.php?op=CalendarAdmin', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (791, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133287087, '/garopaba/admin.php?op=CalendarDeleteStory&qid=1', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (792, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133287088, '/garopaba/admin.php?op=CalendarAdmin', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (793, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133287115, '/garopaba/index.php', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (794, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133291686, '/garopaba/Index.php', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (795, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133291735, '/garopaba/modules.php?name=Calendar', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (796, '201.3.128.217', '201-3-128-217.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133291748, '/garopaba/modules.php?name=Your_Account', 'none', 'none', '201.3.128.217', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (797, '201.14.238.46', '201-14-238-46.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133296828, '/garopaba/Index.php', 'none', 'none', '201.14.238.46', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (798, '201.14.238.46', '201-14-238-46.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133296928, '/garopaba/modules.php?name=Your_Account&op=new_user', 'none', 'none', '201.14.238.46', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (799, '201.14.238.46', '201-14-238-46.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133296980, '/garopaba/index.php', 'none', 'none', '201.14.238.46', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (800, '201.3.156.94', '201-3-156-94.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133354277, '/garopaba/Index.php', 'none', 'none', '201.3.156.94', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (801, '201.3.156.94', '201-3-156-94.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133354330, '/garopaba/modules.php?name=Surveys&op=results&pollID=1&mode=&order=&thold=', 'none', 'none', '201.3.156.94', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (802, '201.3.156.94', '201-3-156-94.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133354343, '/garopaba/index.php', 'none', 'none', '201.3.156.94', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (803, '201.11.244.219', '201.11.244.219', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133364899, '/garopaba/Index.php', 'none', 'none', '201.11.244.219', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (804, '201.11.244.219', '201.11.244.219', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133364982, '/garopaba/admin.php', 'none', 'none', '201.11.244.219', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (805, '201.11.244.219', '201.11.244.219', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133364993, '/garopaba/modules.php?name=Your_Account&file=admin', 'none', 'none', '201.11.244.219', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (806, '201.11.244.219', '201.11.244.219', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133365014, '/garopaba/admin.php', 'none', 'none', '201.11.244.219', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (807, '201.11.244.219', '201.11.244.219', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133365021, '/garopaba/admin.php?op=logout', 'none', 'none', '201.11.244.219', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (808, '201.11.244.219', '201.11.244.219', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133365031, '/garopaba/admin.php', 'none', 'none', '201.11.244.219', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (809, '201.11.244.219', '201.11.244.219', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133365051, '/garopaba/admin.php', 'none', 'none', '201.11.244.219', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (810, '201.11.244.219', '201.11.244.219', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133365117, '/garopaba/index.php', 'none', 'none', '201.11.244.219', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (811, '201.11.244.219', '201.11.244.219', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133396281, '/garopaba/Index.php', 'none', 'none', '201.11.244.219', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (812, '201.11.244.219', '201.11.244.219', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133397631, '/garopaba/Index.php', 'none', 'none', '201.11.244.219', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (813, '201.14.219.76', '201-14-219-76.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133444844, '/garopaba/Index.php', 'none', 'none', '201.14.219.76', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (814, '201.14.219.76', '201-14-219-76.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133444893, '/garopaba/modules.php?name=Statistics', 'none', 'none', '201.14.219.76', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (815, '201.14.219.76', '201-14-219-76.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133444911, '/garopaba/index.php', 'none', 'none', '201.14.219.76', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (816, '201.14.219.76', '201-14-219-76.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133444918, '/garopaba/modules.php?name=Statistics', 'none', 'none', '201.14.219.76', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (817, '201.14.219.76', '201-14-219-76.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133444939, '/garopaba/admin.php', 'none', 'none', '201.14.219.76', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (818, '201.14.219.76', '201-14-219-76.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133444953, '/garopaba/admin.php', 'none', 'none', '201.14.219.76', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (819, '201.14.219.76', '201-14-219-76.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133444961, '/garopaba/admin.php?op=BlocksAdmin', 'none', 'none', '201.14.219.76', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (820, '201.14.219.76', '201-14-219-76.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133444969, '/garopaba/admin.php?op=BlocksEdit&bid=18', 'none', 'none', '201.14.219.76', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (821, '201.14.219.76', '201-14-219-76.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133445059, '/garopaba/index.php', 'none', 'none', '201.14.219.76', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (822, '201.14.219.76', '201-14-219-76.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133445064, '/garopaba/modules.php?name=Statistics', 'none', 'none', '201.14.219.76', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (823, '201.14.219.76', '201-14-219-76.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133445079, '/garopaba/index.php', 'none', 'none', '201.14.219.76', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (824, '201.14.219.215', '201-14-219-215.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133466385, '/index.php', 'none', 'none', '201.14.219.215', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (825, '201.14.219.215', '201-14-219-215.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133466705, '/modules.php?name=Statistics', 'none', 'none', '201.14.219.215', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (826, '201.14.219.215', '201-14-219-215.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133466711, '/index.php', 'none', 'none', '201.14.219.215', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (827, '201.14.219.215', '201-14-219-215.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133466719, '/admin.php', 'none', 'none', '201.14.219.215', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (828, '201.14.219.215', '201-14-219-215.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133466740, '/admin.php', 'none', 'none', '201.14.219.215', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (829, '201.14.219.215', '201-14-219-215.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133466741, '/admin.php', 'none', 'none', '201.14.219.215', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (830, '201.14.219.215', '201-14-219-215.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133466751, '/admin.php', 'none', 'none', '201.14.219.215', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (831, '201.14.219.215', '201-14-219-215.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133466969, '/admin.php?op=FCKadminStory', 'none', 'none', '201.14.219.215', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (832, '201.14.219.215', '201-14-219-215.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133467104, '/admin.php?op=FCKadminStory', 'none', 'none', '201.14.219.215', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (833, '201.14.219.215', '201-14-219-215.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133467646, '/admin.php?op=FCKadminStory', 'none', 'none', '201.14.219.215', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (834, '201.14.219.215', '201-14-219-215.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133467695, '/admin.php?op=FCKadminStory', 'none', 'none', '201.14.219.215', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (835, '201.14.219.215', '201-14-219-215.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133467710, '/admin.php?op=FCKadminStory', 'none', 'none', '201.14.219.215', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (836, '201.14.219.215', '201-14-219-215.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133467736, '/index.php', 'none', 'none', '201.14.219.215', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (837, '201.14.219.215', '201-14-219-215.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133467775, '/index.php', 'none', 'none', '201.14.219.215', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (838, '201.14.219.215', '201-14-219-215.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133471143, '/index.php', 'none', 'none', '201.14.219.215', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (839, '201.14.219.215', '201-14-219-215.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133490044, '/index.php', 'none', 'none', '201.14.219.215', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (840, '200.96.110.22', '200-096-110-022.paemt7012.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133625645, '/index.php', 'none', 'none', '200.96.110.22', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (841, '201.11.107.34', '201-11-107-34.fnsce701.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133626115, '/index.php', 'none', 'none', '201.11.107.34', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (842, '200.251.234.210', '200.251.234.210', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; MyIE2; i-NavFourF)', 1133790328, '/index.php', 'unknown', 'none', '200.251.234.210', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (843, '200.251.234.210', '200.251.234.210', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; MyIE2; i-NavFourF)', 1133790493, '/index.php', 'unknown', 'none', '200.251.234.210', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (844, '201.2.132.201', '201.2.132.201', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133954735, '/index.php', 'none', 'none', '201.2.132.201', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (845, '201.2.132.201', '201.2.132.201', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133957781, '/admin.php', 'none', 'none', '201.2.132.201', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (846, '201.2.132.201', '201.2.132.201', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133957795, '/admin.php?op=create', 'none', 'none', '201.2.132.201', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (847, '201.2.132.201', '201.2.132.201', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133957806, '/admin.php?op=Blocksadmin', 'none', 'none', '201.2.132.201', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (848, '201.2.132.201', '201.2.132.201', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133957898, '/admin.php?op=create', 'none', 'none', '201.2.132.201', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (849, '201.2.132.201', '201.2.132.201', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133957909, '/admin.php?op=BlocksAdmin', 'none', 'none', '201.2.132.201', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (850, '201.2.132.201', '201.2.132.201', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133957953, '/admin.php?op=BlocksEdit&bid=19', 'none', 'none', '201.2.132.201', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (851, '201.2.132.201', '201.2.132.201', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133958005, '/admin.php', 'none', 'none', '201.2.132.201', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (852, '201.2.132.201', '201.2.132.201', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133958010, '/admin.php?op=BlocksAdmin', 'none', 'none', '201.2.132.201', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (853, '201.2.132.201', '201.2.132.201', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133958028, '/index.php', 'none', 'none', '201.2.132.201', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (854, '201.25.47.130', '201-25-47-130.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1133998343, '/index.php', 'none', 'none', '201.25.47.130', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (855, '201.3.128.76', '201-3-128-76.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134158987, '/index.php', 'none', 'none', '201.3.128.76', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (856, '201.3.128.76', '201-3-128-76.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134159030, '/admin.php', 'none', 'none', '201.3.128.76', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (857, '201.3.128.76', '201-3-128-76.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134159042, '/admin.php', 'none', 'none', '201.3.128.76', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (858, '201.3.128.76', '201-3-128-76.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134159057, '/admin.php', 'none', 'none', '201.3.128.76', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (859, '200.203.23.145', '200-203-023-145.paemt7002.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134341657, '/index.php', 'none', 'none', '200.203.23.145', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (860, '200.203.23.145', '200-203-023-145.paemt7002.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134342326, '/admin.php', 'none', 'none', '200.203.23.145', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (861, '200.203.23.145', '200-203-023-145.paemt7002.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134342433, '/admin.php', 'none', 'none', '200.203.23.145', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (862, '200.203.23.145', '200-203-023-145.paemt7002.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134342437, '/admin.php?op=BlocksAdmin', 'none', 'none', '200.203.23.145', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (863, '200.203.23.145', '200-203-023-145.paemt7002.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134342454, '/admin.php?op=BlocksEdit&bid=18', 'none', 'none', '200.203.23.145', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (864, '200.203.23.145', '200-203-023-145.paemt7002.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134342615, '/index.php', 'none', 'none', '200.203.23.145', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (865, '200.203.23.145', '200-203-023-145.paemt7002.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134342663, '/admin.php', 'none', 'none', '200.203.23.145', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (866, '200.203.23.145', '200-203-023-145.paemt7002.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134342664, '/admin.php?op=BlocksAdmin', 'none', 'none', '200.203.23.145', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (867, '200.203.23.145', '200-203-023-145.paemt7002.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134342668, '/index.php', 'none', 'none', '200.203.23.145', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (868, '200.203.23.145', '200-203-023-145.paemt7002.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134342707, '/admin.php?op=BlocksEdit&bid=18', 'none', 'none', '200.203.23.145', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (869, '200.203.23.145', '200-203-023-145.paemt7002.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134342715, '/admin.php', 'none', 'none', '200.203.23.145', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (870, '200.203.23.145', '200-203-023-145.paemt7002.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134342715, '/admin.php?op=BlocksAdmin', 'none', 'none', '200.203.23.145', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (871, '200.203.23.145', '200-203-023-145.paemt7002.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134342722, '/admin.php?op=BlocksEdit&bid=18', 'none', 'none', '200.203.23.145', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (872, '200.203.23.145', '200-203-023-145.paemt7002.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134342730, '/admin.php', 'none', 'none', '200.203.23.145', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (873, '200.203.23.145', '200-203-023-145.paemt7002.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134342730, '/admin.php?op=BlocksAdmin', 'none', 'none', '200.203.23.145', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (874, '200.203.23.145', '200-203-023-145.paemt7002.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134342753, '/index.php', 'none', 'none', '200.203.23.145', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (875, '200.203.23.145', '200-203-023-145.paemt7002.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134342944, '/index.php', 'none', 'none', '200.203.23.145', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (876, '200.203.23.145', '200-203-023-145.paemt7002.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134343055, '/index.php', 'none', 'none', '200.203.23.145', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (877, '200.203.23.145', '200-203-023-145.paemt7002.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134343076, '/modules.php?name=News&file=article&sid=2', 'none', 'none', '200.203.23.145', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (878, '200.203.23.145', '200-203-023-145.paemt7002.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134343090, '/modules.php?name=News&file=article&sid=2', 'none', 'none', '200.203.23.145', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (879, '200.203.23.145', '200-203-023-145.paemt7002.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134343105, '/index.php', 'none', 'none', '200.203.23.145', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (880, '200.203.23.145', '200-203-023-145.paemt7002.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134343138, '/admin.php?op=BlocksEdit&bid=18', 'none', 'none', '200.203.23.145', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (881, '200.203.23.145', '200-203-023-145.paemt7002.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134343148, '/admin.php', 'none', 'none', '200.203.23.145', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (882, '200.203.23.145', '200-203-023-145.paemt7002.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134343148, '/admin.php?op=BlocksAdmin', 'none', 'none', '200.203.23.145', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (883, '200.203.23.145', '200-203-023-145.paemt7002.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134343152, '/index.php', 'none', 'none', '200.203.23.145', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (884, '200.203.23.145', '200-203-023-145.paemt7002.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134343172, '/admin.php?op=BlocksEdit&bid=18', 'none', 'none', '200.203.23.145', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (885, '200.203.23.145', '200-203-023-145.paemt7002.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134343179, '/admin.php', 'none', 'none', '200.203.23.145', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (886, '200.203.23.145', '200-203-023-145.paemt7002.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134343179, '/admin.php?op=BlocksAdmin', 'none', 'none', '200.203.23.145', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (887, '200.203.23.145', '200-203-023-145.paemt7002.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134343186, '/admin.php?op=BlocksEdit&bid=18', 'none', 'none', '200.203.23.145', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (888, '200.203.23.145', '200-203-023-145.paemt7002.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134343192, '/admin.php', 'none', 'none', '200.203.23.145', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (889, '200.203.23.145', '200-203-023-145.paemt7002.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134343193, '/admin.php?op=BlocksAdmin', 'none', 'none', '200.203.23.145', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (890, '200.203.23.145', '200-203-023-145.paemt7002.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134343209, '/index.php', 'none', 'none', '200.203.23.145', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (891, '200.203.23.145', '200-203-023-145.paemt7002.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134343233, '/modules.php?name=Calendar&file=index&Date=12/1/2005&type=month', 'none', 'none', '200.203.23.145', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (892, '200.203.23.145', '200-203-023-145.paemt7002.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134343244, '/index.php', 'none', 'none', '200.203.23.145', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (893, '200.203.23.145', '200-203-023-145.paemt7002.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134343258, '/modules.php?name=Surveys&op=results&pollID=1&mode=&order=&thold=', 'none', 'none', '200.203.23.145', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (894, '200.203.23.145', '200-203-023-145.paemt7002.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134343264, '/index.php', 'none', 'none', '200.203.23.145', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (895, '200.203.23.145', '200-203-023-145.paemt7002.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134343327, '/modules.php?name=Your_Account&op=new_user', 'none', 'none', '200.203.23.145', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (896, '200.203.23.145', '200-203-023-145.paemt7002.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134343436, '/modules.php?name=Your_Account&op=new_user', 'none', 'none', '200.203.23.145', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (897, '200.203.23.145', '200-203-023-145.paemt7002.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134343450, '/index.php', 'none', 'none', '200.203.23.145', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (898, '200.203.23.145', '200-203-023-145.paemt7002.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134343608, '/index.php', 'none', 'none', '200.203.23.145', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (899, '200.203.23.145', '200-203-023-145.paemt7002.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134343613, '/admin.php?op=BlocksAdmin', 'none', 'none', '200.203.23.145', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (900, '200.203.23.145', '200-203-023-145.paemt7002.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134343858, '/admin.php', 'none', 'none', '200.203.23.145', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (901, '200.203.23.145', '200-203-023-145.paemt7002.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134343858, '/admin.php?op=BlocksAdmin', 'none', 'none', '200.203.23.145', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (902, '200.203.23.145', '200-203-023-145.paemt7002.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134343882, '/index.php', 'none', 'none', '200.203.23.145', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (903, '200.203.23.145', '200-203-023-145.paemt7002.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134343929, '/index.php', 'none', 'none', '200.203.23.145', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (904, '200.203.23.145', '200-203-023-145.paemt7002.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134344039, '/index.php', 'none', 'none', '200.203.23.145', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (905, '200.203.23.145', '200-203-023-145.paemt7002.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134344453, '/modules.php?name=Statistics', 'none', 'none', '200.203.23.145', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (906, '200.203.23.145', '200-203-023-145.paemt7002.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134344468, '/index.php', 'none', 'none', '200.203.23.145', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (907, '200.203.23.145', '200-203-023-145.paemt7002.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134347663, '/admin.php?op=BlocksAdmin', 'none', 'none', '200.203.23.145', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (908, '200.203.23.145', '200-203-023-145.paemt7002.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134347670, '/admin.php?op=BlocksEdit&bid=18', 'none', 'none', '200.203.23.145', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (909, '200.203.23.145', '200-203-023-145.paemt7002.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134348055, '/index.php', 'none', 'none', '200.203.23.145', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (910, '201.15.158.254', '201-15-158-254.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134403271, '/index.php', 'none', 'none', '201.15.158.254', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (911, '201.15.158.254', '201-15-158-254.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134403365, '/admin.php?op=BlocksAdmin', 'none', 'none', '201.15.158.254', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (912, '201.15.158.254', '201-15-158-254.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134403379, '/admin.php', 'none', 'none', '201.15.158.254', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (913, '201.15.158.254', '201-15-158-254.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134403394, '/admin.php', 'none', 'none', '201.15.158.254', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (914, '201.15.158.254', '201-15-158-254.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134403432, '/admin.php?op=BlocksAdmin', 'none', 'none', '201.15.158.254', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (915, '201.15.158.254', '201-15-158-254.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134403438, '/admin.php?op=BlocksEdit&bid=20', 'none', 'none', '201.15.158.254', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (916, '201.15.158.254', '201-15-158-254.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134408650, '/index.php', 'none', 'none', '201.15.158.254', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (917, '201.15.158.254', '201-15-158-254.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134409260, '/index.php', 'none', 'none', '201.15.158.254', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (918, '201.24.110.231', 'pixgs110-231.gsurfnet.com.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134409310, '/index.php', 'none', 'none', '201.24.110.231', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (919, '201.15.158.254', '201-15-158-254.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134409548, '/admin.php', 'none', 'none', '201.15.158.254', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (920, '201.15.158.254', '201-15-158-254.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134409778, '/admin.php?op=BlocksAdmin', 'none', 'none', '201.15.158.254', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (921, '201.15.158.254', '201-15-158-254.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134409784, '/admin.php?op=BlocksEdit&bid=12', 'none', 'none', '201.15.158.254', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (922, '201.15.158.254', '201-15-158-254.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134409789, '/admin.php', 'none', 'none', '201.15.158.254', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (923, '201.15.158.254', '201-15-158-254.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134409790, '/admin.php?op=BlocksAdmin', 'none', 'none', '201.15.158.254', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (924, '201.15.158.254', '201-15-158-254.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134409794, '/index.php', 'none', 'none', '201.15.158.254', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (925, '201.15.158.254', '201-15-158-254.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134412317, '/index.php', 'none', 'none', '201.15.158.254', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (926, '201.15.158.254', '201-15-158-254.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134417407, '/index.php', 'none', 'none', '201.15.158.254', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (927, '201.15.158.254', '201-15-158-254.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134417578, '/modules.php?name=Your_Account', 'none', 'none', '201.15.158.254', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (928, '201.15.158.254', '201-15-158-254.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134417904, '/modules.php?name=Statistics', 'none', 'none', '201.15.158.254', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (929, '201.15.158.254', '201-15-158-254.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134418058, '/modules.php?name=Statistics&op=Stats', 'none', 'none', '201.15.158.254', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (930, '201.15.158.254', '201-15-158-254.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134418174, '/modules.php?name=Statistics', 'none', 'none', '201.15.158.254', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (931, '201.15.158.254', '201-15-158-254.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134418206, '/index.php', 'none', 'none', '201.15.158.254', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (932, '201.14.252.37', '201-14-252-37.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134493235, '/index.php', 'none', 'none', '201.14.252.37', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (933, '201.14.252.37', '201-14-252-37.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134493294, '/modules.php?name=Your_Account&op=new_user', 'none', 'none', '201.14.252.37', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (934, '201.14.252.37', '201-14-252-37.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134493616, '/modules.php?name=Your_Account&op=pass_lost', 'none', 'none', '201.14.252.37', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (935, '201.14.252.37', '201-14-252-37.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134493728, '/modules.php?name=Your_Account&op=new_user', 'none', 'none', '201.14.252.37', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (936, '201.14.252.37', '201-14-252-37.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134493787, '/modules.php?name=Your_Account&op=new_user', 'none', 'none', '201.14.252.37', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (937, '201.14.252.37', '201-14-252-37.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134506309, '/index.php', 'none', 'none', '201.14.252.37', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (938, '201.14.252.37', '201-14-252-37.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134506449, '/modules.php?name=Surveys', 'none', 'none', '201.14.252.37', 'none', 'POST', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (939, '201.14.252.37', '201-14-252-37.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134506449, '/modules.php?name=Surveys&op=results&pollID=1', 'none', 'none', '201.14.252.37', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (940, '200.193.8.131', '200-193-8-131.fnsce701.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134506625, '/index.php', 'none', 'none', '200.193.8.131', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (941, '201.14.252.37', '201-14-252-37.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134507163, '/index.php', 'none', 'none', '201.14.252.37', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (942, '201.14.252.37', '201-14-252-37.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134507203, '/admin.php', 'none', 'none', '201.14.252.37', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (943, '201.14.252.37', '201-14-252-37.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134507207, '/admin.php?op=BlocksAdmin', 'none', 'none', '201.14.252.37', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (944, '201.14.252.37', '201-14-252-37.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134507213, '/admin.php?op=BlocksEdit&bid=18', 'none', 'none', '201.14.252.37', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (945, '201.14.252.37', '201-14-252-37.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134507282, '/index.php', 'none', 'none', '201.14.252.37', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (946, '201.25.23.143', '201-25-23-143.paemt705.dsl.brasiltelecom.net.br', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)', 1134586459, '/index.php', 'none', 'none', '201.25.23.143', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (947, '200.251.234.210', '200.251.234.210', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; MyIE2; i-NavFourF)', 1135014290, '/index.php', 'unknown', 'none', '200.251.234.210', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (948, '200.251.234.210', '200.251.234.210', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; MyIE2; i-NavFourF)', 1135014359, '/modules.php?name=Statistics', 'unknown', 'none', '200.251.234.210', 'none', 'GET', '00');
INSERT INTO `kayapo_nsnst_tracked_ips` VALUES (949, '200.251.234.210', '200.251.234.210', 1, '', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; MyIE2; i-NavFourF)', 1135014371, '/index.php', 'unknown', 'none', '200.251.234.210', 'none', 'GET', '00');

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_pages`
-- 

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `kayapo_pages`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_pages_categories`
-- 

CREATE TABLE `kayapo_pages_categories` (
  `cid` int(10) NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `description` text NOT NULL,
  PRIMARY KEY  (`cid`),
  KEY `cid` (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `kayapo_pages_categories`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_poll_check`
-- 

CREATE TABLE `kayapo_poll_check` (
  `ip` varchar(20) NOT NULL default '',
  `time` varchar(14) NOT NULL default '',
  `pollID` int(10) NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Extraindo dados da tabela `kayapo_poll_check`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_poll_data`
-- 

CREATE TABLE `kayapo_poll_data` (
  `pollID` int(11) NOT NULL default '0',
  `optionText` char(50) NOT NULL default '',
  `optionCount` int(11) NOT NULL default '0',
  `voteID` int(11) NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Extraindo dados da tabela `kayapo_poll_data`
-- 

INSERT INTO `kayapo_poll_data` VALUES (1, 'Hum... Nada mal!', 1, 1);
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

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_poll_desc`
-- 

CREATE TABLE `kayapo_poll_desc` (
  `pollID` int(11) NOT NULL auto_increment,
  `pollTitle` varchar(100) NOT NULL default '',
  `timeStamp` int(11) NOT NULL default '0',
  `voters` mediumint(9) NOT NULL default '0',
  `planguage` varchar(30) NOT NULL default '',
  `artid` int(10) NOT NULL default '0',
  PRIMARY KEY  (`pollID`),
  KEY `pollID` (`pollID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- 
-- Extraindo dados da tabela `kayapo_poll_desc`
-- 

INSERT INTO `kayapo_poll_desc` VALUES (1, 'O que você achou deste site?', 961405160, 2, 'brazilian', 0);

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_pollcomments`
-- 

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `kayapo_pollcomments`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_public_messages`
-- 

CREATE TABLE `kayapo_public_messages` (
  `mid` int(10) NOT NULL auto_increment,
  `content` varchar(255) NOT NULL default '',
  `date` varchar(14) default NULL,
  `who` varchar(25) NOT NULL default '',
  PRIMARY KEY  (`mid`),
  KEY `mid` (`mid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `kayapo_public_messages`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_queue`
-- 

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `kayapo_queue`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_quotes`
-- 

CREATE TABLE `kayapo_quotes` (
  `qid` int(10) unsigned NOT NULL auto_increment,
  `quote` text,
  PRIMARY KEY  (`qid`),
  KEY `qid` (`qid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- 
-- Extraindo dados da tabela `kayapo_quotes`
-- 

INSERT INTO `kayapo_quotes` VALUES (1, 'Nos morituri te salutamus - CBHS');

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_recherches`
-- 

CREATE TABLE `kayapo_recherches` (
  `primkey` smallint(6) NOT NULL auto_increment,
  `ip` varchar(15) default NULL,
  `query` varchar(50) default NULL,
  `date` varchar(18) default NULL,
  `userid` varchar(20) default NULL,
  `total` varchar(10) default NULL,
  PRIMARY KEY  (`primkey`),
  UNIQUE KEY `primkey` (`primkey`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `kayapo_recherches`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_referer`
-- 

CREATE TABLE `kayapo_referer` (
  `rid` int(11) NOT NULL auto_increment,
  `url` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`rid`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=142 ;

-- 
-- Extraindo dados da tabela `kayapo_referer`
-- 

INSERT INTO `kayapo_referer` VALUES (1, 'http://localhost/radio/admin.php?op=Configure');
INSERT INTO `kayapo_referer` VALUES (2, 'http://localhost/radio/admin.php?op=Configure');
INSERT INTO `kayapo_referer` VALUES (3, 'http://localhost/radio/admin.php?op=Configure');
INSERT INTO `kayapo_referer` VALUES (4, 'http://localhost/radio/admin.php?op=Configure');
INSERT INTO `kayapo_referer` VALUES (5, 'http://localhost/radio/admin.php?op=Configure');
INSERT INTO `kayapo_referer` VALUES (6, 'http://localhost/radio/admin.php?op=Configure');
INSERT INTO `kayapo_referer` VALUES (7, 'http://localhost/radio/admin.php?op=Configure');
INSERT INTO `kayapo_referer` VALUES (8, 'http://localhost/radio/admin.php?op=Configure');
INSERT INTO `kayapo_referer` VALUES (9, 'http://localhost/radio/admin.php?op=Configure');
INSERT INTO `kayapo_referer` VALUES (10, 'http://localhost/radio/admin.php?op=Configure');
INSERT INTO `kayapo_referer` VALUES (11, 'http://localhost/radio/admin.php?op=Configure');
INSERT INTO `kayapo_referer` VALUES (12, 'http://localhost/radio/admin.php?op=Configure');
INSERT INTO `kayapo_referer` VALUES (13, 'http://localhost/radio/admin.php?op=Configure');
INSERT INTO `kayapo_referer` VALUES (14, 'http://localhost/radio/admin.php?op=Configure');
INSERT INTO `kayapo_referer` VALUES (15, 'http://localhost/radio/admin.php?op=Configure');
INSERT INTO `kayapo_referer` VALUES (16, 'http://localhost/radio/admin.php?op=Configure');
INSERT INTO `kayapo_referer` VALUES (17, 'http://localhost/radio/admin.php?op=Configure');
INSERT INTO `kayapo_referer` VALUES (18, 'http://localhost/radio/admin.php?op=Configure');
INSERT INTO `kayapo_referer` VALUES (19, 'http://localhost/radio/admin.php?op=Configure');
INSERT INTO `kayapo_referer` VALUES (20, 'http://localhost/radio/admin.php?op=Configure');
INSERT INTO `kayapo_referer` VALUES (21, 'http://localhost/radio/admin.php?op=Configure');
INSERT INTO `kayapo_referer` VALUES (22, 'http://localhost/radio/admin.php?op=BlocksAdmin');
INSERT INTO `kayapo_referer` VALUES (23, 'http://localhost/radio/admin.php?op=BlocksAdmin');
INSERT INTO `kayapo_referer` VALUES (24, 'http://localhost/radio/admin.php?op=BlocksAdmin');
INSERT INTO `kayapo_referer` VALUES (25, 'http://localhost/radio/admin.php?op=BlocksAdmin');
INSERT INTO `kayapo_referer` VALUES (26, 'http://localhost/radio/admin.php?op=BlocksAdmin');
INSERT INTO `kayapo_referer` VALUES (27, 'http://localhost/radio/admin.php?op=BlocksAdmin');
INSERT INTO `kayapo_referer` VALUES (28, 'http://localhost/radio/admin.php?op=BlocksAdmin');
INSERT INTO `kayapo_referer` VALUES (29, 'http://localhost/radio/admin.php?op=BlocksAdmin');
INSERT INTO `kayapo_referer` VALUES (30, 'http://localhost/radio/admin.php?op=BlocksAdmin');
INSERT INTO `kayapo_referer` VALUES (31, 'http://localhost/radio/admin.php?op=BlocksAdmin');
INSERT INTO `kayapo_referer` VALUES (32, 'http://localhost/radio/admin.php?op=BlocksAdmin');
INSERT INTO `kayapo_referer` VALUES (33, 'http://localhost/radio/admin.php?op=BlocksAdmin');
INSERT INTO `kayapo_referer` VALUES (34, 'http://localhost/radio/admin.php?op=BlocksAdmin');
INSERT INTO `kayapo_referer` VALUES (35, 'http://localhost/radio/admin.php?op=BlocksAdmin');
INSERT INTO `kayapo_referer` VALUES (36, 'http://localhost/radio/admin.php?op=BlocksAdmin');
INSERT INTO `kayapo_referer` VALUES (37, 'http://localhost/radio/admin.php?op=BlocksAdmin');
INSERT INTO `kayapo_referer` VALUES (38, 'http://localhost/radio/admin.php?op=BlocksAdmin');
INSERT INTO `kayapo_referer` VALUES (39, 'http://localhost/radio/admin.php?op=BlocksAdmin');
INSERT INTO `kayapo_referer` VALUES (40, 'http://localhost/radio/admin.php?op=BlocksAdmin');
INSERT INTO `kayapo_referer` VALUES (41, 'http://localhost/radio/admin.php?op=BlocksAdmin');
INSERT INTO `kayapo_referer` VALUES (42, 'http://localhost/radio/admin.php?op=BlocksAdmin');
INSERT INTO `kayapo_referer` VALUES (43, 'http://localhost/radio/modules.php?name=News&file=article&sid=1');
INSERT INTO `kayapo_referer` VALUES (44, 'http://localhost/radio/admin.php?op=FCKadminStory');
INSERT INTO `kayapo_referer` VALUES (45, 'http://localhost/radio/admin.php?op=FCKadminStory');
INSERT INTO `kayapo_referer` VALUES (46, 'http://localhost/radio/admin.php?op=FCKadminStory');
INSERT INTO `kayapo_referer` VALUES (47, 'http://localhost/radio/admin.php?op=FCKadminStory');
INSERT INTO `kayapo_referer` VALUES (48, 'http://localhost/radio/admin.php?op=FCKadminStory');
INSERT INTO `kayapo_referer` VALUES (49, 'http://localhost/radio/admin.php?op=FCKadminStory');
INSERT INTO `kayapo_referer` VALUES (50, 'http://localhost/radio/admin.php?op=FCKadminStory');
INSERT INTO `kayapo_referer` VALUES (51, 'http://localhost/radio/admin.php?op=FCKadminStory');
INSERT INTO `kayapo_referer` VALUES (52, 'http://localhost/radio/modules.php?name=News&file=article&sid=2');
INSERT INTO `kayapo_referer` VALUES (53, 'http://localhost/radio/modules.php?name=News&file=article&sid=2');
INSERT INTO `kayapo_referer` VALUES (54, 'http://localhost/radio/modules.php?name=News&file=article&sid=2');
INSERT INTO `kayapo_referer` VALUES (55, 'http://localhost/radio/modules.php?name=News&file=article&sid=2');
INSERT INTO `kayapo_referer` VALUES (56, 'http://localhost/radio/modules.php?name=News&file=article&sid=2');
INSERT INTO `kayapo_referer` VALUES (57, 'http://localhost/radio/modules.php?name=News&file=article&sid=2');
INSERT INTO `kayapo_referer` VALUES (58, 'http://localhost/radio/modules.php?name=News&file=article&sid=2');
INSERT INTO `kayapo_referer` VALUES (59, 'http://localhost/radio/modules.php?name=News&file=article&sid=2');
INSERT INTO `kayapo_referer` VALUES (60, 'http://localhost/radio/modules.php?name=News&file=article&sid=2');
INSERT INTO `kayapo_referer` VALUES (61, 'http://localhost/radio/modules.php?name=News&file=article&sid=2');
INSERT INTO `kayapo_referer` VALUES (62, 'http://localhost/radio/modules.php?name=News&file=article&sid=2');
INSERT INTO `kayapo_referer` VALUES (63, 'http://localhost/radio/modules.php?name=News&file=article&sid=2');
INSERT INTO `kayapo_referer` VALUES (64, 'http://localhost/radio/modules.php?name=News&file=article&sid=2');
INSERT INTO `kayapo_referer` VALUES (65, 'http://localhost/radio/modules.php?name=News&file=article&sid=2');
INSERT INTO `kayapo_referer` VALUES (66, 'http://localhost/radio/admin.php?op=adminMain');
INSERT INTO `kayapo_referer` VALUES (67, 'http://localhost/radio/admin.php?op=adminMain');
INSERT INTO `kayapo_referer` VALUES (68, 'http://localhost/radio/admin.php?op=adminMain');
INSERT INTO `kayapo_referer` VALUES (69, 'http://localhost/radio/modules.php?name=News&file=article&sid=2');
INSERT INTO `kayapo_referer` VALUES (70, 'http://localhost/radio/admin.php?op=BlocksAdmin');
INSERT INTO `kayapo_referer` VALUES (71, 'http://localhost/radio/modules.php?name=News&file=article&sid=2');
INSERT INTO `kayapo_referer` VALUES (72, 'http://localhost/radio/modules.php?name=News&file=article&sid=2');
INSERT INTO `kayapo_referer` VALUES (73, 'http://localhost/radio/modules.php?name=News&file=article&sid=2');
INSERT INTO `kayapo_referer` VALUES (74, 'http://localhost/radio/modules.php?name=News&file=article&sid=2');
INSERT INTO `kayapo_referer` VALUES (75, 'http://localhost/radio/modules.php?name=News&file=article&sid=2');
INSERT INTO `kayapo_referer` VALUES (76, 'http://localhost/radio/modules.php?name=News&file=article&sid=2');
INSERT INTO `kayapo_referer` VALUES (77, 'http://localhost/radio/modules.php?name=News&file=article&sid=2');
INSERT INTO `kayapo_referer` VALUES (78, 'http://localhost/radio/modules.php?name=News&file=article&sid=2');
INSERT INTO `kayapo_referer` VALUES (79, 'http://localhost/radio/modules.php?name=News&file=article&sid=2');
INSERT INTO `kayapo_referer` VALUES (80, 'http://localhost/radio/modules.php?name=News&file=article&sid=2');
INSERT INTO `kayapo_referer` VALUES (81, 'http://localhost/radio/modules.php?name=News&file=article&sid=2');
INSERT INTO `kayapo_referer` VALUES (82, 'http://localhost/radio/modules.php?name=News&file=article&sid=2');
INSERT INTO `kayapo_referer` VALUES (83, 'http://localhost/radio/modules.php?name=News&file=article&sid=2');
INSERT INTO `kayapo_referer` VALUES (84, 'http://localhost/frequencia/admin.php?op=BlocksEdit&bid=9');
INSERT INTO `kayapo_referer` VALUES (85, 'http://www.casadaweb.net/garopaba/admin.php');
INSERT INTO `kayapo_referer` VALUES (86, 'http://www.casadaweb.net/garopaba/modules.php?name=News&file=article&sid=2');
INSERT INTO `kayapo_referer` VALUES (87, 'http://www.casadaweb.net/garopaba/modules.php?name=News&file=article&sid=2');
INSERT INTO `kayapo_referer` VALUES (88, 'http://www.casadaweb.net/garopaba/modules.php?name=Private_Messages&file=index&mode=post&sid=76d778b');
INSERT INTO `kayapo_referer` VALUES (89, 'http://www.casadaweb.net/garopaba/modules.php?name=News&file=article&sid=2&mode=&order=0&thold=0');
INSERT INTO `kayapo_referer` VALUES (90, 'http://www.casadaweb.net/garopaba/admin.php?op=BlocksEdit&bid=15');
INSERT INTO `kayapo_referer` VALUES (91, 'http://www.casadaweb.net/garopaba/admin.php?op=BlocksAdmin');
INSERT INTO `kayapo_referer` VALUES (92, 'http://www.casadaweb.net/garopaba/admin.php?op=BlocksEdit&bid=15');
INSERT INTO `kayapo_referer` VALUES (93, 'http://www.casadaweb.net/garopaba/admin.php?op=BlocksAdmin');
INSERT INTO `kayapo_referer` VALUES (94, 'http://www.casadaweb.net/garopaba/modules.php?name=Your_Account&op=avatarlist');
INSERT INTO `kayapo_referer` VALUES (95, 'http://www.casadaweb.net/garopaba/admin.php?op=BlocksAdmin');
INSERT INTO `kayapo_referer` VALUES (96, 'http://www.casadaweb.net/garopaba/admin.php?op=BlocksAdmin');
INSERT INTO `kayapo_referer` VALUES (97, 'http://www.casadaweb.net/garopaba/modules.php?name=Calendar&file=index&Date=11/19/2005&type=day');
INSERT INTO `kayapo_referer` VALUES (98, 'http://www.casadaweb.net/garopaba/modules.php?name=Statistics');
INSERT INTO `kayapo_referer` VALUES (99, 'http://www.casadaweb.net/garopaba/menu.php');
INSERT INTO `kayapo_referer` VALUES (100, 'http://www.casadaweb.net/garopaba/menu.php');
INSERT INTO `kayapo_referer` VALUES (101, 'http://www.casadaweb.net/garopaba/menu.php');
INSERT INTO `kayapo_referer` VALUES (102, 'http://www.casadaweb.net/garopaba/menu.php');
INSERT INTO `kayapo_referer` VALUES (103, 'http://www.casadaweb.net/garopaba/menu.php');
INSERT INTO `kayapo_referer` VALUES (104, 'http://www.casadaweb.net/garopaba/menu.php');
INSERT INTO `kayapo_referer` VALUES (105, 'http://www.casadaweb.net/garopaba/menu.php');
INSERT INTO `kayapo_referer` VALUES (106, 'http://www.casadaweb.net/garopaba/menu.php');
INSERT INTO `kayapo_referer` VALUES (107, 'http://www.casadaweb.net/garopaba/menu.php');
INSERT INTO `kayapo_referer` VALUES (108, 'http://www.casadaweb.net/garopaba/menu.php');
INSERT INTO `kayapo_referer` VALUES (109, 'http://www.casadaweb.net/garopaba/menu.php');
INSERT INTO `kayapo_referer` VALUES (110, 'http://www.casadaweb.net/garopaba/menu.php');
INSERT INTO `kayapo_referer` VALUES (111, 'http://www.casadaweb.net/garopaba/menu.php');
INSERT INTO `kayapo_referer` VALUES (112, 'http://www.casadaweb.net/garopaba/menu.php');
INSERT INTO `kayapo_referer` VALUES (113, 'http://www.casadaweb.net/garopaba/menu.php');
INSERT INTO `kayapo_referer` VALUES (114, 'http://www.casadaweb.net/garopaba/menu.php');
INSERT INTO `kayapo_referer` VALUES (115, 'http://www.casadaweb.net/garopaba/menu.php');
INSERT INTO `kayapo_referer` VALUES (116, 'http://www.casadaweb.net/garopaba/menu.php');
INSERT INTO `kayapo_referer` VALUES (117, 'http://www.casadaweb.net/garopaba/menu.php');
INSERT INTO `kayapo_referer` VALUES (118, 'http://www.casadaweb.net/garopaba/menu.php');
INSERT INTO `kayapo_referer` VALUES (119, 'http://www.casadaweb.net/garopaba/menu.php');
INSERT INTO `kayapo_referer` VALUES (120, 'http://www.casadaweb.net/garopaba/menu.php');
INSERT INTO `kayapo_referer` VALUES (121, 'http://www.casadaweb.net/garopaba/menu.php');
INSERT INTO `kayapo_referer` VALUES (122, 'http://www.radiofrequencia.net/menu.php');
INSERT INTO `kayapo_referer` VALUES (123, 'http://www.radiofrequencia.net/menu.php');
INSERT INTO `kayapo_referer` VALUES (124, 'http://www.radiofrequencia.net/menu.php');
INSERT INTO `kayapo_referer` VALUES (125, 'http://www.radiofrequencia.net/menu.php');
INSERT INTO `kayapo_referer` VALUES (126, 'http://www.radiofrequencia.net/menu.php');
INSERT INTO `kayapo_referer` VALUES (127, 'http://www.radiofrequencia.net/menu.php');
INSERT INTO `kayapo_referer` VALUES (128, 'http://www.radiofrequencia.net/menu.php');
INSERT INTO `kayapo_referer` VALUES (129, 'http://www.radiofrequencia.net/menu.php');
INSERT INTO `kayapo_referer` VALUES (130, 'http://www.radiofrequencia.net/menu.php');
INSERT INTO `kayapo_referer` VALUES (131, 'http://www.radiofrequencia.net/menu.php');
INSERT INTO `kayapo_referer` VALUES (132, 'http://www.radiofrequencia.net/menu.php');
INSERT INTO `kayapo_referer` VALUES (133, 'http://www.radiofrequencia.net/menu.php');
INSERT INTO `kayapo_referer` VALUES (134, 'http://www.radiofrequencia.net/menu.php');
INSERT INTO `kayapo_referer` VALUES (135, 'http://www.radiofrequencia.net/menu.php');
INSERT INTO `kayapo_referer` VALUES (136, 'http://www.radiofrequencia.net/menu.php');
INSERT INTO `kayapo_referer` VALUES (137, 'http://www.radiofrequencia.net/menu.php');
INSERT INTO `kayapo_referer` VALUES (138, 'http://www.radiofrequencia.net/menu.php');
INSERT INTO `kayapo_referer` VALUES (139, 'http://www.radiofrequencia.net/menu.php');
INSERT INTO `kayapo_referer` VALUES (140, 'http://www.radiofrequencia.net/menu.php');
INSERT INTO `kayapo_referer` VALUES (141, 'http://www.radiofrequencia.net/menu.php');

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_related`
-- 

CREATE TABLE `kayapo_related` (
  `rid` int(11) NOT NULL auto_increment,
  `tid` int(11) NOT NULL default '0',
  `name` varchar(30) NOT NULL default '',
  `url` varchar(200) NOT NULL default '',
  PRIMARY KEY  (`rid`),
  KEY `rid` (`rid`),
  KEY `tid` (`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `kayapo_related`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_reviews`
-- 

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `kayapo_reviews`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_reviews_add`
-- 

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `kayapo_reviews_add`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_reviews_comments`
-- 

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `kayapo_reviews_comments`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_reviews_main`
-- 

CREATE TABLE `kayapo_reviews_main` (
  `title` varchar(100) default NULL,
  `description` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Extraindo dados da tabela `kayapo_reviews_main`
-- 

INSERT INTO `kayapo_reviews_main` VALUES ('Reviews Section Title', 'Reviews Section Long Description');

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_session`
-- 

CREATE TABLE `kayapo_session` (
  `uname` varchar(25) NOT NULL default '',
  `time` varchar(14) NOT NULL default '',
  `host_addr` varchar(48) NOT NULL default '',
  `guest` int(1) NOT NULL default '0',
  KEY `time` (`time`),
  KEY `guest` (`guest`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Extraindo dados da tabela `kayapo_session`
-- 

INSERT INTO `kayapo_session` VALUES ('200.251.234.210', '1135014375', '200.251.234.210', 1);

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_stats_date`
-- 

CREATE TABLE `kayapo_stats_date` (
  `year` smallint(6) NOT NULL default '0',
  `month` tinyint(4) NOT NULL default '0',
  `date` tinyint(4) NOT NULL default '0',
  `hits` bigint(20) NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Extraindo dados da tabela `kayapo_stats_date`
-- 

INSERT INTO `kayapo_stats_date` VALUES (2005, 1, 1, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 1, 2, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 1, 3, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 1, 4, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 1, 5, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 1, 6, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 1, 7, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 1, 8, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 1, 9, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 1, 10, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 1, 11, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 1, 12, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 1, 13, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 1, 14, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 1, 15, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 1, 16, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 1, 17, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 1, 18, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 1, 19, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 1, 20, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 1, 21, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 1, 22, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 1, 23, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 1, 24, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 1, 25, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 1, 26, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 1, 27, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 1, 28, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 1, 29, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 1, 30, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 1, 31, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 2, 1, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 2, 2, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 2, 3, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 2, 4, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 2, 5, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 2, 6, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 2, 7, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 2, 8, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 2, 9, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 2, 10, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 2, 11, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 2, 12, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 2, 13, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 2, 14, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 2, 15, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 2, 16, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 2, 17, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 2, 18, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 2, 19, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 2, 20, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 2, 21, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 2, 22, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 2, 23, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 2, 24, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 2, 25, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 2, 26, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 2, 27, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 2, 28, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 3, 1, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 3, 2, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 3, 3, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 3, 4, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 3, 5, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 3, 6, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 3, 7, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 3, 8, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 3, 9, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 3, 10, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 3, 11, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 3, 12, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 3, 13, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 3, 14, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 3, 15, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 3, 16, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 3, 17, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 3, 18, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 3, 19, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 3, 20, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 3, 21, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 3, 22, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 3, 23, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 3, 24, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 3, 25, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 3, 26, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 3, 27, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 3, 28, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 3, 29, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 3, 30, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 3, 31, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 4, 1, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 4, 2, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 4, 3, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 4, 4, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 4, 5, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 4, 6, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 4, 7, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 4, 8, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 4, 9, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 4, 10, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 4, 11, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 4, 12, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 4, 13, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 4, 14, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 4, 15, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 4, 16, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 4, 17, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 4, 18, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 4, 19, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 4, 20, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 4, 21, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 4, 22, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 4, 23, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 4, 24, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 4, 25, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 4, 26, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 4, 27, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 4, 28, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 4, 29, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 4, 30, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 5, 1, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 5, 2, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 5, 3, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 5, 4, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 5, 5, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 5, 6, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 5, 7, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 5, 8, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 5, 9, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 5, 10, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 5, 11, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 5, 12, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 5, 13, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 5, 14, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 5, 15, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 5, 16, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 5, 17, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 5, 18, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 5, 19, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 5, 20, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 5, 21, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 5, 22, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 5, 23, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 5, 24, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 5, 25, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 5, 26, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 5, 27, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 5, 28, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 5, 29, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 5, 30, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 5, 31, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 6, 1, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 6, 2, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 6, 3, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 6, 4, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 6, 5, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 6, 6, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 6, 7, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 6, 8, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 6, 9, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 6, 10, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 6, 11, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 6, 12, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 6, 13, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 6, 14, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 6, 15, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 6, 16, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 6, 17, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 6, 18, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 6, 19, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 6, 20, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 6, 21, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 6, 22, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 6, 23, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 6, 24, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 6, 25, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 6, 26, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 6, 27, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 6, 28, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 6, 29, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 6, 30, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 7, 1, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 7, 2, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 7, 3, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 7, 4, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 7, 5, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 7, 6, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 7, 7, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 7, 8, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 7, 9, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 7, 10, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 7, 11, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 7, 12, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 7, 13, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 7, 14, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 7, 15, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 7, 16, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 7, 17, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 7, 18, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 7, 19, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 7, 20, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 7, 21, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 7, 22, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 7, 23, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 7, 24, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 7, 25, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 7, 26, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 7, 27, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 7, 28, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 7, 29, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 7, 30, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 7, 31, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 8, 1, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 8, 2, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 8, 3, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 8, 4, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 8, 5, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 8, 6, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 8, 7, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 8, 8, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 8, 9, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 8, 10, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 8, 11, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 8, 12, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 8, 13, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 8, 14, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 8, 15, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 8, 16, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 8, 17, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 8, 18, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 8, 19, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 8, 20, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 8, 21, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 8, 22, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 8, 23, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 8, 24, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 8, 25, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 8, 26, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 8, 27, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 8, 28, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 8, 29, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 8, 30, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 8, 31, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 9, 1, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 9, 2, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 9, 3, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 9, 4, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 9, 5, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 9, 6, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 9, 7, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 9, 8, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 9, 9, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 9, 10, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 9, 11, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 9, 12, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 9, 13, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 9, 14, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 9, 15, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 9, 16, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 9, 17, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 9, 18, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 9, 19, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 9, 20, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 9, 21, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 9, 22, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 9, 23, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 9, 24, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 9, 25, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 9, 26, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 9, 27, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 9, 28, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 9, 29, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 9, 30, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 10, 1, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 10, 2, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 10, 3, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 10, 4, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 10, 5, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 10, 6, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 10, 7, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 10, 8, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 10, 9, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 10, 10, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 10, 11, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 10, 12, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 10, 13, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 10, 14, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 10, 15, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 10, 16, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 10, 17, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 10, 18, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 10, 19, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 10, 20, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 10, 21, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 10, 22, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 10, 23, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 10, 24, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 10, 25, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 10, 26, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 10, 27, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 10, 28, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 10, 29, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 10, 30, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 10, 31, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 11, 1, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 11, 2, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 11, 3, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 11, 4, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 11, 5, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 11, 6, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 11, 7, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 11, 8, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 11, 9, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 11, 10, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 11, 11, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 11, 12, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 11, 13, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 11, 14, 246);
INSERT INTO `kayapo_stats_date` VALUES (2005, 11, 15, 60);
INSERT INTO `kayapo_stats_date` VALUES (2005, 11, 16, 9);
INSERT INTO `kayapo_stats_date` VALUES (2005, 11, 17, 19);
INSERT INTO `kayapo_stats_date` VALUES (2005, 11, 18, 35);
INSERT INTO `kayapo_stats_date` VALUES (2005, 11, 19, 4);
INSERT INTO `kayapo_stats_date` VALUES (2005, 11, 20, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 11, 21, 118);
INSERT INTO `kayapo_stats_date` VALUES (2005, 11, 22, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 11, 23, 6);
INSERT INTO `kayapo_stats_date` VALUES (2005, 11, 24, 1);
INSERT INTO `kayapo_stats_date` VALUES (2005, 11, 25, 1);
INSERT INTO `kayapo_stats_date` VALUES (2005, 11, 26, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 11, 27, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 11, 28, 2);
INSERT INTO `kayapo_stats_date` VALUES (2005, 11, 29, 149);
INSERT INTO `kayapo_stats_date` VALUES (2005, 11, 30, 13);
INSERT INTO `kayapo_stats_date` VALUES (2005, 12, 1, 26);
INSERT INTO `kayapo_stats_date` VALUES (2005, 12, 2, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 12, 3, 2);
INSERT INTO `kayapo_stats_date` VALUES (2005, 12, 4, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 12, 5, 2);
INSERT INTO `kayapo_stats_date` VALUES (2005, 12, 6, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 12, 7, 9);
INSERT INTO `kayapo_stats_date` VALUES (2005, 12, 8, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 12, 9, 4);
INSERT INTO `kayapo_stats_date` VALUES (2005, 12, 10, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 12, 11, 44);
INSERT INTO `kayapo_stats_date` VALUES (2005, 12, 12, 21);
INSERT INTO `kayapo_stats_date` VALUES (2005, 12, 13, 13);
INSERT INTO `kayapo_stats_date` VALUES (2005, 12, 14, 1);
INSERT INTO `kayapo_stats_date` VALUES (2005, 12, 15, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 12, 16, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 12, 17, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 12, 18, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 12, 19, 3);
INSERT INTO `kayapo_stats_date` VALUES (2005, 12, 20, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 12, 21, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 12, 22, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 12, 23, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 12, 24, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 12, 25, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 12, 26, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 12, 27, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 12, 28, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 12, 29, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 12, 30, 0);
INSERT INTO `kayapo_stats_date` VALUES (2005, 12, 31, 0);

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_stats_hour`
-- 

CREATE TABLE `kayapo_stats_hour` (
  `year` smallint(6) NOT NULL default '0',
  `month` tinyint(4) NOT NULL default '0',
  `date` tinyint(4) NOT NULL default '0',
  `hour` tinyint(4) NOT NULL default '0',
  `hits` int(11) NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Extraindo dados da tabela `kayapo_stats_hour`
-- 

INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 14, 0, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 14, 1, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 14, 2, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 14, 3, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 14, 4, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 14, 5, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 14, 6, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 14, 7, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 14, 8, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 14, 9, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 14, 10, 26);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 14, 11, 115);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 14, 12, 25);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 14, 13, 47);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 14, 14, 13);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 14, 15, 6);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 14, 16, 7);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 14, 17, 7);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 14, 18, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 14, 19, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 14, 20, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 14, 21, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 14, 22, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 14, 23, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 15, 0, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 15, 1, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 15, 2, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 15, 3, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 15, 4, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 15, 5, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 15, 6, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 15, 7, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 15, 8, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 15, 9, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 15, 10, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 15, 11, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 15, 12, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 15, 13, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 15, 14, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 15, 15, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 15, 16, 1);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 15, 17, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 15, 18, 20);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 15, 19, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 15, 20, 34);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 15, 21, 5);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 15, 22, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 15, 23, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 16, 0, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 16, 1, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 16, 2, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 16, 3, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 16, 4, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 16, 5, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 16, 6, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 16, 7, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 16, 8, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 16, 9, 2);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 16, 10, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 16, 11, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 16, 12, 1);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 16, 13, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 16, 14, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 16, 15, 5);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 16, 16, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 16, 17, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 16, 18, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 16, 19, 1);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 16, 20, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 16, 21, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 16, 22, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 16, 23, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 17, 0, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 17, 1, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 17, 2, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 17, 3, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 17, 4, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 17, 5, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 17, 6, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 17, 7, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 17, 8, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 17, 9, 11);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 17, 10, 2);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 17, 11, 5);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 17, 12, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 17, 13, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 17, 14, 1);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 17, 15, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 17, 16, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 17, 17, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 17, 18, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 17, 19, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 17, 20, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 17, 21, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 17, 22, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 17, 23, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 18, 0, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 18, 1, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 18, 2, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 18, 3, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 18, 4, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 18, 5, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 18, 6, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 18, 7, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 18, 8, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 18, 9, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 18, 10, 6);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 18, 11, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 18, 12, 1);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 18, 13, 1);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 18, 14, 24);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 18, 15, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 18, 16, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 18, 17, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 18, 18, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 18, 19, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 18, 20, 3);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 18, 21, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 18, 22, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 18, 23, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 19, 0, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 19, 1, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 19, 2, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 19, 3, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 19, 4, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 19, 5, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 19, 6, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 19, 7, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 19, 8, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 19, 9, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 19, 10, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 19, 11, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 19, 12, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 19, 13, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 19, 14, 3);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 19, 15, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 19, 16, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 19, 17, 1);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 19, 18, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 19, 19, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 19, 20, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 19, 21, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 19, 22, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 19, 23, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 21, 0, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 21, 1, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 21, 2, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 21, 3, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 21, 4, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 21, 5, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 21, 6, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 21, 7, 1);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 21, 8, 60);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 21, 9, 48);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 21, 10, 1);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 21, 11, 1);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 21, 12, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 21, 13, 1);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 21, 14, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 21, 15, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 21, 16, 3);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 21, 17, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 21, 18, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 21, 19, 3);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 21, 20, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 21, 21, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 21, 22, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 21, 23, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 23, 0, 2);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 23, 1, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 23, 2, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 23, 3, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 23, 4, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 23, 5, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 23, 6, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 23, 7, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 23, 8, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 23, 9, 2);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 23, 10, 2);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 23, 11, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 23, 12, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 23, 13, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 23, 14, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 23, 15, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 23, 16, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 23, 17, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 23, 18, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 23, 19, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 23, 20, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 23, 21, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 23, 22, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 23, 23, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 24, 0, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 24, 1, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 24, 2, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 24, 3, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 24, 4, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 24, 5, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 24, 6, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 24, 7, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 24, 8, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 24, 9, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 24, 10, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 24, 11, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 24, 12, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 24, 13, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 24, 14, 1);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 24, 15, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 24, 16, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 24, 17, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 24, 18, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 24, 19, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 24, 20, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 24, 21, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 24, 22, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 24, 23, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 25, 0, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 25, 1, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 25, 2, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 25, 3, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 25, 4, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 25, 5, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 25, 6, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 25, 7, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 25, 8, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 25, 9, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 25, 10, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 25, 11, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 25, 12, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 25, 13, 1);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 25, 14, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 25, 15, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 25, 16, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 25, 17, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 25, 18, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 25, 19, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 25, 20, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 25, 21, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 25, 22, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 25, 23, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 28, 0, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 28, 1, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 28, 2, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 28, 3, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 28, 4, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 28, 5, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 28, 6, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 28, 7, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 28, 8, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 28, 9, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 28, 10, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 28, 11, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 28, 12, 1);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 28, 13, 1);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 28, 14, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 28, 15, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 28, 16, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 28, 17, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 28, 18, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 28, 19, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 28, 20, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 28, 21, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 28, 22, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 28, 23, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 29, 0, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 29, 1, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 29, 2, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 29, 3, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 29, 4, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 29, 5, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 29, 6, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 29, 7, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 29, 8, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 29, 9, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 29, 10, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 29, 11, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 29, 12, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 29, 13, 89);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 29, 14, 54);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 29, 15, 3);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 29, 16, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 29, 17, 3);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 29, 18, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 29, 19, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 29, 20, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 29, 21, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 29, 22, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 29, 23, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 30, 0, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 30, 1, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 30, 2, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 30, 3, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 30, 4, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 30, 5, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 30, 6, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 30, 7, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 30, 8, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 30, 9, 3);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 30, 10, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 30, 11, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 30, 12, 8);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 30, 13, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 30, 14, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 30, 15, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 30, 16, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 30, 17, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 30, 18, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 30, 19, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 30, 20, 1);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 30, 21, 1);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 30, 22, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 11, 30, 23, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 1, 0, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 1, 1, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 1, 2, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 1, 3, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 1, 4, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 1, 5, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 1, 6, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 1, 7, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 1, 8, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 1, 9, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 1, 10, 11);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 1, 11, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 1, 12, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 1, 13, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 1, 14, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 1, 15, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 1, 16, 13);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 1, 17, 1);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 1, 18, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 1, 19, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 1, 20, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 1, 21, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 1, 22, 1);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 1, 23, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 3, 0, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 3, 1, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 3, 2, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 3, 3, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 3, 4, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 3, 5, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 3, 6, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 3, 7, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 3, 8, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 3, 9, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 3, 10, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 3, 11, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 3, 12, 2);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 3, 13, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 3, 14, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 3, 15, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 3, 16, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 3, 17, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 3, 18, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 3, 19, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 3, 20, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 3, 21, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 3, 22, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 3, 23, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 5, 0, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 5, 1, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 5, 2, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 5, 3, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 5, 4, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 5, 5, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 5, 6, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 5, 7, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 5, 8, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 5, 9, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 5, 10, 2);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 5, 11, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 5, 12, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 5, 13, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 5, 14, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 5, 15, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 5, 16, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 5, 17, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 5, 18, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 5, 19, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 5, 20, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 5, 21, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 5, 22, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 5, 23, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 7, 0, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 7, 1, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 7, 2, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 7, 3, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 7, 4, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 7, 5, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 7, 6, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 7, 7, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 7, 8, 1);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 7, 9, 7);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 7, 10, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 7, 11, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 7, 12, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 7, 13, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 7, 14, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 7, 15, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 7, 16, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 7, 17, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 7, 18, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 7, 19, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 7, 20, 1);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 7, 21, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 7, 22, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 7, 23, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 9, 0, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 9, 1, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 9, 2, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 9, 3, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 9, 4, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 9, 5, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 9, 6, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 9, 7, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 9, 8, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 9, 9, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 9, 10, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 9, 11, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 9, 12, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 9, 13, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 9, 14, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 9, 15, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 9, 16, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 9, 17, 4);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 9, 18, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 9, 19, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 9, 20, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 9, 21, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 9, 22, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 9, 23, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 11, 0, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 11, 1, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 11, 2, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 11, 3, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 11, 4, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 11, 5, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 11, 6, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 11, 7, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 11, 8, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 11, 9, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 11, 10, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 11, 11, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 11, 12, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 11, 13, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 11, 14, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 11, 15, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 11, 16, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 11, 17, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 11, 18, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 11, 19, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 11, 20, 1);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 11, 21, 40);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 11, 22, 3);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 11, 23, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 12, 0, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 12, 1, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 12, 2, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 12, 3, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 12, 4, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 12, 5, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 12, 6, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 12, 7, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 12, 8, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 12, 9, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 12, 10, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 12, 11, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 12, 12, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 12, 13, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 12, 14, 6);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 12, 15, 8);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 12, 16, 1);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 12, 17, 2);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 12, 18, 4);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 12, 19, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 12, 20, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 12, 21, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 12, 22, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 12, 23, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 13, 0, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 13, 1, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 13, 2, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 13, 3, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 13, 4, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 13, 5, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 13, 6, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 13, 7, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 13, 8, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 13, 9, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 13, 10, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 13, 11, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 13, 12, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 13, 13, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 13, 14, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 13, 15, 5);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 13, 16, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 13, 17, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 13, 18, 8);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 13, 19, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 13, 20, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 13, 21, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 13, 22, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 13, 23, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 14, 0, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 14, 1, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 14, 2, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 14, 3, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 14, 4, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 14, 5, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 14, 6, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 14, 7, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 14, 8, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 14, 9, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 14, 10, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 14, 11, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 14, 12, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 14, 13, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 14, 14, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 14, 15, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 14, 16, 1);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 14, 17, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 14, 18, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 14, 19, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 14, 20, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 14, 21, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 14, 22, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 14, 23, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 19, 0, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 19, 1, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 19, 2, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 19, 3, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 19, 4, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 19, 5, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 19, 6, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 19, 7, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 19, 8, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 19, 9, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 19, 10, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 19, 11, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 19, 12, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 19, 13, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 19, 14, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 19, 15, 3);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 19, 16, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 19, 17, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 19, 18, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 19, 19, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 19, 20, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 19, 21, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 19, 22, 0);
INSERT INTO `kayapo_stats_hour` VALUES (2005, 12, 19, 23, 0);

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_stats_month`
-- 

CREATE TABLE `kayapo_stats_month` (
  `year` smallint(6) NOT NULL default '0',
  `month` tinyint(4) NOT NULL default '0',
  `hits` bigint(20) NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Extraindo dados da tabela `kayapo_stats_month`
-- 

INSERT INTO `kayapo_stats_month` VALUES (2005, 1, 0);
INSERT INTO `kayapo_stats_month` VALUES (2005, 2, 0);
INSERT INTO `kayapo_stats_month` VALUES (2005, 3, 0);
INSERT INTO `kayapo_stats_month` VALUES (2005, 4, 0);
INSERT INTO `kayapo_stats_month` VALUES (2005, 5, 0);
INSERT INTO `kayapo_stats_month` VALUES (2005, 6, 0);
INSERT INTO `kayapo_stats_month` VALUES (2005, 7, 0);
INSERT INTO `kayapo_stats_month` VALUES (2005, 8, 0);
INSERT INTO `kayapo_stats_month` VALUES (2005, 9, 0);
INSERT INTO `kayapo_stats_month` VALUES (2005, 10, 0);
INSERT INTO `kayapo_stats_month` VALUES (2005, 11, 663);
INSERT INTO `kayapo_stats_month` VALUES (2005, 12, 125);

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_stats_year`
-- 

CREATE TABLE `kayapo_stats_year` (
  `year` smallint(6) NOT NULL default '0',
  `hits` bigint(20) NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Extraindo dados da tabela `kayapo_stats_year`
-- 

INSERT INTO `kayapo_stats_year` VALUES (2005, 788);

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_stories`
-- 

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- 
-- Extraindo dados da tabela `kayapo_stories`
-- 

INSERT INTO `kayapo_stories` VALUES (2, 0, 'Mandry', 'Opera??o Golfinho come?a no dia 16 de dezembro', '2005-11-14 13:07:52', '<font size="1"><font face="Verdana"><strong><img height="100" src="http://www.clicrbs.com.br/rbs/image/1677474.jpg" width="140" align="left" border="2" alt=""/></strong>A situa??o n?o foi diferente no Litoral Norte. Em Cap?o da Canoa e em Imb?, por exemplo, o dia lembrava em tudo a alta temporada de Ver?o. Sol, aus?ncia vento e temperatura no ponto certo lotaram as areias, fazendo um contraponto ?s guaritas vazias. <br/></font></font>', '<div align="justify"><table cellspacing="0" cellpadding="0" width="100%" border="0"><tbody><tr><td class="mssansserif1"><b><!-- /TITULO --><font face="Arial" size="1"></font></b></td></tr><tr><td class="mssansserif4"><font face="Arial" color="#000000" size="1">Apesar do feriad?o, praias do litoral n?o contaram com salva-vidas em hor?rio integral para garantir a seguran?a</font></td></tr><tr valign="bottom"><td class="tahoma1" height="15"><p><font face="Arial" size="1">CAROLINE TORMA</font></p><p></p></td></tr></tbody></table></div><div align="justify"><table class="mssansserif6" cellspacing="0" cellpadding="0" width="100%" border="0"><tbody><tr><td><table cellspacing="0" cellpadding="0" align="right" border="0"><tbody><tr><td background="/jornais/zerohora/icon/fundo_zh_publicidade.gif" height="11"><font face="Arial" size="1"></font></td></tr><tr><td height="1"><font face="Arial" size="1"></font></td></tr><tr><td><script language="JavaScript"><![CDATA[<!--\r\nOAS_AD(''x06'');\r\n//-->]]></script><a href="http://anuncio.clicrbs.com.br/RealMedia/ads/click_lx.ads/clicrbs/RS/zerohora/369304177/x06/zaffari_feira_full_zhint_rs/trans_oas.gif/63393062633838613433373364396130" target="_top"><font face="Arial" size="1"><img alt="" src="http://anuncio.clicrbs.com.br/RealMedia/ads/Creatives/zaffari_feira_full_zhint_rs/trans_oas.gif" border="0"/></font></a></td></tr></tbody></table><p><!-- MATERIA --><font face="Arial" size="1">Praias cheias de veranistas e guaritas de salva-vidas vazias foram a cara do domingo no litoral ga?cho. Zero Hora n?o encontrou salva-vidas em Imb? e em Cap?o da Canoa, no Litoral Norte (pela manh?), e no Cassino, em Rio Grande, no Litoral Sul (? tarde). O comando da Brigada Militar afirma ter refor?ado o efetivo para garantir a seguran?a dos banhistas, mas em hor?rios intercalados. <br/><br/>Com sol forte e temperaturas altas, o clima foi perfeito para quem queria esquecer os meses de inverno. No Cassino, a ?gua morna, calma e clara era um convite ao banho. Com pouco vento, a orla ficou cheia de pessoas. <br/><br/>Marisa Fernanda Castro levou os filhos e os sobrinhos para aproveitar o dia e precisou ficar com os olhos grudados nas crian?as por causa do grande n?mero de pessoas. <br/><br/>Acompanhada dos pais, a pequena Camyle Freire do Amaral, de um ano e sete meses, n?o resistiu e foi parar na ?gua de roupa e tudo. Os pelotenses tamb?m curtiram o ensaio de veraneio na praia do Laranjal, ?s margens da Lagoa dos Patos. <br/><br/><b>Opera??o Golfinho come?a no dia 16 de dezembro </b><br/><br/>A situa??o n?o foi diferente no Litoral Norte. Em Cap?o da Canoa e em Imb?, por exemplo, o dia lembrava em tudo a alta temporada de Ver?o. Sol, aus?ncia vento e temperatura no ponto certo lotaram as areias, fazendo um contraponto ?s guaritas vazias. <br/><br/>Apesar de a ?gua estar um pouco escura, os veranistas n?o deixaram de aproveitar o mar. <br/><br/>Nos outros munic?pios do Estado, o domingo tamb?m foi de muito calor. A m?xima registrada foi em Uruguaiana, onde a temperatura chegou aos 34?C. Na Capital, a m?xima alcan?ou 29,8?C. <br/><br/>A Opera??o Golfinho come?a oficialmente em 16 de dezembro. Segundo a Brigada Militar, a partir do dia 21, ter? in?cio o treinamento dos salva-vidas, e os plant?es fazem parte da forma??o. <br/><br/>As inscri??es para salva-vidas civis ainda est?o abertas e podem ser feitas em qualquer comando da Brigada Militar no Estado. O sal?rio ? de R$ 740. <br/><br/></font></p></td></tr></tbody></table></div>', 0, 10, 2, 'Mandry', '', 0, '', 0, 0, 0, 0, 0, '');

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_stories_cat`
-- 

CREATE TABLE `kayapo_stories_cat` (
  `catid` int(11) NOT NULL auto_increment,
  `title` varchar(20) NOT NULL default '',
  `counter` int(11) NOT NULL default '0',
  PRIMARY KEY  (`catid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `kayapo_stories_cat`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_subscriptions`
-- 

CREATE TABLE `kayapo_subscriptions` (
  `id` int(10) NOT NULL auto_increment,
  `userid` int(10) default '0',
  `subscription_expire` varchar(50) NOT NULL default '',
  KEY `id` (`id`,`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `kayapo_subscriptions`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_topics`
-- 

CREATE TABLE `kayapo_topics` (
  `topicid` int(3) NOT NULL auto_increment,
  `topicname` varchar(20) default NULL,
  `topicimage` varchar(20) default NULL,
  `topictext` varchar(40) default NULL,
  `counter` int(11) NOT NULL default '0',
  PRIMARY KEY  (`topicid`),
  KEY `topicid` (`topicid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

-- 
-- Extraindo dados da tabela `kayapo_topics`
-- 

INSERT INTO `kayapo_topics` VALUES (2, 'Notícias', 'links.gif', 'Notícias', 0);
INSERT INTO `kayapo_topics` VALUES (3, 'Eventos', 'date.gif', 'Eventos', 0);

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_users`
-- 

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- 
-- Extraindo dados da tabela `kayapo_users`
-- 

INSERT INTO `kayapo_users` VALUES (1, '', 'Anonymous', '', '', '', 'blank.gif', 'Nov 10, 2000', '', '', '', '', '', 0, 0, '', '', '', '', 10, '', 0, 0, 0, '', 0, '', '', 4096, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 10, NULL, 'brazilian', 'D M d, Y g:i a', 0, 0, 0, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 0, 3, NULL, NULL, NULL, 0, '0', 0);
INSERT INTO `kayapo_users` VALUES (2, '', 'Mandry', 'mandry@casadaweb.net', '', 'http://www.casadaweb.net', 'gallery/blank.gif', 'Nov 14, 2005', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 'df8db813ac00dd0d9b91fb29f596417a', 10, '', 0, 0, 0, '', 0, '', '', 4096, 0, 0, 0, 0, 0, 2, 1, 0, 1, 1132322357, 0, 1132101196, 10, NULL, 'brazilian', 'D M d, Y g:i a', 0, 0, 1132322357, NULL, 1, 1, 1, 1, 1, 1, 0, 0, 0, 3, NULL, NULL, NULL, 0, '201.3.156.52', 0);

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `kayapo_users_temp`
-- 

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `kayapo_users_temp`
-- 

