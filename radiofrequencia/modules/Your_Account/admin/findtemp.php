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

    $pagetitle = ": "._USERADMIN." - "._FINDTEMP;
    include("header.php");
    title(""._USERADMIN." - "._FINDTEMP);
    amain();
    echo "<br>\n";
    if (isset($xusername) AND $xusername != "") {
        $sql = "SELECT * FROM ".$user_prefix."_users_temp WHERE username='$xusername'";
    } elseif (isset($xuser_id) AND $xuser_id != "") {
        $sql = "SELECT * FROM ".$user_prefix."_users_temp WHERE user_id='$xuser_id'";
    } elseif (isset($xuser_email) AND $xuser_email != "") {
        $sql = "SELECT * FROM ".$user_prefix."_users_temp WHERE user_email='$xuser_email'";
    }
    if($db->sql_numrows($db->sql_query($sql)) > 0) {
        $chnginfo = $db->sql_fetchrow($db->sql_query($sql));
        OpenTable();
        echo "<center><table border='0'>\n";
        echo "<tr><td bgcolor='$bgcolor2'>"._USERID.":</td><td><b>".$chnginfo['user_id']."</b></td></tr>\n";
        echo "<tr><td bgcolor='$bgcolor2'>"._NICKNAME.":</td><td><b>".$chnginfo['username']."</b></td></tr>\n";
        echo "<tr><td bgcolor='$bgcolor2'>"._EMAIL.":</td><td><b><a href='mailto:".$chnginfo['user_email']."'>".$chnginfo['user_email']."</a></b></td></tr>\n";
        echo "<tr><td bgcolor='$bgcolor2'>"._REGDATE.":</td><td><b>".$chnginfo['user_regdate']."</b></td></tr>\n";
        echo "<tr><td bgcolor='$bgcolor2'>"._CHECKNUM.":</td><td><b>".$chnginfo['check_num']."</b></td></tr>\n";
        echo "<form action='modules.php?name=$module_name&file=admin' method='post'>\n";
        echo "<input type='hidden' name='op' value='modifyTemp'>\n";
        echo "<input type='hidden' name='chng_uid' value='".$chnginfo['user_id']."'>\n";
        echo "<tr><td align='center' colspan='2'><input type='submit' value='"._MODIFY."'></td></tr>\n";
        echo "</form>\n";
        echo "<form action='modules.php?name=$module_name&file=admin' method='post'>\n";
        echo "<tr><td align='center' colspan='2'><input type='submit' value='"._RETURN."'></td></tr>\n";
        echo "</form>\n";
        echo "</table></center>\n";
        CloseTable();
    } else {
        OpenTable();
        echo "<center><b>"._TEMPNOEXIST."</b></center>\n";
        CloseTable();
    }
    include("footer.php");

}

?>