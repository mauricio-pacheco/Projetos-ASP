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
$xtime = time();
$db->sql_query("UPDATE ".$prefix."_nsnst_reserved_ranges SET ip_lo='$longip_lo', ip_hi='$longip_hi', c2c='$xc2c', date='$xtime' WHERE ip_lo='$old_ip_lo' AND ip_hi='$old_ip_hi'");
Header("Location: admin.php?op=$xop&min=$min&column=$column&direction=$direction&sip=$sip");

?>