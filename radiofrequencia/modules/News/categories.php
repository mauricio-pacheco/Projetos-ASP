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
$module_name = basename(dirname(__FILE__));
get_lang($module_name);

$index = 1;
$categories = 1;
$cat = $catid;
automated_news();

function theindex($catid) {
    global $storyhome, $httpref, $httprefmax, $topicname, $topicimage, $topictext, $datetime, $user, $cookie, $nukeurl, $prefix, $multilingual, $currentlang, $db, $articlecomm, $module_name;
    if ($multilingual == 1) {
	    $querylang = "AND (alanguage='$currentlang' OR alanguage='')"; /* the OR is needed to display stories who are posted to ALL languages */
    } else {
	    $querylang = "";
    }
    include("header.php");
    if (isset($cookie[3])) {
	$storynum = $cookie[3];
    } else {
	$storynum = $storyhome;
    }
    $catid = intval($catid);
    $db->sql_query("update ".$prefix."_stories_cat set counter=counter+1 where catid='$catid'");
    $result = $db->sql_query("SELECT sid, aid, title, time, hometext, bodytext, comments, counter, topic, informant, notes, acomm, score, ratings FROM ".$prefix."_stories where catid='$catid' $querylang ORDER BY sid DESC limit $storynum");
    while ($row = $db->sql_fetchrow($result)) {
	$s_sid = intval($row['sid']);
	$aid = stripslashes($row['aid']);
	$title = stripslashes(check_html($row['title'], "nohtml"));
	$time = $row['time'];
	$hometext = stripslashes($row['hometext']);
	$bodytext = stripslashes($row['bodytext']);
	$comments = intval($row['comments']);
	$counter = intval($row['counter']);
	$topic = intval($row['topic']);
	$informant = stripslashes($row['informant']);
	$notes = stripslashes($row['notes']);
	$acomm = intval($row['acomm']);
	$score = intval($row['score']);
	$ratings = intval($row['ratings']);
	getTopics($s_sid);
	formatTimestamp($time);
	$subject = stripslashes(check_html($subject, "nohtml"));
	$introcount = strlen($hometext);
	$fullcount = strlen($bodytext);
	$totalcount = $introcount + $fullcount;
	$c_count = $comments;
	$r_options = "";
      if (isset($cookie[4])) { $r_options .= "&amp;mode=$cookie[4]"; }
      if (isset($cookie[5])) { $r_options .= "&amp;order=$cookie[5]"; }
      if (isset($cookie[6])) { $r_options .= "&amp;thold=$cookie[6]"; }
	$story_link = "<a href=\"modules.php?name=News&amp;file=article&amp;sid=$s_sid$r_options\">";
	$morelink = "(";
	if ($fullcount > 0 OR $c_count > 0 OR $articlecomm == 0 OR $acomm == 1) {
	    $morelink .= "$story_link<b>"._READMORE."</b></a> | ";
	} else {
	    $morelink .= "";
	}
	if ($fullcount > 0) { $morelink .= "$totalcount "._BYTESMORE." | "; }
	if ($articlecomm == 1 AND $acomm == 0) {
	    if ($c_count == 0) { $morelink .= "$story_link"._COMMENTSQ."</a>"; } elseif ($c_count == 1) { $morelink .= "$story_link$c_count "._COMMENT."</a>"; } elseif ($c_count > 1) { $morelink .= "$story_link$c_count "._COMMENTS."</a>"; }
	}
	if ($score != 0) {
	    $rated = substr($score / $ratings, 0, 4);
	} else {
	    $rated = 0;
	}
	$morelink .= " | "._SCORE." $rated";
	$morelink .= ")";
	$morelink = str_replace(" |  | ", " | ", $morelink);
	$sid = intval($s_sid);
	$row2 = $db->sql_fetchrow($db->sql_query("select title from ".$prefix."_stories_cat where catid='$catid'"));
	$title1 = stripslashes(check_html($row2['title'], "nohtml"));
	
	$title = "$title1: $title";
	themeindex($aid, $informant, $datetime, $title, $counter, $topic, $hometext, $notes, $morelink, $topicname, $topicimage, $topictext);
    }
    if ($httpref==1) {
	$referer = $_SERVER["HTTP_REFERER"];
	if ($referer=="" OR ereg("unknown", $referer) OR eregi($nukeurl,$referer)) {
	} else {
	    $db->sql_query("insert into ".$prefix."_referer values (NULL, '$referer')");
	}
	$numrows = $db->sql_numrows($db->sql_query("select * from ".$prefix."_referer"));
	if($numrows==$httprefmax) {
    	    $db->sql_query("delete from ".$prefix."_referer");
	}
    }
    include("footer.php");
}

switch ($op) {

    case "newindex":
	if ($catid == 0 OR $catid == "") {
	    Header("Location: modules.php?name=$module_name");
	}
	theindex($catid);
    break;

    default:
    Header("Location: modules.php?name=$module_name");

}
# $Log: categories.php,v $
# Revision 1.2  2004/12/08 00:22:34  chatserv
# http://www.nukefixes.com/ftopicp-3479.html#3479
#
# Revision 1.1  2004/10/05 18:05:24  chatserv
# Initial CVS Addition
#

?>