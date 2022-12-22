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
    // Last 10 Weblinks Approved
    $result10 = $db->sql_query("SELECT lid, title, cid FROM ".$prefix."_links_links where submitter='$usrinfo[username]' order by date DESC limit 0,10");
    if (($db->sql_numrows($result10) > 0)) {
        echo "<br>";
        OpenTable();
        echo "<b>$usrinfo[username]'s "._LAST10WEBLINK.":</b><br>";
        while(list($lid, $title, $cid) = $db->sql_fetchrow($result10)) {
            echo "<li><a href=\"modules.php?op=modload&name=Web_Links&file=index&l_op=viewlink&cid=$cid\">$title</a><br>";
        }
        CloseTable();
    }

?>