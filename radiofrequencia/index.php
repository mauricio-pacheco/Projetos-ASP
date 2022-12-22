<?php

# $Author: chatserv $
# $Date: 2004/11/27 17:34:07 $
/************************************************************************/
/* PHP-NUKE: Advanced Content Management System                         */
/* ============================================                         */
/*                                                                      */
/* Copyright (c) 2002 by Francisco Burzi                                */
/* http://phpnuke.org                                                   */
/*                                                                      */
/* This program is free software. You can redistribute it and/or modify */
/* it under the terms of the GNU General Public License as published by */
/* the Free Software Foundation; either version 2 of the License.       */
/*                                                                      */
/************************************************************************/
/* Additional security checking code 2003 by chatserv                   */
/* http://www.nukefixes.com -- http://www.nukeresources.com             */
/************************************************************************/

require_once("mainfile.php");
global $prefix, $db;
$modpath = '';
$_SERVER['SCRIPT_NAME'] = "modules.php";
$row = $db->sql_fetchrow($db->sql_query("SELECT main_module from ".$prefix."_main"));
$name = $row['main_module'];
$home = 1;

if ($httpref==1) {
    $referer = $_SERVER["HTTP_REFERER"];
    $referer = check_html($referer, nohtml);
    if ($referer=="" OR eregi("^unknown", $referer) OR substr("$referer",0,strlen($nukeurl))==$nukeurl OR eregi("^bookmark",$referer)) {
    } else {
	$result = $db->sql_query("INSERT INTO ".$prefix."_referer VALUES (NULL, '$referer')");
    }
    $numrows = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_referer"));
    if($numrows>=$httprefmax) {
	$result2 = $db->sql_query("DELETE FROM ".$prefix."_referer");
    }
}
if (!isset($mop)) { $mop="modload"; }
if (!isset($mod_file)) { $mod_file="index"; }
$name = trim($name);
$file = trim($file);
$mod_file = trim($mod_file);
$mop = trim($mop);
if (ereg("\.\.",$name) || ereg("\.\.",$file) || ereg("\.\.",$mod_file) || ereg("\.\.",$mop)) {
    echo "You are so cool...";
} else {
    $ThemeSel = get_theme();
    if (file_exists("themes/$ThemeSel/module.php")) {
	include("themes/$ThemeSel/module.php");
	if (is_active("$default_module") AND file_exists("modules/$default_module/".$mod_file.".php")) {
	    $name = $default_module;
	}
    }
    if (file_exists("themes/$ThemeSel/modules/$name/".$mod_file.".php")) {
	$modpath = "themes/$ThemeSel/";
    }
    $modpath .= "modules/$name/".$mod_file.".php";
    if (file_exists($modpath)) {
	include($modpath);
    } else {
	$index = 1;
	include("header.php");
	OpenTable();
	if (is_admin($admin)) {
	    echo "<center><font class=\"\"><b>"._HOMEPROBLEM."</b></font><br><br>[ <a href=\"admin.php?op=modules\">"._ADDAHOME."</a> ]</center>";
	} else {
	    echo "<center>"._HOMEPROBLEMUSER."</center>";
	}
	CloseTable();
	include("footer.php");
    }
}
# $Log: index.php,v $
# Revision 1.2  2004/11/27 17:34:07  chatserv
# Added missing globals, not required for all but harmless either way
#
# Revision 1.1  2004/10/04 19:24:21  chatserv
# Initial CVS Addition
#

?>