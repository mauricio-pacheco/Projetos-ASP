<?php

/********************************************************/
/* NSN GR Downloads                                     */
/* By: NukeScripts Network (webmaster@nukescripts.net)  */
/* http://www.nukescripts.net                           */
/* Copyright © 2000-2004 by NukeScripts Network         */
/********************************************************/

$db->sql_query("DELETE FROM ".$prefix."_nsngd_mods WHERE lid='$lid' and brokendownload='1'");
$db->sql_query("OPTIMIZE TABLE ".$prefix."_nsngd_mods");
Header("Location: admin.php?op=DownloadBroken");

?>