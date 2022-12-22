<?php

/********************************************************/
/* NSN Groups Universal                                 */
/* By: NukeScripts Network (webmaster@nukescripts.net)  */
/* http://www.nukescripts.net                           */
/* Copyright © 2000-2004 by NukeScripts Network         */
/********************************************************/
if (!eregi("admin.php", $_SERVER['PHP_SELF']) AND !eregi("admin.php", $_SERVER['SCRIPT_NAME'])) { die ("Access Denied"); }
if ($radminsuper==1) {
    adminmenu("admin.php?op=NSNGroups", _GR_ADMGRP, "groups.png");
}

?>
