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
    $ya_user_email = strtolower($ya_user_email);
// menelaos: these lines seem to give problems and they are already in new_confirm3.php
//    ya_userCheck($ya_username);
//    ya_mailCheck($ya_user_email);
    $user_regdate = date("M d, Y");
    if (!isset($stop)) {
        $datekey = date("F j");
        $rcode = hexdec(md5($_SERVER[HTTP_USER_AGENT] . $sitekey . $random_num . $datekey));
        $code = substr($rcode, 2, $ya_config['codesize']);
        if (extension_loaded("gd") AND $code != $gfx_check AND ($ya_config['usegfxcheck'] == 1 OR $ya_config['usegfxcheck'] == 3)) {
            Header("Location: modules.php?name=$module_name");
            die();
        }
        $new_password = md5($user_password);
        $ya_username = ya_fixtext($ya_username);
        $ya_user_email = ya_fixtext($ya_user_email);
        $realname = ya_fixtext($realname);
// menelaos: I see no use for the next line. It's better to leave it empty so we can ask users later on to fill in the field
//      if($realname == "") { $realname = $ya_username; }
        $femail = ya_fixtext($femail);
        $user_website = check_html($user_website);
        if (!eregi("http://", $user_website) AND $user_website != "") { $user_website = "http://$user_website"; }
        $bio = str_replace("<br>", "\r\n", $bio);
        $bio = ya_fixtext($bio);
        $user_sig = str_replace("<br>", "\r\n", $user_sig);
        $user_sig = ya_fixtext($user_sig);
        $user_icq = ya_fixtext($user_icq);
        $user_aim = ya_fixtext($user_aim);
        $user_yim = ya_fixtext($user_yim);
        $user_msnm = ya_fixtext($user_msnm);
        $user_occ = ya_fixtext($user_occ);
        $user_from = ya_fixtext($user_from);
        $user_interests = ya_fixtext($user_interests);
        $user_dateformat = ya_fixtext($user_dateformat);
        $newsletter = intval($newsletter);
        $user_viewemail = intval($user_viewemail);
        $user_allow_viewonline = intval($user_allow_viewonline);
        $user_timezone = intval($user_timezone);
        list($newest_uid) = $db->sql_fetchrow($db->sql_query("SELECT max(user_id) AS newest_uid FROM ".$user_prefix."_users"));
        if ($newest_uid == "-1") { $new_uid = 1; } else { $new_uid = $newest_uid+1; }
        $lv = time();
        $result = $db->sql_query("INSERT INTO ".$user_prefix."_users (user_id, name, username, user_email, user_avatar, user_regdate, user_viewemail, user_password, user_lang, user_lastvisit) VALUES ($new_uid, '$ya_username', '$ya_username', '$ya_user_email', 'gallery/blank.gif', '$user_regdate', '0', '$new_password', '$language', '$lv')");
       
		if ((count($nfield) > 0) AND ($result)) {
          foreach ($nfield as $key => $var) { 
  		    $db->sql_query("INSERT INTO ".$user_prefix."_cnbya_value (uid, fid, value) VALUES ('$new_uid', '$key','$nfield[$key]')");				
		  }
		}	   
	   
	$db->sql_query("LOCK TABLES ".$user_prefix."_users WRITE");
	$db->sql_query("INSERT INTO ".$user_prefix."_users (user_id, user_avatar, user_avatar_type, user_lang, user_lastvisit, umode) VALUES ($new_uid, 'gallery/blank.gif', '3', '$language', '$lv', 'nested')");

	$db->sql_query("UPDATE ".$user_prefix."_users SET username='$ya_username', name='$realname', user_email='$ya_user_email', femail='$femail', user_website='$user_website', user_icq='$user_icq', user_aim='$user_aim', user_yim='$user_yim', user_msnm='$user_msnm', user_from='$user_from', user_occ='$user_occ', user_interests='$user_interests', newsletter='$newsletter', user_viewemail='$user_viewemail', user_allow_viewonline='$user_allow_viewonline', user_timezone='$user_timezone', user_dateformat='$user_dateformat', user_sig='$user_sig', bio='$bio', user_password='$user_password', user_regdate='$user_regdate' WHERE user_id='$new_uid'");

	$db->sql_query("UNLOCK TABLES");
	if(!$result) {
		OpenTable();
		echo ""._ADDERROR."<br>";
		CloseTable();
	} else {
		if ($ya_config['servermail'] == 0) {
                $message = _WELCOMETO." $sitename ($nukeurl)!\r\n\r\n";
                $message .= _YOUUSEDEMAIL." $ya_user_email "._TOREGISTER." $sitename.\r\n\r\n";
                $message .= _FOLLOWINGMEM."\r\n"._UNICKNAME." $ya_username\r\n"._UPASSWORD." $user_password";
                $subject = _REGISTRATIONSUB;
                $from  = "From: $adminmail\r\n";
                $from .= "Reply-To: $adminmail\r\n";
                $from .= "Return-Path: $adminmail\r\n";
                mail($ya_user_email, $subject, $message, $from);
            }
            title(_USERREGLOGIN);
            OpenTable();
            $result = $db->sql_query("SELECT * FROM ".$user_prefix."_users WHERE username='$ya_username' AND user_password='$user_password'");
            if ($db->sql_numrows($result) == 1) {
                $userinfo = $db->sql_fetchrow($result);
                yacookie($userinfo[user_id],$userinfo[username],$userinfo[user_password],$userinfo[storynum],$userinfo[umode],$userinfo[uorder],$userinfo[thold],$userinfo[noscore],$userinfo[ublockon],$userinfo[theme],$userinfo[commentmax]);
// menelaos: i wonder if this cookie is set correctly
// menelaos: refresh of location? The next line causes multiple accounts to be loaded into the database, this has to be fixed
//              echo "<META HTTP-EQUIV=\"refresh\" content=\"2;URL=/modules.php?name=$module_name\">";
                echo "<center><b>$userinfo[username]:</b> "._ACTMSG2."</center>";
            } else {
                echo "<center>"._SOMETHINGWRONG."</center><br>";
            }
            CloseTable();
            if ($ya_config['sendaddmail'] == 1 AND $ya_config['servermail'] == 0) {
                $from  = "From: $ya_user_email\r\n";
                $from .= "Reply-To: $ya_user_email\r\n";
                $from .= "Return-Path: $ya_user_email\r\n";
                $subject = "$sitename - "._MEMADD;
                $from_ip = $_SERVER['REMOTE_ADDR'];
                $message = "$ya_username has been added to $sitename. from $from_ip\r\n";
                $message .= "-----------------------------------------------------------\r\n";
                $message .= _YA_NOREPLY;
                mail($adminmail, $subject, $message, $from);
            }
        }
    } else {
        echo "$stop";
    }
    include("footer.php");

?>