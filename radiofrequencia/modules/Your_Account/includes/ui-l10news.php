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
    // Last 10 Comments
    if ($articlecomm == 1) {
        $result6 = $db->sql_query("SELECT tid, sid, subject FROM ".$prefix."_comments WHERE name='$usrinfo[username]' ORDER BY tid DESC LIMIT 0,10");
        if (($db->sql_numrows($result6) > 0)) {
            echo "<br>";
            OpenTable();
            echo "<b>$usrinfo[username]'s "._LAST10COMMENT.":</b><br>";
            while($row6 = $db->sql_fetchrow($result6)) {
                $tid = $row6[tid];
                $sid = $row6[sid];
                $subject = $row6[subject];
                echo "<li><a href=\"modules.php?name=News&file=article&thold=-1&mode=flat&order=0&sid=$sid#$tid\">$subject</a><br>";
            }
            CloseTable();
        }
    }
    // Last 10 Submissions
    $result7 = $db->sql_query("SELECT sid, title FROM ".$prefix."_stories WHERE informant='$usrinfo[username]' ORDER BY sid DESC LIMIT 0,10");
    if (($db->sql_numrows($result7) > 0)) {
        echo "<br>";
        OpenTable();
        echo "<b>$usrinfo[username]'s "._LAST10SUBMISSION.":</b><br>";
        while($row7 = $db->sql_fetchrow($result7)) {
            $sid = $row7[sid];
            $title = $row7[title];
            echo "<li><a href=\"modules.php?name=News&file=article&sid=$sid\">$title</a><br>";
        }
        CloseTable();
    }

?>