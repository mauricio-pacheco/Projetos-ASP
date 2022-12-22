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

    $pagetitle = ": "._USERADMIN." - "._SEARCHUSERS;
    include("header.php");
    title(_USERADMIN.": "._SEARCHUSERS);
    amain();
    echo "<br>\n";
    asearch();
    echo "<br>\n";
    OpenTable();
    $query = str_replace("\"","",$query);
    $query = str_replace("\'","",$query);
    if ($find == "findUser") { $usertable = $user_prefix."_users"; } else { $usertable = $user_prefix."_users_temp"; }
    if ($match == "equal") { $sign = "='$query'"; } else { $sign = "LIKE '%".$query."%'"; }
    if (!isset($min)) $min=0;
    if (!isset($max)) $max=$min+$ya_config['perpage'];
    $totalselected = $db->sql_numrows($db->sql_query("SELECT * FROM $usertable WHERE $what $sign"));
    echo "<table align='center' cellpadding='2' cellspacing='2' bgcolor='$textcolor1' border='0'>\n";
    echo "<tr bgcolor='$bgcolor2'>\n<td><b>"._USERID."</b></td>\n";
    echo "<td><b>"._USERNAME."</b></td>\n";
    echo "<td align='center'><b>"._UREALNAME."</b></td>\n";
    echo "<td align='center'><b>"._EMAIL."</b></td>\n";
    echo "<td align='center'><b>"._REGDATE."</b></td>\n";
    echo "<td align='center'><b>"._FUNCTIONS."</b></td>\n</tr>\n";
    $result = $db->sql_query("SELECT * FROM $usertable WHERE $what $sign ORDER BY username LIMIT $min,".$ya_config['perpage']."");
    while($chnginfo = $db->sql_fetchrow($result)) {
        echo "<tr bgcolor='$bgcolor1'><form action='modules.php?name=$module_name&file=admin' method='post'>\n";
        echo "<input type='hidden' name='query' value='$query'>\n";
        echo "<input type='hidden' name='find' value='$find'>\n";
        echo "<input type='hidden' name='what' value='$what'>\n";
        echo "<input type='hidden' name='match' value='$match'>\n";
        echo "<input type='hidden' name='min' value='$min'>\n";
        echo "<input type='hidden' name='xop' value='$op'>\n";
        echo "<input type='hidden' name='chng_uid' value='".$chnginfo['user_id']."'>\n";
        echo "<td>".$chnginfo['user_id']."</td>\n";
        echo "<td>".$chnginfo['username']."</td>\n";
        echo "<td align='center'>".$chnginfo['realname']."</td>\n";
        echo "<td align='center'>".$chnginfo['user_email']."</td>\n";
        echo "<td align='center'>".$chnginfo['user_regdate']."</td>\n";
        echo "<td align='center'><select name='op'>\n";
        if ($find == "tempUser") {
            echo "<option value='detailsTemp'>"._DETUSER."</option>\n";
            echo "<option value='modifyTemp'>"._MODIFY."</option>\n";
            echo "<option value='resendMail'>"._RESEND."</option>\n";
            echo "<option value='approveUser'>"._APPROVE."</option>\n";
            echo "<option value='denyUser'>"._DENY."</option>\n";
        } else {
            echo "<option value='detailsUser'>"._DETUSER."</option>\n";
            echo "<option value='modifyUser'>"._MODIFY."</option>\n";
            // suspended
            if ($chnginfo['user_level'] == 0) { echo "<option value='restoreUser'>"._RESTORE."</option>\n"; }
            // deactivated
            if ($chnginfo['user_level'] == -1) { echo "<option value='removeUser'>"._REMOVE."</option>\n"; }
            // active
            if ($chnginfo['user_level'] > 0 AND $radminsuper == 1) { echo "<option value='promoteUser'>"._PROMOTE."</option>\n"; }
            if ($chnginfo['user_level'] == 1) { echo "<option value='suspendUser'>"._SUSPEND."</option>\n"; }
            if ($chnginfo['user_level'] > -1) { echo "<option value='deleteUser'>"._YA_DEACTIVATE."</option>\n"; }
        }
        echo "</select><input type='submit' value='"._OK."'></td>\n";
        echo "</form></tr>\n";
    }
    echo "</table>\n";
    echo "<br>\n";
    yapagenums($op, $totalselected, $ya_config['perpage'], $max, $find, $what, $match, $query);
    CloseTable();
    include("footer.php");

}

?>