<?php

/********************************************************/
/* NSN GR Downloads                                     */
/* By: NukeScripts Network (webmaster@nukescripts.net)  */
/* http://www.nukescripts.net                           */
/* Copyright © 2000-2004 by NukeScripts Network         */
/********************************************************/

$eid = intval($eid);
$db->sql_query("DELETE FROM ".$prefix."_nsngd_extensions WHERE eid='$eid'");
$db->sql_query("OPTIMIZE TABLE ".$prefix."_nsngd_extensions");
Header("Location: admin.php?op=Extensions&min=$min");

?>