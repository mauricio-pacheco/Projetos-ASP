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

$db->sql_query("DELETE FROM ".$prefix."_nsnst_blocked_ips WHERE ip_addr='$xIPs'");
$db->sql_query("OPTIMIZE TABLE ".$prefix."_nsnst_blocked_ips");
if ($abconfig['htaccess_path'] != "") {
  $i = 1;
  while ($i <= 3) {
    $tip = substr($xIPs, -2);
    if ($tip == ".*") { $xIPs = substr($xIPs, 0, -2); }
    $i++;
  }
  $testip = "deny from $xIPs\n";
  $ipfile = file($abconfig['htaccess_path']);
  $ipfile = implode("", $ipfile);
  $ipfile = str_replace($testip, "", $ipfile);
  $doit = fopen($abconfig['htaccess_path'], "w");
  fwrite($doit, $ipfile);
  fclose($doit);
}
Header("Location: admin.php?op=$xop&min=$min&column=$column&direction=$direction&sip=$sip");

?>