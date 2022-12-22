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

$pagetitle = _AB_NUKESENTINEL.": "._AB_USERIPTRACKING;
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
$user_id=intval($user_id);
list($uname) = $db->sql_fetchrow($db->sql_query("SELECT username FROM ".$user_prefix."_users WHERE user_id='$user_id'"));
# default values if none set
echo "<center><b>$uname ($user_id)</b></center><br>";
echo "<table align='center' cellpadding='2' cellspacing='2' bgcolor='$bgcolor2' border='0' width='100%'>\n";
echo "<tr bgcolor='$bgcolor2'>";
echo "<td nowrap width='30%'><b>"._AB_IPADDRESSES."</b></td>";
echo "<td align='center' nowrap width='30%'><b>"._AB_HITDATE."</b></td>";
echo "<td align='center' nowrap width='30%'><b>"._AB_COUNTRY."</b></td>";
echo "<td align='center' nowrap width='10%'><b>&nbsp;</b></td>";
$result = $db->sql_query("SELECT DISTINCT(ip_addr) FROM ".$prefix."_nsnst_tracked_ips WHERE user_id='$user_id' ORDER BY ip_addr LIMIT $min, $perpage");
while(list($lipaddr) = $db->sql_fetchrow($result)){
  $newrow = $db->sql_fetchrow($db->sql_query("SELECT * FROM ".$prefix."_nsnst_tracked_ips WHERE user_id='$user_id' AND ip_addr='$lipaddr' ORDER BY date DESC LIMIT 1"));
  echo "<tr onmouseover=\"this.style.backgroundColor='$bgcolor2'\" onmouseout=\"this.style.backgroundColor='$bgcolor1'\" bgcolor='$bgcolor1'>\n";
  echo "<td>$lipaddr</td>\n";
  echo "<td align='center'>".date("Y-m-d \@ H:i:s",$newrow['date'])."</td>\n";
  $countrytitle = abget_countrytitle($newrow['c2c']);
  echo "<td align='center'>".$countrytitle['country']."</td>\n";
  echo "<td align='center'><a href='admin.php?op=ABTrackedDeleteUserIP&amp;user_id=$user_id&amp;ip_addr=$lipaddr&amp;min=$min&amp;xop=$op'><img src='images/sentinel/delete.png' height='16' width='16' border='0'></a></td>";
  echo "</tr>\n";
}
$db->sql_freeresult($result);
$totalselected = $db->sql_numrows($db->sql_query("SELECT DISTINCT(ip_addr) FROM ".$prefix."_nsnst_tracked_ips WHERE user_id='$user_id'"));
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
    echo "<tr bgcolor='$bgcolor1'><td colspan='4'><img src='images/pix.gif' height='2' width='2'></td></tr>\n";
    echo "<tr>\n";
    echo "<form action='admin.php?op=ABTrackedUsersIPs' method='post'>\n";
    echo "<td align='right' bgcolor='$bgcolor2' colspan='4'><b>"._AB_PAGE."</b> ";
    $counter = 1;
    $currentpage = ($max / $perpage);
    echo "<input type='hidden' name='showmodule' value='$showmodule'>\n";
    echo "<input type='hidden' name='user_id' value='$user_id'>\n";
    echo "<input type='hidden' name='ip_addr' value='$ip_addr'>\n";
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