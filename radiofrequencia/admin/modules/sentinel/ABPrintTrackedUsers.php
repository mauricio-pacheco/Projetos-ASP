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
$pagetitle = _AB_NUKESENTINEL.": "._AB_PRINTTRACKEDUSERS;
echo "<title>$pagetitle</title>\n";
$theme_Sel = get_theme();
include("themes/$theme_Sel/theme.php");
echo "<style>\n";
include("themes/$theme_Sel/style/style.css");
echo "</style>\n";
echo "</head><body>\n";
echo "<h1 align='center'>$pagetitle</h1>\n";
$totalselected = $db->sql_numrows($db->sql_query("SELECT DISTINCT(username) FROM ".$prefix."_nsnst_tracked_ips $modfilter GROUP BY 1"));
if($totalselected > 0) {
  echo "<table align='center' border='2' cellpadding='2' cellspacing='2'>\n";
  echo "<tr>\n";
  echo "<td><b>"._AB_USERNAME."</b></td>\n";
  echo "<td align='center'><b>"._AB_IPSTRACKED."</b></td>\n";
  echo "<td align='center'><b>"._AB_LASTVIEWED."</b></td>\n";
  echo "<td align='center'><b>"._AB_HITS."</b></td>\n";
  $result = $db->sql_query("SELECT user_id, username, MAX(date), COUNT(*) FROM ".$prefix."_nsnst_tracked_ips GROUP BY 2");
  while(list($userid,$username,$lastview,$hits) = $db->sql_fetchrow($result)){
    echo "<tr>";
    echo "<td>";
    if($userid != 1) {
      echo "$username";
    } else { 
      echo "$anonymous";
    }
    echo "</td>";
    $trackedips = $db->sql_numrows($db->sql_query("SELECT DISTINCT(ip_addr) FROM ".$prefix."_nsnst_tracked_ips WHERE user_id='$userid'"));
    echo "<td align='center'>$trackedips</td>\n";
    echo "<td align='center'>".date("Y-m-d \@ H:i:s",$lastview)."</td>";
    echo "<td align='center'>$hits</td>";
    echo "</tr>";
  }
  $db->sql_freeresult($result);
  // End IP Stats
  echo "</table>";
} else {
  echo "<center><b>"._AB_NOUSERS."</b></center>\n";
}
echo "</body></html>\n";

?>