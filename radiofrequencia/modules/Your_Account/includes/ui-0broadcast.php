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
    if ($broadcast_msg == 1 AND ($username == $cookie[1]) AND ($usrinfo[user_password] == $cookie[2])) {
        echo "<br>";
        OpenTable();
        echo "<center><b>"._BROADCAST."</b><br><br>"._BROADCASTTEXT."<br><br>";
        echo "<form action=\"modules.php?name=$module_name\" method=\"post\">";
        echo "<input type=\"hidden\" name=\"who\" value=\"$username\">";
        echo "<input type=\"hidden\" name=\"op\" value=\"broadcast\">";
        echo "<input type=\"text\" size=\"60\" maxlength=\"255\" name=\"the_message\">&nbsp;&nbsp;<input type=\"submit\" value=\""._SEND."\">";
        echo "</form></center>";
        CloseTable();
    }

?>