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

// Last 10 Download Links Approved

// menelaos: changed these routines to fist check if the database table exist
$checktable = $db->sql_fetchrow($db->sql_query("SHOW TABLES LIKE '".$prefix."_nsngd_downloads'"));
if ($checktable == 1) {
	if($checkrow['Msg_type']!="error") {
	    $result9 = $db->sql_query("SELECT lid, title, date FROM ".$prefix."_nsngd_downloads where submitter='$usrinfo[username]' order by date DESC limit 0,10");
	    if (($db->sql_numrows($result9) > 0)) {
	        echo "<br>";
	        OpenTable();
	        echo "<b>$usrinfo[username]'s "._LAST10DOWNLOAD.":</b><br>";
	        while(list($lid, $title, $date) = $db->sql_fetchrow($result9)) {
	            echo "<li><a href=\"modules.php?name=Downloads&op=getit&lid=$lid\">$title</a> ($lid) - $date<br>";
	        }
	        CloseTable();
	    }
	}
} 

?>