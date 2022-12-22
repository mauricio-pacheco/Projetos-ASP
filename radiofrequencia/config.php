<?php
######################################################################
# PHP-NUKE: Advanced Content Management System
# ============================================
#
# Copyright (c) 2002 by Francisco Burzi (fbc@mandrakesoft.com)
# http://phpnuke.org
#
# This module is to configure the main options for your site
#
# This program is free software. You can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License.
######################################################################



######################################################################
# Esse arquivo foi gerado utilizando-se o PHP-Nuke Install v1.3
# Por XPK_FENIX ( http://www.xnuke.net )
######################################################################



######################################################################
# Database & System Config
#
# dbhost:       SQL Database Hostname
# dbuname:      SQL Username
# dbpass:       SQL Password
# dbname:       SQL Database Name
# $prefix:      Your Database tables prefix
# $user_prefix: Your Users Database tables prefix (To share it)
# $dbtype:      Your Database Server type. Supported servers are:
#               MySQL, mysql4, postgres, mssql, oracle, msaccess,
#               db2 and mssql-odbc
#               Be sure to write it exactly as above, case SeNsItIvE!
# $sitekey:	Security Key. CHANGE it to whatever you want, as long
#               as you want. Just dont use quotes.
# $gfx_chk:	Set the graphic security code on every login screen,
#		You need to have GD extension installed:
#		0: No check
#		1: Administrators login only
#		2: Users login only
#		3: New users registration only
#		4: Both, users login and new users registration only
#		5: Administrators and users login only
#		6: Administrators and new users registration only
#		7: Everywhere on all login options (Admins and Users)
#		NOTE: If you arent sure set this value to 0
# $subscription_url : If you manage subscriptions on your site, you
#                     must write here the url of the subscription
#                     information/renewal page. This will send by
#                     email if set.
######################################################################
$dbhost = "localhost";
$dbuname = "mandry";
$dbpass = "abacate";
$dbname = "frequencia";
$prefix = "kayapo";
$user_prefix = "kayapo";
$dbtype = "MySQL";
$sitekey = "Rádio Frequência AM";
$gfx_chk = 7;
$subscription_url = "";

$reasons = array("As Is",
 		    "Offtopic",
 		    "Flamebait",
		    "Troll",
 		    "Redundant",
 		    "Insighful",
 		    "Interesting",
 		    "Informative",
 		    "Funny",
 		    "Overrated",
 		    "Underrated");
$badreasons = 4;

$AllowableHTML = array("b"=>1, "i"=>1, "a"=>2, "em"=>1, "br"=>1, "strong"=>1, "blockquote"=>1, "tt"=>1, "li"=>1, "ol"=>1, "ul"=>1);

$CensorList = array("puta", "viado", "gay");
$tipath = "images/topics/";

if (eregi("config.php",$_SERVER['SCRIPT_NAME'])) {
  Header("Location: index.php");
  die();
}
?>