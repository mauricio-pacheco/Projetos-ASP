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
$pagetitle = _AB_NUKESENTINEL.": "._AB_USERTRACKING;
echo "<title>$pagetitle</title>\n";
$theme_Sel = get_theme();
include("themes/$theme_Sel/theme.php");
echo "<style>\n";
include("themes/$theme_Sel/style/style.css");
echo "</style>\n";
echo "</head><body>\n";
echo "<h1 align='center'>$pagetitle</h1>\n";
$user_id=intval($user_id);
list($uname) = $db->sql_fetchrow($db->sql_query("SELECT username FROM ".$user_prefix."_users WHERE user_id='$user_id'"));
# default values if none set
echo "<center><b>$uname ($user_id)</b></center><br>";
echo "<table align='center' cellpadding='2' cellspacing='2' border='2'>\n";
echo "<tr>";
echo "<td nowrap><b>"._AB_PAGEVIEWED."</b></td>";
echo "<td nowrap><b>"._AB_HITDATE."</b></td>";
$result = $db->sql_query("SELECT user_id, ip_addr, page, date FROM ".$prefix."_nsnst_tracked_ips WHERE user_id='$user_id' ORDER BY date desc");
while(list($luserid, $lipaddr, $page, $date_time) = $db->sql_fetchrow($result)){
  echo "<tr>\n";
  echo "<td>$page</td>\n";
  echo "<td>".date("Y-m-d \@ H:i:s",$date_time)."</td>\n";
  echo "</tr>\n";
}
$db->sql_freeresult($result);
echo "</table>";
echo "</body></html>\n";

?>