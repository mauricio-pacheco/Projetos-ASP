<?php

# $Author: chatserv $
# $Date: 2004/12/08 00:22:34 $
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

if (!stristr($_SERVER['SCRIPT_NAME'], "modules.php")) {
    die ("You can't access this file directly...");
}
require_once("mainfile.php");
$optionbox = "";
$module_name = basename(dirname(__FILE__));
get_lang($module_name);

if (stristr($REQUEST_URI,"mainfile")) {
    Header("Location: modules.php?name=$module_name&file=article&sid=$sid");
} elseif (!isset($sid) && !isset($tid)) {
    Header("Location: index.php");
}
if (isset($sid)) $sid=intval($sid); 
if (isset($tid)) $tid=intval($tid);
if ($save AND is_user($user)) {
    cookiedecode($user);
    $db->sql_query("UPDATE ".$user_prefix."_users SET umode='$mode', uorder='$order', thold='$thold' where uid='$cookie[0]'");
    getusrinfo($user);
    $info = base64_encode("$userinfo[user_id]:$userinfo[username]:$userinfo[user_password]:$userinfo[storynum]:$userinfo[umode]:$userinfo[uorder]:$userinfo[thold]:$userinfo[noscore]");
    setcookie("user","$info",time()+$cookieusrtime);
}

if ($op == "Reply") {
    Header("Location: modules.php?name=$module_name&file=comments&op=Reply&pid=0&sid=$sid&mode=$mode&order=$order&thold=$thold");
}

$result = $db->sql_query("select catid, aid, time, title, hometext, bodytext, topic, informant, notes, acomm, haspoll, pollID, score, ratings FROM ".$prefix."_stories where sid='$sid'");
if ($numrows = $db->sql_numrows($result) != 1) {
    Header("Location: index.php");
    die();
}
$row = $db->sql_fetchrow($result);
$catid = intval($row['catid']);
$aid = stripslashes($row['aid']);
$time = $row['time'];
$title = stripslashes(check_html($row['title'], "nohtml"));
$hometext = stripslashes($row['hometext']);
$bodytext = stripslashes($row['bodytext']);
$topic = intval($row['topic']);
$informant = stripslashes($row['informant']);
$notes = stripslashes($row['notes']);
$acomm = intval($row['acomm']);
$haspoll = intval($row['haspoll']);
$pollID = intval($row['pollID']);
$score = intval($row['score']);
$ratings = intval($row['ratings']);

if ($aid == "") {
    Header("Location: modules.php?name=$module_name");
}

$db->sql_query("UPDATE ".$prefix."_stories SET counter=counter+1 where sid='$sid'");

$artpage = 1;
$pagetitle = "- $title";
require("header.php");
$artpage = 0;

formatTimestamp($time);
$title = stripslashes(check_html($title, "nohtml"));
$hometext = stripslashes($hometext);
$bodytext = stripslashes($bodytext);
$notes = stripslashes($notes);

if ($notes != "") {
    $notes = "<br><br><b>"._NOTE."</b> <i>$notes</i>";
} else {
    $notes = "";
}

if($bodytext == "") {
    $bodytext = "$hometext$notes";
} else {
    $bodytext = "$hometext<br><br>$bodytext$notes";
}

if($informant == "") {
    $informant = $anonymous;
}

getTopics($sid);

if ($catid != 0) {
    $row2 = $db->sql_fetchrow($db->sql_query("select title from ".$prefix."_stories_cat where catid='$catid'"));
    $title1 = stripslashes(check_html($row2['title'], "nohtml"));
    $title = "<a href=\"modules.php?name=$module_name&amp;file=categories&amp;op=newindex&amp;catid=$catid\"><font class=\"storycat\">$title1</font></a>: $title";
}

echo "<table width=\"100%\" border=\"0\"><tr><td valign=\"top\" width=\"100%\">\n";
themearticle($aid, $informant, $datetime, $title, $bodytext, $topic, $topicname, $topicimage, $topictext);
echo "</td><td>&nbsp;</td><td valign=\"top\">\n";

if ($multilingual == 1) {
    $querylang = "AND (blanguage='$currentlang' OR blanguage='')";
} else {
    $querylang = "";
}

/* Determine if the article has attached a poll */
if ($haspoll == 1) {
    $url = sprintf("modules.php?name=Surveys&amp;op=results&amp;pollID=%d", $pollID);
    $boxContent = "<form action=\"modules.php?name=Surveys\" method=\"post\">";
    $boxContent .= "<input type=\"hidden\" name=\"pollID\" value=\"".$pollID."\">";
    $boxContent .= "<input type=\"hidden\" name=\"forwarder\" value=\"".$url."\">";
    $row3 = $db->sql_fetchrow($db->sql_query("SELECT pollTitle, voters FROM ".$prefix."_poll_desc WHERE pollID='$pollID'"));
    $pollTitle = stripslashes(check_html($row3['pollTitle'], "nohtml"));
    $voters = $row3['voters'];
    $boxTitle = _ARTICLEPOLL;
    $boxContent .= "<font class=\"content\"><b>$pollTitle</b></font><br><br>\n";
    $boxContent .= "<table border=\"0\" width=\"100%\">";
    for($i = 1; $i <= 12; $i++) {
	$result4 = $db->sql_query("SELECT pollID, optionText, optionCount, voteID FROM ".$prefix."_poll_data WHERE (pollID='$pollID') AND (voteID='$i')");
	$row4 = $db->sql_fetchrow($result4);
	$numrows = $db->sql_numrows($result4);
	if($numrows != 0) {
	    $optionText = $row4['optionText'];
	    if($optionText != "") {
		$boxContent .= "<tr><td valign=\"top\"><input type=\"radio\" name=\"voteID\" value=\"".$i."\"></td><td width=\"100%\"><font class=\"content\">$optionText</font></td></tr>\n";
	    }
	}
    }
    $boxContent .= "</table><br><center><font class=\"content\"><input type=\"submit\" value=\""._VOTE."\"></font><br>";
    if (is_user($user)) {
        cookiedecode($user);
    }
    for($i = 0; $i < 12; $i++) {
	$row5 = $db->sql_fetchrow($db->sql_query("SELECT optionCount FROM ".$prefix."_poll_data WHERE (pollID='$pollID') AND (voteID='$i')"));
	$optionCount = $row5['optionCount'];
	$sum = (int)$sum+$optionCount;
    }
    $boxContent .= "<font class=\"content\">[ <a href=\"modules.php?name=Surveys&amp;op=results&amp;pollID=$pollID&amp;mode=$cookie[4]&amp;order=$cookie[5]&amp;thold=$cookie[6]\"><b>"._RESULTS."</b></a> | <a href=\"modules.php?name=Surveys\"><b>"._POLLS."</b></a> ]<br>";

    if ($pollcomm) {
	$result6 = $db->sql_query("select * from ".$prefix."_pollcomments where pollID='$pollID'");
	$numcom = $db->sql_numrows($result6);
	$boxContent .= "<br>"._VOTES.": <b>$sum</b><br>"._PCOMMENTS." <b>$numcom</b>\n\n";
    } else {
        $boxContent .= "<br>"._VOTES." <b>$sum</b>\n\n";
    }
    $boxContent .= "</font></center></form>\n\n";
    themesidebox($boxTitle, $boxContent);
}

$title = stripslashes(check_html($row7['title'], "nohtml"));
$content = stripslashes($row7['content']);
$active = intval($row7['active']);
$position = $row7['bposition'];
$position = substr("$position", 0,1);
if (($active == 1) AND ($position == "r") AND (!is_user($user))) {
    loginbox();
}

global $multilingual, $currentlang;
    if ($multilingual == 1) {
	$querylang = "AND (alanguage='$currentlang' OR alanguage='')"; /* the OR is needed to display stories who are posted to ALL languages */
    } else {
	$querylang = "";
    }

if ($ratings != 0) {
    $rate = substr($score / $ratings, 0, 4);
    $r_image = round($rate);
	if ($r_image == 1) {
    		$the_image = "<br><br><img src=\"images/articles/stars-1.gif\" border=\"1\"></center><br>";
	} elseif ($r_image == 2) {
    		$the_image = "<br><br><img src=\"images/articles/stars-2.gif\" border=\"1\"></center><br>";
	} elseif ($r_image == 3) {
    		$the_image = "<br><br><img src=\"images/articles/stars-3.gif\" border=\"1\"></center><br>";
	} elseif ($r_image == 4) {
    		$the_image = "<br><br><img src=\"images/articles/stars-4.gif\" border=\"1\"></center><br>";
	} elseif ($r_image == 5) {
    		$the_image = "<br><br><img src=\"images/articles/stars-5.gif\" border=\"1\"></center><br>";
	}
} else {
    $rate = 0;
    $the_image = "</center><br>";
}


cookiedecode($user);


if ((($mode != "nocomments") OR ($acomm == 0)) OR ($articlecomm == 1)) {
    include("modules/News/comments.php");
}
include ("footer2.php");
# $Log: article.php,v $
# Revision 1.3  2004/12/08 00:22:34  chatserv
# http://www.nukefixes.com/ftopicp-3479.html#3479
#
# Revision 1.2  2004/11/01 20:49:27  chatserv
# http://www.nukefixes.com/ftopic-1052-0-days0-orderasc-.html
#
# Revision 1.1  2004/10/05 18:05:24  chatserv
# Initial CVS Addition
#

?>