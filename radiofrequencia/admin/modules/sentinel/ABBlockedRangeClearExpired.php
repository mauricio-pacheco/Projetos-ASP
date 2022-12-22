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
$clearresult = $db->sql_query("SELECT * FROM ".$prefix."_nsnst_blocked_ranges WHERE (expires<'$expiretime' AND expires!='0')");
while($clearblock = $db->sql_fetchrow($clearresult)) {
  $db->sql_query("DELETE FROM ".$prefix."_nsnst_blocked_ranges WHERE ip_lo='".$clearblock['ip_lo']."' AND ip_hi='".$clearblock['ip_hi']."'");
  $db->sql_query("OPTIMIZE TABLE ".$prefix."_nsnst_blocked_ranges");
}
Header("Location: admin.php?op=ABBlockedRange");

?>