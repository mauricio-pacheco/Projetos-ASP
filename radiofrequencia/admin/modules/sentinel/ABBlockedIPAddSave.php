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

$ip = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_nsnst_blocked_ips WHERE ip_addr='$xIPs'"));
$bantime = time();
$xnotes = str_replace("<br>","\r\n",$xnotes);
$xnotes = str_replace("<br />","\r\n",$xnotes);
$xnotes = htmlentities($xnotes, ENT_QUOTES);
if($xexpires>0) { $xexpires = $bantime + ($xexpires * 86400); }
if ($ip < 1) {
  $temp_qs = $xquery_string;
  $temp_qs = base64_encode($temp_qs);
  $db->sql_query("INSERT INTO ".$prefix."_nsnst_blocked_ips VALUES ('$xIPs', '$xuser_id', '$xusername', '$xuser_agent', '$bantime', '$xnotes', '$xreason', '$temp_qs', '$xx_forward_for', '$xclient_ip', '$xremote_addr', '$xremote_port', '$xrequest_method', '$xexpires', '00')");
  if ($abconfig['htaccess_path'] != "") {
    $i = 1;
    while ($i <= 3) {
      $tip = substr($xIPs, -2);
      if ($tip == ".*") { $xIPs = substr($xIPs, 0, -2); }
      $i++;
    }
    $tempip = "";
    if ($xIPs != "*") { $tempip = "deny from ".$xIPs."\n"; }
    $doit = fopen($abconfig['htaccess_path'], "a");
    fwrite($doit, $tempip);
    fclose($doit);
  }
}
Header("Location: admin.php?op=ABBlockedIP");

?>