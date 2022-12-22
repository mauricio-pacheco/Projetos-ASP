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

$pagetitle = _AB_NUKESENTINEL.": "._AB_TRACKEDIPS;
include ("header.php");
title($pagetitle);
OpenMenu();
ipbanmenu();
CarryMenu();
trackedmenu();
CloseMenu();
echo "<br />\n";
OpenTable();
$tbcol = 6;
$perpage = $abconfig['track_perpage'];
if ($perpage == 0) { $perpage = 25; }
if (!isset($showmodule)) $showmodule=" All Modules";
if (!isset($min)) $min=0;
if (!isset($max)) $max=$min+$perpage;
if(!$column or $column=="") $column = $abconfig['track_sort_column'];
if(!$direction or $direction=="") $direction = $abconfig['track_sort_direction'];
if(ereg("All.*Modules", $showmodule) || !$showmodule ) {
  $modfilter="";
} elseif(ereg("Admin", $showmodule)) {
  $modfilter="WHERE page LIKE '%admin.php%'";
} elseif(ereg("Index", $showmodule)) {
  $modfilter="WHERE page LIKE '%index.php%'";
} elseif(ereg("Backend", $showmodule)) {
  $modfilter="WHERE page LIKE '%backend.php%'";
} else {
  $modfilter="WHERE page LIKE '%name=$showmodule%'";
}
$totalselected = $db->sql_numrows($db->sql_query("SELECT username, ip_addr, hostname, MAX(date), COUNT(*) FROM ".$prefix."_nsnst_tracked_ips $modfilter GROUP BY 1,2,3"));
if($totalselected > 0) {
  echo "<table width='100%' cellpadding='2' cellspacing='2' bgcolor='$bgcolor2' border='0'>\n";
  echo "<tr><td colspan='$tbcol'><table width='100%' cellpadding='0' cellspacing='0' border='0'>\n";
  echo "<tr>\n";
  // Page Sorting
  echo "<form method='post' action='admin.php?op=ABTracked'>\n";
  echo "<input type='hidden' name='min' value='$min'>\n";
  echo "<input type='hidden' name='showmodule' value='$showmodule'>\n";
  echo "<td align='left' bgcolor='$bgcolor2' width='50%'><b>"._AB_SORT.":</b> ";
  echo "<select name='column'>\n";
  if($column == "ip_addr") $selcolumn1 = "selected";
  echo "<option value='ip_addr' $selcolumn1>"._AB_IPTRACKED."</option>\n";
  if($column == "hostname") $selcolumn2 = "selected";
  echo "<option value='hostname' $selcolumn2>"._AB_HOSTNAME."</option>\n";
  if($column == "date") $selcolumn3 = "selected";
  echo "<option value='date' $selcolumn3>"._AB_DATE."</option>\n";
  if($column == "username") $selcolumn4 = "selected";
  echo "<option value='username' $selcolumn4>"._AB_USERNAME."</option>\n";
  if($column == 6) $selcolumn5 = "selected";
  echo "<option value=6 $selcolumn5>"._AB_HITS."</option>\n";
  if($column == "c2c") $selcolumn6 = "selected";
  echo "<option value='c2c' $selcolumn6>"._AB_C2CODE."</option>\n";
  echo "</select> ";
  echo "<select name='direction'>\n";
  if($direction == "asc") $seldirection1 = "selected";
  echo "<option value='asc' $seldirection1>"._AB_ASC."</option>\n";
  if($direction == "desc") $seldirection2 = "selected";
  echo "<option value='desc' $seldirection2>"._AB_DESC."</option>\n";
  echo "</select> ";
  echo "<input type='submit' value='"._AB_SORT."'>\n";
  echo "</td></form>";
  // Page Sorting
  // START Modules
  $handle=opendir('modules');
  while($file = readdir($handle)) {
    if( (!ereg("^[.]",$file)) && !ereg("html$", $file) ) {
      $moduleslist .= "$file ";
    }
  }
  closedir($handle);
  $moduleslist .= "&nbsp;All&nbsp;Modules &nbsp;Index &nbsp;Admin &nbsp;Backend";
  $moduleslist = explode(" ", $moduleslist);
  sort($moduleslist);
  echo "<form action=\"admin.php?op=ABTracked\" method=\"post\">\n";
  echo "<input type='hidden' name='column' value='$column'>\n";
  echo "<input type='hidden' name='direction' value='$direction'>\n";
  echo "<td align='right' bgcolor='$bgcolor2' width='50%'><b>"._AB_MODULE.":</b> <select name=\"showmodule\">\n";
  for($i=0; $i < sizeof($moduleslist); $i++) {
    if($moduleslist[$i]!="") {
      $moduleslist[$i] = str_replace("&nbsp;", " ", $moduleslist[$i]);
      echo "<option value=\"$moduleslist[$i]\" ";
      if($showmodule==$moduleslist[$i] OR ((!showmodule OR $showmodule=="") AND $moduleslist[$i]==" All Modules")) { echo " selected"; }
      echo ">".$moduleslist[$i]."</option>\n";
    }
  }
  echo "</select> <input type='submit' value='"._AB_GO."'></td>\n</form>";
  // END Modules
  echo "</tr>";
  echo "</td></tr></table>\n";
  echo "<tr bgcolor='$bgcolor1'><td colspan='$tbcol'><img src='images/pix.gif' height='2' width='2'></td></tr>\n";
  echo "<tr bgcolor='$bgcolor2'>\n";
  echo "<td><b>"._AB_IPADDRESS."</b></td>\n";
  echo "<td width='2%'><b>&nbsp;</b></td>\n";
  echo "<td align='center'><b>"._AB_HOSTNAME."</b></td>\n";
  echo "<td align='center'><b>"._AB_LASTVIEWED."</b></td>\n";
  echo "<td align='center'><b>"._AB_HITS."</b></td>\n";
  echo "<td align='center'><b>"._AB_FUNCTIONS."</b></td>\n";
  $result = $db->sql_query("SELECT user_id, username, ip_addr, hostname, MAX(date), COUNT(*), MIN(tid), c2c FROM ".$prefix."_nsnst_tracked_ips $modfilter GROUP BY 2,3,4 ORDER BY $column $direction LIMIT $min, $perpage");
  while(list($userid,$username,$ipaddr,$hostnm,$lastview,$hits,$tid,$c2c) = $db->sql_fetchrow($result)){
    echo "<tr onmouseover=\"this.style.backgroundColor='$bgcolor2'\" onmouseout=\"this.style.backgroundColor='$bgcolor1'\" bgcolor='$bgcolor1'>";
    echo "<td>";
    if($userid != 1) {
      echo "<a href='modules.php?name=Your_Account&amp;op=userinfo&amp;username=$username' target='_blank'><img src='images/sentinel/usericon.png' height='12' width='12' alt='$username' title='$username' border='0'></a>";
    } else { 
      echo "<img src='images/pix.gif' height='12' width='12' alt='' title='' border='0'>";
    }
    echo " <a href='".$ab_config['lookup_link']."$ipaddr' target='_blank'>$ipaddr</a></td>";
    $getIPs['flag_img'] = flag_img($c2c);
    echo "<td width='2%'>".$getIPs['flag_img']."</td>\n";
    echo "<td align='center'>$hostnm</td>";
    echo "<td align='center'>".date("Y-m-d \@ H:i:s",$lastview)."</td>";
    echo "<td align='center'>$hits</td>";
    echo "<td align='center'>&nbsp;<a href='admin.php?op=ABPrintTrackedPages&amp;user_id=$userid&amp;ip_addr=$ipaddr' target='_blank'><img src='images/sentinel/print.png' height='16' width='16' alt='"._AB_PRINT."' title='"._AB_PRINT."' border='0'></a>&nbsp;<a ";
    echo "href='admin.php?op=ABTrackedPages&amp;user_id=$userid&amp;ip_addr=$ipaddr' target='_blank'><img src='images/sentinel/view.png' height='16' width='16' alt='"._AB_VIEW."' title='"._AB_VIEW."' border='0'></a>&nbsp;<a ";
    echo "href='admin.php?op=ABTrackedAdd&amp;tid=$tid&amp;min=$min&amp;column=$column&amp;direction=$direction&amp;showmodule=$showmodule' target='_blank'><img src='images/sentinel/block.png' height='16' width='16' alt='"._AB_BLOCK."' title='"._AB_BLOCK."' border='0'></a>&nbsp;<a ";
    echo "href='admin.php?op=ABTrackedDelete&amp;tid=$tid&amp;min=$min&amp;column=$column&amp;direction=$direction&amp;showmodule=$showmodule&amp;xop=$op'><img src='images/sentinel/delete.png' height='16' width='16' alt='"._AB_DELETE."' title='"._AB_DELETE."' border='0'></a>&nbsp;</td>";
    echo "</tr>";
  }
  $db->sql_freeresult($result);
  // End IP Stats
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
    echo "<form action='admin.php?op=ABTracked' method='post'>\n";
    echo "<td align='right' bgcolor='$bgcolor2' colspan='$tbcol'><b>"._AB_PAGE."</b> ";
    $counter = 1;
    $currentpage = ($max / $perpage);
    echo "<input type='hidden' name='showmodule' value='$showmodule'>\n";
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
} else {
  echo "<center><b>"._AB_NOIPS."</b></center>\n";
}
CloseTable();
include ("footer.php");

?>