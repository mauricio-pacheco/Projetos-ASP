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

    $pagetitle = ": "._USERADMIN." - "._DETUSER;
    include("header.php");
    title(""._USERADMIN." - "._DETUSER.": <i>$chng_uid</i>");
    amain();
    echo "<br>\n";
    $result = $db->sql_query("select * from ".$user_prefix."_users_temp where user_id='$chng_uid'");
    if($db->sql_numrows($result) > 0) {
    $chnginfo = $db->sql_fetchrow($result);
    OpenTable();
    echo "<center><table border='0'>\n";
    echo "<tr><td bgcolor='$bgcolor2'>"._USERID.":</td><td><b><input type='text' value='$chnginfo[user_id]' size='40' disabled=disabled style='color=#000000;background-color: #FFFFFF'></b></td></tr>\n";
    echo "<tr><td bgcolor='$bgcolor2'>"._NICKNAME.":</td><td><b><input type='text' value='$chnginfo[username]' size='40' disabled=disabled style='color=#000000;background-color: #FFFFFF'></b></td></tr>\n";
    echo "<tr><td bgcolor='$bgcolor2'>"._UREALNAME.":</td><td><b><input type='text' value='$chnginfo[realname]' size='40' disabled=disabled style='color=#000000;background-color: #FFFFFF'></b></td></tr>\n";
    echo "<tr><td bgcolor='$bgcolor2'>"._EMAIL.":</td><td><b><a href='mailto:".$chnginfo['user_email']."'><input type='text' value='$chnginfo[user_email]' size='40' disabled=disabled style='color=#000000;background-color: #FFFFFF'></a></b></td></tr>\n";

    $result = $db->sql_query("SELECT * FROM ".$user_prefix."_cnbya_field WHERE need <> '0' ORDER BY pos");
    while ($sqlvalue = $db->sql_fetchrow($result)) {
	$t = $sqlvalue[fid];
	$result1 = $db->sql_query("SELECT * FROM ".$user_prefix."_cnbya_value_temp WHERE uid='$chng_uid' AND fid='$t'");
		while ($tmpsqlvalue = $db->sql_fetchrow($result1)) {
			$tmp_value=$tmpsqlvalue[value];
			if (substr($sqlvalue[name],0,1)=='_') eval( "\$name_exit = $sqlvalue[name];"); else $name_exit = $sqlvalue[name];
			echo "<tr><td bgcolor='$bgcolor2'>$name_exit</td><td bgcolor='$bgcolor3'><b><input type='text' value='$tmp_value' size='40' disabled=disabled style='color=#000000;background-color: #FFFFFF'>></b>";
			echo "</td></tr>\n";
		}
    }

    echo "<tr><td bgcolor='$bgcolor2'>"._REGDATE.":</td><td><input type='text' value='$chnginfo[user_regdate]' size='40' disabled=disabled style='color=#000000;background-color: #FFFFFF'></td></tr>\n";
    $chnginfo['time'] = date("D M j H:i T Y", $chnginfo['time']);
    echo "<tr><td bgcolor='$bgcolor2'>"._YA_APPROVE2.":</td><td><input type='text' value='$chnginfo[time]' size='40' disabled=disabled style='color=#000000;background-color: #FFFFFF'> </td></tr>\n";
    echo "<tr><td bgcolor='$bgcolor2'>"._CHECKNUM.":</td><td><input type='text' value=".$chnginfo['check_num']." size='40' disabled=disabled style='color=#000000;background-color: #FFFFFF'></td></tr>\n";
    echo "<tr><td colspan=\"2\" align=\"left\"><br>\n";

        echo "<table cellspacing=\"0\" cellpadding=\"0\" border='0'><tr>\n";
		echo "<form action='modules.php?name=$module_name&file=admin' method='post'><td>\n";
		if (isset($min)) { echo "<input type='hidden' name='min' value='$min'>\n"; }
		if (isset($xop)) { echo "<input type='hidden' name='op' value='$xop'>\n"; }
		echo "<input type='submit' value='"._RETURN."'></td></form>\n";
        echo "<td width=\"3\"></td>\n";
		echo "<form action='modules.php?name=$module_name&file=admin' method='post'><td>\n";
		if (isset($min)) { echo "<input type='hidden' name='min' value='$min'>\n"; }
		if (isset($xop)) { echo "<input type='hidden' name='op' value='$xop'>\n"; }
		echo "<input type='hidden' name='op' value='modifyTemp'>\n";
		echo "<input type='hidden' name='chng_uid' value='".$chnginfo['user_id']."'>\n";
		echo "<input type='submit' value='"._MODIFY."'></td></form>\n";
        echo "<td width=\"3\"></td>\n";
		echo "<form action='modules.php?name=$module_name&file=admin' method='post'><td>\n";
		if (isset($min)) { echo "<input type='hidden' name='min' value='$min'>\n"; }
		if (isset($xop)) { echo "<input type='hidden' name='op' value='$xop'>\n"; }
		echo "<input type='hidden' name='op' value='denyUser'>\n";
		echo "<input type='hidden' name='chng_uid' value='".$chnginfo['user_id']."'>\n";
		echo "<input type='submit' value='"._DENY."'></td></form>\n";
        echo "<td width=\"3\"></td>\n";
			if ($ya_config['useactivate'] == 0) {
				echo "<form action='modules.php?name=$module_name&file=admin' method='post'><td valign=\"top\">\n";
				if (isset($min)) { echo "<input type='hidden' name='min' value='$min'>\n"; }
				if (isset($xop)) { echo "<input type='hidden' name='xop' value='$xop'>\n"; }
				echo "<input type='hidden' name='op' value='approveUserConf'>\n";
				echo "<input type='hidden' name='apr_uid' value='".$chnginfo['user_id']."'>\n";
				echo "<input type='submit' value='"._YA_APPROVE."'></td></form>\n";
			} else {
				echo "<form action='modules.php?name=$module_name&file=admin' method='post'><td>\n";
				if (isset($min)) { echo "<input type='hidden' name='min' value='$min'>\n"; }
				if (isset($xop)) { echo "<input type='hidden' name='xop' value='$xop'>\n"; }
				echo "<input type='hidden' name='op' value='activateUser'>\n";
				echo "<input type='hidden' name='act_uid' value='".$chnginfo['user_id']."'>\n";
				echo "<input type='submit' value='"._YA_ACTIVATE."'></td></form>\n";
			}
        echo "</tr></table>\n";

    echo "</td></tr><tr><td colspan=\"2\"><b>"._NOTE."</b>\n";
    echo "</td></tr><tr><td colspan=\"2\"><b>"._YA_APPROVENOTE."</b>\n";
    echo "</td></tr><tr><td colspan=\"2\"><b>"._YA_ACTIVATENOTE."</b>\n";

    echo "</td></tr></table></center>\n";
    echo "<br>\n";
    CloseTable();
    } else {
        OpenTable();
        echo "<center><b>"._USERNOEXIST."</b></center>\n";
        CloseTable();
    }
    include("footer.php");

}

?>