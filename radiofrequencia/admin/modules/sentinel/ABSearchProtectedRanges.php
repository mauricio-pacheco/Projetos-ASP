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

$pagetitle = _AB_NUKESENTINEL.": "._AB_SEARCHPROTECTEDRANGES;
include("header.php");
title($pagetitle);
OpenMenu();
ipbanmenu();
CarryMenu();
searchmenu();
CloseMenu();
if(isset($sip)) {
  $sip = str_replace("*", "0", $sip);
  $sip = str_replace("%", "0", $sip);
  $tempip = sprintf("%u", ip2long($sip));
  echo "<br />\n";
  OpenTable();
  $totalselected = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_nsnst_protected_ranges WHERE ip_lo<='$tempip' AND ip_hi>='$tempip'"));
  if ($totalselected > 0) {
    echo "<table align='center' border='0' cellpadding='2' cellspacing='2' bgcolor='$bgcolor2' width='100%'>\n";
    echo "<tr bgcolor='$bgcolor2'>\n";
    echo "<td width='15%'><b>"._AB_IPLO."</b></td>\n";
    echo "<td width='15%'><b>"._AB_IPHI."</b></td>\n";
    echo "<td align='center' width='10%'><b>"._AB_FLAG."</b></td>\n";
    echo "<td align='center' width='10%'><b>"._AB_CODE."</b></td>\n";
    echo "<td align='center' width='35%'><b>"._AB_COUNTRY."</b></td>\n";
    echo "<td align='center' width='15%'><b>"._AB_FUNCTIONS."</b></td>\n";
    echo "</tr>\n";
    $x = 0;
    $result = $db->sql_query("SELECT * FROM ".$prefix."_nsnst_protected_ranges WHERE ip_lo<='$tempip' AND ip_hi>='$tempip'");
    while ($getIPs = $db->sql_fetchrow($result)) {
      $getIPs['ip_lo_ip'] = long2ip($getIPs['ip_lo']);
      $getIPs['ip_hi_ip'] = long2ip($getIPs['ip_hi']);
      $getIPs['c2c'] = strtoupper($getIPs['c2c']);
      $countrytitleinfo = abget_countrytitle($getIPs['c2c']);
      $getIPs['country'] = $countrytitleinfo['country'];
      $getIPs['flag_img'] = flag_img($getIPs['c2c']);
      echo "<tr onmouseover=\"this.style.backgroundColor='$bgcolor2'\" onmouseout=\"this.style.backgroundColor='$bgcolor1'\" bgcolor='$bgcolor1'>\n";
      echo "<td>".$getIPs['ip_lo_ip']."</td>\n";
      echo "<td>".$getIPs['ip_hi_ip']."</td>\n";
      echo "<td align='center'>".$getIPs['flag_img']."</td>\n";
      echo "<td align='center'>".$getIPs['c2c']."</td>\n";
      echo "<td align='center'>".$getIPs['country']."</td>\n";
      echo "<td align='center'>&nbsp;<a href='admin.php?op=ABProtectedRangeEditEdit&amp;ip_lo=".$getIPs['ip_lo']."&amp;ip_hi=".$getIPs['ip_hi']."&amp;min=$min&amp;column=$column&amp;direction=$direction&amp;sip=$sip&amp;xop=$op'><img src='images/sentinel/edit.png' border='0' alt='"._AB_EDIT."' title='"._AB_EDIT."' height='16' width='16'></a>&nbsp;<a ";
      echo "href='admin.php?op=ABProtectedRangeDelete&amp;ip_lo=".$getIPs['ip_lo']."&amp;ip_hi=".$getIPs['ip_hi']."&amp;min=$min&amp;column=$column&amp;direction=$direction&amp;sip=$sip&amp;xop=$op'><img src='images/sentinel/delete.png' border='0' alt='"._AB_DELETE."' title='"._AB_DELETE."' height='16' width='16'></a>&nbsp;</td>\n";
      echo "</tr>\n";
      $x++;
    }
    echo "</table>\n";
  } else {
    echo "<center><b>"._AB_NOMATCHES."</b></center>\n";
  }
  CloseTable();
}
include("footer.php");

?>