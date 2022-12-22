<?php

/********************************************************/
/* NSN-NUKE: Intelligent Content Management System      */
/* ============================================         */
/*                                                      */
/* Copyright (c) 2003 by NukeScripts Network            */
/* http://nsnnuke.org                                   */
/********************************************************/
/* NSN GR Downloads                                     */
/* By: NukeScripts Network (webmaster@nukescripts.net)  */
/* http://www.nukescripts.net                           */
/* Copyright © 2000-2004 by NukeScripts Network         */
/********************************************************/

if (!eregi("admin.php", $_SERVER['SCRIPT_NAME']) AND !eregi("admin.php", $_SERVER['PHP_SELF'])) { die ("Access Denied"); }
    adminmenu("admin.php?op=DLMain", ""._DOWNLOAD."", "downloads.gif");

?>