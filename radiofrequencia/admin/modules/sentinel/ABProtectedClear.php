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

$pagetitle = _AB_NUKESENTINEL.": "._AB_CLEARPROTECTED;
include("header.php");
title($pagetitle);
OpenMenu();
ipbanmenu();
CarryMenu();
protectedmenu();
CloseMenu();
echo "<br />\n";
OpenTable();
echo "<form action='admin.php' method='post'>\n";
echo "<table align='center' border='0' cellpadding='2' cellspacing='2' width='100%'>\n";
echo "<tr><td align='center' class='content'>"._AB_CLEARPROTECTEDS."<br />\n";
echo "<input type=hidden name='op' value='ABProtectedClearSave'>\n";
echo "<input type=submit value=\""._AB_CLEARPROTECTED."\"></td></tr>\n";
echo "</table>\n";
echo "</form>\n";
CloseTable();
include("footer.php");

?>