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
$index=1;
get_lang($module_name);

function theindex($new_topic=0) {
    global $db, $storyhome, $topicname, $topicimage, $topictext, $datetime, $user, $cookie, $nukeurl, $prefix, $multilingual, $currentlang, $articlecomm, $sitename, $user_news;
    if ($multilingual == 1) {
	$querylang = "AND (alanguage='$currentlang' OR alanguage='')";
    } else {
	$querylang = "";
    }
    include("header.php");
    automated_news();
    if (isset($new_topic)) {
    $new_topic = intval($new_topic);
    } else {
    $new_topic == 0;
    }
    if (isset($cookie[3]) AND $user_news == 1) {
	$storynum = $cookie[3];
    } else {
	$storynum = $storyhome;
    }
    if ($new_topic == 0) {
	$qdb = "WHERE (ihome='0' OR catid='0')";
	$home_msg = "";
    } else {
	$qdb = "WHERE topic='$new_topic'";
	$result_a = $db->sql_query("SELECT topictext FROM ".$prefix."_topics WHERE topicid='$new_topic'");
	$row_a = $db->sql_fetchrow($result_a);	
	$numrows_a = $db->sql_numrows($result_a);
	$topic_title = stripslashes(check_html($row_a['topictext'], "nohtml"));
	OpenTable();
	if ($numrows_a == 0) {
	    echo "<center><font class=\"title\">$sitename</font><br><br>"._NOINFO4TOPIC."<br><br>[ <a href=\"modules.php?name=News\">"._GOTONEWSINDEX."</a> | <a href=\"modules.php?name=Topics\">"._SELECTNEWTOPIC."</a> ]</center>";
	} else {
	    echo "<center><font class=\"title\">$sitename: $topic_title</font><br><br>"
		."<form action=\"modules.php?name=Search\" method=\"post\">"
		."<input type=\"hidden\" name=\"topic\" value=\"$new_topic\">"
		.""._SEARCHONTOPIC.": <input type=\"name\" name=\"query\" size=\"30\">&nbsp;&nbsp;"
		."<input type=\"submit\" value=\""._SEARCH."\">"
		."</form>"
		."[ <a href=\"index.php\">"._GOTOHOME."</a> | <a href=\"modules.php?name=Topics\">"._SELECTNEWTOPIC."</a> ]</center>";
	}
	CloseTable();
	echo "<br>";
    }
    $result = $db->sql_query("SELECT sid, catid, aid, title, time, hometext, bodytext, comments, counter, topic, informant, notes, acomm, score, ratings FROM ".$prefix."_stories $qdb $querylang ORDER BY sid DESC limit $storynum");
    while ($row = $db->sql_fetchrow($result)) {
	$s_sid = intval($row['sid']);
	$catid = intval($row['catid']);
	$aid = stripslashes($row['aid']);
	$title = stripslashes(check_html($row['title'], "nohtml"));
	$time = $row['time'];
	$hometext = stripslashes($row['hometext']);
	$bodytext = stripslashes($row['bodytext']);
	$comments = stripslashes($row['comments']);
	$counter = intval($row['counter']);
	$topic = intval($row['topic']);
	$informant = stripslashes($row['informant']);
	$notes = stripslashes($row['notes']);
	$acomm = intval($row['acomm']);
	$score = intval($row['score']);
	$ratings = intval($row['ratings']);
	if ($catid > 0) {
	    $row2 = $db->sql_fetchrow($db->sql_query("SELECT title FROM ".$prefix."_stories_cat WHERE catid='$catid'"));
	    $cattitle = stripslashes(check_html($row2['title'], "nohtml"));
	}
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
	    $morelink .= "$story_link<b> "._READMORE."</b></a> ";
	} else {
	    $morelink .= "";
	}
	if ($articlecomm == 1 AND $acomm == 0) {
	    if ($c_count == 0) { $morelink .= "$story_link"._COMMENTSQ."</a>"; } elseif ($c_count == 1) { $morelink .= "$story_link$c_count "._COMMENT."</a>"; } elseif ($c_count > 1) { $morelink .= "$story_link$c_count "._COMMENTS."</a>"; }
	}
	$sid = intval($s_sid);
	if ($catid != 0) {
	    $row3 = $db->sql_fetchrow($db->sql_query("SELECT title FROM ".$prefix."_stories_cat WHERE catid='$catid'"));
	    $title1 = stripslashes(check_html($row3['title'], "nohtml"));
	    $title = "<a href=\"modules.php?name=News&amp;file=categories&amp;op=newindex&amp;catid=$catid\"><font class=\"storycat\">$title1</font></a>: $title";
	    $morelink .= " | <a href=\"modules.php?name=News&amp;file=categories&amp;op=newindex&amp;catid=$catid\">$title1</a>";
	}
	if ($score != 0) {
	    $rated = substr($score / $ratings, 0, 4);
	} else {
	    $rated = 0;
	}
	$morelink .= ")";
	$morelink = str_replace(" |  | ", " | ", $morelink);
	themeindex($aid, $informant, $datetime, $title, $counter, $topic, $hometext, $notes, $morelink, $topicname, $topicimage, $topictext);
    }
    include("footer.php");
}

function rate_article($sid, $score) {
    global $prefix, $db, $ratecookie, $sitename, $r_options;
    $score = intval($score);
    $sid = intval($sid);
    if ($score) {
	if ($score > 5) { $score = 5; }
	if ($score < 1) { $score = 1; }
	if ($score != 1 AND $score != 2 AND $score != 3 AND $score != 4 AND $score != 5) {
	    Header("Location: index.php");
	    die();
	}
	if (isset($ratecookie)) {
	    $rcookie = base64_decode($ratecookie);
	    $rcookie = addslashes($rcookie);
	    $r_cookie = explode(":", $rcookie);
	}
	for ($i=0; $i < sizeof($r_cookie); $i++) {
	    if ($r_cookie[$i] == $sid) {
		$a = 1;
	    }
	}
	if ($a == 1) {
	    Header("Location: modules.php?name=News&op=rate_complete&sid=$sid&rated=1");
	} else {
	    $result = $db->sql_query("update ".$prefix."_stories set score=score+$score, ratings=ratings+1 where sid='$sid'");
	    $info = base64_encode("$rcookie$sid:");
	    setcookie("ratecookie","$info",time()+3600);
	    update_points(7);
	    Header("Location: modules.php?name=News&op=rate_complete&sid=$sid$r_options");
	}
    } else {
	include("header.php");
	title("$sitename: "._ARTICLERATING."");
	OpenTable();
	echo "<center>"._DIDNTRATE."<br><br>"
	    .""._GOBACK."</center>";
	CloseTable();
	include("footer.php");
    }
}

function rate_complete($sid, $rated=0) {
    global $sitename, $user, $cookie;
    $r_options = "";
    if (is_user($user)) {
	if (isset($cookie[4])) { $r_options .= "&amp;mode=$cookie[4]"; }
	if (isset($cookie[5])) { $r_options .= "&amp;order=$cookie[5]"; }
        if (isset($cookie[6])) { $r_options .= "&amp;thold=$cookie[6]"; }
    }
    include("header.php");
    title("$sitename: "._ARTICLERATING."");
    OpenTable();
    if ($rated == 0) {
	echo "<center>"._THANKSVOTEARTICLE."<br><br>"
	    ."[ <a href=\"modules.php?name=News&amp;file=article&amp;sid=$sid$r_options\">"._BACKTOARTICLEPAGE."</a> ]</center>";
    } elseif ($rated == 1) {
	echo "<center>"._ALREADYVOTEDARTICLE."<br><br>"
	    ."[ <a href=\"modules.php?name=News&amp;file=article&amp;sid=$sid$r_options\">"._BACKTOARTICLEPAGE."</a> ]</center>";
    }
    CloseTable();
    include("footer.php");
}

switch ($op) {

    default:
    theindex($new_topic);
    break;

    case "rate_article":
    rate_article($sid, $score);
    break;

    case "rate_complete":
    rate_complete($sid, $rated);
    break;

}
# $Log: index.php,v $
# Revision 1.2  2004/12/08 00:22:34  chatserv
# http://www.nukefixes.com/ftopicp-3479.html#3479
#
# Revision 1.1  2004/10/05 18:05:24  chatserv
# Initial CVS Addition
#

?>