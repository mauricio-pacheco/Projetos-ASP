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

$module_name = basename(dirname(__FILE__));
if (!stristr($_SERVER['PHP_SELF'], "modules.php") AND !stristr($_SERVER['SCRIPT_NAME'], "modules.php")) { header ("Location: ../modules.php?name=$module_name"); }
require_once("mainfile.php");
$index = 1;
$abconfig = abget_configs();

    $pagetitle = _AB_NUKESENTINEL.": "._AB_BLOCKEDIPS;
    include("header.php");
    title($pagetitle);
    OpenTable();
    $perpage = $abconfig['block_perpage'];
    if ($perpage == 0) { $perpage = 25; }
    if (!isset($min)) $min=0;
    if (!isset($max)) $max=$min+$perpage;
    if(!$column or $column=="") $column = $abconfig['block_sort_column'];
    if(!$direction or $direction=="") $direction = $abconfig['block_sort_direction'];
    $totalselected = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_nsnst_blocked_ips"));
    if ($totalselected > 0) {
      echo "<table align='center' border='0' cellpadding='2' cellspacing='2' bgcolor='$bgcolor2' width='100%'>\n";
      echo "<tr><td align='right' bgcolor='$bgcolor2' colspan='3'>";
      // Page Sorting
      echo "<form method='post' action='modules.php?name=$module_name'>\n";
      echo "<input type='hidden' name='min' value='$min'>\n";
      echo "<b>"._AB_SORT.":</b> ";
      echo "<select name='column'>\n";
      if($column == "ip_addr") $selcolumn1 = "selected";
      echo "<option value='ip_addr' $selcolumn1>"._AB_IPBLOCKED."</option>\n";
      if($column == "date") $selcolumn2 = "selected";
      echo "<option value='date' $selcolumn2>"._AB_DATE."</option>\n";
      if($column == "reason") $selcolumn3 = "selected";
      echo "<option value='reason' $selcolumn3>"._AB_REASON."</option>\n";
      echo "</select> ";
      echo "<select name='direction'>\n";
      if($direction == "asc") $seldirection1 = "selected";
      echo "<option value='asc' $seldirection1>"._AB_ASC."</option>\n";
      if($direction == "desc") $seldirection2 = "selected";
      echo "<option value='desc' $seldirection2>"._AB_DESC."</option>\n";
      echo "</select> ";
      echo "<input type='submit' value='"._AB_SORT."'>\n";
      echo "</form>";
      // Page Sorting
      echo "</td></tr>\n";
      echo "<tr><td bgcolor='$bgcolor1' colspan='3'><img src='images/pix.gif' height='2' width='2'></td></tr>\n";
      echo "<tr bgcolor='$bgcolor2'>\n";
      echo "<td align='center' width='34%'><b>"._AB_IPBLOCKED."</b></td>\n";
      echo "<td align='center' width='33%'><b>"._AB_DATE."</b></td>\n";
      echo "<td align='center' width='33%'><b>"._AB_REASON."</b></td>\n";
      echo "</tr>\n";
      $result = $db->sql_query("SELECT * FROM ".$prefix."_nsnst_blocked_ips ORDER BY $column $direction LIMIT $min,$perpage");
      while ($getIPs = $db->sql_fetchrow($result)) {
        list($getIPs['reason']) = $db->sql_fetchrow($db->sql_query("SELECT reason FROM ".$prefix."_nsnst_blockers WHERE blocker='".$getIPs['reason']."'"));
        $getIPs['reason'] = str_replace("Abuse-", "", $getIPs['reason']);
        $bdate = date("Y-m-d @ H:i:s", $getIPs['date']);
        $lookupip = str_replace("*", "0", $getIPs['ip_addr']);
        echo "<tr onmouseover=\"this.style.backgroundColor='$bgcolor2'\" onmouseout=\"this.style.backgroundColor='$bgcolor1'\" bgcolor='$bgcolor1'>\n";
        if((is_admin($admin) AND $ab_config['display_link']==1) OR ((is_user($user) OR is_admin($admin)) AND $ab_config['display_link']==2) OR $ab_config['display_link']==3) {
          $lookupip = str_replace("*", "0", $getIPs['ip_addr']);
          $ipcontent = "<a href=\"".$ab_config['lookup_link']."$lookupip\" target=\"_blank\">".$getIPs['ip_addr']."</a>";
        } else {
          $ipcontent = $getIPs['ip_addr'];
        }
        echo "<td align='center'>$ipcontent</td>\n";
        echo "<td align='center'>$bdate</td>\n";
        $reason = "----------";
        if((is_admin($admin) AND $ab_config['display_reason']==1) OR ((is_user($user) OR is_admin($admin)) AND $ab_config['display_reason']==2) OR $ab_config['display_reason']==3) {
          $result2 = $db->sql_query("SELECT reason FROM $prefix"._nsnst_blockers." WHERE blocker='$ip_reason'");
          list($reason) = $db->sql_fetchrow($result2);
          $reason = str_replace("Abuse-","",$reason);
        }
        echo "<td align='center'>$reason</td>\n";
        echo "<input type='hidden' name='min' value='$min'>\n";
        echo "<input type='hidden' name='column' value='$column'>\n";
        echo "<input type='hidden' name='direction' value='$direction'>\n";
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
        echo "<tr><td bgcolor='$bgcolor1' colspan='3'><img src='images/pix.gif' height='2' width='2'></td></tr>\n";
        echo "<tr><td align='right' bgcolor='$bgcolor2' colspan='3'>\n";
        echo "<form action='modules.php?name=$module_name' method='post'>\n";
        echo "<b>"._AB_PAGE."</b> ";
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
        echo "</select> <b>"._AB_OF." $pages</b> <input type='submit' value='"._AB_GO."'>\n</form>\n";
        echo "</tr>\n";
      }
      // Page Numbering
      echo "</table>\n";
    } else {
      echo "<center><b>"._AB_NOIPS."</b></center>\n";
    }
    CloseTable();
    include("footer.php");

?>