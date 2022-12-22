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
$pagetitle = _AB_NUKESENTINEL.": "._AB_PRINTPROTECTEDRANGES;
echo "<title>$pagetitle</title>\n";
$theme_Sel = get_theme();
include("themes/$theme_Sel/theme.php");
echo "<style>\n";
include("themes/$theme_Sel/style/style.css");
echo "</style>\n";
echo "</head><body>\n";
echo "<h1 align='center'>$pagetitle</h1>\n";
$totalselected = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_nsnst_protected_ranges"));
if ($totalselected > 0) {
  echo "<table align='center' border='2' cellpadding='2' cellspacing='2'>\n";
  echo "<tr>\n";
  echo "<td><b>"._AB_IPLO."</b></td>\n";
  echo "<td><b>"._AB_IPHI."</b></td>\n";
  echo "<td align='center'><b>"._AB_COUNTRY."</b></td>\n";
  echo "<td align='center'><b>"._AB_DATE."</b></td>\n";
  echo "</tr>\n";
  $result = $db->sql_query("SELECT * FROM ".$prefix."_nsnst_protected_ranges ORDER BY ip_lo");
  while ($getIPs = $db->sql_fetchrow($result)) {
    $getIPs['ip_lo_ip'] = long2ip($getIPs['ip_lo']);
    $getIPs['ip_hi_ip'] = long2ip($getIPs['ip_hi']);
    $countrytitleinfo = abget_countrytitle($getIPs['c2c']);
    echo "<tr>\n";
    echo "<td>".$getIPs['ip_lo_ip']."</td>\n";
    echo "<td>".$getIPs['ip_hi_ip']."</td>\n";
    echo "<td align='center'>".$countrytitleinfo['country']."</td>\n";
    echo "<td align='center'>".date("Y-m-d \@ H:i:s",$getIPs['date'])."</td>\n";
    echo "</tr>\n";
  }
  echo "</table>\n";
} else {
  echo "<center><b>"._AB_NORANGES."</b></center>\n";
}
echo "</body></html>\n";

?>