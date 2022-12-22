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

$pagetitle = _AB_NUKESENTINEL.": "._AB_ADDRESERVED;
include("header.php");
title($pagetitle);
OpenMenu();
ipbanmenu();
CarryMenu();
reservedmenu();
CloseMenu();
echo "<br />\n";
OpenTable();
echo "<table align='center' border='0' cellpadding='2' cellspacing='2'>\n";
echo "<form action='admin.php' method='post'>\n";
echo "<tr bgcolor='$bgcolor1'><td align='center' class='content' colspan='2'>"._AB_ADDRESERVEDS."</td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'><b>"._AB_IPLO.":</b></td>\n";
echo "<td><input type='text' name='xip_lo[0]' size='4' maxlength='3'>\n";
echo ". <input type='text' name='xip_lo[1]' size='4' value='0' maxlength='3'>\n";
echo ". <input type='text' name='xip_lo[2]' size='4' value='0' maxlength='3'>\n";
echo ". <input type='text' name='xip_lo[3]' size='4' value='0' maxlength='3'></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'><b>"._AB_IPHI.":</b></td>\n";
echo "<td><input type='text' name='xip_hi[0]' size='4' maxlength='3'>\n";
echo ". <input type='text' name='xip_hi[1]' size='4' value='255' maxlength='3'>\n";
echo ". <input type='text' name='xip_hi[2]' size='4' value='255' maxlength='3'>\n";
echo ". <input type='text' name='xip_hi[3]' size='4' value='255' maxlength='3'></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'><b>"._AB_COUNTRY.":</b></td>\n";
echo "<td><select name='xc2c'>\n";
$result = $db->sql_query("SELECT * FROM ".$prefix."_nsnst_countries ORDER BY country");
while($countryrow = $db->sql_fetchrow($result)) {
  echo "<option value='".$countryrow['c2c']."'>".$countryrow['country']." (".$countryrow['c2c'].")</option>\n";
}
echo "</select></td></tr>\n";
echo "<input type='hidden' name='op' value='ABReservedAddSave'>\n";
echo "<tr><td colspan='2' align='center'><input type=submit value='"._AB_ADDRESERVED."'></td></tr>\n";
echo "</form>";
echo "</table>\n";
CloseTable();
include("footer.php");

?>