<?php

/********************************************************/
/* NukeSentinel(tm) Universal                           */
/* By: NukeScripts Network (webmaster@nukescripts.net)  */
/* http://www.nukescripts.net                           */
/* Copyright © 2000-2005 by NukeScripts Network         */
/********************************************************/
/* CLIKE, UNION, & Email elements from HackAlert        */
/* HTTPAuth element                                     */
/* By: Raven PHP Scripts                                */
/* http://www.ravenphpscripts.com                       */
/* Copyright © 2004 by Raven PHP Scripts                */
/********************************************************/
/* Scripting Blocker elements                           */
/* By: ChatServ                                         */
/* http://www.nukeresources.com                         */
/* Copyright © 2004 by Nuke Resources                   */
/********************************************************/

$pagetitle = _AB_NUKESENTINEL.": "._AB_ADDIP;
include("header.php");
title($pagetitle);
OpenMenu();
ipbanmenu();
CarryMenu();
blockedipmenu();
CloseMenu();
echo "<br />\n";
OpenTable();
echo "<table align='center' border='0' cellpadding='2' cellspacing='2'>\n";
echo "<form action='admin.php' method='post'>\n";
echo "<tr bgcolor='$bgcolor1'><td align='center' class='content' colspan='2'>"._AB_ADDIPS."</td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'><b>"._AB_IPBLOCKED.":</b></td><td><input type='text' name='xIPs' size='18'></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'><b>"._AB_USERID.":</b></td><td><input type='text' name='xuser_id' size='10' value='1'></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'><b>"._AB_USERNAME.":</b></td><td><input type='text' name='xusername' size='20' value='$anonymous'></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'><b>"._AB_AGENT.":</b></td><td><input type='text' name='xuser_agent' size='40' value='"._AB_UNKNOWN."'></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2' valign='top'><b>"._AB_EXPIRESIN.":</b></td><td><select name='xexpires'>\n";
select_box7();
echo "</select><br />\n"._AB_EXPIRESINS."</td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2' valign='top'><b>"._AB_NOTES.":</b></td><td><textarea name='xnotes' rows='5' cols='40'>"._AB_ADDBY." $aid</textarea></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'><b>"._AB_REASON.":</b></td><td><select name='xreason'>";
select_box8();
echo "</select></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'><b>"._AB_QUERY.":</b></td><td><input type='text' name='xquery_string' size='40' value='"._AB_UNKNOWN."'></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'><b>"._AB_X_FORWARDED.":</b></td><td><input type='text' name='xx_forward_for' size='40' value='none'></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'><b>"._AB_CLIENT_IP.":</b></td><td><input type='text' name='xclient_ip' size='40' value='none'></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'><b>"._AB_REMOTE_ADDR.":</b></td><td><input type='text' name='xremote_addr' size='40' value='none'></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'><b>"._AB_REMOTE_PORT.":</b></td><td><input type='text' name='xremote_port' size='40' value='"._AB_UNKNOWN."'></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'><b>"._AB_REQUEST_METHOD.":</b></td><td><input type='text' name='xrequest_method' size='40' value='"._AB_UNKNOWN."'></td></tr>\n";
echo "<input type='hidden' name='op' value='ABBlockedIPAddSave'>\n";
echo "<tr><td colspan='2' align='center'><input type=submit value='"._AB_ADDIP."'></td></tr>\n";
echo "</form>";
echo "</table>\n";
CloseTable();
include("footer.php");

?>