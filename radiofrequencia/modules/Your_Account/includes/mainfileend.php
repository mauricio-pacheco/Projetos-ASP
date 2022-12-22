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

$uinfo	   = getusrinfo($user);
$ulevel  = $uinfo['user_level'];
$uactive = $uinfo['user_active'];
if ( ($ulevel < 1) OR ($uactive < 1) ) {
    unset($user);
    unset($cookie);
}

if ( ($_GET['name']=='Forums') && ($_GET['file']=='profile') && ($_GET['mode']=='register') ) Header("Location: modules.php?name=Your_Account&op=new_user");

// CNB Mod
// WARNING THIS SECTION OF CODE PREVENTS NEW POSTS REGISTERING AS UNREAD
if (is_user($user)) {
    //$uinfo	= getusrinfo($user);
    $lv	= time();
    //$db->sql_query("UPDATE ".$user_prefix."_users SET user_lastvisit='$lv' WHERE user_id='".$uinfo['user_id']."'");
    list($sessiontime) = $db->sql_fetchrow($db->sql_query("SELECT time FROM ".$prefix."_session WHERE uname='$uinfo[username]'"));

// modified by menelaos dot hetnet dot nl to reduce amount of sql-queries
    $configresult = $db->sql_query("SELECT config_name, config_value FROM ".$prefix."_cnbya_config");
    while (list($config_name, $config_value) = $db->sql_fetchrow($configresult)) {
    $config[$config_name] = $config_value;
    }
    $ya_config = $config;
    $cookieinactivity	= $ya_config['cookieinactivity'];
    $cookiepath		= $ya_config['cookiepath'];
    $autosuspend		= $ya_config['autosuspend'];
    $autosuspendmain	= $ya_config['autosuspendmain'];
// modified by menelaos dot hetnet dot nl to reduce amount of sql-queries

    if (($cookieinactivity != '-') AND ( ($sessiontime + $cookieinactivity < $lv ) ) ) {
        cookiedecode($user);
        $r_uid = $uinfo['user_id'];
        $r_username = $uinfo['username'];
        setcookie("user");
        if (trim($cookiepath) != '') setcookie("user","","","$ya_config[cookiepath]");
        $db->sql_query("DELETE FROM ".$prefix."_session WHERE uname='$r_username'");
        $db->sql_query("OPTIMIZE TABLE ".$prefix."_session");
        //$db->sql_query("DELETE FROM ".$prefix."_bbsessions WHERE session_user_id='$r_uid'");
        //$db->sql_query("OPTIMIZE TABLE ".$prefix."_bbsessions");
        unset($user); 
        unset($cookie);
	  header("Location: modules.php?name=Your_Account");
	  die();
	};

    // WARNING THIS SECTION OF CODE CAN SLOW SITE LOAD TIME DOWN!!!!!!!!!!!!!
    // IF YOU DO NOT WANT TO USE THIS CODE YOU DO NOT HAVE TO.
    // THIS FUCTION IS IN USER ADMIN AND CAN BE TRIGGERED ONLY
    // WHEN THE ADMIN WANTS IT RUN.
    if (($autosuspend > 0) AND ($autosuspendmain==1)) {
        $st = time() - $autosuspend;
        $susresult = $db->sql_query("SELECT user_id FROM ".$user_prefix."_users WHERE user_lastvisit <= $st AND user_level > 0");
            while(list($sus_uid) = $db->sql_fetchrow($susresult)) {
            $db->sql_query("UPDATE ".$user_prefix."_users SET user_level='0', user_active='0' WHERE user_id='$sus_uid'");
    }
  }

}

else { 
setcookie("CNB_test1","value1"); 
setcookie("CNB_test2","value2",time()+3600); 
setcookie("CNB_test3","value3",time()+3600,"/"); 
setcookie("CNB_test4","value4",time()+3600,"$ya_config[cookiepath]"); 
} 

// CNB Mod
?>