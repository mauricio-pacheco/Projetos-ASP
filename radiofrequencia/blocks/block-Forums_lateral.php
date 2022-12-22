<?php

/************************************************************************/
/* PHP-NUKE: Web Portal System                                          */
/* ===========================                                          */
/*                                                                      */
/* Copyright (c) 2002 by Francisco Burzi (fbc@mandrakesoft.com)         */
/* http://phpnuke.org                                                   */
/*                                                                      */
/* This is a 2 min hack of the old forum block to work with the phpBB2  */
/* port.                                                                */
/*                                                                      */
/* This program is free software. You can redistribute it and/or modify */
/* it under the terms of the GNU General Public License as published by */
/* the Free Software Foundation; either version 2 of the License.       */
/************************************************************************/
/*         Additional security & Abstraction layer conversion           */
/*                           2003 chatserv                              */
/*      http://www.nukefixes.com -- http://www.nukeresources.com        */
/************************************************************************/

if (stristr($_SERVER['SCRIPT_NAME'], "block-Forums_lateral.php")) { 
    Header("Location: ../index.php");
    die();
}

global $prefix, $db, $sitename;

$result = $db->sql_query("SELECT forum_id, topic_id, topic_title FROM ".$prefix."_bbtopics ORDER BY topic_time DESC LIMIT 10");
$content = "<br>";
while ($row = $db->sql_fetchrow($result)) {
    $forum_id = intval($row['forum_id']);
    $topic_id = intval($row['topic_id']);
    $topic_title = $row['topic_title'];
    $row2 = $db->sql_fetchrow($db->sql_query("SELECT auth_view, auth_read FROM ".$prefix."_bbforums WHERE forum_id='$forum_id'"));
    $auth_view = intval($row2['auth_view']);
    $auth_read = intval($row2['auth_read']);
    if (($auth_view < 2) OR ($auth_read < 2)) {
        $content .= "<img src=\"images/arrow.gif\" border=\"0\" alt=\"\" title=\"\" width=\"9\" height=\"9\">&nbsp;<a href=\"modules.php?name=Forums&amp;file=viewtopic&amp;t=$topic_id\">$topic_title</a><br>";
    }
}

$content .= "<br><center><a href=\"modules.php?name=Forums\"><b>$sitename Forums</b></a><br><br></center>";

?>