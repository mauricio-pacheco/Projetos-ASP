<?php

# $Author: chatserv $
# $Date: 2004/12/07 22:20:10 $
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
/*                                                                      */
/************************************************************************/
/*         Additional security & Abstraction layer conversion           */
/*                           2003 chatserv                              */
/*      http://www.nukefixes.com -- http://www.nukeresources.com        */
/************************************************************************/

if ( !defined('ADMIN_FILE') )
{
	die("Illegal File Access");
}
if (!stristr($_SERVER['SCRIPT_NAME'], "admin.php")) { die ("Access Denied"); }
global $prefix, $db;
$aid = substr("$aid", 0,25);
$row = $db->sql_fetchrow($db->sql_query("SELECT radminsuper FROM " . $prefix . "_authors WHERE aid='$aid'"));
if ($row['radminsuper'] == 1) {

/*********************************************************/
/* Admin/Authors Functions                               */
/*********************************************************/

function displayadmins() {
    global $admin, $prefix, $db, $language, $multilingual;
    if (is_admin($admin)) {
    include("header.php");
    GraphicAdmin();
    OpenTable();
    echo "<center><font class=\"title\"><b>" . _AUTHORSADMIN . "</b></font></center>";
    CloseTable();
    echo "<br>";
    OpenTable();
    echo "<center><font class=\"option\"><b>" . _EDITADMINS . "</b></font></center><br>"
	."<table border=\"1\" align=\"center\">";
    $result = $db->sql_query("SELECT aid, name, admlanguage from " . $prefix . "_authors");
    while ($row = $db->sql_fetchrow($result)) {
	$a_aid = $row['aid'];
	$name = $row['name'];
	$admlanguage = $row['admlanguage'];
        $a_aid = substr("$a_aid", 0,25);
        $name = substr("$name", 0,25);
        echo "<tr><td align=\"center\">$a_aid</td>";
	if ($admlanguage == "") {
	    $admlanguage = "" . _ALL . "";
	}
        echo "<td align=\"center\">$admlanguage</td>";
    	echo "<td><a href=\"admin.php?op=modifyadmin&amp;chng_aid=$a_aid\">" . _MODIFYINFO . "</a></td>";
	if($name=="God") {
	    echo "<td>" . _MAINACCOUNT . "</td></tr>";
	} else {
	    echo "<td><a href=\"admin.php?op=deladmin&amp;del_aid=$a_aid\">" . _DELAUTHOR . "</a></td></tr>";
	}
    }
    echo "</table><br><center><font class=\"tiny\">" . _GODNOTDEL . "</font></center>";
    CloseTable();
    echo "<br>";
    OpenTable();
    echo "<center><font class=\"option\"><b>" . _ADDAUTHOR . "</b></font></center>"
	."<form action=\"admin.php\" method=\"post\">"
	."<table border=\"0\">"
	."<tr><td>" . _NAME . ":</td>"
	."<td colspan=\"3\"><input type=\"text\" name=\"add_name\" size=\"30\" maxlength=\"50\"> <font class=\"tiny\">" . _REQUIREDNOCHANGE . "</font></td></tr>"
	."<tr><td>" . _NICKNAME . ":</td>"
	."<td colspan=\"3\"><input type=\"text\" name=\"add_aid\" size=\"30\" maxlength=\"30\"> <font class=\"tiny\">" . _REQUIRED . "</font></td></tr>"
	."<tr><td>" . _EMAIL . ":</td>"
	."<td colspan=\"3\"><input type=\"text\" name=\"add_email\" size=\"30\" maxlength=\"60\"> <font class=\"tiny\">" . _REQUIRED . "</font></td></tr>"
	."<tr><td>" . _URL . ":</td>"
	."<td colspan=\"3\"><input type=\"text\" name=\"add_url\" size=\"30\" maxlength=\"60\"></td></tr>";
    if ($multilingual == 1) {
	echo "<tr><td>" . _LANGUAGE . ":</td><td colspan=\"3\">"
	    ."<select name=\"add_admlanguage\">";
	$handle=opendir('language');
	while ($file = readdir($handle)) {
	    if (preg_match("/^lang\-(.+)\.php/", $file, $matches)) {
	        $langFound = $matches[1];
	        $languageslist .= "$langFound ";
	    }
	}
	closedir($handle);
	$languageslist = explode(" ", $languageslist);
	sort($languageslist);
	for ($i=0; $i < sizeof($languageslist); $i++) {
	    if($languageslist[$i]!="") {
		echo "<option value=\"$languageslist[$i]\" ";
		if($languageslist[$i]==$language) echo "selected";
		echo ">".ucfirst($languageslist[$i])."</option>\n";
	    }
	}
	echo "<option value=\"\">" . _ALL . "</option></select></td></tr>";
    } else {
	echo "<input type=\"hidden\" name=\"add_admlanguage\" value=\"\">";
    }
    echo "<tr><td>" . _PERMISSIONS . ":</td>";
	$result = $db->sql_query("SELECT mid, title FROM ".$prefix."_modules ORDER BY title ASC");
	while ($row = $db->sql_fetchrow($result)) {
		$title = ereg_replace("_", " ", $row[title]);
		if (file_exists("modules/$row[title]/admin/index.php") AND file_exists("modules/$row[title]/admin/links.php") AND file_exists("modules/$row[title]/admin/case.php")) {
    		echo "<td><input type=\"checkbox\" name=\"auth_modules[]\" value=\"$row[mid]\"> $title</td>";
    		if ($a == 2) {
    			echo "</tr><tr><td>&nbsp;</td>";
    			$a = 0;
    		} else {
    			$a++;
    		}
		}
	}
	echo "</tr><tr><td>&nbsp;</td>"
		."<td><input type=\"checkbox\" name=\"add_radminsuper\" value=\"1\"> <b>" . _SUPERUSER . "</b></td>"
		."</tr>"
		."<tr><td>&nbsp;</td><td colspan=\"3\"><font class=\"tiny\"><i>" . _SUPERWARNING . "</i></font></td></tr>"
		."<tr><td>" . _PASSWORD . "</td>"
		."<td colspan=\"3\"><input type=\"password\" name=\"add_pwd\" size=\"12\" maxlength=\"12\"> <font class=\"tiny\">" . _REQUIRED . "</font></td></tr>"
		."<input type=\"hidden\" name=\"op\" value=\"AddAuthor\">"
		."<tr><td><input type=\"submit\" value=\"" . _ADDAUTHOR2 . "\"></td></tr>"
		."</table></form>";
    CloseTable();
    include("footer.php");
    } else {
	include ('header.php');
	GraphicAdmin();
	OpenTable();
	echo "<center><font class=\"title\"><b>Authors Admin</b></font></center>";
	CloseTable();
	echo "<br>";
	OpenTable();
	echo "<center><b>Not Authorized</b><br><br>"
	    ."Unauthorized editing of authors detected<br><br>"
	    .""._GOBACK."";
	CloseTable();
	include("footer.php");
    }
}

function modifyadmin($chng_aid) {
    global $admin, $prefix, $db, $multilingual;
    if (is_admin($admin)) {
    include("header.php");
    GraphicAdmin();
    OpenTable();
    echo "<center><font class=\"title\"><b>" . _AUTHORSADMIN . "</b></font></center>";
    CloseTable();
    echo "<br>";
    OpenTable();
    echo "<center><font class=\"option\"><b>" . _MODIFYINFO . "</b></font></center><br><br>";
    $adm_aid = $chng_aid;
    $adm_aid = trim($adm_aid);
    $row = $db->sql_fetchrow($db->sql_query("SELECT aid, name, url, email, pwd, radminsuper, admlanguage from " . $prefix . "_authors where aid='$chng_aid'"));
    $chng_aid = $row['aid'];
    $chng_name = $row['name'];
    $chng_url = stripslashes($row['url']);
    $chng_email = stripslashes($row['email']);
    $chng_pwd = $row['pwd'];
    $chng_radminsuper = intval($row['radminsuper']);
    $chng_admlanguage = $row['admlanguage'];
    $chng_aid = substr("$chng_aid", 0,25);
    $aid = $chng_aid;
    echo "<form action=\"admin.php\" method=\"post\">"
	."<table border=\"0\">"
	."<tr><td>" . _NAME . ":</td>"
	."<td colspan=\"3\"><b>$chng_name</b> <input type=\"hidden\" name=\"chng_name\" value=\"$chng_name\"></td></tr>"
	."<tr><td>" . _NICKNAME . ":</td>"
        ."<td colspan=\"3\"><input type=\"text\" name=\"chng_aid\" value=\"$chng_aid\"> <font class=\"tiny\">" . _REQUIRED . "</font></td></tr>"
	."<tr><td>" . _EMAIL . ":</td>"
	."<td colspan=\"3\"><input type=\"text\" name=\"chng_email\" value=\"$chng_email\" size=\"30\" maxlength=\"60\"> <font class=\"tiny\">" . _REQUIRED . "</font></td></tr>"
	."<tr><td>" . _URL . ":</td>"
	."<td colspan=\"3\"><input type=\"text\" name=\"chng_url\" value=\"$chng_url\" size=\"30\" maxlength=\"60\"></td></tr>";
    if ($multilingual == 1) {
	echo "<tr><td>" . _LANGUAGE . ":</td><td colspan=\"3\">"
	    ."<select name=\"chng_admlanguage\">";
	$handle=opendir('language');
	while ($file = readdir($handle)) {
	    if (preg_match("/^lang\-(.+)\.php/", $file, $matches)) {
		$langFound = $matches[1];
		$languageslist .= "$langFound ";
	    }
	}
	closedir($handle);
	$languageslist = explode(" ", $languageslist);
	sort($languageslist);
	for ($i=0; $i < sizeof($languageslist); $i++) {
	    if($languageslist[$i]!="") {
		echo "<option value=\"$languageslist[$i]\" ";
		if($languageslist[$i]==$chng_admlanguage) echo "selected";
		echo ">".ucfirst($languageslist[$i])."</option>\n";
	    }
	}
	if ($chng_admlanguage == "") {
	    $allsel = "selected";
	} else {
    	    $allsel = "";
	}
	echo "<option value=\"\" $allsel>" . _ALL . "</option></select></td></tr>";
    } else {
	echo "<input type=\"hidden\" name=\"chng_admlanguage\" value=\"\">";
    }
    echo "<tr><td>" . _PERMISSIONS . ":</td>";
    if ($row[name] != God) {
	$result = $db->sql_query("SELECT mid, title, admins FROM ".$prefix."_modules ORDER BY title ASC");
	while ($row = $db->sql_fetchrow($result)) {
		$title = ereg_replace("_", " ", $row[title]);
		if (file_exists("modules/$row[title]/admin/index.php") AND file_exists("modules/$row[title]/admin/links.php") AND file_exists("modules/$row[title]/admin/case.php")) {
			$admins = explode(",", $row[admins]);
			$sel = "";
			for ($i=0; $i < sizeof($admins); $i++) {
				if ($chng_name == "$admins[$i]") {
					$sel = "checked";	
				}
			}
    		echo "<td><input type=\"checkbox\" name=\"auth_modules[]\" value=\"$row[mid]\" $sel> $title</td>";
    		$sel = "";
    		if ($a == 2) {
    			echo "</tr><tr><td>&nbsp;</td>";
    			$a = 0;
    		} else {
    			$a++;
    		}
		}
	}
	if ($chng_radminsuper == 1) {
		$sel1 = "checked";	
	}
	echo "</tr><tr><td>&nbsp;</td>";
    } else {
        echo "<input type=\"hidden\" name=\"auth_modules[]\" value=\"\">";
        $sel1 = "checked";
    }
	echo "<td><input type=\"checkbox\" name=\"chng_radminsuper\" value=\"1\" $sel1> <b>" . _SUPERUSER . "</b></td>"
		."</tr><tr><td>&nbsp;</td>"
		."<td colspan=\"3\"><font class=\"tiny\"><i>" . _SUPERWARNING . "</i></font></td></tr>"
		."<tr><td>" . _PASSWORD . ":</td>"
	    	."<td colspan=\"3\"><input type=\"password\" name=\"chng_pwd\" size=\"12\" maxlength=\"12\"></td></tr>"
		."<tr><td>" . _RETYPEPASSWD . ":</td>"
		."<td colspan=\"3\"><input type=\"password\" name=\"chng_pwd2\" size=\"12\" maxlength=\"12\"> <font class=\"tiny\">" . _FORCHANGES . "</font></td></tr>"
		."<input type=\"hidden\" name=\"adm_aid\" value=\"$adm_aid\">"
		."<input type=\"hidden\" name=\"op\" value=\"UpdateAuthor\">"
		."<tr><td><input type=\"submit\" value=\"" . _SAVE . "\"> " . _GOBACK . ""
		."</td></tr></table></form>";
    CloseTable();
    include("footer.php");
    } else {
	include ('header.php');
	GraphicAdmin();
	OpenTable();
	echo "<center><font class=\"title\"><b>Authors Admin</b></font></center>";
	CloseTable();
	echo "<br>";
	OpenTable();
	echo "<center><b>Not Authorized</b><br><br>"
	    ."Unauthorized editing of authors detected<br><br>"
	    .""._GOBACK."";
	CloseTable();
	include("footer.php");
    }
}

function updateadmin($chng_aid, $chng_name, $chng_email, $chng_url, $chng_radminsuper, $chng_pwd, $chng_pwd2, $chng_admlanguage, $adm_aid, $auth_modules) {
    global $admin, $prefix, $db;
    if (is_admin($admin)) {
    $chng_aid = trim($chng_aid);
    if (!($chng_aid && $chng_name && $chng_email)) {
	Header("Location: admin.php?op=mod_authors");
    }
    if ($chng_pwd2 != "") {
		if($chng_pwd != $chng_pwd2) {
		    include("header.php");
		    GraphicAdmin();
		    OpenTable();
		    echo "" . _PASSWDNOMATCH . "<br><br>"
			."<center>" . _GOBACK . "</center>";
		    CloseTable();
		    include("footer.php");
		    exit;
		}
		$chng_pwd = md5($chng_pwd);
		$chng_aid = substr("$chng_aid", 0,25);
		if ($chng_radminsuper == 1) {
    		$result = $db->sql_query("SELECT mid, admins FROM ".$prefix."_modules");
    		while ($row = $db->sql_fetchrow($result)) {
		    	$admins = explode(",", $row[admins]);
		    	$adm = "";
		    	for ($a=0; $a < sizeof($admins); $a++) {
		    		if ($admins[$a] != "$chng_name" AND $admins[$a] != "") {
						$adm .= "$admins[$a],";
		    		}
		    	}
		    	$db->sql_query("UPDATE ".$prefix."_modules SET admins='$adm' WHERE mid='$row[mid]'");
    		}
			$db->sql_query("update " . $prefix . "_authors set aid='$chng_aid', email='$chng_email', url='$chng_url', radminsuper='$chng_radminsuper', pwd='$chng_pwd', admlanguage='$chng_admlanguage' where name='$chng_name'");
		    Header("Location: admin.php?op=mod_authors");
		} else {
			if ($chng_name != "God") {
		          $db->sql_query("update " . $prefix . "_authors set aid='$chng_aid', email='$chng_email', url='$chng_url', radminsuper='0', pwd='$chng_pwd', admlanguage='$chng_admlanguage' where name='$chng_name'");
			}
    		$result = $db->sql_query("SELECT mid, admins FROM ".$prefix."_modules");
    		while ($row = $db->sql_fetchrow($result)) {
		    	$admins = explode(",", $row[admins]);
		    	$adm = "";
		    	for ($a=0; $a < sizeof($admins); $a++) {
		    		if ($admins[$a] != "$chng_name" AND $admins[$a] != "") {
						$adm .= "$admins[$a],";
		    		}
		    	}
		    	$db->sql_query("UPDATE ".$prefix."_authors SET radminsuper='$chng_radminsuper' WHERE name='$chng_name'");
		    	$db->sql_query("UPDATE ".$prefix."_modules SET admins='$adm' WHERE mid='$row[mid]'");
    		}
		    for ($i=0; $i < sizeof($auth_modules); $i++) {
		    	$row = $db->sql_fetchrow($db->sql_query("SELECT admins FROM ".$prefix."_modules WHERE mid='$auth_modules[$i]'"));
		    	$admins = explode(",", $row[admins]);
		    	for ($a=0; $a < sizeof($admins); $a++) {
		    		if ($admins[$a] == "$chng_name") {
						$dummy = 1;
		    		}
		    	}
		    	if ($dummy != 1) {
		    		$adm = "$row[admins]$chng_name";
		    		$db->sql_query("UPDATE ".$prefix."_modules SET admins='$adm,' WHERE mid='$auth_modules[$i]'");
		    	}
		    	$dummy = "";
		    }
		    Header("Location: admin.php?op=mod_authors");
		}
    } else {
		if ($chng_radminsuper == 1) {
    		$result = $db->sql_query("SELECT mid, admins FROM ".$prefix."_modules");
    		while ($row = $db->sql_fetchrow($result)) {
		    	$admins = explode(",", $row[admins]);
		    	$adm = "";
		    	for ($a=0; $a < sizeof($admins); $a++) {
		    		if ($admins[$a] != "$chng_name" AND $admins[$a] != "") {
						$adm .= "$admins[$a],";
		    		}
		    	}
		    	$db->sql_query("UPDATE ".$prefix."_modules SET admins='$adm' WHERE mid='$row[mid]'");
    		}
		    $db->sql_query("update " . $prefix . "_authors set aid='$chng_aid', email='$chng_email', url='$chng_url', radminsuper='$chng_radminsuper', admlanguage='$chng_admlanguage' where name='$chng_name'");
		    Header("Location: admin.php?op=mod_authors");
		} else {
			if ($chng_name != "God") {
		    		$db->sql_query("update " . $prefix . "_authors set aid='$chng_aid', email='$chng_email', url='$chng_url', radminsuper='0', admlanguage='$chng_admlanguage' where name='$chng_name'");
			}
    		$result = $db->sql_query("SELECT mid, admins FROM ".$prefix."_modules");
    		while ($row = $db->sql_fetchrow($result)) {
		    	$admins = explode(",", $row[admins]);
		    	$adm = "";
		    	for ($a=0; $a < sizeof($admins); $a++) {
		    		if ($admins[$a] != "$chng_name" AND $admins[$a] != "") {
						$adm .= "$admins[$a],";
		    		}
		    	}
		    	$db->sql_query("UPDATE ".$prefix."_authors SET radminsuper='$chng_radminsuper' WHERE name='$chng_name'");
		    	$db->sql_query("UPDATE ".$prefix."_modules SET admins='$adm' WHERE mid='$row[mid]'");
    		}
		    for ($i=0; $i < sizeof($auth_modules); $i++) {
		    	$row = $db->sql_fetchrow($db->sql_query("SELECT admins FROM ".$prefix."_modules WHERE mid='$auth_modules[$i]'"));
		    	$admins = explode(",", $row[admins]);
		    	for ($a=0; $a < sizeof($admins); $a++) {
		    		if ($admins[$a] == "$chng_name") {
						$dummy = 1;
		    		}
		    	}
		    	if ($dummy != 1) {
		    		$adm = "$row[admins]$chng_name";
		    		$db->sql_query("UPDATE ".$prefix."_modules SET admins='$adm,' WHERE mid='$auth_modules[$i]'");
		    	}
		    	$dummy = "";
    		}
    		Header("Location: admin.php?op=mod_authors");
		}
    }
    if ($adm_aid != $chng_aid) {
	    $result2 = $db->sql_query("SELECT sid, aid, informant from " . $prefix . "_stories where aid='$adm_aid'");
	    while ($row2 = $db->sql_fetchrow($result2)) {
			$sid = intval($row2['sid']);
			$old_aid = $row2['aid'];
			$old_aid = substr("$old_aid", 0,25);
			$informant = $row2['informant'];
			$informant = substr("$informant", 0,25);
			if ($old_aid == $informant) {
				$db->sql_query("update " . $prefix . "_stories set informant='$chng_aid' where sid='$sid'");
			}
			$db->sql_query("update " . $prefix . "_stories set aid='$chng_aid' WHERE sid='$sid'");
		}
    }
    } else {
	include ('header.php');
	GraphicAdmin();
	OpenTable();
	echo "<center><font class=\"title\"><b>Authors Admin</b></font></center>";
	CloseTable();
	echo "<br>";
	OpenTable();
	echo "<center><b>Not Authorized</b><br><br>"
	    ."Unauthorized editing of authors detected<br><br>"
	    .""._GOBACK."";
	CloseTable();
	include("footer.php");
    }
}

function deladmin2($del_aid) {
    global $admin, $prefix, $db;
    if (is_admin($admin)) {
    $del_aid = substr("$del_aid", 0,25);
    $result = $db->sql_query("SELECT admins FROM ".$prefix."_modules WHERE title='News'");
	$row2 = $db->sql_fetchrow($db->sql_query("SELECT name FROM ".$prefix."_authors WHERE aid='$del_aid'"));
	while ($row = $db->sql_fetchrow($result)) {
		$admins = explode(",", $row[admins]);
		$auth_user = 0;
		for ($i=0; $i < sizeof($admins); $i++) {
			if ($row2[name] == "$admins[$i]") {
				$auth_user = 1;	
			}
		}
		if ($auth_user == 1) {
			$radminarticle = 1;
		}
	}
	if ($radminarticle == 1) {
		$row2 = $db->sql_fetchrow($db->sql_query("SELECT sid from " . $prefix . "_stories where aid='$del_aid'"));
		$sid = intval($row2['sid']);
		if ($sid != "") {
		    include("header.php");
		    GraphicAdmin();
		    OpenTable();
		    echo "<center><font class=\"title\"><b>" . _AUTHORSADMIN . "</b></font></center>";
		    CloseTable();
		    echo "<br>";
		    OpenTable();
		    echo "<center><font class=\"option\"><b>" . _PUBLISHEDSTORIES . "</b></font><br><br>"
				."" . _SELECTNEWADMIN . ":<br><br>";
		    $result3 = $db->sql_query("SELECT aid from " . $prefix . "_authors where aid!='$del_aid'");
		    echo "<form action=\"admin.php\" method=\"post\"><select name=\"newaid\">";
		    while ($row3 = $db->sql_fetchrow($result3)) {
		    	$oaid = $row3['aid'];
		    	$oaid = substr("$oaid", 0,25);
				echo "<option name=\"newaid\" value=\"$oaid\">$oaid</option>";
		    }
		    echo "</select><input type=\"hidden\" name=\"del_aid\" value=\"$del_aid\">"
				."<input type=\"hidden\" name=\"op\" value=\"assignstories\">"
				."<input type=\"submit\" value=\"" . _OK . "\">"
				."</form>";
		    CloseTable();
		    include("footer.php");
		    return;
		}
    }
    Header("Location: admin.php?op=deladminconf&del_aid=$del_aid");
    } else {
	include ('header.php');
	GraphicAdmin();
	OpenTable();
	echo "<center><font class=\"title\"><b>Authors Admin</b></font></center>";
	CloseTable();
	echo "<br>";
	OpenTable();
	echo "<center><b>Not Authorized</b><br><br>"
	    ."Unauthorized editing of authors detected<br><br>"
	    .""._GOBACK."";
	CloseTable();
	include("footer.php");
    }
}

switch ($op) {

    case "mod_authors":
    displayadmins();
    break;

    case "modifyadmin":
    modifyadmin($chng_aid);
    break;

    case "UpdateAuthor":
    updateadmin($chng_aid, $chng_name, $chng_email, $chng_url, $chng_radminsuper, $chng_pwd, $chng_pwd2, $chng_admlanguage, $adm_aid, $auth_modules);
    break;

    case "AddAuthor":
	    $add_aid = substr("$add_aid", 0,25);
	    $add_name = substr("$add_name", 0,25);
	    if (!($add_aid && $add_name && $add_email && $add_pwd)) {
	        include("header.php");
	        GraphicAdmin();
			OpenTable();
			echo "<center><font class=\"title\"><b>" . _AUTHORSADMIN . "</b></font></center>";
			CloseTable();
			echo "<br>";
		        OpenTable();
			echo "<center><font class=\"option\"><b>" . _CREATIONERROR . "</b></font><br><br>"
			    ."" . _COMPLETEFIELDS . "<br><br>"
			    ."" . _GOBACK . "</center>";
		    CloseTable();
			include("footer.php");
			return;
	    }
	    $add_pwd = md5($add_pwd);
	    for ($i=0; $i < sizeof($auth_modules); $i++) {
	    	$row = $db->sql_fetchrow($db->sql_query("SELECT admins FROM ".$prefix."_modules WHERE mid='$auth_modules[$i]'"));
	    	$adm = "$row[admins]$add_name";
	    	$db->sql_query("UPDATE ".$prefix."_modules SET admins='$adm,' WHERE mid='$auth_modules[$i]'");
	    }
	    $result = $db->sql_query("insert into " . $prefix . "_authors values ('$add_aid', '$add_name', '$add_url', '$add_email', '$add_pwd', '0', '$add_radminsuper', '$add_admlanguage')");
	    if (!$result) {
			return;
	    }
	    Header("Location: admin.php?op=mod_authors");
    break;

    case "deladmin":
	    include("header.php");
	    $del_aid = trim($del_aid);
	    GraphicAdmin();
	    OpenTable();
	    echo "<center><font class=\"title\"><b>" . _AUTHORSADMIN . "</b></font></center>";
	    CloseTable();
	    echo "<br>";
	    OpenTable();
	    echo "<center><font class=\"option\"><b>" . _AUTHORDEL . "</b></font><br><br>"
			."" . _AUTHORDELSURE . " <i>$del_aid</i>?<br><br>";
	    echo "[ <a href=\"admin.php?op=deladmin2&amp;del_aid=$del_aid\">" . _YES . "</a> | <a href=\"admin.php?op=mod_authors\">" . _NO . "</a> ]";
	    CloseTable();
	    include("footer.php");
    break;

    case "deladmin2":
    deladmin2($del_aid);
    break;

    case "assignstories":
	    $del_aid = trim($del_aid);
	    $result = $db->sql_query("SELECT sid from " . $prefix . "_stories where aid='$del_aid'");
	    while ($row = $db->sql_fetchrow($result)) {
	    	$sid = intval($row['sid']);
			$db->sql_query("update " . $prefix . "_stories set aid='$newaid', informant='$newaid' where aid='$del_aid'");
			$db->sql_query("update " . $prefix . "_authors set counter=counter+1 where aid='$newaid'");
	    }
	    Header("Location: admin.php?op=deladminconf&del_aid=$del_aid");
    break;

    case "deladminconf":
    	$del_aid = trim($del_aid);
    	$db->sql_query("delete from " . $prefix . "_authors where aid='$del_aid' AND name!='God'");
    	$result = $db->sql_query("SELECT mid, admins FROM ".$prefix."_modules");
    	while ($row = $db->sql_fetchrow($result)) {
		   	$admins = explode(",", $row[admins]);
		   	$adm = "";
		   	for ($a=0; $a < sizeof($admins); $a++) {
		   		if ($admins[$a] != "$del_aid" AND $admins[$a] != "") {
					$adm .= "$admins[$a],";
		   		}
		   	}
		   	$db->sql_query("UPDATE ".$prefix."_modules SET admins='$adm' WHERE mid='$row[mid]'");
    	}
    	Header("Location: admin.php?op=mod_authors");
    break;

}

} else {
    echo "Access Denied";
}
# $Log: authors.php,v $
# Revision 1.4  2004/12/07 22:20:10  chatserv
# http://www.nukefixes.com/ftopicp-3479.html#3479
#
# Revision 1.3  2004/11/24 22:40:13  chatserv
# Version 2.7 Release
#
# Revision 1.2  2004/10/06 14:51:49  chatserv
# http://www.nukefixes.com/ftopict-991.html
#
# Revision 1.1  2004/10/04 23:27:53  chatserv
# Initial CVS Addition
#

?>