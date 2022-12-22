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
$pagetitle = _AB_NUKESENTINEL.": "._AB_PRINTTRACKEDIPS;
echo "<title>$pagetitle</title>\n";
$theme_Sel = get_theme();
include("themes/$theme_Sel/theme.php");
echo "<style>\n";
include("themes/$theme_Sel/style/style.css");
echo "</style>\n";
echo "</head><body>\n";
echo "<h1 align='center'>$pagetitle</h1>\n";
$totalselected = $db->sql_numrows($db->sql_query("SELECT username, ip_addr, hostname, MAX(date), COUNT(*) FROM ".$prefix."_nsnst_tracked_ips GROUP BY 1,2,3"));
if($totalselected > 0) {
  echo "<table align='center' cellpadding='2' cellspacing='2' border='2'>\n";
  echo "<tr>\n";
  echo "<td><b>"._AB_USER."</b></td>\n";
  echo "<td><b>"._AB_IPADDRESS."</b></td>\n";
  echo "<td align='center'><b>"._AB_COUNTRY."</b></td>\n";
  echo "<td align='center'><b>"._AB_HOSTNAME."</b></td>\n";
  echo "<td align='center'><b>"._AB_LASTVIEWED."</b></td>\n";
  echo "<td align='center'><b>"._AB_HITS."</b></td>\n";
  $result = $db->sql_query("SELECT user_id, username, ip_addr, hostname, MAX(date), COUNT(*), MIN(tid), c2c FROM ".$prefix."_nsnst_tracked_ips $modfilter GROUP BY 2,3,4 ORDER BY ip_addr");
  while(list($userid,$username,$ipaddr,$hostnm,$lastview,$hits,$tid,$c2c) = $db->sql_fetchrow($result)){
    echo "<tr>";
    if($userid != 1) { echo "<td>$username</td>"; } else { echo "<td>&nbsp;</td>"; }
    echo "<td>$ipaddr</td>";
    $countrytitleinfo = abget_countrytitle($c2c);
    echo "<td align='center'>".$countrytitleinfo['country']."</td>";
    echo "<td align='center'>$hostnm</td>";
    echo "<td align='center'>".date("Y-m-d \@ H:i:s",$lastview)."</td>";
    echo "<td align='center'>$hits</td>";
    echo "</tr>";
  }
  $db->sql_freeresult($result);
  // End IP Stats
  echo "</table>";
} else {
  echo "<center><b>"._AB_NOIPS."</b></center>\n";
}
echo "</body></html>\n";

?>