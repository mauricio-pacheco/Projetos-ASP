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

	getusrinfo($user);
	cookiedecode($user);
	include("header.php");
	title(_YA_AVATARSUCCESS);
	OpenTable();
	nav();
	CloseTable();
	echo "<br>\n";
	OpenTable();
    
	$resultbc = $db->sql_query("SELECT * FROM ".$prefix."_bbconfig"); 
	while($rowbc = $db->sql_fetchrow($resultbc)) {
	$board_config[$rowbc[config_name]] = $rowbc[config_value];
	}
	$direktori = $board_config['avatar_gallery_path'];
	
	$newavatar=$category."/".$avatar;
	$db->sql_query("UPDATE ".$user_prefix."_users SET user_avatar='$newavatar', user_avatar_type='3' WHERE username='$cookie[1]'");
	echo "<center><font class=\"content\">"._YA_AVATARFOR." ".$cookie[1]." "._YA_SAVED."</font></center><br>";
	if (ereg("(http)", $newavatar)) {
	  echo "<center>"._YA_NEWAVATAR.":<br><IMG alt=\"\" src=\"$newavatar\"><br>";
	  echo "[ <a href=\"modules.php?name=$module_name&op=edituser\">"._YA_BACKPROFILE."</a> | <a href=\"modules.php?name=$module_name\">"._YA_DONE."</a> ]</center>";
	} elseif ($newavatar) {
	  echo "<center>"._YA_NEWAVATAR.":<br><IMG alt=\"\" src=\"$direktori/$newavatar\"><br>";
        echo "[ <a href=\"modules.php?name=$module_name&op=edituser\">"._YA_BACKPROFILE."</a> | <a href=\"modules.php?name=$module_name\">"._YA_DONE."</a> ]</center>";
	}
	CloseTable();
	include("footer.php");

?>