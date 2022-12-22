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

    $pagetitle = ": "._USERADMIN." - "._WAITINGUSERS;
    include("header.php");
    title(_USERADMIN.": "._WAITINGUSERS);
    amain();
    echo "<br>\n";
    OpenTable();
    if (!isset($min)) $min=0;
    if (!isset($max)) $max=$min+$ya_config['perpage'];
    $totalselected = $db->sql_numrows($db->sql_query("SELECT * FROM ".$user_prefix."_users_temp"));
    echo "<table align='center' cellpadding='2' cellspacing='2' bgcolor='$textcolor1' border='0'>\n";
    echo "<tr bgcolor='$bgcolor2'>\n<td><b>"._USERNAME." ("._USERID.")</b></td>\n";
    echo "<td align='center'><b>"._UREALNAME."</b></td>\n";
    echo "<td align='center'><b>"._EMAIL."</b></td>\n";
    echo "<td align='center'><b>"._REGDATE."</b></td>\n";
    echo "<td align='center'><b>"._FUNCTIONS."</b></td>\n</tr>\n";
    $result = $db->sql_query("SELECT * FROM ".$user_prefix."_users_temp ORDER BY username LIMIT $min,".$ya_config['perpage']."");
    while($chnginfo = $db->sql_fetchrow($result)) {
        echo "<tr bgcolor='$bgcolor1'>\n<form action='modules.php?name=$module_name&file=admin' method='post'>\n";
        echo "<input type='hidden' name='min' value='$min'>\n";
        echo "<input type='hidden' name='xop' value='$op'>\n";
        echo "<input type='hidden' name='apr_uid' value='".$chnginfo['user_id']."'>\n";
        echo "<input type='hidden' name='act_uid' value='".$chnginfo['user_id']."'>\n";
        echo "<input type='hidden' name='chng_uid' value='".$chnginfo['user_id']."'>\n";
        echo "<td>".$chnginfo['username']." (".$chnginfo['user_id'].")</td>\n";
        echo "<td align='center'>".$chnginfo['realname']."</td>\n";
        echo "<td align='center'>".$chnginfo['user_email']."</td>\n";
        echo "<td align='center'>".$chnginfo['user_regdate']."</td>\n";
        echo "<td align='center'><select name='op'>\n";
        echo "<option value='detailsTemp' selected='selected'>"._DETUSER."</option>\n";
        echo "<option value='approveUser'>"._YA_APPROVE."</option>\n";
        echo "<option value='activateUser'>"._YA_ACTIVATE."</option>\n";
        echo "<option value='modifyTemp'>"._MODIFY."</option>\n";
        echo "<option value='denyUser'>"._DENY."</option>\n";
        echo "<option value='resendMail'>"._RESEND."</option>\n";
        echo "</select><input type='submit' value='"._OK."'>\n";
        echo "</td></form></tr>\n";
    }
    echo "";
    echo "</td></table>\n";
    echo "<br>\n";
    yapagenums($op, $totalselected, $ya_config['perpage'], $max, "", "", "", "");
    CloseTable();
    include("footer.php");

}

?>