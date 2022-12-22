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

$pagetitle = _AB_NUKESENTINEL.": "._AB_PROTECTEDDELETE;
include("header.php");
title($pagetitle);
OpenMenu();
ipbanmenu();
CarryMenu();
protectedmenu();
CloseMenu();
echo "<br />\n";
OpenTable();
echo "<table align='center' border='0' cellpadding='2' cellspacing='2'>\n";
echo "<form action='admin.php' method='post'>\n";
echo "<tr bgcolor='$bgcolor1'><td align='center' class='content'>"._AB_PROTECTEDDELETES." ".long2ip($ip_lo)." to ".long2ip($ip_hi)."?</td></tr>\n";
echo "<input type='hidden' name='op' value='ABProtectedDeleteSave'>\n";
echo "<input type='hidden' name='ip_lo' value='$ip_lo'>\n";
echo "<input type='hidden' name='ip_hi' value='$ip_hi'>\n";
echo "<input type='hidden' name='xop' value='$xop'>\n";
echo "<input type='hidden' name='min' value='$min'>\n";
echo "<input type='hidden' name='sip' value='$sip'>\n";
echo "<input type='hidden' name='column' value='$column'>\n";
echo "<input type='hidden' name='direction' value='$direction'>\n";
echo "<tr><td align='center'><input type=submit value='"._AB_PROTECTEDDELETE."'></td></tr>\n";
echo "<tr><td align='center'>"._GOBACK."</td></tr>\n";
echo "</form>";
echo "</table>\n";
CloseTable();
include("footer.php");

?>