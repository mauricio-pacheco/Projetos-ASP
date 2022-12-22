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

echo "<html><head>\n";
$pagetitle = _AB_NUKESENTINEL.": "._AB_PRINTIP;
echo "<title>$pagetitle</title>\n";
$theme_Sel = get_theme();
include("themes/$theme_Sel/theme.php");
echo "<style>\n";
include("themes/$theme_Sel/style/style.css");
echo "</style>\n";
echo "</head><body>\n";
echo "<h1 align='center'>$pagetitle</h1>\n";
$getIPs = $db->sql_fetchrow($db->sql_query("SELECT * FROM ".$prefix."_nsnst_blocked_ips WHERE ip_addr='$xIPs'"));
$getIPs['date'] = date("Y-m-d H:i:s",$getIPs['date']);
list($getIPs['reason']) = $db->sql_fetchrow($db->sql_query("SELECT reason FROM ".$prefix."_nsnst_blockers WHERE blocker='".$getIPs['reason']."'"));
$lookupip = str_replace("*", "0", $xIPs);
echo "<table align='center' border='1' cellpadding='2' cellspacing='2'>\n";
echo "<tr><td><b>"._AB_BLOCKEDIP.":</b></td><td>$xIPs</td></tr>";
echo "<tr><td><b>"._AB_USER.":</b></td><td>".$getIPs['username']."</td></tr>";
echo "<tr><td><b>"._AB_AGENT.":</b></td><td>".$getIPs['user_agent']."</td></tr>";
echo "<tr><td><b>"._AB_BLOCKEDON.":</b></td><td>".$getIPs['date']."</td></tr>";
echo "<tr><td valign='top'><b>"._AB_NOTES.":</b></td><td>".$getIPs['notes']."</td></tr>\n";
echo "<tr><td><b>"._AB_REASON.":</b></td><td>".$getIPs['reason']."</td></tr>\n";
echo "<tr><td colspan='2'>&nbsp;</td></tr>\n";
$getIPs['query_string'] = htmlentities(base64_decode($getIPs['query_string']));
$getIPs['query_string'] = str_replace("%20", " ", $getIPs['query_string']);
$getIPs['query_string'] = str_replace("/**/", "/* */", $getIPs['query_string']);
echo "<tr><td><b>"._AB_QUERY.":</b></td><td> ".$getIPs['query_string']."</td></tr>\n";
echo "<tr><td><b>"._AB_X_FORWARDED.":</b></td><td>".$getIPs['x_forward_for']."</td></tr>\n";
echo "<tr><td><b>"._AB_CLIENT_IP.":</b></td><td>".$getIPs['client_ip']."</td></tr>\n";
echo "<tr><td><b>"._AB_REMOTE_ADDR.":</b></td><td>".$getIPs['remote_addr']."</td></tr>\n";
echo "<tr><td><b>"._AB_REMOTE_PORT.":</b></td><td>".$getIPs['remote_port']."</td></tr>\n";
echo "<tr><td><b>"._AB_REQUEST_METHOD.":</b></td><td>".$getIPs['request_method']."</td></tr>\n";
$countrytitleinfo = abget_countrytitle($getIPs['c2c']);
echo "<tr><td><b>"._AB_COUNTRY.":</b></td><td>".$countrytitleinfo['country']."</td></tr>\n";
echo "</table>\n";
echo "</body></html>\n";

?>