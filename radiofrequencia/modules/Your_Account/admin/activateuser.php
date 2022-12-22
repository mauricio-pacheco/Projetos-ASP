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

    list($username, $realname, $email, $check_num) = $db->sql_fetchrow($db->sql_query("SELECT username, realname, user_email, check_num FROM ".$user_prefix."_users_temp WHERE user_id='$act_uid'"));
    $pagetitle = ": "._USERADMIN." - "._YA_ACTIVATEUSER;
    include("header.php");
    title(_USERADMIN." - "._YA_ACTIVATEUSER);
    amain();
    echo "<br>\n";
    OpenTable();
    echo "<center><table align='center' border='0' cellpadding='0' cellspacing='0'>\n";
    echo "<tr><td align=center><b>"._SURE2ACTIVATE.":</b></td></tr><td><br>\n";

    OpenTable();
        echo "<table align='center' border='0' align=\"center\">";
        echo "<tr><td width=\"50%\"><b>"._USERNAME.":</b></td><td align=\"left\">$username<br></td></tr>";
        echo "<tr><td width=\"50%\"><b>"._UREALNAME.":</b></td><td align=\"left\">$realname<br></td></tr>";
        echo "<tr><td width=\"50%\"><b>"._EMAIL.":</b></td><td align=\"left\">$email</td></tr>";
        echo "</table>";
    CloseTable();

    echo "<br></td></tr>";

    echo "<tr><td colspan=\"2\" align=\"center\">\n";

        echo "<table cellspacing=\"0\" cellpadding=\"0\" border='0' align=\"center\"><tr>\n";
		echo "<form action='modules.php?name=$module_name&file=admin' method='post'><td width=\"49%\" align=\"right\">\n";
		if (isset($min)) { echo "<input type='hidden' name='min' value='$min'>\n"; }
		if (isset($xop)) { echo "<input type='hidden' name='xop' value='$xop'>\n"; }
		echo "<input type='hidden' name='op' value='activateUserConf'>\n";
		echo "<input type='hidden' name='act_uid' value='$act_uid'>\n";
		echo "<input type='submit' value='"._YES."'></td></form>\n";
        echo "<td width=\"10\"></td>\n";
		echo "<form action='modules.php?name=$module_name&file=admin' method='post'><td width=\"49%\" align=\"left\">\n";
		if (isset($min)) { echo "<input type='hidden' name='min' value='$min'>\n"; }
		if (isset($xop)) { echo "<input type='hidden' name='op' value='$xop'>\n"; }
		echo "<input type='submit' value='"._NO."'></td></form>\n";
        echo "</tr><tr><td colspan=\"3\" align=\"center\">\n";
		echo "<br><b>"._YA_ACTIVATEWARN1."</b>\n";
		echo "<br><b>"._YA_ACTIVATEWARN2."</b>\n";
        echo "</td></tr><tr>\n";
		echo "<form action='modules.php?name=$module_name&file=admin' method='post'><td colspan=\"3\" align=\"center\">\n";
		if (isset($min)) { echo "<input type='hidden' name='min' value='$min'>\n"; }
		if (isset($xop)) { echo "<input type='hidden' name='xop' value='$xop'>\n"; }
		echo "<input type='hidden' name='op' value='approveUserConf'>\n";
		echo "<input type='hidden' name='apr_uid' value='$act_uid'>\n";
		echo "<input type='submit' value='"._YA_APPROVEUSER."'></td></form>\n";
        echo "</tr></table>\n";

    echo "</td></tr></table></center>\n";
    CloseTable();
    include("footer.php");

}

?>