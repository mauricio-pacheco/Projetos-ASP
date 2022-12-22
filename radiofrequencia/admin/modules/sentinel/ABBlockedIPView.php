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

$pagetitle = _AB_NUKESENTINEL.": "._AB_VIEWIP;
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
list($getIPs['reason']) = $db->sql_fetchrow($db->sql_query("SELECT reason FROM ".$prefix."_nsnst_blockers WHERE blocker='".$getIPs['reason']."'"));
$lookupip = str_replace("*", "0", $xIPs);
echo "<table align='center' border='0' cellpadding='2' cellspacing='2'>\n";
echo "<tr><td bgcolor='$bgcolor2'><b>"._AB_BLOCKEDIP.":</b></td><td><a href='".$ab_config['lookup_link']."$lookupip' target='$xIPs'>$xIPs</a></td></tr>";
echo "<tr><td bgcolor='$bgcolor2'><b>"._AB_USER.":</b></td><td>".$getIPs['username']."</td></tr>";
echo "<tr><td bgcolor='$bgcolor2'><b>"._AB_AGENT.":</b></td><td>".$getIPs['user_agent']."</td></tr>";
echo "<tr><td bgcolor='$bgcolor2'><b>"._AB_BLOCKEDON.":</b></td><td>".$getIPs['date']."</td></tr>";
echo "<tr><td bgcolor='$bgcolor2' valign='top'><b>"._AB_NOTES.":</b></td><td>".$getIPs['notes']."</td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'><b>"._AB_REASON.":</b></td><td>".$getIPs['reason']."</td></tr>\n";
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
echo "<tr><td align='center' colspan='2'>"._GOBACK."</td></tr>";
echo "</table>\n";
CloseTable();
include("footer.php");

?>