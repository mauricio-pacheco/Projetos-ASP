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

$db->sql_query("DELETE FROM ".$prefix."_nsnst_protected_ranges WHERE ip_lo='$ip_lo' AND ip_hi='$ip_hi'");
$db->sql_query("OPTIMIZE TABLE ".$prefix."_nsnst_protected_ranges");
Header("Location: admin.php?op=$xop&min=$min&column=$column&direction=$direction&sip=$sip");

?>