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

$tid = intval($tid);
$tidinfo = $db->sql_fetchrow($db->sql_query("SELECT * FROM ".$prefix."_nsnst_tracked_ips WHERE tid='$tid'"));
$pagetitle = _AB_NUKESENTINEL.": "._AB_ADDIP;
include("header.php");
title($pagetitle);
OpenMenu();
ipbanmenu();
CarryMenu();
trackedmenu();
CloseMenu();
echo "<br />\n";
OpenTable();
echo "<table align='center' border='0' cellpadding='2' cellspacing='2'>\n";
echo "<form action='admin.php' method='post'>\n";
echo "<input type='hidden' name='tidinfo[date]' value='".time()."'>\n";
echo "<input type='hidden' name='tidinfo[old_ip]' value='".$tidinfo['ip_addr']."'>\n";
echo "<input type='hidden' name='tidinfo[query_string]' value='".$tidinfo['page']."'>\n";
echo "<tr><td align='center' colspan='2'>"._AB_ADDIPS."</td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'><b>"._AB_IPBLOCKED.":</b></td><td><input type='text' name='tidinfo[ip_addr]' size='18' value='".$tidinfo['ip_addr']."'></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'><b>"._AB_USERID.":</b></td><td><input type='text' name='tidinfo[user_id]' size='20' value='".$tidinfo['user_id']."'></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'><b>"._AB_USERNAME.":</b></td><td><input type='text' name='tidinfo[username]' size='20' value='".$tidinfo['username']."'></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'><b>"._AB_AGENT.":</b></td><td><input type='text' name='tidinfo[user_agent]' size='40' value='".$tidinfo['user_agent']."'></td></tr>\n";
$tidinfo['date'] = date("Y-m-d H:i:s",time());
echo "<tr><td bgcolor='$bgcolor2'><b>"._AB_DATE.":</b></td><td>".$tidinfo['date']."</td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2' valign='top'><b>"._AB_EXPIRESIN.":</b></td><td><select name='tidinfo[expires]'>\n";
select_box7();
echo "</select><br />\n"._AB_EXPIRESINS."</td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2' valign='top'><b>"._AB_NOTES.":</b></td><td><textarea name='tidinfo[notes]' rows='5' cols='40'>".$getIPs['notes']."</textarea></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'><b>"._AB_REASON.":</b></td><td><select name='tidinfo[reason]'>";
select_box8();
echo "</select></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2' colspan='2'>&nbsp;</td></tr>\n";
$tidinfo['page'] = str_replace("%20", " ", $tidinfo['page']);
$tidinfo['page'] = str_replace("/**/", "/* */", $tidinfo['page']);
echo "<tr><td bgcolor='$bgcolor2'><b>"._AB_QUERY.":</b></td><td>".info_img("<b>"._AB_QUERY.":</b> ".$tidinfo['page'], r)."</td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'><b>"._AB_X_FORWARDED.":</b></td><td>".$tidinfo['x_forward_for']."</td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'><b>"._AB_CLIENT_IP.":</b></td><td>".$tidinfo['client_ip']."</td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'><b>"._AB_REMOTE_ADDR.":</b></td><td>".$tidinfo['remote_addr']."</td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'><b>"._AB_REMOTE_PORT.":</b></td><td>".$tidinfo['remote_port']."</td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'><b>"._AB_REQUEST_METHOD.":</b></td><td>".$tidinfo['request_method']."</td></tr>\n";
echo "<input type='hidden' name='op' value='ABTrackedAddSave'>\n";
echo "<input type='hidden' name='tidinfo[x_forward_for]' value='".$tidinfo['x_forward_for']."'>\n";
echo "<input type='hidden' name='tidinfo[client_ip]' value='".$tidinfo['client_ip']."'>\n";
echo "<input type='hidden' name='tidinfo[remote_addr]' value='".$tidinfo['remote_addr']."'>\n";
echo "<input type='hidden' name='tidinfo[remote_port]' value='".$tidinfo['remote_port']."'>\n";
echo "<input type='hidden' name='tidinfo[request_method]' value='".$tidinfo['request_method']."'>\n";
echo "<input type='hidden' name='column' value='$column'>\n";
echo "<input type='hidden' name='direction' value='$direction'>\n";
echo "<input type='hidden' name='showmodule' value='$showmodule'>\n";
echo "<input type='hidden' name='min' value='$min'>\n";
echo "<tr><td align='center' colspan='2'><input type=submit value='"._AB_ADDIP."'></td></tr>\n";
echo "</form></table>\n";
CloseTable();
include("footer.php");

?>