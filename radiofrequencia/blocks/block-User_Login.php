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

/********************************************************/
/* User Login Block for PHP-Nuke                        */
/* By: NukeScripts Network (webmaster@nukescripts.net)  */
/* http://www.nukescripts.net                           */
/* Copyright © 2000-2004 by NukeScripts Network         */
/********************************************************/

if (eregi("block-User_Login.php", $_SERVER['PHP_SELF'])) { Header("Location: index.php"); }
global $redirect, $mode, $f, $t, $sitekey, $nukeurl, $user, $cookie, $prefix, $user_prefix, $db, $anonymous, $gfx_chk;
include_once("modules/Your_Account/includes/functions.php");
$ya_config = ya_get_configs();
$content = "";

// User Login
if (is_user($user)) {
    $memname = $cookie[1];
    $content .= ""._BWEL.", <b>$memname</b>.<br>(<a href=\"modules.php?name=Your_Account&op=logout\">"._BLOGOUT."</a>)\n";
    $content .= "<hr noshade size=\"1\">\n";
    if(is_active("Private_Messages")) {
        list($uid) = $db->sql_fetchrow($db->sql_query("select user_id from $user_prefix"._users." where username='$memname'"));
        $newpms = $db->sql_numrows($db->sql_query("select privmsgs_to_userid from $prefix"._bbprivmsgs." where privmsgs_to_userid='$uid' and (privmsgs_type='1' OR privmsgs_type='5')"));
        $savpms = $db->sql_numrows($db->sql_query("select privmsgs_to_userid from $prefix"._bbprivmsgs." where privmsgs_to_userid='$uid' and privmsgs_type='3'"));
        $oldpms = $db->sql_numrows($db->sql_query("select privmsgs_to_userid from $prefix"._bbprivmsgs." where privmsgs_to_userid='$uid' and privmsgs_type='0'"));
        $totpms = $newpms + $oldpms + $savpms;
        $content .= "<a href=\"modules.php?name=Private_Messages\"><b>"._BPM.":</b></a><br>\n";
        $content .= "<big><b>&middot;</b></big> "._BUNREAD.": <b>$newpms</b><br>\n";
        $content .= "<big><b>&middot;</b></big> "._BREAD.": <b>$oldpms</b><br>\n";
        $content .= "<big><b>&middot;</b></big> "._BSAVED.": <b>$savpms</b><br>\n";
        $content .= "<big><b>&middot;</b></big> "._BTT.": <b>$totpms</b><br>\n";
        $content .= "<hr noshade size=\"1\">\n";
    }
} else {
    mt_srand ((double)microtime()*1000000);
    $maxran = 10 * intval($ya_config['codesize']);
    $random_num = mt_rand(0, $maxran);
    $content .= ""._BWEL.", <b>$anonymous</b><br>\n<br>\n";
    $content .= "<table border=0 cellpadding=0 cellspacing=0>\n";
    $content .= "<tr><form action=\"modules.php?name=Your_Account\" method=\"post\">\n";
    $content .= "<td>"._BNICK.": <input type=\"text\" name=\"username\" size=\"10\" maxlength=\"25\"><br>\n";
    $content .= ""._BPASS.": <input type=\"password\" name=\"user_password\" size=\"10\" maxlength=\"20\" AutoComplete=\"off\"><br>\n";
    if (extension_loaded("gd") AND ($ya_config['usegfxcheck'] == 2 OR $ya_config['usegfxcheck'] == 3)) {
        $content .=""._BCODE.": <img src='modules.php?name=Your_Account&op=gfx&random_num=$random_num' border='1' height='20' width='77' alt='"._BCODE."' title='"._BCODE."'><br>\n";
        $content .=""._BTYPECODE.": <input type=\"text\" NAME=\"gfx_check\" SIZE=\"10\" MAXLENGTH=\"10\" AutoComplete=\"off\"><br>\n";
        $content .="<input type=\"hidden\" name=\"random_num\" value=\"$random_num\">\n";
    }
    $content .="<input type=\"hidden\" name=\"redirect\" value=$redirect>\n";
    $content .="<input type=\"hidden\" name=\"mode\" value=$mode>\n";
    $content .="<input type=\"hidden\" name=\"f\" value=$f>\n";
    $content .="<input type=\"hidden\" name=\"t\" value=$t>\n";
    $content .="<input type=\"hidden\" name=\"op\" value=\"login\">\n";
    $content .= "<input type=\"submit\" value=\""._BLOGIN."\"> (<a href=\"modules.php?name=Your_Account&op=new_user\">"._BREG."</a>)\n";
    $content .= "</td>\n";
    $content .= "</form></tr>\n";
    $content .= "</table>\n";
}

?>