<?php

/********************************************************/
/* NSN GR Downloads                                     */
/* By: NukeScripts Network (webmaster@nukescripts.net)  */
/* http://www.nukescripts.net                           */
/* Copyright © 2000-2004 by NukeScripts Network         */
/********************************************************/

$db->sql_query("UPDATE ".$prefix."_nsngd_extensions SET ext='$xext', file='$xfile', image='$ximage' WHERE eid='$eid'");
Header("Location: admin.php?op=Extensions&min=$min");

?>