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

$pagetitle = _AB_NUKESENTINEL.": "._AB_EDITIP;
include("header.php");
title($pagetitle);
OpenMenu();
ipbanmenu();
CarryMenu();
blockedipmenu();
CloseMenu();
echo "<br />\n";
OpenTable();
$getIPs = $db->sql_fetchrow($db->sql_query("SELECT * FROM ".$prefix."_nsnst_blocked_ips WHERE ip_addr='$xIPs'"));
$getIPs['date'] = date("Y-m-d H:i:s",$getIPs['date']);
$getIPs['expires'] = round(($getIPs['expires'] - time()) / 86400);
echo "<table align='center' border='0' cellpadding='2' cellspacing='2'>\n";
echo "<form action='admin.php' method='post'>\n";
echo "<tr><td align='center' colspan='2'>"._AB_EDITIPS."</td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'><b>"._AB_IPBLOCKED.":</b></td><td><input type='text' name='xIPs' size='18' value='$xIPs'></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'><b>"._AB_USERID.":</b></td><td><input type='text' name='xuser_id' size='10' value='".$getIPs['user_id']."'></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'><b>"._AB_USERNAME.":</b></td><td><input type='text' name='xusername' size='20' value='".$getIPs['username']."'></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'><b>"._AB_AGENT.":</b></td><td><input type='text' name='xuser_agent' size='40' value='".$getIPs['user_agent']."'></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'><b>"._AB_BLOCKEDON.":</b></td><td><input type='text' name='xdatetime' size='30' value='".$getIPs['date']."'></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2' valign='top'><b>"._AB_EXPIRESIN.":</b></td><td><select name='xexpires'>\n";
select_box7($getIPs['expires']);
echo "</select><br />\n"._AB_EXPIRESINS."</td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2' valign='top'><b>"._AB_NOTES.":</b></td><td><textarea name='xnotes' rows='5' cols='40'>".$getIPs['notes']."</textarea></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'><b>"._AB_REASON.":</b></td><td><select name='xreason'>";
select_box8($getIPs['reason']);
echo "</select></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2' colspan='2'>&nbsp;</td></tr>\n";
$getIPs['query_string'] = htmlentities(base64_decode($getIPs['query_string']));
$getIPs['query_string'] = str_replace("%20", " ", $getIPs['query_string']);
$getIPs['query_string'] = str_replace("/**/", "/* */", $getIPs['query_string']);
echo "<tr><td bgcolor='$bgcolor2'><b>"._AB_QUERY.":</b></td><td>".info_img("<b>"._AB_QUERY.":</b> ".$getIPs['query_string'], r)."</td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'><b>"._AB_X_FORWARDED.":</b></td><td>".$getIPs['x_forward_for']."</td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'><b>"._AB_CLIENT_IP.":</b></td><td>".$getIPs['client_ip']."</td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'><b>"._AB_REMOTE_ADDR.":</b></td><td>".$getIPs['remote_addr']."</td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'><b>"._AB_REMOTE_PORT.":</b></td><td>".$getIPs['remote_port']."</td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'><b>"._AB_REQUEST_METHOD.":</b></td><td>".$getIPs['request_method']."</td></tr>\n";
echo "<input type='hidden' name='op' value='ABBlockedIPEditSave'>\n";
echo "<input type='hidden' name='xop' value='$xop'>\n";
echo "<input type='hidden' name='sip' value='$sip'>\n";
echo "<input type='hidden' name='old_xIPs' value='$xIPs'>\n";
echo "<input type='hidden' name='min' value='$min'>\n";
echo "<input type='hidden' name='column' value='$column'>\n";
echo "<input type='hidden' name='direction' value='$direction'>\n";
echo "<tr><td align='center' colspan='2'><input type=submit value='"._AB_SAVECHANGES."'></td></tr>\n";
echo "</form></table>\n";
CloseTable();
include("footer.php");

?>