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

$xip_lo = implode(".", $xip_lo);
$longip_lo = sprintf("%u", ip2long($xip_lo));
$xip_hi = implode(".", $xip_hi);
$longip_hi = sprintf("%u", ip2long($xip_hi));
list($xcountry) = $db->sql_fetchrow($db->sql_query("SELECT country FROM ".$prefix."_nsnst_countries WHERE c2c='$xc2c'"));
$test1 = $db->sql_query("SELECT * FROM ".$prefix."_nsnst_reserved_ranges WHERE ip_lo<='$longip_lo' AND ip_hi>='$longip_lo'");
$test2 = $db->sql_query("SELECT * FROM ".$prefix."_nsnst_reserved_ranges WHERE ip_lo<='$longip_hi' AND ip_hi>='$longip_hi'");
$testnum1 = $db->sql_numrows($test1);
$testnum2 = $db->sql_numrows($test2);
if($testnum1 > 0 Or $testnum2 >0) {
  $pagetitle = _AB_NUKESENTINEL.": "._AB_ADDRESERVEDERROR;
  include("header.php");
  title($pagetitle);
  ipbanmenu();
  echo "<br />\n";
  OpenTable();
  if($testnum1 > 0) {
    $testrow1 = $db->sql_fetchrow($test1);
    echo "<br /><center><b>$xip_lo: "._AB_IN." ".long2ip($testrow1['ip_lo'])." "._AB_TO." ".long2ip($testrow1['ip_hi'])." "._AB_FROM." ".$testrow1['country']."</b></center>\n";
  }
  if($testnum2 > 0) {
    $testrow2 = $db->sql_fetchrow($test2);
    echo "<br /><center><b>$xip_hi: "._AB_IN." ".long2ip($testrow2['ip_lo'])." "._AB_TO." ".long2ip($testrow2['ip_hi'])." "._AB_FROM." ".$testrow2['country']."</b></center>\n";
  }
  echo "<br /><center><b>"._GOBACK."</b></center><br />\n";
  CloseTable();
  include("footer.php");
} else {
  $xtime = time();
  $db->sql_query("INSERT INTO ".$prefix."_nsnst_reserved_ranges VALUES ('$longip_lo', '$longip_hi', '$xtime', '$xc2c')");
  Header("Location: admin.php?op=ABReservedList");
}

?>