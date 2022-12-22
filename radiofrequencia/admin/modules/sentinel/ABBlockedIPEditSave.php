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

if($xexpires>0) { $xexpires = ($xexpires * 86400) + time(); }
$xdate = strtotime($xdatetime);
$xuser_id = intval($xuser_id);
$xusername = stripslashes($xusername);
$xuser_agent = htmlentities($xuser_agent, ENT_QUOTES);
$xnotes = str_replace("<br>","\r\n",$xnotes);
$xnotes = str_replace("<br />","\r\n",$xnotes);
$xnotes = htmlentities($xnotes, ENT_QUOTES);
$result = $db->sql_query("UPDATE ".$prefix."_nsnst_blocked_ips SET ip_addr='$xIPs', user_id='$xuser_id', username='$xusername', user_agent='$xuser_agent', date='$xdate', notes='$xnotes', reason='$xreason', expires='$xexpires' WHERE ip_addr='$old_xIPs'");
if(!$result) { die("DB Error"); }
$i = 1;
while ($i <= 3) {
  $tip = substr($xIPs, -2);
  if ($tip == ".*") { $xIPs = substr($xIPs, 0, -2); }
  $i++;
}
$i = 1;
while ($i <= 3) {
  $tip = substr($old_xIPs, -2);
  if ($tip == ".*") { $old_xIPs = substr($old_xIPs, 0, -2); }
  $i++;
}
$testip1 = "";
if ($xIPs != "0" AND $xIPs != "*") { $testip1 = "deny from $xIPs\n"; }
$testip2 = "deny from $old_xIPs\n";
if ($abconfig['htaccess_path'] != "") {
  $ipfile = file($abconfig['htaccess_path']);
  $ipfile = implode("", $ipfile);
  $ipfile = str_replace($testip2, "", $ipfile);
  $ipfile = $ipfile.$testip1;
  $doit = fopen($abconfig['htaccess_path'], "w");
  fwrite($doit, $ipfile);
  fclose($doit);
}
Header("Location: admin.php?op=$xop&min=$min&column=$column&direction=$direction&sip=$sip");

?>