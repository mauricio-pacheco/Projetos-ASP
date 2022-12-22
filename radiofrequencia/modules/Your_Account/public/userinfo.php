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
$resultbc = $db->sql_query("SELECT * FROM ".$prefix."_bbconfig"); 
while($rowbc = $db->sql_fetchrow($resultbc)) { 
    $board_config[$rowbc[config_name]] = $rowbc[config_value]; 
}
$result  = $db->sql_query("SELECT * FROM ".$user_prefix."_users WHERE username='$username'");
$num     = $db->sql_numrows($result);
$usrinfo = $db->sql_fetchrow($result);

$result = $db->sql_query("SELECT * FROM ".$user_prefix."_cnbya_field");
while ($sqlvalue = $db->sql_fetchrow($result)) {
  list($value) = $db->sql_fetchrow( $db->sql_query("SELECT value FROM ".$user_prefix."_cnbya_value WHERE fid ='$sqlvalue[fid]' AND uid = '$usrinfo[user_id]'"));
  $usrinfo[$sqlvalue[name]] = $value;
}

if(!$bypass) cookiedecode($user);
include("header.php");

if ($num > 0) {
    if ($usrinfo[user_level] > 0) {
        OpenTable();
        echo "<center>";
        if ((strtolower($usrinfo['username']) == strtolower($cookie[1])) AND ($usrinfo['user_password'] == $cookie[2])) {
            echo "<font class=\"option\">$username, "._WELCOMETO." $sitename!</font><br><br>";
            echo "<font class=\"content\">"._THISISYOURPAGE."</font></center><br>";
            nav(1);
            echo "<br>";
        } else {
            echo "<font class=\"title\">"._PERSONALINFO.": ".$usrinfo['username']."</font></center><br>";
        }
        if($num == 1) {
            echo "<center>\n";
            echo "<table bgcolor='$bgcolor4' border='0' cellpadding='2' cellspacing='1' class='content' width='60%'>\n";
            echo "<tr>\n<td align='center' bgcolor='$bgcolor2' class='title' colspan='2' width='100%'>";
            if ($usrinfo[user_avatar_type] == 1) {		// Type 1
                $user_avatar = $board_config[avatar_path]."/".$usrinfo[user_avatar]; 
            } elseif($usrinfo[user_avatar_type] == 2) {	// Type 2
                echo "<img src='$usrinfo[user_avatar]'>";
            } elseif($usrinfo[user_avatar] == "") {		// Type 3
                echo "<img src='".$board_config[avatar_gallery_path]."/gallery/blank.gif'>";
            } else {
                echo "<img src='".$board_config[avatar_gallery_path]."/".$usrinfo[user_avatar]."'>";
            }
            echo "</td>\n</tr>\n";
            $usrinfo[user_website] = strtolower($usrinfo[user_website]);
            $usrinfo[user_website] = str_replace("http://", "", $usrinfo[user_website]);
            if ($usrinfo[user_website] == "") {
                $userwebsite = _YA_NA;
            } else {
                $userwebsite = "<a href=\"http://$usrinfo[user_website]\" target=\"new\">$usrinfo[user_website]</a>";
            }
            if (is_admin($admin) || $usrinfo['user_viewemail'] == 1) {
                $user_email = "<a href='mailto:$usrinfo[user_email]'>$usrinfo[user_email]</a>"; 
            } else {
                $user_email = _YA_NA;
            }
            $usrinfo[user_sig] = nl2br($usrinfo[user_sig]);
            $usrinfo[user_bio] = nl2br($usrinfo[user_bio]);
            $usrinfo[user_lastvisit] = date("D M j H:i:s T Y", $usrinfo[user_lastvisit]);
            echo "<tr>\n<td width='30%' bgcolor='$bgcolor1'>"._USERNAME."</td>\n<td width='70%' bgcolor='$bgcolor1'><b>$usrinfo[username]</b></td>\n</tr>\n";
            echo "<tr>\n<td width='30%' bgcolor='$bgcolor1'>"._REALNAME."</td>\n<td width='70%' bgcolor='$bgcolor1'><b>$usrinfo[name]</b></td>\n</tr>\n";
            echo "<tr>\n<td width='30%' bgcolor='$bgcolor1'>"._EMAIL."</td>\n<td width='70%' bgcolor='$bgcolor1'><b>$user_email</b></td>\n</tr>\n";
            echo "<tr>\n<td width='30%' bgcolor='$bgcolor1'>"._WEBSITE."</td>\n<td width='70%' bgcolor='$bgcolor1'><b>$userwebsite</b></td>\n</tr>\n";

		if(is_admin($admin) OR is_user($user) AND $usrinfo[username] == $username) {
                    $result = $db->sql_query("SELECT * FROM ".$user_prefix."_cnbya_field WHERE need <> '0' ORDER BY pos");
		} else {
			$result = $db->sql_query("SELECT * FROM ".$user_prefix."_cnbya_field WHERE need <> '0' AND public='1' ORDER BY pos");
		}
		while ($sqlvalue = $db->sql_fetchrow($result)) {
			if (substr($sqlvalue[name],0,1)=='_') eval( "\$name_exit = $sqlvalue[name];"); else $name_exit = $sqlvalue[name];
			echo "<tr><td width='30%' bgcolor='$bgcolor1'>$name_exit</td><td width='70%' bgcolor='$bgcolor1'>".$usrinfo[$sqlvalue[name]]."</td></tr>\n";
		}
			
            echo "<tr>\n<td width='30%' bgcolor='$bgcolor1'>"._ICQ."</td>\n<td width='70%' bgcolor='$bgcolor1'><b>$usrinfo[user_icq]</b></td>\n</tr>\n";
            echo "<tr>\n<td width='30%' bgcolor='$bgcolor1'>"._AIM."</td>\n<td width='70%' bgcolor='$bgcolor1'><b>$usrinfo[user_aim]</b></td>\n</tr>\n";
            echo "<tr>\n<td width='30%' bgcolor='$bgcolor1'>"._YIM."</td>\n<td width='70%' bgcolor='$bgcolor1'><b>$usrinfo[user_yim]</b></td>\n</tr>\n";
            echo "<tr>\n<td width='30%' bgcolor='$bgcolor1'>"._MSNM."</td>\n<td width='70%' bgcolor='$bgcolor1'><b>$usrinfo[user_msnm]</b></td>\n</tr>\n";
            echo "<tr>\n<td width='30%' bgcolor='$bgcolor1'>"._LOCATION."</td>\n<td width='70%' bgcolor='$bgcolor1'><b>$usrinfo[user_from]</b></td>\n</tr>\n";
            echo "<tr>\n<td width='30%' bgcolor='$bgcolor1'>"._REGDATE."</td>\n<td width='70%' bgcolor='$bgcolor1'><b>$usrinfo[user_regdate]</b></td>\n</tr>\n";
            echo "<tr>\n<td width='30%' bgcolor='$bgcolor1'>"._OCCUPATION."</td>\n<td width='70%' bgcolor='$bgcolor1'><b>$usrinfo[user_occ]</b></td>\n</tr>\n";
            echo "<tr>\n<td width='30%' bgcolor='$bgcolor1'>"._INTERESTS."</td>\n<td width='70%' bgcolor='$bgcolor1'><b>$usrinfo[user_interests]</b></td>\n</tr>\n";
            echo "<tr>\n<td width='30%' bgcolor='$bgcolor1'>"._SIGNATURE."</td>\n<td width='70%' bgcolor='$bgcolor1'><b>$usrinfo[user_sig]</b></td>\n</tr>\n";
            echo "<tr>\n<td width='30%' bgcolor='$bgcolor1'>"._EXTRAINFO."</td>\n<td width='70%' bgcolor='$bgcolor1'><b>$usrinfo[bio]</b></td>\n</tr>\n";
            echo "<tr>\n<td width='30%' bgcolor='$bgcolor1'>"._YA_LASTVISIT."</td>\n<td width='70%' bgcolor='$bgcolor1'><b>$usrinfo[user_lastvisit]</b></td>\n</tr>\n";
            $sql2 = "SELECT uname FROM ".$prefix."_session WHERE uname='$username'";
            $result2 = $db->sql_query($sql2);
            $row2 = $db->sql_fetchrow($result2);
            $username_pm = $username;
            $username = $row2[uname];
            if ($username == "") { $online = _OFFLINE; } else { $online = _ONLINE; }
            echo "<tr>\n<td width='30%' bgcolor='$bgcolor1'>"._USERSTATUS."</td>\n<td width='70%' bgcolor='$bgcolor1'><b>$online</b></td>\n</tr>\n";
            if ($Version_Num > 6.9) {
                if (is_user($user) AND $cookie[1] == "$username" OR is_admin($admin)) {
                    echo "<tr>\n<td width='30%' bgcolor='$bgcolor1'>"._YA_POINTS."</td>\n<td width='70%' bgcolor='$bgcolor1'><b>$usrinfo[points]</b></td>\n</tr>\n";
                }
            }
            if (($usrinfo[newsletter] == 1) AND ($username == $cookie[1]) AND ($usrinfo[user_password] == $cookie[2]) OR (is_admin($admin) AND ($usrinfo[newsletter] == 1))) {
                echo "<tr>\n<td width='30%' bgcolor='$bgcolor1'>"._NEWSLETTER."</td>\n<td width='70%' bgcolor='$bgcolor1'><b>"._SUBSCRIBED."</b></td>\n</tr>\n";
            } elseif (($usrinfo[newsletter] == 0) AND ($username == $cookie[1]) AND ($usrinfo[user_password] == $cookie[2]) OR (is_admin($admin) AND ($usrinfo[newsletter] == 0))) {
                echo "<tr>\n<td width='30%' bgcolor='$bgcolor1'>"._NEWSLETTER."</td>\n<td width='70%' bgcolor='$bgcolor1'><b>"._NOTSUBSCRIBED."</b></td>\n</tr>\n";
            }
            echo "</table>\n";
            echo "</center><br>\n<center>\n";
            if (is_active("Journal") AND $cookie[1] != $username) {
                $sql3 = "SELECT jid FROM ".$prefix."_journal WHERE aid='$username' AND status='yes' ORDER BY pdate,jid DESC LIMIT 0,1";
                $result3 = $db->sql_query($sq3);
                $row3 = $db->sql_fetchrow($result3);
                $jid = $row3[jid];
                if ($jid != "" AND isset($jid)) {
                    echo "[ <a href=\"modules.php?name=Journal&file=search&bywhat=aid&forwhat=$username\">"._READMYJOURNAL."</a> ]<br>";
                }
            }
            if (is_admin($admin)) {
                if ($userinfo[last_ip] != 0) {
                echo "<center>"._LASTIP." <b>$userinfo[last_ip]</b><br>";
                echo "[ <a href='".$admin_file.".php?op=ipban&ip=$userinfo[last_ip]'>"._BANTHIS."</a> ]<br>";
                } 
                echo "[ <a href=\"modules.php?name=$module_name&file=admin&op=modifyUser&chng_uid=$usrinfo[user_id]\">"._EDITUSER."</a> ] ";
                echo "[ <a href=\"modules.php?name=$module_name&file=admin&op=suspendUser&chng_uid=$usrinfo[user_id]\">"._SUSPENDUSER."</a> ] ";
                echo "[ <a href=\"modules.php?name=$module_name&file=admin&op=deleteUser&chng_uid=$usrinfo[user_id]\">"._DELETEUSER."</a> ]<br>";
            }
            if (((is_user($user) AND $cookie[1] != $username) OR is_admin($admin)) AND is_active("Private_Messages")) { echo "<br>[ <a href=\"modules.php?name=Private_Messages&mode=post&u=$usrinfo[user_id]\">"._USENDPRIVATEMSG." $usrinfo[username]</a> ]<br>\n"; }
            echo "</center></font>";
        } else {
            echo "<center>"._NOINFOFOR." $username</center>";
        }
        CloseTable();

        $incsdir = dir("modules/$module_name/includes");
        while($func=$incsdir->read()) {
            if(substr($func, 0, 3) == "ui-") {
                $incslist .= "$func ";
            }
        }
        closedir($incsdir->handle);
        $incslist = explode(" ", $incslist);
        sort($incslist);
        for ($i=0; $i < sizeof($incslist); $i++) {
            if($incslist[$i]!="") {
                $counter = 0;
                include($incsdir->path."/$incslist[$i]");
            }
        }

    } else {
        OpenTable();
        echo "<center><b>"._NOINFOFOR." <i>".$usrinfo['username']."</i></b></center>";
        if($usrinfo[user_level] == 0) { echo "<br><center><b>"._ACCSUSPENDED."</b></center>"; }
        if($usrinfo[user_level] == -1) { echo "<br><center><b>"._ACCDELETED."</b></center>"; }
        CloseTable();
    }
} else {
    OpenTable();
    echo "<center><b>"._NOINFOFOR." <i>".$usrinfo['username']."</i></b></center>";
    echo "<br><center><b>"._YA_ACCNOFIND."</b></center>";
    CloseTable();
}
include("footer.php");

?>