<?php

/************************************************************************/
/* PHP-NUKE: Web Portal System                                          */
/* ===========================                                          */
/*                                                                      */
/* Copyright (c) 2004 by Francisco Burzi                                */
/* http://phpnuke.org                                                   */
/*                                                                      */
/* This program is free software. You can redistribute it and/or modify */
/* it under the terms of the GNU General Public License as published by */
/* the Free Software Foundation; either version 2 of the License.       */
/************************************************************************/

global $prefix, $db;
$ip = $_SERVER["REMOTE_ADDR"];
$numrow = $db->sql_numrows($db->sql_query("SELECT id FROM ".$prefix."_banned_ip WHERE ip_address='$ip'"));
if ($numrow != 0) {
	echo "<br><br><center><img src='images\admin\ipban.gif'><br><br><b>You has been banned by the administrator</b></center>";
	die();
}

?>