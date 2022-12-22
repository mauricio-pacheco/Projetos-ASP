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

if (!defined('YA_ADMIN')) { echo "CNBYA admin protection"; exit; }
if (!eregi("modules.php", $_SERVER['SCRIPT_NAME'])) {
    header("Location: ../../../index.php");
    die ();
}if (!defined('CNBYA')) { echo "CNBYA protection"; exit; }
if (($radminsuper==1) OR ($radminuser==1)) {

    if ($add_email != $add_email2) {
        include("header.php");
        OpenTable();
        echo "<center><font class='title'><b>"._ERRORREG."</b></font><br><br>";
        echo "<font class='content'>"._EMAILDIFFERENT."<br><br>"._GOBACK."</font></center>";
        CloseTable();
        include("footer.php");
        die();
    }
    $add_email = strtolower($add_email);
    ya_userCheck($add_uname);
    ya_mailCheck($add_email);
    ya_passCheck($add_pass, $add_pass2);
    $add_name = ya_fixtext($realname);
    if($add_name == "") { $add_name = $add_uname; }
    $add_femail = ya_fixtext($add_femail);
    $add_url = check_html($add_url);
    if (!eregi("http://", $add_url) AND $add_url != "") { $add_url = "http://$add_url"; }
    $add_user_sig = str_replace("<br>", "\r\n", $add_user_sig);
    $add_user_sig = ya_fixtext($add_user_sig);
    $add_user_icq = ya_fixtext($add_user_icq);
    $add_user_aim = ya_fixtext($add_user_aim);
    $add_user_yim = ya_fixtext($add_user_yim);
    $add_user_msnm = ya_fixtext($add_user_msnm);
    $add_user_from = ya_fixtext($add_user_from);
    $add_user_occ = ya_fixtext($add_user_occ);
    $add_user_interest = ya_fixtext($add_user_interest);
    $add_user_viewemail = intval($add_user_viewemail);
    $add_newsletter = intval($add_newsletter);
    $user_points = intval($user_points);
    if ($stop == "") {
        $user_password = $add_pass;
        $add_pass = md5($add_pass);
        $user_regdate = date("M d, Y");
        list($newest_uid) = $db->sql_fetchrow($db->sql_query("SELECT max(user_id) AS newest_uid FROM ".$user_prefix."_users"));
        if ($newest_uid == "-1") { $new_uid = 1; } else { $new_uid = $newest_uid+1; }
        $sql = "INSERT INTO ".$user_prefix."_users ";
        $sql .= "(user_id, name, username, user_email, femail, user_website, user_regdate, user_icq, user_aim, user_yim, user_msnm, user_from, user_occ, user_interests, user_viewemail, user_avatar, user_avatar_type, user_sig, user_password, newsletter, broadcast, popmeson";
        if ($Version_Num > 6.9) { $sql .= ", points"; }
        $sql .= ") ";
        $sql .= "VALUES ('$new_uid', '$add_name', '$add_uname', '$add_email', '$add_femail', '$add_url', '$user_regdate', '$add_user_icq', '$add_user_aim', '$add_user_yim', '$add_user_msnm', '$add_user_from', '$add_user_occ', '$add_user_intrest', '$add_user_viewemail', 'gallery/blank.gif', '3', '$add_user_sig', '$add_pass', '$add_newsletter', '1', '0'";
        if ($Version_Num > 6.9) { $sql .= ", '$add_points'"; }
        $sql .= ")";
        $result = $db->sql_query($sql);
		
		if (count($nfield) > 0) {
         foreach ($nfield as $key => $var) { 
		 $nfield[$key] = ya_fixtext($nfield[$key]);
 	      if (($db->sql_numrows($db->sql_query("SELECT * FROM ".$user_prefix."_cnbya_value WHERE fid='$key' AND uid = '$new_uid'"))) == 0) {
		  $sql = "INSERT INTO ".$user_prefix."_cnbya_value (uid, fid, value) VALUES ('$new_uid', '$key','$nfield[$key]')";
		  $db->sql_query($sql);				
	      }
	      else {
    	    $db->sql_query("UPDATE ".$user_prefix."_cnbya_value SET value='$nfield[$key]' WHERE fid='$key' AND uid = '$new_uid'");
		  } 
		 }
		}
		
        if (!$result) {
            $pagetitle = ": "._USERADMIN;
            include("header.php");
            title(_USERADMIN);
            OpenTable();
            echo "<center><b>"._ERRORSQL."</b></center>";
            CloseTable();
            include("footer.php");
            return;
        } else {
            if ($ya_config['servermail'] == 0) {
                $message = _WELCOMETO." $sitename!\r\n\r\n";
                $message .= _YOUUSEDEMAIL." ($add_email) "._TOREGISTER." $sitename.\r\n\r\n";
                $message .= _FOLLOWINGMEM."\r\n"._UNICKNAME." $add_uname\r\n"._UPASSWORD." $user_password";
                $subject = _ACCOUNTCREATED;
                $from  = "From: $adminmail\r\n";
                $from .= "Reply-To: $adminmail\r\n";
                $from .= "Return-Path: $adminmail\r\n";
                mail($user_email, $subject, $message, $from);
            }
            if (isset($min)) { $xmin = "&min=$min"; }
            if (isset($xop)) { $xxop = "&op=$xop"; }
            Header("Location: modules.php?name=$module_name&file=admin"."$xxop"."$xmin");
        }
    } else {
        $pagetitle = ": "._USERADMIN;
        include("header.php");
        title(_USERADMIN);
        amain();
        echo "<br>\n";
        OpenTable();
        echo "<b>$stop</b>\n";
        CloseTable();
        include("footer.php");
        return;
    }

}

?>