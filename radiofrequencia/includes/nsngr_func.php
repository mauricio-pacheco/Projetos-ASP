<?php

/********************************************************/
/* NSN Groups Universal                                 */
/* By: NukeScripts Network (webmaster@nukescripts.net)  */
/* http://www.nukescripts.net                           */
/* Copyright © 2000-2004 by NukeScripts Network         */
/********************************************************/
define("NSNGROUPS_IS_LOADED", TRUE);

// Load required scripts
if (defined('FORUM_ADMIN')) {
    $lang_dir = "../../../";
} elseif ($inside_mod == 1) {
    $lang_dir = "../../";
} else {
    $lang_dir = "";
}

// Load required configs
$nuke_config = $db->sql_fetchrow($db->sql_query("SELECT * FROM ".$prefix."_config"));

// Load required lang file
if(!isset($lang)) { $lang = $nuke_config['language']; }
if (!eregi("\.","$lang") AND file_exists($lang_dir."language/groups/lang-$lang.php")) {
  require_once($lang_dir."language/groups/lang-$lang.php");
} else {
  require_once($lang_dir."language/groups/lang-english.php");
}

// Copyright (c) 2000-2004 by NukeScripts Network
function in_group($gid) {
    global $prefix, $db, $user, $admin, $cookie;
    /*if (is_admin($admin)) {
        return 1;
    } else*/if (is_user($user)) {
        cookiedecode($user);
        $guid = $cookie[0];
        $currdate = time();
        $ingroup = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_nsngr_users WHERE gid='$gid' AND uid='$guid' AND (edate>'$currdate' OR edate='0')"));
        if ($ingroup > 0) { return 1; }
    }
    return 0;
}
// Copyright (c) 2000-2004 by NukeScripts Network

// Copyright (c) 2000-2004 by NukeScripts Network
function in_groups($gids) {
    global $prefix, $db, $user, $admin, $cookie;
    if(!is_array($gids)) { $gids = explode("-",$gids); }
    /*if (is_admin($admin)) {
        return 1;
    } else*/if (is_user($user)) {
        cookiedecode($user);
        $guid = $cookie[0];
        $currdate = time();
        for ($i=0; $i < count($gids); $i++) {
            $ingroup = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_nsngr_users WHERE gid='".$gids[$i]."' AND uid='$guid' AND (edate>'$currdate' OR edate='0')"));
            if ($ingroup > 0) { return 1; }
        }
    }
    return 0;
}
// Copyright (c) 2000-2004 by NukeScripts Network

// Copyright (c) 2000-2004 by NukeScripts Network
function is_ingroup($guid,$gid) {
    global $prefix, $db;
    $isgroup = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_nsngr_users WHERE gid='$gid' AND uid='$guid'"));
    if ($isgroup > 0) { return 1; }
    return 0;
}
// Copyright (c) 2000-2004 by NukeScripts Network

// Copyright (c) 2000-2004 by NukeScripts Network
$currdate = time ();
$db->sql_query("DELETE FROM ".$prefix."_nsngr_users WHERE (edate<'$currdate' AND edate!='0') AND trial='0'");
$db->sql_query("OPTIMIZE TABLE ".$prefix."_nsngr_users");
$exprdate = $currdate + 604800;
$result = $db->sql_query("SELECT * FROM ".$prefix."_nsngr_users WHERE (edate<'$exprdate' AND edate!='0') AND notice='0'");
while($row = $db->sql_fetchrow($result)) {
    $grsend = grget_config("send_notice");
    if ($grsend > 0) {
        $row2 = $db->sql_fetchrow($db->sql_query("SELECT username, user_email FROM ".$user_prefix."_users WHERE user_id='".$row['uid']."'"));
        $row3 = $db->sql_fetchrow($db->sql_query("SELECT gname FROM ".$prefix."_nsngr_groups WHERE gid='".$row['gid']."'"));
        $from = "From: $sitename <$adminmail>\r\n";
        $subject = $row3['gname']." "._GR_MEMBERSHIP." "._GR_EXPIRESSOON;
        $body = $row2['username'].":\r\r"._GR_EXPIREEXPLAIN."\r\r$sitename "._TEAM."\r$nukeurl";
        mail($row2['user_email'], $subject, $body, $from);
    }
    $db->sql_query("UPDATE ".$prefix."_nsngr_users SET notice='1' WHERE uid='".$row['uid']."' AND gid='".$row['gid']."'");
}
// Copyright (c) 2000-2004 by NukeScripts Network

// Copyright (c) 2000-2004 by NukeScripts Network
function grget_config($config_name){
    global $prefix, $db;
    $configresult = $db->sql_query("SELECT config_value FROM ".$prefix."_nsngr_config WHERE config_name='$config_name'");
    list($config_value) = $db->sql_fetchrow($configresult);
    return $config_value;
}
// Copyright (c) 2000-2004 by NukeScripts Network

// Copyright (c) 2000-2004 by NukeScripts Network
function grget_configs(){
    global $prefix, $db;
    $configresult = $db->sql_query("SELECT config_name, config_value FROM ".$prefix."_nsngr_config");
    while (list($config_name, $config_value) = $db->sql_fetchrow($configresult)) {
        $config[$config_name] = $config_value;
    }
    return $config;
}
// Copyright (c) 2000-2004 by NukeScripts Network

?>