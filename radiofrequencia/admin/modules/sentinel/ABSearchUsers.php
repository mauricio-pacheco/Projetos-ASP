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

$pagetitle = _AB_NUKESENTINEL.": "._AB_SEARCHUSERS;
include("header.php");
title($pagetitle);
OpenMenu();
ipbanmenu();
CarryMenu();
searchmenu();
CloseMenu();
echo "<br />\n";
OpenTable();
$checkrow = $db->sql_fetchrow($db->sql_query("CHECK TABLE ".$prefix."_nsnst_ip2country"));
if($checkrow['Msg_type']=="error") { $tableexist = 0; $tbcol = 5; } else { $tableexist = 1; $tbcol = 6; }
$perpage = $abconfig['search_user_perpage'];
if ($perpage == 0) { $perpage = 25; }
if (!isset($min)) $min=0;
if (!isset($max)) $max=$min+$perpage;
if(!$column or $column=="") $column = $abconfig['search_user_sort_column'];
if(!$direction or $direction=="") $direction = $abconfig['search_user_sort_direction'];
$totalselected = $db->sql_numrows($db->sql_query("SELECT * FROM ".$user_prefix."_users WHERE last_ip like '$sip'"));
if($totalselected > 0) {
  echo "<table cellpadding='2' cellspacing='2' bgcolor='$bgcolor2' border='0' width='100%'>\n";
  // Page Sorting
  echo "<tr><form method='post' action='admin.php'>\n";
  echo "<input type='hidden' name='min' value='$min'>\n";
  echo "<input type='hidden' name='sip' value='$sip'>\n";
  echo "<input type='hidden' name='op' value='ABSearchUsers'>\n";
  echo "<td align='right' bgcolor='$bgcolor2' colspan='$tbcol'><b>"._AB_SORT.":</b> ";
  echo "<select name='column'>\n";
  if($column == "username") $selcolumn1 = "selected";
  echo "<option value='username' $selcolumn1>"._AB_USERNAME."</option>\n";
  if($column == "user_id") $selcolumn2 = "selected";
  echo "<option value='user_id' $selcolumn2>"._AB_USERID."</option>\n";
  if($column == "last_ip") $selcolumn3 = "selected";
  echo "<option value='last_ip' $selcolumn3>"._AB_LASTIP."</option>\n";
  if($column == "user_email") $selcolumn4 = "selected";
  echo "<option value='user_email' $selcolumn4>"._AB_USEREMAIL."</option>\n";
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
  echo "<td width='20%'><b>"._AB_USERNAME."</b></td>\n";
  echo "<td width='35%'><b>"._AB_USEREMAIL."</b></td>\n";
  echo "<td align='right' width='10%'><b>"._AB_USERID."</b></td>\n";
  echo "<td align='right' width='20%'><b>"._AB_LASTIP."</b></td>\n";
  if($tableexist == 1) { echo "<td width='2%'><b>&nbsp;</b></td>\n"; }
  echo "<td align='right' width='15%'><b>"._AB_REGDATE."</b></td>\n";
  echo "</tr>\n";
  $result = $db->sql_query("SELECT * FROM ".$user_prefix."_users WHERE last_ip like '$sip' ORDER BY $column $direction LIMIT $min,$perpage");
  while($chnginfo = $db->sql_fetchrow($result)) {
    echo "<tr onmouseover=\"this.style.backgroundColor='$bgcolor2'\" onmouseout=\"this.style.backgroundColor='$bgcolor1'\" bgcolor='$bgcolor1'>\n";
    echo "<td><a href='modules.php?name=Your_Account&op=userinfo&amp;username=".$chnginfo['username']."' target='_blank'>".$chnginfo['username']."</a></td>\n";
    echo "<td><a href='mailto:".$chnginfo['user_email']."'>".$chnginfo['user_email']."</a></td>\n";
    echo "<td align='right'>".$chnginfo['user_id']."</td>\n";
    echo "<td align='right'><a href='".$ab_config['lookup_link']."".$chnginfo['last_ip']."' target='_blank'>".$chnginfo['last_ip']."</a></td>\n";
    if($tableexist == 1) {
      $countryinfo = abget_country($chnginfo['last_ip']);
      echo "<td width='2%'><b><img src='images/sentinel/countries/".$countryinfo['c2c'].".png' height='10' width='16' alt='".$countryinfo['country']."' title='".$countryinfo['country']."'></b></td>\n";
    }
    echo "<td align='right'>".$chnginfo['user_regdate']."</td>\n";
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
    echo "<tr>\n";
    echo "<form action='admin.php?op=ABSearchUsers' method='post'>\n";
    echo "<td align='right' bgcolor='$bgcolor2' colspan='$tbcol'><b>"._AB_PAGE."</b> ";
    $counter = 1;
    $currentpage = ($max / $perpage);
    echo "<input type='hidden' name='sip' value='$sip'>\n";
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
echo "</table>\n";
} else {
  echo "<center><b>"._AB_NOMATCHES."</b></center>\n";
}
CloseTable();
include("footer.php");


?>