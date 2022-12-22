<?php

# $Author: chatserv $
# $Date: 2004/12/09 23:03:48 $
/************************************************************************/
/* PHP-NUKE: Web Portal System                                          */
/* ===========================                                          */
/*                                                                      */
/* Copyright (c) 2002 by Francisco Burzi                                */
/* http://phpnuke.org                                                   */
/*                                                                      */
/* ========================                                             */
/* Based on PHP-Nuke Add-On                                             */
/* Copyright (c) 2001 by Richard Tirtadji AKA King Richard              */
/*                       (rtirtadji@hotmail.com)                        */
/*                       Hutdik Hermawan AKA hotFix                     */
/*                       (hutdik76@hotmail.com)                         */
/* http://www.nukeaddon.com                                             */
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
$row = $db->sql_fetchrow($db->sql_query("SELECT title, admins FROM ".$prefix."_modules WHERE title='FAQ'"));
$row2 = $db->sql_fetchrow($db->sql_query("SELECT name, radminsuper FROM ".$prefix."_authors WHERE aid='$aid'"));
$admins = explode(",", $row['admins']);
$auth_user = 0;
for ($i=0; $i < sizeof($admins); $i++) {
    if ($row2['name'] == "$admins[$i]" AND $row['admins'] != "") {
        $auth_user = 1;	
    }
}

if ($row2['radminsuper'] == 1 || $auth_user == 1) {

/*********************************************************/
/* Faq Admin Function                                    */
/*********************************************************/

function FaqAdmin() {
    global $admin, $bgcolor2, $prefix, $db, $currentlang, $multilingual;
    include ("header.php");
    GraphicAdmin();
    OpenTable();
    echo "<center><font class=\"title\"><b>" . _FAQADMIN . "</b></font></center>";
    CloseTable();
    echo "<br>";
    OpenTable();
    echo "<center><font class=\"option\"><b>" . _ACTIVEFAQS . "</b></font></center><br>"
	."<table border=\"1\" width=\"100%\" align=\"center\"><tr>"
	."<td bgcolor=\"$bgcolor2\" align=\"center\"><b>" . _ID . "</b></td>"
	."<td bgcolor=\"$bgcolor2\" align=\"center\"><b>" . _CATEGORIES . "</b></td>"
	."<td bgcolor=\"$bgcolor2\" align=\"center\"><b>" . _LANGUAGE . "</b></td>"
	."<td bgcolor=\"$bgcolor2\" align=\"center\"><b>" . _FUNCTIONS . "</b></td></tr><tr>";
    $result = $db->sql_query("select id_cat, categories, flanguage from ".$prefix."_faqcategories order by id_cat");
    while ($row = $db->sql_fetchrow($result)) {
	$id_cat = $row['id_cat'];
	$categories = $row['categories'];
	$flanguage = $row['flanguage'];
	if ($flanguage == "") {
	    $flanguage = _ALL;
	}
	echo "<td align=\"center\">$id_cat</td>"
	    ."<td align=\"center\">$categories</td>"
	    ."<td align=\"center\">$flanguage</td>"
	    ."<td align=\"center\">[ <a href=\"admin.php?op=FaqCatGo&amp;id_cat=$id_cat\">" . _CONTENT . "</a> | <a href=\"admin.php?op=FaqCatEdit&amp;id_cat=$id_cat\">" . _EDIT . "</a> | <a href=\"admin.php?op=FaqCatDel&amp;id_cat=$id_cat&amp;ok=0\">" . _DELETE . "</a> ]</td><tr>";
    }
    echo "</td></tr></table>";
    CloseTable();
    echo "<br>";
    OpenTable();
    echo "<center><font class=\"option\"><b>" . _ADDCATEGORY . "</b></font></center><br>"
	."<form action=\"admin.php\" method=\"post\">"
	."<table border=\"0\" width=\"100%\"><tr><td>"
	."" . _CATEGORIES . ":</td><td><input type=\"text\" name=\"categories\" size=\"30\"></td>";
    if ($multilingual == 1) {
	echo "<tr><td>" . _LANGUAGE . ":</td><td>"
	    ."<select name=\"flanguage\">";
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
		if($languageslist[$i]==$currentlang) echo "selected";
		echo ">".ucfirst($languageslist[$i])."</option>\n";
	    }
	}
	echo "</select></td>";
    } else {
	echo "<input type=\"hidden\" name=\"flanguage\" value=\"$language\">";
    }
	echo "</tr></table>"
	."<input type=\"hidden\" name=\"op\" value=\"FaqCatAdd\">"
	."<input type=\"submit\" value=" . _SAVE . ">"
	."</form>";
    CloseTable();
    include("footer.php");
}

function FaqCatGo($id_cat) {
    global $admin, $bgcolor2, $prefix, $db;
    include ("header.php");
    GraphicAdmin();
    OpenTable();
    echo "<center><font class=\"title\"><b>" . _FAQADMIN . "</b></font></center>";
    CloseTable();
    echo "<br>";
    OpenTable();
    echo "<center><font class=\"option\"><b>" . _QUESTIONS . "</b></font></center><br>"
	."<table border=1 width=100% align=\"center\"><tr>"
	."<td bgcolor=\"$bgcolor2\" align=\"center\">" . _CONTENT . "</td>"
	."<td bgcolor=\"$bgcolor2\" align=\"center\">" . _FUNCTIONS . "</td></tr>";
    $id_cat = intval($id_cat);
    $result = $db->sql_query("select id, question, answer from ".$prefix."_faqanswer where id_cat='$id_cat' order by id");
    while ($row = $db->sql_fetchrow($result)) {
	$id = intval($row['id']);
	$question = $row['question'];
	$answer = $row['answer'];
	echo "<tr><td><i>$question</i><br><br>$answer"
	    ."</td><td align=\"center\">[ <a href=\"admin.php?op=FaqCatGoEdit&amp;id=$id\">" . _EDIT . "</a> | <a href=\"admin.php?op=FaqCatGoDel&amp;id=$id&amp;ok=0\">" . _DELETE . "</a> ]</td></tr>"
	    ."</td></tr>";
    }
    echo "</table>";
    CloseTable();
    echo "<br>";
    OpenTable();
    echo "<center><font class=\"option\"><b>" . _ADDQUESTION . "</b></center><br>"
	."<form action=\"admin.php\" method=\"post\">"
	."<table border=\"0\" width=\"100%\"><tr><td>"
	."" . _QUESTION . ":</td><td><input type=\"text\" name=\"question\" size=\"40\"></td></tr><tr><td>"
	."" . _ANSWER . " </td><td><textarea name=\"answer\" cols=\"60\" rows=\"10\"></textarea>"
	."</td></tr></table>"
	."<input type=\"hidden\" name=\"id_cat\" value=\"$id_cat\">"
	."<input type=\"hidden\" name=\"op\" value=\"FaqCatGoAdd\">"
	."<input type=\"submit\" value=" . _SAVE . "> " . _GOBACK . ""
	."</form>";
    CloseTable();
    include("footer.php");
}

function FaqCatEdit($id_cat) {
    global $admin, $db, $multilingual;
    include ("config.php");
    include ("header.php");
    GraphicAdmin();
    OpenTable();
    echo "<center><font class=\"title\"><b>" . _FAQADMIN . "</b></font></center>";
    CloseTable();
    echo "<br>";
    $id_cat = intval($id_cat);
    $row = $db->sql_fetchrow($db->sql_query("SELECT categories, flanguage from " . $prefix . "_faqcategories where id_cat='$id_cat'"));
    $categories = $row['categories'];
    $flanguage = $row['flanguage'];
    OpenTable();
    echo "<center><font class=\"option\"><b>" . _EDITCATEGORY . "</b></font></center>"
	."<form action=\"admin.php\" method=\"post\">"
	."<input type=\"hidden\" name=\"id_cat\" value=\"$id_cat\">"
	."<table border=\"0\" width=\"100%\"><tr><td>"
	."" . _CATEGORIES . ":</td><td><input type=\"text\" name=\"categories\" size=\"31\" value='$categories'></td>";
    if ($multilingual == 1) {
	echo "<tr><td>" . _LANGUAGE . ":</td><td>"
	    ."<select name=\"flanguage\">";
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
		echo "<option name=\"flanguage\" value=\"$languageslist[$i]\" ";
		if($languageslist[$i]==$flanguage) echo "selected";
		echo ">".ucfirst($languageslist[$i])."</option>\n";
	    }
	}
	echo "</select></td>";
    } else {
	echo "<input type=\"hidden\" name=\"flanguage\" value=\"$language\">";
    }
	echo "</tr></table>"
	."<input type=\"hidden\" name=\"op\" value=\"FaqCatSave\">"
	."<input type=\"submit\" value=\""._SAVE."\"> "._GOBACK.""
	."</form>";
    CloseTable();
    include("footer.php");
}

function FaqCatGoEdit($id) {
    global $admin, $bgcolor2, $prefix, $db;
    include ("header.php");
    GraphicAdmin();
    OpenTable();
    echo "<center><font class=\"title\"><b>" . _FAQADMIN . "</b></font></center>";
    CloseTable();
    echo "<br>";
    $id = intval($id);
    $row = $db->sql_fetchrow($db->sql_query("SELECT question, answer from " . $prefix . "_faqanswer where id='$id'"));
    $question = $row['question'];
    $answer = $row['answer'];
    OpenTable();
    echo "<center><font class=\"option\"><b>" . _EDITQUESTIONS . "</b></font></center>"
	."<form action=\"admin.php\" method=\"post\">"
	."<input type=\"hidden\" name=\"id\" value=\"$id\">"
	."<table border=\"0\" width=\"100%\"><tr><td>"
	."" . _QUESTION . ":</td><td><input type=\"text\" name=\"question\" size=\"31\" value=\"$question\"></td></tr><tr><td>"
	."" . _ANSWER . ":</td><td><textarea name=\"answer\" cols=60 rows=5>$answer</textarea>"
	."</td></tr></table>"
	."<input type=\"hidden\" name=\"op\" value=\"FaqCatGoSave\">"
	."<input type=\"submit\" value=" . _SAVE . "> " . _GOBACK . ""
	."</form>";
    CloseTable();
    include("footer.php");
}


function FaqCatSave($id_cat, $categories, $flanguage) {
    global $prefix, $db;
    $categories = stripslashes(FixQuotes($categories));
    $id_cat = intval($id_cat);
    $db->sql_query("update ".$prefix."_faqcategories set categories='$categories', flanguage='$flanguage' where id_cat='$id_cat'");
    Header("Location: admin.php?op=FaqAdmin");
}

function FaqCatGoSave($id, $question, $answer) {
    global $prefix, $db;
    $question = stripslashes(FixQuotes($question));
    $answer = stripslashes(FixQuotes($answer));
    $id = intval($id);
    $db->sql_query("update ".$prefix."_faqanswer set question='$question', answer='$answer' where id='$id'");
    Header("Location: admin.php?op=FaqAdmin");
}

function FaqCatAdd($categories, $flanguage) {
    global $prefix, $db;
    $categories = stripslashes(FixQuotes($categories));
    $db->sql_query("insert into ".$prefix."_faqcategories values (NULL, '$categories', '$flanguage')");
    Header("Location: admin.php?op=FaqAdmin");
}

function FaqCatGoAdd($id_cat, $question, $answer) {
    global $prefix, $db;
    $question = stripslashes(FixQuotes($question));
    $answer = stripslashes(FixQuotes($answer));
    $db->sql_query("insert into ".$prefix."_faqanswer values (NULL, '$id_cat', '$question', '$answer')");
    Header("Location: admin.php?op=FaqCatGo&id_cat=$id_cat");
}

function FaqCatDel($id_cat, $ok=0) {
    global $prefix, $db;
    if($ok==1) {
    $id_cat = intval($id_cat);
	$db->sql_query("delete from ".$prefix."_faqcategories where id_cat='$id_cat'");
	$db->sql_query("delete from ".$prefix."_faqanswer where id_cat='$id_cat'");
	Header("Location: admin.php?op=FaqAdmin");
    } else {
	include("header.php");
	GraphicAdmin();
	OpenTable();
	echo "<center><font class=\"title\"><b>" . _FAQADMIN . "</b></font></center>";
	CloseTable();
	echo "<br>";
	OpenTable();
	echo "<br><center><b>" . _FAQDELWARNING . "</b><br><br>";
    }
	echo "[ <a href=\"admin.php?op=FaqCatDel&amp;id_cat=$id_cat&amp;ok=1\">" . _YES . "</a> | <a href=\"admin.php?op=FaqAdmin\">" . _NO . "</a> ]</center><br><br>";
	CloseTable();
	include("footer.php");
}

function FaqCatGoDel($id, $ok=0) {
    global $prefix, $db;
    if($ok==1) {
    $id = intval($id);
	$db->sql_query("delete from ".$prefix."_faqanswer where id='$id'");
	Header("Location: admin.php?op=FaqAdmin");
    } else {
	include("header.php");
	GraphicAdmin();
	OpenTable();
	echo "<center><font class=\"title\"><b>" . _FAQADMIN . "</b></font></center>";
	CloseTable();
	echo "<br>";
	OpenTable();
	echo "<br><center><b>" . _QUESTIONDEL . "</b><br><br>";
    }
	echo "[ <a href=\"admin.php?op=FaqCatGoDel&amp;id=$id&amp;ok=1\">" . _YES . "</a> | <a href=\"admin.php?op=FaqAdmin\">" . _NO . "</a> ]</center><br><br>";
	CloseTable();
	include("footer.php");
}

switch($op) {

    case "FaqCatSave":
    FaqCatSave($id_cat, $categories, $flanguage); /* Multilingual Code : added variable */
    break;

    case "FaqCatGoSave":
    FaqCatGoSave($id, $question, $answer);
    break;

    case "FaqCatAdd":
    FaqCatAdd($categories, $flanguage); /* Multilingual Code : added variable */
    break;

    case "FaqCatGoAdd":
    FaqCatGoAdd($id_cat, $question, $answer);
    break;

    case "FaqCatEdit":
    FaqCatEdit($id_cat);
    break;

    case "FaqCatGoEdit":
    FaqCatGoEdit($id);
    break;

    case "FaqCatDel":
    FaqCatDel($id_cat, $ok);
    break;

    case "FaqCatGoDel":
    FaqCatGoDel($id, $ok);
    break;

    case "FaqAdmin":
    FaqAdmin();
    break;

    case "FaqCatGo":
    FaqCatGo($id_cat);
    break;
}

} else {
	include("header.php");
	GraphicAdmin();
	OpenTable();
	echo "<center><b>"._ERROR."</b><br><br>You do not have administration permission for module \"$module_name\"</center>";
	CloseTable();
	include("footer.php");
}
# $Log: index.php,v $
# Revision 1.3  2004/12/09 23:03:48  chatserv
# http://www.nukefixes.com/ftopicp-3479.html#3479
#
# Revision 1.2  2004/11/24 23:19:55  chatserv
# Version 2.7 Release
#
# Revision 1.1  2004/10/05 18:04:50  chatserv
# Initial CVS Addition
#

?>