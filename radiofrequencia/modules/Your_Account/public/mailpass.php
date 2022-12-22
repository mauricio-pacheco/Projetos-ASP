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

    if ($username != "" AND $user_email == "") {
        $sql = "SELECT username, user_email, user_password, user_level FROM ".$user_prefix."_users WHERE username='$username'";
    } elseif ($username == "" AND $user_email != "") {
        $sql = "SELECT username, user_email, user_password, user_level FROM ".$user_prefix."_users WHERE user_email='$user_email'";
    } else {
        include("header.php");
// removed by menelaos dot hetnet dot nl
//      title(_USERREGLOGIN);
        Show_CNBYA_menu();
        OpenTable();
        echo "<center><font class='title'>"._YA_MUSTSUPPLY."</font></center>\n";
        CloseTable();
        include("footer.php");
        die();
    }
    $result = $db->sql_query($sql);
    if($db->sql_numrows($result) == 0) {
        include("header.php");

// removed by menelaos dot hetnet dot nl
//      title(_USERREGLOGIN);
        Show_CNBYA_menu();
        OpenTable();
        echo "<center><font class='title'>"._SORRYNOUSERINFO."</font></center>\n";
        CloseTable();
        include("footer.php");
    } else {

        if ($ya_config['servermail'] == 0) {
            $host_name = $_SERVER["REMOTE_ADDR"];
            $row = $db->sql_fetchrow($result);
            $user_name = $row[username];
            $user_email = $row[user_email];
            $user_password = $row[user_password];
            $user_level = $row[user_level];
            if ($user_level > 0) {
                $areyou = substr($user_password, 0, 10);
                if ($areyou==$code) {
                    $newpass = YA_MakePass();
                    $message .= _USERACCOUNT." '$user_name' "._AT." $sitename "._HASTHISEMAIL."  "._AWEBUSERFROM." $host_name "._HASREQUESTED."\r\n\r\n";
                    $message .= _YOURNEWPASSWORD." $newpass\r\n\r\n ";
                    $message .= _YOUCANCHANGE."\r\n$nukeurl/modules.php?name=$module_name\r\n\r\n"._IFYOUDIDNOTASK;
                    $subject = _USERPASSWORD4;
                    if ($username != "") {
                        $subject .= " '$user_name'";
                    } else if ($user_email !="") {
                        $subject .= " '$user_email'";
                    }
                    $from  = "From: $adminmail\r\n";
                    $from .= "Reply-To: $adminmail\r\n";
                    $from .= "Return-Path: $adminmail\r\n";
                    mail($user_email, $subject, $message, $from);
                    $cryptpass = md5($newpass);
                    if ($username != "") {
                        $query = "UPDATE ".$user_prefix."_users SET user_password='$cryptpass' WHERE username='$username'";
                    } else if ($user_email !="") {
                        $query = "UPDATE ".$user_prefix."_users SET user_password='$cryptpass' WHERE user_email='$user_email'";
                    }
                    include ("header.php");
                    OpenTable();
                    if (!$db->sql_query($query)) { echo "<center>"._UPDATEFAILED."</center><br>"; }
                    echo "<center><b>"._PASSWORD4." ";
                    if ($username != "") { echo "'$user_name'"; } else if ($user_email != "") { echo "'$user_email'"; }
                    echo " "._MAILED."</b><br><br>"._GOBACK."</center>";
                    CloseTable();
                    include ("footer.php");
                } else {
                    $host_name = $_SERVER["REMOTE_ADDR"];
                    $row = $db->sql_fetchrow($result);
                    $areyou = substr($user_password, 0, 10);
                    $message = _USERACCOUNT." '$user_name' "._AT." $sitename "._HASTHISEMAIL." "._AWEBUSERFROM." $host_name "._CODEREQUESTED."\r\n\r\n";
                    $message .= _YOURCODEIS." $areyou\r\n\r\n";
                    $message .= _WITHTHISCODE."\r\n$nukeurl/modules.php?name=$module_name&op=pass_lost\r\n\r\n";
                    $message .= _IFYOUDIDNOTASK2;
                    $subject = _CODEFOR;
                    if ($username != "") {
                        $subject .= " '$user_name'";
                    } else if ($user_email !="") {
                        $subject .= " '$user_email'";
                    }
                    $from  = "From: $adminmail\r\n";
                    $from .= "Reply-To: $adminmail\r\n";
                    $from .= "Return-Path: $adminmail\r\n";
                    mail($user_email, $subject, $message, $from);
                    include ("header.php");
                    OpenTable();
                    echo "<center><b>"._CODEFOR." ";
                    if ($username != "") { echo "'$user_name'"; } else if ($user_email != "") { echo "'$user_email'"; }
                    echo " "._MAILED."</b><br><br>"._GOBACK."</center>";
                    CloseTable();
                    include ("footer.php");
                }
            } elseif ($user_level == 0) {
                include("header.php");
                title(_USERREGLOGIN);
                OpenTable();
                echo "<center><font class='title'>"._ACCSUSPENDED."</font></center>\n";
                CloseTable();
                include("footer.php");
            } elseif ($user_level == -1) {
                include("header.php");
                title(_USERREGLOGIN);
                OpenTable();
                echo "<center><font class='title'>"._ACCDELETED."</font></center>\n";
                CloseTable();
                include("footer.php");
            }
        } else {
            include("header.php");
            title(_USERREGLOGIN);
            OpenTable();
            echo "<center>"._SERVERNOMAIL."</center>\n";
            CloseTable();
            include("footer.php");
        }

    }

?>