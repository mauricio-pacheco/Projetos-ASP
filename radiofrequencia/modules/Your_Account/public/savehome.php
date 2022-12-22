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

    cookiedecode($user);
    $check = $cookie[1];
    $check2 = $cookie[2];
    $result = $db->sql_query("SELECT user_id, user_password FROM ".$user_prefix."_users WHERE username='$check'");
    $row = $db->sql_fetchrow($result);
    $vuid = $row[user_id];
    $ccpass = $row[user_password];
    if (($user_id == $vuid) AND ($check2 == $ccpass)) {
        if(isset($ublockon)) $ublockon=1; else $ublockon=0;
        $ublock = FixQuotes($ublock);
        $db->sql_query("UPDATE ".$user_prefix."_users SET storynum='$storynum', ublockon='$ublockon', ublock='$ublock', broadcast='$broadcast' WHERE user_id='$user_id'");
        getusrinfo($user);
        yacookie($userinfo[user_id],$userinfo[username],$userinfo[user_password],$userinfo[storynum],$userinfo[umode],$userinfo[uorder],$userinfo[thold],$userinfo[noscore],$userinfo[ublockon],$userinfo[theme],$userinfo[commentmax]);
        Header("Location: modules.php?name=$module_name");
    }

?>