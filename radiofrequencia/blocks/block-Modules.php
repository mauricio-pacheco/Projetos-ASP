<?php

# $Author: chatserv $
# $Date: 2004/12/07 22:23:42 $
/************************************************************************/
/* PHP-NUKE: Web Portal System                                          */
/* ===========================                                          */
/*                                                                      */
/* Copyright (c) 2002 by Francisco Burzi                                */
/* http://phpnuke.org                                                   */
/*                                                                      */
/* This program is free software. You can redistribute it and/or modify */
/* it under the terms of the GNU General Public License as published by */
/* the Free Software Foundation; either version 2 of the License.       */
/************************************************************************/
/*         Additional security & Abstraction layer conversion           */
/*                           2003 chatserv                              */
/*      http://www.nukefixes.com -- http://www.nukeresources.com        */
/************************************************************************/

if (stristr($_SERVER['SCRIPT_NAME'], "block-Modules.php")) {
    Header("Location: index.php");
    die();
}

global $prefix, $db, $admin;

    $ThemeSel = get_theme();
    if (file_exists("themes/$ThemeSel/module.php")) {
	include("themes/$ThemeSel/module.php");
	if (is_active("$default_module") AND file_exists("modules/$default_module/index.php")) {
	    $def_module = $default_module;
	} else {
	    $def_module = "";
	}
    }

    $row = $db->sql_fetchrow($db->sql_query("SELECT main_module FROM ".$prefix."_main"));
    $main_module = $row['main_module'];

    /* If the module doesn't exist, it will be removed from the database automaticaly */
    $result2 = $db->sql_query("SELECT title FROM " . $prefix . "_modules");
    while ($row2 = $db->sql_fetchrow($result2)) {
	$title = stripslashes($row2['title']);
	$a = 0;
	$handle=opendir('modules');
	while ($file = readdir($handle)) {
    	    if ($file == $title) {
		$a = 1;
	    }
	}
	closedir($handle);
	if ($a == 0) {
	    $db->sql_query("DELETE FROM ".$prefix."_modules WHERE title='$title'");
	}
    }

    /* Now we make the Modules block with the correspondent links */

    $content .= "<strong><big>&middot;</big></strong>&nbsp;<a href=\"index.php\">"._HOME."</a><br>\n";
//    $result3 = $db->sql_query("SELECT title, custom_title, view FROM " . $prefix . "_modules WHERE active='1' AND title!='$def_module' AND inmenu='1' ORDER BY custom_title ASC");
//    while ($row3 = $db->sql_fetchrow($result3)) {
//	$m_title = stripslashes($row3['title']);

/* Início da modificação do Bloco para NSN Groups UNI 151 */

    $result3 = $db->sql_query("SELECT * FROM " . $prefix . "_modules WHERE active='1' AND title!='$def_module' AND inmenu='1' ORDER BY custom_title ASC");
    while ($row3 = $db->sql_fetchrow($result3)) {
	$groups = $row3['groups'];
	$m_title = stripslashes($row3['title']);

/* Término da modificação do Bloco para NSN Groups UNI 151 */

	$custom_title = $row3['custom_title'];
	$view = intval($row3['view']);
	$m_title2 = ereg_replace("_", " ", $m_title);
	if ($custom_title != "") {
	    $m_title2 = $custom_title;
	}

//	if ($m_title != $main_module) {
//	    if ((is_admin($admin) AND $view == 2) OR $view != 2) {
//		$content .= "<strong><big>&middot;</big></strong>&nbsp;<a href=\"modules.php?name=$m_title\">$m_title2</a><br>\n";
//	    }

/* Início da modificação do Bloco para NSN Groups UNI 151 */

	if ($m_title != $main_module) {
            if ($view == 0) {
                $content .= "<strong><big>&middot;</big></strong>&nbsp;<a href=\"modules.php?name=$m_title\">$m_title2</a><br>\n";
            } elseif ($view == 1 AND is_user($user)) {
                $content .= "<strong><big>&middot;</big></strong>&nbsp;<a href=\"modules.php?name=$m_title\">$m_title2</a><br>\n";
            } elseif ($view == 2 AND is_admin($admin)) {
                $content .= "<strong><big>&middot;</big></strong>&nbsp;<a href=\"modules.php?name=$m_title\">$m_title2</a><br>\n";
            } elseif ($view == 3 AND paid()) {
                $content .= "<strong><big>&middot;</big></strong>&nbsp;<a href=\"modules.php?name=$m_title\">$m_title2</a><br>\n";
            } elseif ($view > 3 AND in_groups($groups)) {
		$content .= "<strong><big>&middot;</big></strong>&nbsp;<a href=\"modules.php?name=$m_title\">$m_title2</a><br>\n";
	    }

/* Término da modificação do Bloco para NSN Groups UNI 151 */

	}
    }

    /* If you're Admin you and only you can see Inactive modules and test it */
    /* If you copied a new module is the /modules/ directory, it will be added to the database */
    
    if (is_admin($admin)) {
	$handle=opendir('modules');
	while ($file = readdir($handle)) {
	    if ( (!ereg("[.]",$file)) ) {
		$modlist .= "$file ";
	    }
	}
	closedir($handle);
	$modlist = explode(" ", $modlist);
	sort($modlist);
	for ($i=0; $i < sizeof($modlist); $i++) {
	    if($modlist[$i] != "") {
		$row4 = $db->sql_fetchrow($db->sql_query("SELECT mid FROM ".$prefix."_modules WHERE title='$modlist[$i]'"));
		$mid = intval($row4['mid']);
		$mod_uname = ereg_replace("_", " ", $modlist[$i]);
		if ($mid == "") {

//		    $db->sql_query("INSERT INTO ".$prefix."_modules VALUES (NULL, '$modlist[$i]', '$mod_uname', '0', '0', '1', '0', '')");

/* Início da modificação do Bloco para NSN Groups UNI 151 */

            $db->sql_query("INSERT INTO ".$prefix."_modules VALUES (NULL, '$modlist[$i]', '$mod_uname', '0', '0', '1', '0', '0', '')");

/* Término da modificação do Bloco para NSN Groups UNI 151 */

		}
	    }
	}
	$content .= "<br><center><b>"._INVISIBLEMODULES."</b><br>";
	$content .= "<font class=\"tiny\">"._ACTIVEBUTNOTSEE."</font></center><br>";
	$result5 = $db->sql_query("SELECT title, custom_title FROM ".$prefix."_modules WHERE active='1' AND inmenu='0' ORDER BY title ASC");
	while ($row5 = $db->sql_fetchrow($result5)) {
	    $mn_title = stripslashes($row5['title']);
	    $custom_title = $row5['custom_title'];
	    $mn_title2 = ereg_replace("_", " ", $mn_title);
	    if ($custom_title != "") {
		$mn_title2 = $custom_title;
	    }
	    if ($mn_title2 != "") {
		$content .= "<strong><big>&middot;</big></strong>&nbsp;<a href=\"modules.php?name=$mn_title\">$mn_title2</a><br>\n";
		$dummy = 1;
	    } else {
		$a = 1;
	    }
	}
	if ($a == 1 AND $dummy != 1) {
    	    $content .= "<strong><big>&middot;</big></strong>&nbsp;<i>"._NONE."</i><br>\n";
	}
	$content .= "<br><center><b>"._NOACTIVEMODULES."</b><br>";
	$content .= "<font class=\"tiny\">"._FORADMINTESTS."</font></center><br>";
	$result6 = $db->sql_query("SELECT title, custom_title FROM ".$prefix."_modules WHERE active='0' ORDER BY title ASC");
	while ($row6 = $db->sql_fetchrow($result6)) {
	    $mn_title = stripslashes($row6['title']);
	    $custom_title = $row6['custom_title'];
	    $mn_title2 = ereg_replace("_", " ", $mn_title);
	    if ($custom_title != "") {
		$mn_title2 = $custom_title;
	    }
	    if ($mn_title2 != "") {
		$content .= "<strong><big>&middot;</big></strong>&nbsp;<a href=\"modules.php?name=$mn_title\">$mn_title2</a><br>\n";
		$dummy = 1;
	    } else {
		$a = 1;
	    }
	}
	if ($a == 1 AND $dummy != 1) {
    	    $content .= "<strong><big>&middot;</big></strong>&nbsp;<i>"._NONE."</i><br>\n";
	}
    }
# $Log: block-Modules.php,v $
# Revision 1.2  2004/12/07 22:23:42  chatserv
# http://www.nukefixes.com/ftopicp-3479.html#3479
#
# Revision 1.1  2004/10/04 23:20:29  chatserv
# Initial CVS Addition
#

?>