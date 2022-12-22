<?php

# $Author: chatserv $
# $Date: 2004/12/07 22:50:22 $
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
/* Additional security checking code 2003 by chatserv                   */
/* http://www.nukefixes.com -- http://www.nukeresources.com             */
/************************************************************************/

if (!stristr($_SERVER['SCRIPT_NAME'], "modules.php")) {
	die ("You can't access this file directly...");
}
require_once("mainfile.php");
$module_name = basename(dirname(__FILE__));
get_lang($module_name);

if(!isset($sid)) {
    exit();
}

function PrintPage($sid) {
    global $site_logo, $nukeurl, $sitename, $datetime, $prefix, $db;
    $sid = intval(trim($sid));
    $row = $db->sql_fetchrow($db->sql_query("SELECT title, time, hometext, bodytext, topic, notes FROM ".$prefix."_stories WHERE sid='$sid'"));
    $title = stripslashes($row['title']);
    $time = $row['time'];
    $hometext = stripslashes($row['hometext']);
    $bodytext = stripslashes($row['bodytext']);
    $topic = intval($row['topic']);
    $notes = stripslashes($row['notes']);
    $row2 = $db->sql_fetchrow($db->sql_query("SELECT topictext FROM ".$prefix."_topics WHERE topicid='$topic'"));
    $topictext = stripslashes($row2['topictext']);
    formatTimestamp($time);
    echo "
    <html>
    <head><title>$sitename - $title</title></head>
    <body bgcolor=\"#ffffff\" text=\"#000000\">
    <table border=\"0\" align=\"center\"><tr><td>
    <table border=\"0\" width=\"640\" cellpadding=\"0\" cellspacing=\"1\" bgcolor=\"#000000\"><tr><td>
    <table border=\"0\" width=\"640\" cellpadding=\"20\" cellspacing=\"1\" bgcolor=\"#ffffff\"><tr><td>
    <center>
    <img src=\"images/$site_logo\" border=\"0\" alt=\"\"><br><br>
    <font class=\"content\">
    <b>$title</b></font><br>
    <font class=tiny><b>"._PDATE."</b> $datetime<br><b>"._PTOPIC."</b> $topictext</font><br><br>
    </center>
    <font class=\"content\">
    $hometext<br><br>
    $bodytext<br><br>
    $notes<br><br>
    </font>
    </td></tr></table></td></tr></table>
    <br><br><center>
    <font class=\"content\">
    "._COMESFROM." $sitename<br>
    <a href=\"$nukeurl\">$nukeurl</a><br><br>
    "._THEURL."<br>
    <a href=\"$nukeurl/modules.php?name=News&file=article&sid=$sid\">$nukeurl/modules.php?name=News&file=article&sid=$sid</a>
    </font>
    </td></tr></table>
    </body>
    </html>
    ";
}

PrintPage($sid);
# $Log: print.php,v $
# Revision 1.2  2004/12/07 22:50:22  chatserv
# http://www.nukefixes.com/ftopicp-3479.html#3479
#
# Revision 1.1  2004/10/05 18:04:39  chatserv
# Initial CVS Addition
#

?>