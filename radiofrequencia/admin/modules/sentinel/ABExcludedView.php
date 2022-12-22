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

$pagetitle = _AB_NUKESENTINEL.": "._AB_VIEWEXCLUDED;
include("header.php");
title($pagetitle);
OpenMenu();
ipbanmenu();
CarryMenu();
excludedmenu();
CloseMenu();
echo "<br />\n";
OpenTable();
$getIPs = $db->sql_fetchrow($db->sql_query("SELECT * FROM ".$prefix."_nsnst_excluded_ranges WHERE ip_lo='$ip_lo' AND ip_hi='$ip_hi'"));
$getIPs['ip_lo_ip'] = long2ip($getIPs['ip_lo']);
$getIPs['ip_hi_ip'] = long2ip($getIPs['ip_hi']);
echo "<table align='center' border='0' cellpadding='2' cellspacing='2'>\n";
echo "<tr><td bgcolor='$bgcolor2'><b>"._AB_IPLO.":</b></td><td>".$getIPs['ip_lo_ip']."</td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'><b>"._AB_IPHI.":</b></td><td>".$getIPs['ip_hi_ip']."</td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2' valign='top'><b>"._AB_NOTES.":</b></td><td>".$getIPs['notes']."</td></tr>\n";
$countryrow = $db->sql_fetchrow($db->sql_query("SELECT * FROM ".$prefix."_nsnst_countries WHERE c2c='".$getIPs['c2c']."'"));
echo "<tr><td bgcolor='$bgcolor2'><b>"._AB_COUNTRY.":</b></td><td>".$countryrow['country']."</td></tr>\n";
echo "</table>\n";
CloseTable();
include("footer.php");

?>