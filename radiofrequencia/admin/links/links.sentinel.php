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

if (!stristr($_SERVER['PHP_SELF'], "admin.php") AND !stristr($_SERVER['SCRIPT_NAME'], "admin.php")) { die ("Access Denied"); }
if ($radminsuper==1) {
    adminmenu("admin.php?op=ABMain", _AB_NUKESENTINEL, "sentinel.png");
}

?>