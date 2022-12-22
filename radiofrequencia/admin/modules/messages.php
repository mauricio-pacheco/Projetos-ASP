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
/* Messages Functions                                    */
/*********************************************************/

function MsgDeactive($mid) {
    global $prefix, $db;
    $mid = intval($mid);
    $db->sql_query("update " . $prefix . "_message set active='0' WHERE mid='$mid'");
    Header("Location: admin.php?op=messages");
}

function messages() {
    global $admin, $admlanguage, $language, $bgcolor1, $bgcolor2, $prefix, $db, $multilingual;
    include ("header.php");
    GraphicAdmin();
    OpenTable();
    echo "<center><font class=\"title\"><b>" . _MESSAGESADMIN . "</b></font></center>";
    CloseTable();
    echo "<br>";
    if ($admlanguage == "") {
    	$admlanguage = $language; /* This to make sure some language is pre-selected */
    }
    OpenTable();
    echo "<center><font class=\"title\"><b>" . _ALLMESSAGES . "</b></font><br><br><table border=\"0\" width=\"100%\" bgcolor=\"$bgcolor1\">"
	."<td bgcolor=\"$bgcolor2\" align=\"center\"><b>" . _ID . "</b></td>"
	."<td bgcolor=\"$bgcolor2\" align=\"center\"><b>" . _TITLE . "</b></td>"
	."<td bgcolor=\"$bgcolor2\" align=\"center\">&nbsp;<b>" . _LANGUAGE . "</b>&nbsp;</td>"
	."<td bgcolor=\"$bgcolor2\" align=\"center\" nowrap>&nbsp;<b>" . _VIEW . "</b>&nbsp;</td>"
	."<td bgcolor=\"$bgcolor2\" align=\"center\">&nbsp;<b>" . _ACTIVE . "</b>&nbsp;</td>"
	."<td bgcolor=\"$bgcolor2\" align=\"center\">&nbsp;<b>" . _FUNCTIONS . "</b>&nbsp;</td></tr>";
//    $result = $db->sql_query("SELECT mid, title, content, date, expire, active, view, mlanguage from " . $prefix . "_message");
//    while ($row = $db->sql_fetchrow($result)) {
//    $mid = intval($row['mid']);
	$result = $db->sql_query("SELECT * from " . $prefix . "_message");
    while ($row = $db->sql_fetchrow($result)) {
    $groups = $row['groups'];
    $mid = intval($row['mid']);
    $title = $row['title'];
    $content = $row['content'];
    $mdate = $row['date'];
    $expire = intval($row['expire']);
    $active = intval($row['active']);
    $view = intval($row['view']);
    $mlanguage = $row['mlanguage'];
    if ($active == 1) {
	$mactive = "" . _YES . "";
    } elseif ($active == 0) {
	$mactive = "" . _NO . "";
    }
    if ($view == 1) { 
   $mview = "" . _MVALL . ""; 
    } elseif ($view == 2) { 
   $mview = "" . _MVANON . ""; 
    } elseif ($view == 3) { 
   $mview = "" . _MVUSERS . ""; 
//    } elseif ($view == 4) {
//   $mview = "" . _MVADMIN . ""; 
//    } elseif ($view == 5) {
//   $mview = ""._SUBUSERS."";
//    }
	} elseif ($view == 4) {
   $mview = "" . _MVADMIN . ""; 
    } elseif ($view == 5) {
   $mview = ""._SUBUSERS."";
    } elseif ($view > 5) {
    $mview = _MVGROUPS;
    }
	if ($mlanguage == "") {
	$mlanguage = "" . _ALL . "";
	}
	echo "<tr><td align=\"right\"><b>$mid</b>"
	    ."</td><td align=\"left\" width=\"100%\"><b>$title</b>"
	    ."</td><td align=\"center\">$mlanguage"
	    ."</td><td align=\"center\" nowrap>$mview"
	    ."</td><td align=\"center\">$mactive"
	    ."</td><td align=\"right\" nowrap>(<a href=\"admin.php?op=editmsg&mid=$mid\">" . _EDIT . "</a>-<a href=\"admin.php?op=deletemsg&mid=$mid\">" . _DELETE . "</a>)"
	    ."</td></tr>";

    }
    echo "</table></center><br>";
    CloseTable();
    echo "<br>";
    OpenTable();
    echo "<center><font class=\"title\"><b>" . _ADDMSG . "</b></font></center><br>";
    echo "<form action=\"admin.php\" method=\"post\">"
	."<br><b>" . _MESSAGETITLE . ":</b><br>"
	."<input type=\"text\" name=\"add_title\" value=\"\" size=\"50\" maxlength=\"100\"><br><br>"
	."<b>" . _MESSAGECONTENT . ":</b><br>"
	."<textarea name=\"add_content\" rows=\"15\" wrap=\"virtual\" cols=\"60\"></textarea><br><br>";
    if ($multilingual == 1) {
	echo "<b>" . _LANGUAGE . ": </b>"
	    ."<select name=\"add_mlanguage\">";
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
	echo "<option value=\"\">" . _ALL . "</option></select><br><br>";
    } else {
	echo "<input type=\"hidden\" name=\"add_mlanguage\" value=\"\">";
    }
    $now = time();
    echo "<b>" . _EXPIRATION . ":</b> <select name=\"add_expire\">"
	."<option value=\"86400\" >1 " . _DAY . "</option>"
	."<option value=\"172800\" >2 " . _DAYS . "</option>"
	."<option value=\"432000\" >5 " . _DAYS . "</option>"
	."<option value=\"1296000\" >15 " . _DAYS . "</option>"
	."<option value=\"2592000\" >30 " . _DAYS . "</option>"
	."<option value=\"0\" >" . _UNLIMITED . "</option>"
	."</select><br><br>"
	."<b>Active?</b> <input type=\"radio\" name=\"add_active\" value=\"1\" checked>" . _YES . " "
	."<input type=\"radio\" name=\"add_active\" value=\"0\" >" . _NO . "";
    echo "<br><br><b>" . _VIEWPRIV . "</b> <select name=\"add_view\">"
	."<option value=\"1\" >" . _MVALL . "</option>"
	."<option value=\"2\" >" . _MVANON . "</option>"
	."<option value=\"3\" >" . _MVUSERS . "</option>"
	."<option value=\"4\" >" . _MVADMIN . "</option>"
//	."<option value=\"5\" >" . _SUBUSERS . "</option>"
//	."</select><br><br>"
	."<option value=\"5\" >" . _SUBUSERS . "</option>"
    ."<option value=\"6\">"._MVGROUPS."</option>"
	."</select><br><br>"
    ."<font class='tiny'>"._WHATGRDESC."</font><br><b>"._WHATGROUPS."</b> <select name='add_groups[]' multiple size='5'>\n";
    $groupsResult = $db->sql_query("select gid, gname from ".$prefix."_nsngr_groups");
    while(list($gid, $gname) = $db->sql_fetchrow($groupsResult)) { echo "<OPTION VALUE='$gid'>$gname</option>\n"; }
    echo "</select><br><br>\n"
	."<input type=\"hidden\" name=\"op\" value=\"addmsg\">"
	."<input type=\"hidden\" name=\"add_mdate\" value=\"$now\">"
	."<input type=\"submit\" value=\"" . _ADDMSG . "\">"
	."</form>";
    CloseTable();
    include ("footer.php");
}

function editmsg($mid) {
    global $admin, $prefix, $db, $multilingual;
    include ("header.php");
    $mid = intval($mid);
    GraphicAdmin();
    OpenTable();
    echo "<center><font class=\"title\"><b>" . _MESSAGESADMIN . "</b></font></center>";
    CloseTable();
    echo "<br>";
//    $row = $db->sql_fetchrow($db->sql_query("SELECT title, content, date, expire, active, view, mlanguage from " . $prefix . "_message WHERE mid='$mid'"));
//    $title = $row['title'];
	$row = $db->sql_fetchrow($db->sql_query("SELECT * from " . $prefix . "_message WHERE mid='$mid'"));
    $groups = $row['groups'];
    $title = $row['title'];
    $content = $row['content'];
    $mdate = $row['date'];
    $expire = intval($row['expire']);
    $active = intval($row['active']);
    $view = intval($row['view']);
    $mlanguage = $row['mlanguage'];
    OpenTable();
    echo "<center><font class=\"title\"><b>" . _EDITMSG . "</b></font></center>";
    if ($active == 1) {
	$asel1 = "checked";
	$asel2 = "";
    } elseif ($active == 0) {
	$asel1 = "";
	$asel2 = "checked";
    }
/*    if ($view == 1) {
	$sel1 = "selected";
	$sel2 = "";
	$sel3 = "";
	$sel4 = "";
	$sel5 = "";
    } elseif ($view == 2) {
	$sel1 = "";
	$sel2 = "selected";
	$sel3 = "";
	$sel4 = "";
	$sel5 = "";
    } elseif ($view == 3) {
	$sel1 = "";
	$sel2 = "";
	$sel3 = "selected";
	$sel4 = "";
	$sel5 = "";
    } elseif ($view == 4) {
	$sel1 = "";
	$sel2 = "";
	$sel3 = "";
	$sel4 = "selected";
	$sel5 = "";
    } elseif ($view == 5) {
	$sel1 = "";
	$sel2 = "";
	$sel3 = "";
	$sel4 = "";
	$sel5 = "selected";
    } */
	if ($view == 1) {
	$sel1 = "selected";
	$sel2 = "";
	$sel3 = "";
	$sel4 = "";
	$sel5 = "";
	$sel6 = "";
    } elseif ($view == 2) {
	$sel1 = "";
	$sel2 = "selected";
	$sel3 = "";
	$sel4 = "";
	$sel5 = "";
	$sel6 = "";
    } elseif ($view == 3) {
	$sel1 = "";
	$sel2 = "";
	$sel3 = "selected";
	$sel4 = "";
	$sel5 = "";
	$sel6 = "";
    } elseif ($view == 4) {
	$sel1 = "";
	$sel2 = "";
	$sel3 = "";
	$sel4 = "selected";
	$sel5 = "";
	$sel6 = "";
    } elseif ($view == 5) {
	$sel1 = "";
	$sel2 = "";
	$sel3 = "";
	$sel4 = "";
	$sel5 = "selected";
	$sel6 = "";
    } elseif ($view > 5) {
	$sel1 = "";
	$sel2 = "";
	$sel3 = "";
	$sel4 = "";
	$sel5 = "";
	$sel6 = "selected";
    }
    if ($expire == 86400) {
	$esel1 = "selected";
	$esel2 = "";
	$esel3 = "";
	$esel4 = "";
	$esel5 = "";
	$esel6 = "";
    } elseif ($expire == 172800) {
	$esel1 = "";
	$esel2 = "selected";
	$esel3 = "";
	$esel4 = "";
	$esel5 = "";
	$esel6 = "";
    } elseif ($expire == 432000) {
	$esel1 = "";
	$esel2 = "";
	$esel3 = "selected";
	$esel4 = "";
	$esel5 = "";
	$esel6 = "";
    } elseif ($expire == 1296000) {
	$esel1 = "";
	$esel2 = "";
	$esel3 = "";
	$esel4 = "selected";
	$esel5 = "";
	$esel6 = "";
    } elseif ($expire == 2592000) {
	$esel1 = "";
	$esel2 = "";
	$esel3 = "";
	$esel4 = "";
	$esel5 = "selected";
	$esel6 = "";
    } elseif ($expire == 0) {
	$esel1 = "";
	$esel2 = "";
	$esel3 = "";
	$esel4 = "";
	$esel5 = "";
	$esel6 = "selected";
    }
    echo "<form action=\"admin.php\" method=\"post\">"
	."<br><b>" . _MESSAGETITLE . ":</b><br>"
	."<input type=\"text\" name=\"title\" value=\"$title\" size=\"50\" maxlength=\"100\"><br><br>"
	."<b>" . _MESSAGECONTENT . ":</b><br>"
	."<textarea name=\"content\" rows=\"15\" wrap=\"virtual\" cols=\"60\">$content</textarea><br><br>";
    if ($multilingual == 1) {
	echo "<b>" . _LANGUAGE . ": </b>"
	    ."<select name=\"mlanguage\">";
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
		if($languageslist[$i]==$mlanguage) echo "selected";
		echo ">".ucfirst($languageslist[$i])."</option>\n";
	    }
	}
	if ($mlanguage == "") {
	    $sellang = "selected";
	} else {
    	    $sellang = "";
	}
	echo "<option value=\"\" $sellang>" . _ALL . "</option></select><br><br>";
    } else {
	echo "<input type=\"hidden\" name=\"mlanguage\" value=\"\">";
    }
    echo "<b>" . _EXPIRATION . ":</b> <select name=\"expire\">"
	."<option name=\"expire\" value=\"86400\" $esel1>1 " . _DAY . "</option>"
	."<option name=\"expire\" value=\"172800\" $esel2>2 " . _DAYS . "</option>"
	."<option name=\"expire\" value=\"432000\" $esel3>5 " . _DAYS . "</option>"
	."<option name=\"expire\" value=\"1296000\" $esel4>15 " . _DAYS . "</option>"
	."<option name=\"expire\" value=\"2592000\" $esel5>30 " . _DAYS . "</option>"
	."<option name=\"expire\" value=\"0\" $esel6>" . _UNLIMITED . "</option>"
	."</select><br><br>"
	."<b>Active?</b> <input type=\"radio\" name=\"active\" value=\"1\" $asel1>" . _YES . " "
	."<input type=\"radio\" name=\"active\" value=\"0\" $asel2>" . _NO . "";
    if ($active == 1) {
	echo "<br><br><b>" . _CHANGEDATE . "</b>"
	    ."<input type=\"radio\" name=\"chng_date\" value=\"1\">" . _YES . " "
	    ."<input type=\"radio\" name=\"chng_date\" value=\"0\" checked>" . _NO . "<br><br>";
    } elseif ($active == 0) {
	echo "<br><font class=\"tiny\">" . _IFYOUACTIVE . "</font><br><br>"
	    ."<input type=\"hidden\" name=\"chng_date\" value=\"1\">";
    }
/*    echo "<b>" . _VIEWPRIV . "</b> <select name=\"view\">"
	."<option name=\"view\" value=\"1\" $sel1>" . _MVALL . "</option>"
	."<option name=\"view\" value=\"2\" $sel2>" . _MVANON . "</option>"
	."<option name=\"view\" value=\"3\" $sel3>" . _MVUSERS . "</option>"
	."<option name=\"view\" value=\"4\" $sel4>" . _MVADMIN . "</option>"
	."<option name=\"view\" value=\"5\" $sel5>" . _SUBUSERS . "</option>"
	."</select><br><br>" */
	echo "<b>" . _VIEWPRIV . "</b> <select name=\"view\">"
	."<option name=\"view\" value=\"1\" $sel1>" . _MVALL . "</option>"
	."<option name=\"view\" value=\"2\" $sel2>" . _MVANON . "</option>"
	."<option name=\"view\" value=\"3\" $sel3>" . _MVUSERS . "</option>"
	."<option name=\"view\" value=\"4\" $sel4>" . _MVADMIN . "</option>"
	."<option name=\"view\" value=\"5\" $sel5>" . _SUBUSERS . "</option>"
        ."<option name=\"view\" value=\"6\" $sel6>"._MVGROUPS."</option>"
	."</select><br><br>"
        ."<font class='tiny'>"._WHATGRDESC."</font><br><b>"._WHATGROUPS."</b> <select name='groups[]' multiple size='5'>";
    $ingroups = explode("-",$groups);
    $groupsResult = $db->sql_query("select gid, gname from ".$prefix."_nsngr_groups");
    while(list($gid, $gname) = $db->sql_fetchrow($groupsResult)) {
        if(in_array($gid,$ingroups) AND $view > 5) { $sel = " selected"; } else { $sel = ""; }
        echo "<OPTION VALUE='$gid'$sel>$gname</option>";
    }
    echo "</select><br /><br />"
	."<input type=\"hidden\" name=\"mdate\" value=\"$mdate\">"
	."<input type=\"hidden\" name=\"mid\" value=\"$mid\">"
	."<input type=\"hidden\" name=\"op\" value=\"savemsg\">"
	."<input type=\"submit\" value=\"" . _SAVECHANGES . "\">"
	."</form>";
    CloseTable();
    include ("footer.php");
}

/* function savemsg($mid, $title, $content, $mdate, $expire, $active, $view, $chng_date, $mlanguage) {
    global $prefix, $db;
    $mid = intval($mid); */
function savemsg($mid, $title, $content, $mdate, $expire, $active, $view, $groups, $chng_date, $mlanguage) {
    global $prefix, $db;
    if($view == 6) { $ingroups = implode("-",$groups); }
    if($view < 6) { $ingroups = ""; }
    $mid = intval($mid);
    $title = stripslashes(FixQuotes($title));
    $content = stripslashes(FixQuotes($content));
    if ($chng_date == 1) {
	$newdate = time();
    } elseif ($chng_date == 0) {
	$newdate = $mdate;
    }
//    $result = $db->sql_query("update " . $prefix . "_message set title='$title', content='$content', date='$newdate', expire='$expire', active='$active', view='$view', mlanguage='$mlanguage' WHERE mid='$mid'");
    $result = $db->sql_query("update " . $prefix . "_message set title='$title', content='$content', date='$newdate', expire='$expire', active='$active', view='$view', groups='$ingroups', mlanguage='$mlanguage' WHERE mid='$mid'");
	Header("Location: admin.php?op=messages");
}

/* function addmsg($add_title, $add_content, $add_mdate, $add_expire, $add_active, $add_view, $add_mlanguage) {
    global $prefix, $db;
    $title = stripslashes(FixQuotes($add_title)); */
function addmsg($add_title, $add_content, $add_mdate, $add_expire, $add_active, $add_view, $add_groups, $add_mlanguage) {
    global $prefix, $db;
    if($add_view == 6) { $ingroups = implode("-",$add_groups); }
    if($add_view < 6) { $ingroups = ""; }
    $title = stripslashes(FixQuotes($add_title));
    $content = stripslashes(FixQuotes($add_content));
//    $result = $db->sql_query("insert into " . $prefix . "_message values (NULL, '$add_title', '$add_content', '$add_mdate', '$add_expire', '$add_active', '$add_view', '$add_mlanguage')");
    $result = $db->sql_query("insert into " . $prefix . "_message values (NULL, '$add_title', '$add_content', '$add_mdate', '$add_expire', '$add_active', '$add_view', '$ingroups', '$add_mlanguage')");
	if (!$result) {
	exit();
    }
    Header("Location: admin.php?op=messages");
}

function deletemsg($mid, $ok=0) {
    global $prefix, $db;
    if($ok) {
	$result = $db->sql_query("delete from " . $prefix . "_message where mid='$mid'");
    	if (!$result) {
	    return;
    	}
	Header("Location: admin.php?op=messages");
    } else {
	include("header.php");
	GraphicAdmin();
	OpenTable();
	echo "<center><font size=\"4\"><b>" . _MESSAGESADMIN . "</b></font></center>";
	CloseTable();
	echo "<br>";
	OpenTable();
	echo "<center>" . _REMOVEMSG . "";
	echo "<br><br>[ <a href=\"admin.php?op=messages\">" . _NO . "</a> | <a href=\"admin.php?op=deletemsg&amp;mid=$mid&amp;ok=1\">" . _YES . "</a> ]</center>";
    	CloseTable();
	include("footer.php");
    }
}

switch ($op){

    case "messages":
    messages();
    break;

    case "editmsg":
    editmsg($mid, $title, $content, $mdate, $expire, $active, $view, $chng_date, $mlanguage);
    break;

    case "addmsg":
//    addmsg($add_title, $add_content, $add_mdate, $add_expire, $add_active, $add_view, $add_mlanguage);
	addmsg($add_title, $add_content, $add_mdate, $add_expire, $add_active, $add_view, $add_groups, $add_mlanguage);
    break;

    case "deletemsg":
    deletemsg($mid, $ok);
    break;

    case "savemsg":
//    savemsg($mid, $title, $content, $mdate, $expire, $active, $view, $chng_date, $mlanguage);
	savemsg($mid, $title, $content, $mdate, $expire, $active, $view, $groups, $chng_date, $mlanguage);
    break;

}

} else {
    echo "Access Denied";
}
# $Log: messages.php,v $
# Revision 1.3  2004/12/07 22:20:10  chatserv
# http://www.nukefixes.com/ftopicp-3479.html#3479
#
# Revision 1.2  2004/11/24 22:40:13  chatserv
# Version 2.7 Release
#
# Revision 1.1  2004/10/04 23:27:53  chatserv
# Initial CVS Addition
#

?>