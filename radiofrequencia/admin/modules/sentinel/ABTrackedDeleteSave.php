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

$db->sql_query("DELETE FROM ".$prefix."_nsnst_tracked_ips WHERE tid='$tid'");
$db->sql_query("OPTIMIZE TABLE ".$prefix."_nsnst_tracked_ips");
Header("Location: admin.php?op=ABTrackedPages&user_id=$user_id&ip_addr=$ip_addr&column=$column&direction=$direction&min=$min");

?>