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

$pagetitle = _AB_NUKESENTINEL.": "._AB_PAGETRACKING;
include ("header.php");
title($pagetitle);
OpenMenu();
ipbanmenu();
CarryMenu();
trackedmenu();
CloseMenu();
echo "<br />\n";
OpenTable();
$perpage = $abconfig['track_perpage'];
if ($perpage == 0) { $perpage = 25; }
if (!isset($min)) $min=0;
if (!isset($max)) $max=$min+$perpage;
if(!$column or $column=="") $column = "date";
if(!$direction or $direction=="") $direction = "desc";
$tid=intval($tid);
$result = $db->sql_query("SELECT hostname FROM ".$prefix."_nsnst_tracked_ips WHERE user_id='$user_id' AND ip_addr='$ip_addr'");
list($hostname) = $db->sql_fetchrow($result);
# default values if none set
echo "<center><b>$ip_addr ($hostname)</b></center><br>";
echo "<table align='center' cellpadding='2' cellspacing='2' bgcolor='$bgcolor2' border='0' width='100%'>\n";
echo "<tr>";
// Page Sorting
echo "<form method='post' action='admin.php?op=ABTrackedPages'>\n";
echo "<input type='hidden' name='min' value='$min'>\n";
echo "<input type='hidden' name='user_id' value='$user_id'>\n";
echo "<input type='hidden' name='ip_addr' value='$ip_addr'>\n";
echo "<td align='left' bgcolor='$bgcolor2' colspan='3'><b>"._AB_SORT.":</b> ";
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
echo "<tr bgcolor='$bgcolor1'><td colspan='3'><img src='images/pix.gif' height='2' width='2'></td></tr>\n";
echo "<tr>";
echo "<td bgcolor='$bgcolor2' nowrap width='70%'><b>"._AB_PAGEVIEWED."</b></td>";
echo "<td bgcolor='$bgcolor2' nowrap width='20%'><b>"._AB_HITDATE."</b></td>";
echo "<td bgcolor='$bgcolor2' nowrap width='10%'><b>&nbsp;</b></td>";
$result = $db->sql_query("SELECT tid, page, date FROM ".$prefix."_nsnst_tracked_ips WHERE ip_addr='$ip_addr' AND user_id='$user_id' ORDER BY $column $direction LIMIT $min, $perpage");
while(list($ltid, $page,$date_time) = $db->sql_fetchrow($result)){
  echo "<tr onmouseover=\"this.style.backgroundColor='$bgcolor2'\" onmouseout=\"this.style.backgroundColor='$bgcolor1'\" bgcolor='$bgcolor1'>\n";
  echo "<td><a href='$page' target='_blank'>$page</a></td>\n";
  echo "<td>".date("Y-m-d \@ H:i:s",$date_time)."</td>\n";
  echo "<td align='center'><a href='admin.php?op=ABTrackedDeleteSave&amp;tid=$ltid&amp;user_id=$user_id&amp;ip_addr=$ip_addr&amp;column=$column&amp;direction=$direction&amp;min=$min'><img src='images/sentinel/delete.png' height='16' width='16' border='0'></a></td>";
  echo "</tr>\n";
}
$db->sql_freeresult($result);
$totalselected = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_nsnst_tracked_ips WHERE ip_addr='$ip_addr' AND user_id='$user_id'"));
  // Page Numbering
  $pagesint = ($totalselected / $perpage);
  $pageremainder = ($totalselected % $perpage);
  if ($pageremainder != 0) {
    $pages = ceil($pagesint);
    if ($totalselected < $perpage) { $pageremainder = 0; }
  } else {
    $pages = $pagesint;
  }
  if ($pages != 1 && $pages != 0) {
    echo "<tr bgcolor='$bgcolor1'><td colspan='3'><img src='images/pix.gif' height='2' width='2'></td></tr>\n";
    echo "<tr>\n";
    echo "<form action='admin.php?op=ABTrackedPages' method='post'>\n";
    echo "<td align='right' bgcolor='$bgcolor2' colspan='3'><b>"._AB_PAGE."</b> ";
    $counter = 1;
    $currentpage = ($max / $perpage);
    echo "<input type='hidden' name='showmodule' value='$showmodule'>\n";
    echo "<input type='hidden' name='user_id' value='$user_id'>\n";
    echo "<input type='hidden' name='ip_addr' value='$ip_addr'>\n";
    echo "<input type='hidden' name='column' value='$column'>\n";
    echo "<input type='hidden' name='direction' value='$direction'>\n";
    echo "<select name='min'>\n";
    while ($counter <= $pages ) {
      $cpage = $counter;
      $mintemp = ($perpage * $counter) - $perpage;
      if ($counter == $currentpage) {
        echo "<option selected>$counter</option>";
      } else {
        echo "<option value='$mintemp'>$counter</option>";
      }
      $counter++;
    }
    echo "</select> <b>"._AB_OF." $pages</b> <input type='submit' value='"._AB_GO."'></td>\n</form>\n";
    echo "</tr>\n";
  }
  // Page Numbering
echo "</table>";
// End Page Stats
CloseTable();
include ("footer.php");

?>