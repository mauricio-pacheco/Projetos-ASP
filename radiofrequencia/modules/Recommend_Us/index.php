<?php

# $Author: chatserv $
# $Date: 2004/12/08 00:25:44 $
/************************************************************************/
/* PHP-NUKE: Web Portal System                                          */
/* ===========================                                          */
/*                                                                      */
/* Copyright (c) 2002 by Francisco Burzi                                */
/* http://phpnuke.org                                                   */
/*                                                                      */
/* This program is free software. You can redistribute it and/or modify */
/* it under the terms of the GNU General Public License as published by */
/* the Free Software Foundation; either version 2 of the License.       */
/************************************************************************/
/*         Additional security & Abstraction layer conversion           */
/*                           2003 chatserv                              */
/*      http://www.nukefixes.com -- http://www.nukeresources.com        */
/************************************************************************/

if (!stristr($_SERVER['SCRIPT_NAME'], "modules.php")) {
	die ("You can't access this file directly...");
}
require_once("mainfile.php");
$module_name = basename(dirname(__FILE__));
get_lang($module_name);
$pagetitle = "- "._RECOMMEND."";

function RecommendSite() {
    global $user, $cookie, $prefix, $db, $user_prefix, $module_name;
    include ("header.php");
    OpenTable();
    echo "<center><font class=\"content\"><b>"._RECOMMEND."</b></font></center><br><br>"
		."<form action=\"modules.php?name=$module_name\" method=\"post\">"
		."<input type=\"hidden\" name=\"op\" value=\"SendSite\">";
    if (is_user($user)) {
    	$row = $db->sql_fetchrow($db->sql_query("SELECT username, user_email from ".$user_prefix."_users where username='$cookie[1]'"));
		$yn = stripslashes($row['username']);
		$ye = stripslashes($row['user_email']);
    }
    echo "<b>"._FYOURNAME." </b> <input type=\"text\" name=\"yname\" value=\"$yn\"><br><br>\n"
		."<b>"._FYOUREMAIL." </b> <input type=\"text\" name=\"ymail\" value=\"$ye\"><br><br><br>\n"
		."<b>"._FFRIENDNAME." </b> <input type=\"text\" name=\"fname\"><br><br>\n"
		."<b>"._FFRIENDEMAIL." </b> <input type=\"text\" name=\"fmail\"><br><br>\n"
		."<input type=submit value="._SEND.">\n"
		."</form>\n";
    CloseTable();
    include ('footer.php');
}

function SendSite($yname, $ymail, $fname, $fmail) {
    global $sitename, $slogan, $nukeurl, $module_name;
    $fname = stripslashes(FixQuotes(check_html(removecrlf($fname))));
    $fmail = stripslashes(FixQuotes(check_html(removecrlf($fmail))));
    $yname = stripslashes(FixQuotes(check_html(removecrlf($yname))));
    $ymail = stripslashes(FixQuotes(check_html(removecrlf($ymail))));
    $subject = ""._INTSITE." $sitename";
    $message = ""._HELLO." $fname:\n\n"._YOURFRIEND." $yname "._OURSITE." $sitename "._INTSENT."\n\n\n"._FSITENAME." $sitename\n$slogan\n"._FSITEURL." $nukeurl\n";
    if ($fname == "" || $fmail == "" || $yname == "" || $ymail == "") {
    Header("Location: modules.php?name=$module_name");
    } else {
    mail($fmail, $subject, $message, "From: \"$yname\" <$ymail>\nX-Mailer: PHP/" . phpversion());
    update_points(3);
    Header("Location: modules.php?name=$module_name&op=SiteSent&fname=$fname");
   }
}

function SiteSent($fname) {
    include ('header.php');
    $fname = stripslashes(FixQuotes(check_html(removecrlf($fname))));
    OpenTable();
    echo "<center><font class=\"content\">"._FREFERENCE." $fname...<br><br>"._THANKSREC."</font></center>";
    CloseTable();
    include ('footer.php');
}


switch($op) {

    case "SendSite":
    SendSite($yname, $ymail, $fname, $fmail);
    break;
	
    case "SiteSent":
    SiteSent($fname);
    break;

    default:
    RecommendSite();
    break;

}
# $Log: index.php,v $
# Revision 1.2  2004/12/08 00:25:44  chatserv
# http://www.nukefixes.com/ftopicp-3479.html#3479
#
# Revision 1.1  2004/10/05 18:05:24  chatserv
# Initial CVS Addition
#

?>