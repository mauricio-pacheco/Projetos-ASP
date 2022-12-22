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

$pagetitle = _AB_NUKESENTINEL.": "._AB_ADDRANGE;
include("header.php");
title($pagetitle);
OpenMenu();
ipbanmenu();
CarryMenu();
blockedrangemenu();
CloseMenu();
echo "<br />\n";
OpenTable();
echo "<table align='center' border='0' cellpadding='2' cellspacing='2'>\n";
echo "<form action='admin.php' method='post'>\n";
echo "<tr bgcolor='$bgcolor1'><td align='center' class='content' colspan='2'>"._AB_ADDRANGES."</td></tr>\n";
if(isset($ip_lo)) { $tip_lo = explode(".", $ip_lo); } else { $tip_lo[0]=""; $tip_lo[1]=$tip_lo[2]=$tip_lo[3]="0"; }
echo "<tr><td bgcolor='$bgcolor2'><b>"._AB_IPLO.":</b></td>\n";
echo "<td><input type='text' name='xip_lo[0]' value='$tip_lo[0]' size='4' maxlength='3'>\n";
echo ". <input type='text' name='xip_lo[1]' value='$tip_lo[1]' size='4' maxlength='3'>\n";
echo ". <input type='text' name='xip_lo[2]' value='$tip_lo[2]' size='4' maxlength='3'>\n";
echo ". <input type='text' name='xip_lo[3]' value='$tip_lo[3]' size='4' maxlength='3'></td></tr>\n";
if(isset($ip_hi)) { $tip_hi = explode(".", $ip_hi); } else { $tip_hi[0]=""; $tip_hi[1]=$tip_hi[2]=$tip_hi[3]="255"; }
echo "<tr><td bgcolor='$bgcolor2'><b>"._AB_IPHI.":</b></td>\n";
echo "<td><input type='text' name='xip_hi[0]' value='$tip_hi[0]' size='4' maxlength='3'>\n";
echo ". <input type='text' name='xip_hi[1]' value='$tip_hi[1]' size='4' maxlength='3'>\n";
echo ". <input type='text' name='xip_hi[2]' value='$tip_hi[2]' size='4' maxlength='3'>\n";
echo ". <input type='text' name='xip_hi[3]' value='$tip_hi[3]' size='4' maxlength='3'></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2' valign='top'><b>"._AB_EXPIRESIN.":</b></td><td><select name='xexpires'>\n";
select_box7();
echo "</select><br />\n"._AB_EXPIRESINS."</td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2' valign='top'><b>"._AB_NOTES.":</b></td><td><textarea name='xnotes' rows='5' cols='40'>"._AB_ADDBY." $aid</textarea></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'><b>"._AB_REASON.":</b></td><td><select name='xreason'>";
select_box8();
echo "</select></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'><b>"._AB_COUNTRY.":</b></td>\n";
echo "<td><select name='xc2c'>\n";
$result = $db->sql_query("SELECT * FROM ".$prefix."_nsnst_countries ORDER BY country");
while($countryrow = $db->sql_fetchrow($result)) {
  echo "<option value='".$countryrow['c2c']."'";
  if($tc2c == strtolower($countryrow['c2c'])) { echo " selected"; }
  echo ">".$countryrow['country']." (".$countryrow['c2c'].")</option>\n";
}
echo "</select></td></tr>\n";
echo "<input type='hidden' name='op' value='ABBlockedRangeAddSave'>\n";
echo "<tr><td colspan='2' align='center'><input type=submit value='"._AB_ADDRANGE."'></td></tr>\n";
echo "</form>";
echo "</table>\n";
CloseTable();
include("footer.php");

?>