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

    include("header.php");
    title(""._BROADCAST."");
    OpenTable();
    $numrows = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_public_messages WHERE who='$who'"));
    $the_message = FixQuotes(filter_text($the_message, "nohtml"));
    if ($the_message != "" AND $numrows == 0) {
        $the_time = time();
        $db->sql_query("INSERT INTO ".$prefix."_public_messages VALUES (NULL, '$the_message', '$the_time', '$who')");
        update_points(20);
        echo "<center>"._BROADCASTSENT."<br><br>[ <a href=\"modules.php?name=$module_name\">"._RETURNPAGE."</a> ]</center>";
    } else {
        echo "<center>"._BROADCASTNOTSENT."<br><br>[ <a href=\"modules.php?name=$module_name\">"._RETURNPAGE."</a> ]</center>";
    }
    CloseTable();
    include("footer.php");

?>