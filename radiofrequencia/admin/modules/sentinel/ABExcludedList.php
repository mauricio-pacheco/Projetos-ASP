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

$pagetitle = _AB_NUKESENTINEL.": "._AB_EXCLUDEDLISTING;
include("header.php");
title($pagetitle);
OpenMenu();
ipbanmenu();
CarryMenu();
excludedmenu();
CloseMenu();
echo "<br />\n";
OpenTable();
$perpage = 50;
if ($perpage == 0) { $perpage = 25; }
if (!isset($min)) $min=0;
if (!isset($max)) $max=$min+$perpage;
if(!$column or $column=="") $column = "ip_lo";
if(!$direction or $direction=="") $direction = "asc";
$totalselected = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_nsnst_excluded_ranges"));
if ($totalselected > 0) {
  echo "<table align='center' border='0' cellpadding='2' cellspacing='2' bgcolor='$bgcolor2' width='100%'>\n";
  // Page Sorting
  echo "<tr><form method='post' action='admin.php?op=ABExcludedList'>\n";
  echo "<input type='hidden' name='min' value='$min'>\n";
  echo "<td align='right' bgcolor='$bgcolor2' colspan='5'><b>"._AB_SORT.":</b> ";
  echo "<select name='column'>\n";
  if($column == "ip_lo") $selcolumn1 = "selected";
  echo "<option value='ip_lo' $selcolumn1>"._AB_IP2CRANGE."</option>\n";
  if($column == "c2c,ip_lo") $selcolumn2 = "selected";
  echo "<option value='c2c,ip_lo' $selcolumn2>"._AB_C2CODE."</option>\n";
  if($column == "date,ip_lo") $selcolumn3 = "selected";
  echo "<option value='date,ip_lo' $selcolumn3>"._AB_DATE."</option>\n";
  echo "</select> ";
  echo "<select name='direction'>\n";
  if($direction == "asc") $seldirection1 = "selected";
  echo "<option value='asc' $seldirection1>"._AB_ASC."</option>\n";
  if($direction == "desc") $seldirection2 = "selected";
  echo "<option value='desc' $seldirection2>"._AB_DESC."</option>\n";
  echo "</select> ";
  echo "<input type='submit' value='"._AB_SORT."'>\n";
  echo "</td></form></tr>";
  // Page Sorting
  echo "<tr bgcolor='$bgcolor1'><td colspan='5'><img src='images/pix.gif' height='2' width='2'></td></tr>\n";
  echo "<tr bgcolor='$bgcolor2'>\n";
  echo "<td width='20%'><b>"._AB_IPLO."</b></td>\n";
  echo "<td width='20%'><b>"._AB_IPHI."</b></td>\n";
  echo "<td align='center' width='10%'><b>"._AB_FLAG."</b></td>\n";
  echo "<td align='center' width='35%'><b>"._AB_DATE."</b></td>\n";
  echo "<td align='center' width='15%'><b>"._AB_FUNCTIONS."</b></td>\n";
  echo "</tr>\n";
  $result = $db->sql_query("SELECT * FROM ".$prefix."_nsnst_excluded_ranges ORDER BY $column $direction LIMIT $min,$perpage");
  while ($getIPs = $db->sql_fetchrow($result)) {
    $getIPs['ip_lo_ip'] = long2ip($getIPs['ip_lo']);
    $getIPs['ip_hi_ip'] = long2ip($getIPs['ip_hi']);
    $getIPs['c2c'] = strtoupper($getIPs['c2c']);
    $getIPs['flag_img'] = flag_img($getIPs['c2c']);
    echo "<tr onmouseover=\"this.style.backgroundColor='$bgcolor2'\" onmouseout=\"this.style.backgroundColor='$bgcolor1'\" bgcolor='$bgcolor1'>\n";
    echo "<td>".$getIPs['ip_lo_ip']."</td>\n";
    echo "<td>".$getIPs['ip_hi_ip']."</td>\n";
    echo "<td align='center'>".$getIPs['flag_img']."</td>\n";
    echo "<td align='center'>".date("Y-m-d \@ H:i:s",$getIPs['date'])."</td>\n";
    echo "<td align='center'>&nbsp;<a href='admin.php?op=ABPrintExcludedView&amp;ip_lo=".$getIPs['ip_lo']."&amp;ip_hi=".$getIPs['ip_hi']."' target='_blank'><img src='images/sentinel/print.png' border='0' alt='"._AB_PRINT."' title='"._AB_PRINT."' height='16' width='16'></a>&nbsp;<a ";
    echo "href='admin.php?op=ABExcludedView&amp;ip_lo=".$getIPs['ip_lo']."&amp;ip_hi=".$getIPs['ip_hi']."' target='_blank'><img src='images/sentinel/view.png' border='0' alt='"._AB_VIEW."' title='"._AB_VIEW."' height='16' width='16'></a>&nbsp;<a ";
    echo "href='admin.php?op=ABExcludedEdit&amp;ip_lo=".$getIPs['ip_lo']."&amp;ip_hi=".$getIPs['ip_hi']."&amp;min=$min&amp;column=$column&amp;direction=$direction&amp;xop=$op'><img src='images/sentinel/edit.png' border='0' alt='"._AB_EDIT."' title='"._AB_EDIT."' height='16' width='16'></a>&nbsp;<a ";
    echo "href='admin.php?op=ABExcludedDelete&amp;ip_lo=".$getIPs['ip_lo']."&amp;ip_hi=".$getIPs['ip_hi']."&amp;min=$min&amp;column=$column&amp;direction=$direction&amp;xop=$op'><img src='images/sentinel/delete.png' border='0' alt='"._AB_DELETE."' title='"._AB_DELETE."' height='16' width='16'></a>&nbsp;</td>\n";
    echo "</tr>\n";
  }
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
    echo "<tr bgcolor='$bgcolor1'><td colspan='5'><img src='images/pix.gif' height='2' width='2'></td></tr>\n";
    echo "<tr><form action='admin.php?op=ABExcludedList' method='post'>\n";
    echo "<td align='right' bgcolor='$bgcolor2' colspan='5'><b>"._AB_PAGE."</b> ";
    $counter = 1;
    $currentpage = ($max / $perpage);
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
    echo "</select> <b>"._AB_OF." $pages</b> <input type='submit' value='"._AB_GO."'></td>\n</form></tr>\n";
  }
  // Page Numbering
  echo "</table>\n";
} else {
  echo "<center><b>"._AB_NORANGES."</b></center>\n";
}
CloseTable();
include("footer.php");

?>