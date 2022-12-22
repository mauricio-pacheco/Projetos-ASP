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
$pagetitle = _AB_NUKESENTINEL.": "._AB_PRINTRANGE;
echo "<title>$pagetitle</title>\n";
$theme_Sel = get_theme();
include("themes/$theme_Sel/theme.php");
echo "<style>\n";
include("themes/$theme_Sel/style/style.css");
echo "</style>\n";
echo "</head><body>\n";
echo "<h1 align='center'>$pagetitle</h1>\n";
$getIPs = $db->sql_fetchrow($db->sql_query("SELECT * FROM ".$prefix."_nsnst_reserved_ranges WHERE ip_lo='$ip_lo' AND ip_hi='$ip_hi'"));
$getIPs['ip_lo_ip'] = long2ip($getIPs['ip_lo']);
$getIPs['ip_hi_ip'] = long2ip($getIPs['ip_hi']);
echo "<table align='center' border='2' cellpadding='2' cellspacing='2'>\n";
echo "<tr><td><b>"._AB_IPLO.":</b></td><td>".$getIPs['ip_lo_ip']."</td></tr>\n";
echo "<tr><td><b>"._AB_IPHI.":</b></td><td>".$getIPs['ip_hi_ip']."</td></tr>\n";
if($getIPs['expires']==0) { $getIPs['expires'] =_AB_PERMENANT; } else { $getIPs['expires'] = date("Y-m-d \@ H:i:s", $getIPs['expires']); }
echo "<tr><td><b>"._AB_EXPIRES.":</b></td><td>".$getIPs['expires']."</td></tr>\n";
echo "<tr><td valign='top'><b>"._AB_NOTES.":</b></td><td>".$getIPs['notes']."</td></tr>\n";
$blockerrow = $db->sql_fetchrow($db->sql_query("SELECT * FROM ".$prefix."_nsnst_blockers WHERE blocker='".$getIPs['reason']."'"));
echo "<tr><td><b>"._AB_REASON.":</b></td><td>".$blockerrow['reason']."</td></tr>\n";
$countryrow = $db->sql_fetchrow($db->sql_query("SELECT * FROM ".$prefix."_nsnst_countries WHERE c2c='".$getIPs['c2c']."'"));
echo "<tr><td><b>"._AB_COUNTRY.":</b></td><td>".$countryrow['country']."</td></tr>\n";
echo "</table>\n";
echo "</body></html>\n";

?>