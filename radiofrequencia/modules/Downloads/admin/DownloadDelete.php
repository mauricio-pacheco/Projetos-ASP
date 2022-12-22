<?php

/********************************************************/
/* NSN GR Downloads                                     */
/* By: NukeScripts Network (webmaster@nukescripts.net)  */
/* http://www.nukescripts.net                           */
/* Copyright © 2000-2004 by NukeScripts Network         */
/********************************************************/

list($sname) = $db->sql_fetchrow($db->sql_query("SELECT submitter FROM ".$prefix."_nsngd_downloads WHERE lid='$lid'"));
$db->sql_query("UPDATE ".$prefix."_nsngd_accesses SET uploads=uploads-1 WHERE username='$sname'");
$db->sql_query("DELETE FROM ".$prefix."_nsngd_downloads WHERE lid='$lid'");
$db->sql_query("OPTIMIZE TABLE ".$prefix."_nsngd_downloads");
Header("Location: admin.php?op=Downloads&min=$min");

?>