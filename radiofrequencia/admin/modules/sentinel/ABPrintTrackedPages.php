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
$pagetitle = _AB_NUKESENTINEL.": "._AB_PAGETRACKING;
echo "<title>$pagetitle</title>\n";
$theme_Sel = get_theme();
include("themes/$theme_Sel/theme.php");
echo "<style>\n";
include("themes/$theme_Sel/style/style.css");
echo "</style>\n";
echo "</head><body>\n";
echo "<h1 align='center'>$pagetitle</h1>\n";
if(!$column or $column=="") $column = "date";
if(!$direction or $direction=="") $direction = "desc";
$tid=intval($tid);
$totalselected = $db->sql_numrows($db->sql_query("SELECT tid, page, date FROM ".$prefix."_nsnst_tracked_ips WHERE ip_addr='$ip_addr' AND user_id='$user_id'"));
if($totalselected > 0) {
  $result = $db->sql_query("SELECT hostname FROM ".$prefix."_nsnst_tracked_ips WHERE user_id='$user_id' AND ip_addr='$ip_addr'");
  list($hostname) = $db->sql_fetchrow($result);
  # default values if none set
  echo "<center><b>$ip_addr ($hostname)</b></center><br>";
  echo "<table align='center' cellpadding='2' cellspacing='2' border='2'>\n";
  echo "<tr>";
  // Page Sorting
  echo "<form method='post' action='admin.php?op=ABPrintTrackedPages'>\n";
  echo "<input type='hidden' name='user_id' value='$user_id'>\n";
  echo "<input type='hidden' name='ip_addr' value='$ip_addr'>\n";
  echo "<td align='left' colspan='3'><b>"._AB_SORT.":</b> ";
  echo "<select name='column'>\n";
  if($column == "page") $selcolumn1 = "selected";
  echo "<option value='page' $selcolumn1>"._AB_PAGEVIEWED."</option>\n";
  if($column == "date") $selcolumn2 = "selected";
  echo "<option value='date' $selcolumn2>"._AB_HITDATE."</option>\n";
  echo "</select> ";
  echo "<select name='direction'>\n";
  if($direction == "asc") $seldirection1 = "selected";
  echo "<option value='asc' $seldirection1>"._AB_ASC."</option>\n";
  if($direction == "desc") $seldirection2 = "selected";
  echo "<option value='desc' $seldirection2>"._AB_DESC."</option>\n";
  echo "</select> ";
  echo "<input type='submit' value='"._AB_SORT."'>\n";
  echo "</td></form>";
  echo "</tr>";
  // Page Sorting
  echo "<tr>";
  echo "<td width='70%'><b>"._AB_PAGEVIEWED."</b></td>";
  echo "<td width='30%'><b>"._AB_HITDATE."</b></td>";
  $result = $db->sql_query("SELECT tid, page, date FROM ".$prefix."_nsnst_tracked_ips WHERE ip_addr='$ip_addr' AND user_id='$user_id' ORDER BY $column $direction");
  while(list($ltid, $page,$date_time) = $db->sql_fetchrow($result)){
    echo "<tr>\n";
    echo "<td><a href=\"$page\">$page</a></td>\n";
    echo "<td>".date("Y-m-d \@ H:i:s",$date_time)."</td>\n";
    echo "</tr>\n";
  }
  $db->sql_freeresult($result);
  echo "</table>";
  // End Page Stats
} else {
  echo "<center><b>"._AB_NOPAGES."</b></center>\n";
}
echo "</body></html>\n";

?>