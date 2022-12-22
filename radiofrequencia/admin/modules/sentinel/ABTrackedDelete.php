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

$tid = intval($tid);
if(ereg("All.*Modules", $showmodule) || !$showmodule ) {
  $modfilter="";
} elseif(ereg("Admin", $showmodule)) {
  $modfilter="AND page LIKE '%admin.php%'";
} elseif(ereg("Index", $showmodule)) {
  $modfilter="AND page LIKE '%index.php%'";
} elseif(ereg("Backend", $showmodule)) {
  $modfilter="AND page LIKE '%backend.php%'";
} else {
  $modfilter="AND page LIKE '%name=$showmodule%'";
}
$deleterow = $db->sql_fetchrow($db->sql_query("SELECT user_id, ip_addr FROM ".$prefix."_nsnst_tracked_ips WHERE tid='$tid'"));
$db->sql_query("DELETE FROM ".$prefix."_nsnst_tracked_ips WHERE user_id='".$deleterow['user_id']."' AND ip_addr='".$deleterow['ip_addr']."' $modfilter");
$db->sql_query("OPTIMIZE TABLE ".$prefix."_nsnst_tracked_ips");
Header("Location: admin.php?op=$xop&min=$min&column=$column&direction=$direction&showmodule=$showmodule&sip=$sip");

?>