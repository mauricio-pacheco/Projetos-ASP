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

$pagetitle = _AB_NUKESENTINEL.": "._AB_CONFIGURATION.": "._AB_STRINGBLOCKER;
include("header.php");
title($pagetitle);
OpenMenu();
ipbanmenu();
CarryMenu();
ipsubmenu();
CloseMenu();
echo "<br />\n";
OpenTable();
echo "<form action='admin.php' method='post'>";
echo "<table align='center' border='0' cellpadding='2' cellspacing='2' width='75%'>";
$blocker_row = abget_blocker("string");
$blocker_row['duration'] = $blocker_row['duration'] / 86400;
echo "<tr><td align='center' bgcolor='$bgcolor2' colspan='2'><b>"._AB_STRINGBLOCKER."</b></td></tr>\n";
echo "<input type='hidden' name='xblocker_row[block_name]' value='string'>\n";
blocker_config($blocker_row);
echo "<tr><td bgcolor='$bgcolor2' valign='top'>".help_img(_AB_HELP_022)." "._AB_STRINGLIST.":</td><td><textarea name='xblocker_row[list]' rows='5' cols='40'>".$blocker_row['list']."</textarea></td></tr>\n";
echo "<input type='hidden' name='xop' value='$op'>\n";
echo "<input type='hidden' name='op' value='ABConfigSave'>\n";
echo "<tr><td align='center' colspan='2'><input type=submit value='"._AB_SAVECHANGES."'></td></tr>\n";
echo "</table>\n</form>\n";
CloseTable();
include("footer.php");

?>