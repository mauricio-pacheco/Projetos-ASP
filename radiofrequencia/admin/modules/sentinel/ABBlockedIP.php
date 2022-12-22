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

$pagetitle = _AB_NUKESENTINEL.": "._AB_BLOCKEDIPS;
include("header.php");
title($pagetitle);
OpenMenu();
ipbanmenu();
CarryMenu();
blockedipmenu();
CloseMenu();
echo "<br />\n";
OpenTable();
$tbcol = 6;
$perpage = $abconfig['block_perpage'];
if ($perpage == 0) { $perpage = 25; }
if (!isset($min)) $min=0;
if (!isset($max)) $max=$min+$perpage;
if(!$column or $column=="") $column = $abconfig['block_sort_column'];
if(!$direction or $direction=="") $direction = $abconfig['block_sort_direction'];
$totalselected = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_nsnst_blocked_ips"));
if ($totalselected > 0) {
  echo "<table align='center' border='0' cellpadding='2' cellspacing='2' bgcolor='$bgcolor2' width='100%'>\n";
  // Page Sorting
  echo "<tr><form method='post' action='admin.php'>\n";
  echo "<input type='hidden' name='min' value='$min'>\n";
  echo "<input type='hidden' name='op' value='ABBlockedIP'>\n";
  echo "<td align='right' bgcolor='$bgcolor2' colspan='$tbcol'><b>"._AB_SORT.":</b> ";
  echo "<select name='column'>\n";
  if($column == "ip_addr") $selcolumn1 = "selected";
  echo "<option value='ip_addr' $selcolumn1>"._AB_IPBLOCKED."</option>\n";
  if($column == "expires") $selcolumn2 = "selected";
  echo "<option value='expires' $selcolumn2>"._AB_EXPIRES."</option>\n";
  if($column == "date") $selcolumn3 = "selected";
  echo "<option value='date' $selcolumn3>"._AB_DATE."</option>\n";
  if($column == "reason") $selcolumn4 = "selected";
  echo "<option value='reason' $selcolumn4>"._AB_REASON."</option>\n";
  if($column == "c2c,ip_addr") $selcolumn5 = "selected";
  echo "<option value='c2c,ip_addr' $selcolumn5>"._AB_C2CODE."</option>\n";
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
  echo "<tr bgcolor='$bgcolor1'><td colspan='$tbcol'><img src='images/pix.gif' height='2' width='2'></td></tr>\n";
  echo "<tr bgcolor='$bgcolor2'>\n";
  echo "<td width='20%'><b>"._AB_IPBLOCKED."</b></td>\n";
  echo "<td width='2%'><b>&nbsp;</b></td>\n";
  echo "<td align='center' width='25%'><b>"._AB_DATE."</b></td>\n";
  echo "<td align='center' width='25%'><b>"._AB_EXPIRES."</b></td>\n";
  echo "<td align='center' width='15%'><b>"._AB_REASON."</b></td>\n";
  echo "<td align='center' width='15%'><b>"._AB_FUNCTIONS."</b></td>\n";
  echo "</tr>\n";
  $result = $db->sql_query("SELECT * FROM ".$prefix."_nsnst_blocked_ips ORDER BY $column $direction LIMIT $min,$perpage");
  while ($getIPs = $db->sql_fetchrow($result)) {
    list($getIPs['reason']) = $db->sql_fetchrow($db->sql_query("SELECT reason FROM ".$prefix."_nsnst_blockers WHERE blocker='".$getIPs['reason']."'"));
    $getIPs['reason'] = str_replace("Abuse-", "", $getIPs['reason']);
    $bdate = date("Y-m-d @ H:i:s", $getIPs['date']);
    $lookupip = str_replace("*", "0", $getIPs['ip_addr']);
    if ($getIPs['expires']==0) { $bexpire = _AB_PERMENANT; } else { $bexpire = date("Y-m-d @ H:i:s", $getIPs['expires']); }
    list($bname) = $db->sql_fetchrow($db->sql_query("SELECT username FROM ".$user_prefix."_users WHERE user_id='".$getIPs['user_id']."'"));
    echo "<tr onmouseover=\"this.style.backgroundColor='$bgcolor2'\" onmouseout=\"this.style.backgroundColor='$bgcolor1'\" bgcolor='$bgcolor1'>\n";
    $qs = htmlentities(base64_decode($getIPs['query_string']));
    $qs = str_replace("%20", " ", $qs);
    $qs = str_replace("/**/", "/* */", $qs);
    $qs = str_replace("&", "<br />&", $qs);
    $ua = $getIPs['user_agent'];
    $ua = htmlentities($ua, ENT_QUOTES);
    $getIPs['flag_img'] = flag_img($getIPs['c2c']);
    echo "<td>".info_img("<b>"._AB_USERAGENT.":</b> $ua<br /><br /><b>"._AB_QUERY.":</b> $qs", r)." <a href='".$ab_config['lookup_link']."$lookupip' target='$lookupip'>".$getIPs['ip_addr']."</td>\n";
    echo "<td width='2%'>".$getIPs['flag_img']."</td>\n";
    echo "<td align='center'>$bdate</td>\n";
    echo "<td align='center'>$bexpire</td>\n";
    echo "<td align='center'>".$getIPs['reason']."</td>\n";
    echo "<td align='center'>&nbsp;<a href='admin.php?op=ABPrintBlockedIPView&amp;xIPs=".$getIPs['ip_addr']."' target='_blank'><img src='images/sentinel/print.png' border='0' alt='"._AB_PRINT."' title='"._AB_PRINT."' height='16' width='16'></a>&nbsp;<a ";
    echo "href='admin.php?op=ABBlockedIPView&amp;xIPs=".$getIPs['ip_addr']."' target='_blank'><img src='images/sentinel/view.png' border='0' alt='"._AB_VIEW."' title='"._AB_VIEW."' height='16' width='16'></a>&nbsp;<a ";
    echo "href='admin.php?op=ABBlockedIPEdit&amp;xIPs=".$getIPs['ip_addr']."&amp;min=$min&amp;column=$column&amp;direction=$direction&amp;xop=$op'><img src='images/sentinel/edit.png' border='0' alt='"._AB_EDIT."' title='"._AB_EDIT."' height='16' width='16'></a>&nbsp;<a ";
    echo "href='admin.php?op=ABBlockedIPDelete&amp;xIPs=".$getIPs['ip_addr']."&amp;min=$min&amp;column=$column&amp;direction=$direction&amp;xop=$op'><img src='images/sentinel/delete.png' border='0' alt='"._AB_DELETE."' title='"._AB_DELETE."' height='16' width='16'></a>&nbsp;</td>\n";
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
    echo "<tr bgcolor='$bgcolor1'><td colspan='$tbcol'><img src='images/pix.gif' height='2' width='2'></td></tr>\n";
    echo "<tr><form action='admin.php' method='post'>\n";
    echo "<td align='right' bgcolor='$bgcolor2' colspan='$tbcol'><b>"._AB_PAGE."</b> ";
    $counter = 1;
    $currentpage = ($max / $perpage);
    echo "<input type='hidden' name='op' value='ABBlockedIP'>\n";
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
  echo "<center><b>"._AB_NOIPS."</b></center>\n";
}
CloseTable();
include("footer.php");

?>