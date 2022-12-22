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

$expiretime = time();
$clearresult = $db->sql_query("SELECT * FROM ".$prefix."_nsnst_blocked_ips WHERE (expires<'$expiretime' AND expires!='0')");
while($clearblock = $db->sql_fetchrow($clearresult)) {
  $db->sql_query("DELETE FROM ".$prefix."_nsnst_blocked_ips WHERE ip_addr='".$clearblock['ip_addr']."'");
  $db->sql_query("OPTIMIZE TABLE ".$prefix."_nsnst_blocked_ips");
  if($abconfig['htaccess_path'] != "") {
    if($abconfig['htaccess_path'] != "") { $ipfile = file($abconfig['htaccess_path']); }
    $ipfile = implode("", $ipfile);
    $i = 1;
    while ($i <= 3) {
      $tip = substr($clearblock['ip_addr'], -2);
      if ($tip == ".*") { $clearblock['ip_addr'] = substr($clearblock['ip_addr'], 0, -2); }
      $i++;
    }
    $testip = "deny from ".$clearblock['ip_addr']."\n";
    $ipfile = str_replace($testip, "", $ipfile);
    $doit = fopen($abconfig['htaccess_path'], "w");
    fwrite($doit, $ipfile);
    fclose($doit);
  }
}
Header("Location: admin.php?op=ABBlockedIP");

?>