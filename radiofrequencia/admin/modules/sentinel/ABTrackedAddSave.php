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

if($tidinfo['expires']>0) { $tidinfo['expires'] = ($tidinfo['expires'] * 86400) + time(); }
$tidinfo['user_id'] = intval($tidinfo['user_id']);
$tidinfo['username'] = stripslashes($tidinfo['username']);
$tidinfo['user_agent'] = htmlentities($tidinfo['user_agent'], ENT_QUOTES);
$tidinfo['notes'] = str_replace("<br>","\r\n",$tidinfo['notes']);
$tidinfo['notes'] = str_replace("<br />","\r\n",$tidinfo['notes']);
$tidinfo['notes'] = htmlentities($tidinfo['notes'], ENT_QUOTES);
$tidinfo['query_string'] = str_replace("http://", "", $nukeurl).$tidinfo['query_string'];
$tidinfo['query_string'] = base64_encode($tidinfo['query_string']);
$ip = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_nsnst_blocked_ips WHERE ip_addr='".$tidinfo['ip_addr']."'"));
if ($ip < 1) {
  $db->sql_query("INSERT INTO ".$prefix."_nsnst_blocked_ips VALUES ('".$tidinfo['ip_addr']."', '".$tidinfo['user_id']."', '".$tidinfo['username']."', '".$tidinfo['user_agent']."', '".$tidinfo['date']."', '".$tidinfo['notes']."', '".$tidinfo['reason']."', '".$tidinfo['query_string']."', '".$tidinfo['x_forward_for']."', '".$tidinfo['client_ip']."', '".$tidinfo['remote_addr']."', '".$tidinfo['remote_port']."', '".$tidinfo['request_method']."', '".$tidinfo['expires']."')");
  if ($abconfig['htaccess_path'] != "") {
    $i = 1;
    while ($i <= 3) {
      $tip = substr($tidinfo['ip_addr'], -2);
      if ($tip == ".*") { $tidinfo['ip_addr'] = substr($tidinfo['ip_addr'], 0, -2); }
      $i++;
    }
    $tempip = "";
    if ($tidinfo['ip_addr'] != "*") { $tempip = "deny from ".$tidinfo['ip_addr']."\n"; }
    $doit = fopen($abconfig['htaccess_path'], "a");
    fwrite($doit, $tempip);
    fclose($doit);
  }
}
Header("Location: admin.php?op=ABTracked&min=$min&column=$column&direction=$direction&showmodule=$showmodule");

?>