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
}
if (!defined('CNBYA')) { echo "CNBYA protection"; exit; }
if (($radminsuper==1) OR ($radminuser==1)) {

    $stop = "";
    if ($chng_uname != $old_uname) { ya_userCheck($chng_uname); }
    if ($chng_email != $old_email) { ya_mailCheck($chng_email); }
    if ($chng_pass != "" OR $chng_pass2 != "") { ya_passCheck($chng_pass, $chng_pass2); }
    $chng_uname = ya_fixtext($chng_uname);
    $chng_name = ya_fixtext($chng_name);
    $chng_email = ya_fixtext($chng_email);
    $chng_femail = ya_fixtext($chng_femail);
    $chng_url = ya_fixtext($chng_url);
    $chng_user_icq = ya_fixtext($chng_user_icq);
    $chng_user_aim = ya_fixtext($chng_user_aim);
    $chng_user_yim = ya_fixtext($chng_user_yim);
    $chng_user_msnm = ya_fixtext($chng_user_msnm);
    $chng_user_occ = ya_fixtext($chng_user_occ);
    $chng_user_from = ya_fixtext($chng_user_from);
    $chng_user_intrest = ya_fixtext($chng_user_intrest);
    $chng_avatar = ya_fixtext($chng_avatar);
    $chng_user_viewemail = intval($chng_user_viewemail);
    $chng_user_sig = ya_fixtext($chng_user_sig);
    $chng_newsletter = intval($chng_newsletter);

	if ($stop == "") {
        if ($chng_pass != "") {
            $cpass = md5($chng_pass);
            $db->sql_query("UPDATE ".$user_prefix."_users SET username='$chng_uname', name='$chng_name', user_email='$chng_email', femail='$chng_femail', user_website='$chng_url', user_icq='$chng_user_icq', user_aim='$chng_user_aim', user_yim='$chng_user_yim', user_msnm='$chng_user_msnm', user_from='$chng_user_from', user_occ='$chng_user_occ', user_interests='$chng_user_interests', user_viewemail='$chng_user_viewemail', user_avatar='$chng_avatar', user_sig='$chng_user_sig', user_password='$cpass', newsletter='$chng_newsletter' WHERE user_id='$chng_uid'");
            if ($Version_Num > 6.9) { $db->sql_query("UPDATE ".$user_prefix."_users SET points='$chng_points' WHERE user_id='$chng_uid'"); }
        } else {
            $db->sql_query("UPDATE ".$user_prefix."_users SET username='$chng_uname', name='$chng_name', user_email='$chng_email', femail='$chng_femail', user_website='$chng_url', user_icq='$chng_user_icq', user_aim='$chng_user_aim', user_yim='$chng_user_yim', user_msnm='$chng_user_msnm', user_from='$chng_user_from', user_occ='$chng_user_occ', user_interests='$chng_user_interests', user_viewemail='$chng_user_viewemail', user_avatar='$chng_avatar', user_sig='$chng_user_sig', newsletter='$chng_newsletter' WHERE user_id='$chng_uid'");
            if ($Version_Num > 6.9) { $db->sql_query("UPDATE ".$user_prefix."_users SET points='$chng_points' WHERE user_id='$chng_uid'"); }
        }
		
		 if (count($nfield) > 0) {
         foreach ($nfield as $key => $var) { 
		 $nfield[$key] = ya_fixtext($nfield[$key]);
 	      if (($db->sql_numrows($db->sql_query("SELECT * FROM ".$user_prefix."_cnbya_value WHERE fid='$key' AND uid = '$chng_uid'"))) == 0) {
		  
		    $sql = "INSERT INTO ".$user_prefix."_cnbya_value (uid, fid, value) VALUES ('$chng_uid', '$key','$nfield[$key]')";
		    $db->sql_query($sql);				
	      }
	      else {
    	    $db->sql_query("UPDATE ".$user_prefix."_cnbya_value SET value='$nfield[$key]' WHERE fid='$key' AND uid = '$chng_uid'");
		  } 
		 }
		}

        if ($Version_Num > 7.0) {
            $subnum = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_subscriptions WHERE userid='$chng_uid'"));
            $row = $db->sql_fetchrow($db->sql_query("SELECT * FROM ".$prefix."_subscriptions WHERE userid='$chng_uid'"));
            $row2 = $db->sql_fetchrow($db->sql_query("SELECT username, user_email FROM ".$user_prefix."_users WHERE user_id='$chng_uid'"));
            if ($reason == "") {
                $reason = 0;
            }
            if ($subnum == 1) {
                if ($subscription == 0) {
                    $from = "$sitename <$adminmail>";
                    $subject = "$sitename "._SUBCANCELLED."";
                    if ($reason == "0") {
                        if ($subscription_url != "") {
                            $body = _HELLO." ".$row2['username']."!\r\n\r\n"._SUBCANCEL."\r\n\r\n"._SUBNEEDTOAPPLY." $subscription_url\r\n\r\n"._SUBTHANKSATT."\r\n\r\n$sitename "._TEAM."\r\n$nukeurl";
                        } else {
                            $body = _HELLO." ".$row2['username']."!\r\n\r\n"._SUBCANCEL."\r\n\r\n"._SUBTHANKSATT."\r\n\r\n$sitename "._TEAM."\r\n$nukeurl";
                        }
                    } else {
                        if ($subscription_url != "") {
                            $body = _HELLO." ".$row2['username']."!\r\n\r\n"._SUBCANCELREASON."\r\n\r\n$reason\r\n\r\n"._SUBNEEDTOAPPLY." $subscription_url\r\n\r\n"._SUBTHANKSATT."\r\n\r\n$sitename "._TEAM."\r\n$nukeurl";
                        } else {
                            $body = _HELLO." ".$row2['username']."!\r\n\r\n"._SUBCANCELREASON."\r\n\r\n$reason\r\n\r\n"._SUBTHANKSATT."\r\n\r\n$sitename "._TEAM."\r\n$nukeurl";
                        }
                    }
                    $db->sql_query("DELETE FROM ".$prefix."_subscriptions WHERE userid='$chng_uid'");
                    mail($row2[user_email], $subject, $body, "From: $from\nX-Mailer: PHP/" . phpversion());
                } elseif ($subscription == 1) {
                    if ($subscription_expire != 0) {
                        $from	= "$sitename <$adminmail>";
                        $subject	= "$sitename "._SUBUPDATEDSUB."";
                        $body	= _HELLO." ".$row2['username']."!\r\n\r\n"._SUBUPDATED." $subscription_expire "._SUBYEARSTOACCOUNT."\r\n\r\n"._SUBTHANKSSUPP."\r\n\r\n$sitename "._TEAM."\r\n$nukeurl";
                        $expire	= $subscription_expire*31536000;
                        if ($subnum == 0) {
                            $expire = $expire+time();
                        }
                        $expire = $expire+$row['subscription_expire'];
                        $db->sql_query("UPDATE ".$prefix."_subscriptions SET subscription_expire='$expire' WHERE userid='$chng_uid'");
                        mail($row2['user_email'], $subject, $body, "From: $from\nX-Mailer: PHP/" . phpversion());
                    }
                }
            } elseif ($subnum == 0 AND $subscription == 1) {
                if ($subscription_expire != 0) {
                    $expire = $subscription_expire*31536000;
                    $expire = $expire+time();
                    $db->sql_query("INSERT INTO ".$prefix."_subscriptions VALUES (NULL, '$chng_uid', '$expire')");
                    $from = "$sitename <$adminmail>";
                    $subject = "$sitename "._SUBACTIVATED."";
                    $body = _HELLO." ".$row2['username']."!\r\n\r\n"._SUBOPENED." $subscription_expire "._SUBOPENED2."\r\n\r\n"._SUBHOPELIKE."\r\n"._SUBTHANKSSUPP2."\r\n\r\n$sitename "._TEAM."\r\n$nukeurl";
                    mail($row2['user_email'], $subject, $body, "From: $from\nX-Mailer: PHP/" . phpversion());
                }
            }
        }

        $pagetitle = ": "._USERADMIN." - "._ACCTMODIFY;
        include("header.php");
        amain();
        echo "<br>\n";
        OpenTable();
        echo "<center><table align='center' border='0' cellpadding='2' cellspacing='2'>\n";
        echo "<form action='modules.php?name=$module_name&file=admin' method='post'>\n";
        if (isset($query)) { echo "<input type='hidden' name='query' value='$query'>\n"; }
        if (isset($min)) { echo "<input type='hidden' name='min' value='$min'>\n"; }
        if (isset($xop)) { echo "<input type='hidden' name='op' value='$xop'>\n"; }
        echo "<tr><td align='center'><b>"._ACCTMODIFY."</b></td></tr>\n";
        echo "<tr><td align='center'><input type='submit' value='"._RETURN2."'></td></tr>\n";
        echo "</form>\n";
        echo "</table></center>\n";
        CloseTable();
        include("footer.php");
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