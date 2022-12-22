<?php

/*********************************************************************************/
/* CNB Your Account: An Advanced User Management System for phpnuke     		*/
/* ============================================                         		*/
/*                                                                      		*/
/* Copyright (c) 2004 by Comunidade PHP Nuke Brasil                     		*/
/* http://dev.phpnuke.org.br & http://www.phpnuke.org.br                		*/
/*                                                                      		*/
/* Contact author: escudero@phpnuke.org.br                              		*/
/* International Support Forum: http://ravenphpscripts.com/forum76.html 		*/
/*                                                                      		*/
/* This program is free software. You can redistribute it and/or modify 		*/
/* it under the terms of the GNU General Public License as published by 		*/
/* the Free Software Foundation; either version 2 of the License.       		*/
/*                                                                      		*/
/*********************************************************************************/
/* CNB Your Account it the official successor of NSN Your Account by Bob Marion	*/
/*********************************************************************************/

if (!eregi("modules.php", $_SERVER['SCRIPT_NAME'])) {
    header("Location: ../../../index.php");
    die ();
}
if (!defined('CNBYA')) { echo "CNBYA protection"; exit; }
    // Last 10 Forum Topics
    $result8 = $db->sql_query("select t.topic_id, t.topic_title, f.forum_name, t.forum_id from ".$prefix."_bbtopics t, ".$prefix."_bbforums f where t.forum_id=f.forum_id and t.topic_poster='$usrinfo[user_id]' and auth_view<'2' and auth_read<'2' and auth_post<'2' order by t.topic_time DESC limit 0,10");
    if (($db->sql_numrows($result8) > 0)) {
        echo "<br>";
        OpenTable();
        echo "<b>$usrinfo[username]'s "._LAST10BBTOPIC.":</b><br>";
        while(list($topic_id, $topic_title, $forum_name, $forum_id) = $db->sql_fetchrow($result8)) {
            echo "<li><a href=\"modules.php?name=Forums&file=viewforum&f=$forum_id\">$forum_name</a> &#187 <a href=\"modules.php?name=Forums&file=viewtopic&t=$topic_id\">$topic_title</a><br>";
        }
        CloseTable();
    }

    // Last 10 Forum Posts
    $result12 = $db->sql_query("select p.post_id, r.post_subject, f.forum_name, p.forum_id from ".$prefix."_bbposts p, ".$prefix."_bbposts_text r, ".$prefix."_bbforums f where p.forum_id=f.forum_id and r.post_id=p.post_id and p.poster_id='$usrinfo[user_id]' and auth_view<'2' and auth_read<'2' and auth_post<'2' order by p.post_time DESC limit 0,10");
    if (($db->sql_numrows($result12) > 0)) {
        echo "<br>";
        OpenTable();
        echo "<b>$usrinfo[username]'s "._LAST10BBPOST.":</b><br>";
        while(list($post_id, $post_subject, $forum_name, $forum_id) = $db->sql_fetchrow($result12)) {
            if($post_subject == "") { $post_subject = _NOPOSTSUBJECT; }
            echo "<li><a href=\"modules.php?name=Forums&file=viewforum&f=$forum_id\">$forum_name</a> &#187 <a href=\"modules.php?name=Forums&file=viewtopic&p=$post_id#$post_id\">$post_subject</a><br>";
        }
        CloseTable();
    }

?>