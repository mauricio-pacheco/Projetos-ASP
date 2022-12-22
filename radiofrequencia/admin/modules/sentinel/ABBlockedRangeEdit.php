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

$pagetitle = _AB_NUKESENTINEL.": "._AB_EDITRANGE;
include("header.php");
title($pagetitle);
OpenMenu();
ipbanmenu();
CarryMenu();
blockedrangemenu();
CloseMenu();
echo "<br />\n";
OpenTable();
$getIPs = $db->sql_fetchrow($db->sql_query("SELECT * FROM ".$prefix."_nsnst_blocked_ranges WHERE ip_lo='$ip_lo' AND ip_hi='$ip_hi'"));
//$getIPs['ip_lo_ip'] = long2ip($getIPs['ip_lo']);
//$getIPs['ip_hi_ip'] = long2ip($getIPs['ip_hi']);
$ip_lo = explode(".", long2ip($getIPs['ip_lo']));
$ip_hi = explode(".", long2ip($getIPs['ip_hi']));
echo "<table align='center' border='0' cellpadding='2' cellspacing='2'>\n";
echo "<form action='admin.php' method='post'>\n";
echo "<tr><td align='center' colspan='2'>"._AB_EDITRANGES."</td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'><b>"._AB_IPLO.":</b></td>\n";
echo "<td><input type='text' name='xip_lo[0]' size='4' maxlength='3' value='$ip_lo[0]'>\n";
echo ". <input type='text' name='xip_lo[1]' size='4' maxlength='3' value='$ip_lo[1]'>\n";
echo ". <input type='text' name='xip_lo[2]' size='4' maxlength='3' value='$ip_lo[2]'>\n";
echo ". <input type='text' name='xip_lo[3]' size='4' maxlength='3' value='$ip_lo[3]'></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'><b>"._AB_IPHI.":</b></td>\n";
echo "<td><input type='text' name='xip_hi[0]' size='4' maxlength='3' value='$ip_hi[0]'>\n";
echo ". <input type='text' name='xip_hi[1]' size='4' maxlength='3' value='$ip_hi[1]'>\n";
echo ". <input type='text' name='xip_hi[2]' size='4' maxlength='3' value='$ip_hi[2]'>\n";
echo ". <input type='text' name='xip_hi[3]' size='4' maxlength='3' value='$ip_hi[3]'></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2' valign='top'><b>"._AB_EXPIRESIN.":</b></td><td><select name='xexpires'>\n";
select_box7($getIPs['expires']);
echo "</select><br />\n"._AB_EXPIRESINS."</td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2' valign='top'><b>"._AB_NOTES.":</b></td><td><textarea name='xnotes' rows='5' cols='40'>".$getIPs['notes']."</textarea></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'><b>"._AB_REASON.":</b></td><td><select name='xreason'>";
select_box8($getIPs['reason']);
echo "</select></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'><b>"._AB_COUNTRY.":</b></td>\n";
echo "<td><select name='xc2c'>\n";
$result = $db->sql_query("SELECT * FROM ".$prefix."_nsnst_countries ORDER BY country");
while($countryrow = $db->sql_fetchrow($result)) {
  echo "<option value='".$countryrow['c2c']."'";
  if($countryrow['c2c'] == $getIPs['c2c']) { echo " selected"; }
  echo ">".$countryrow['country']." (".$countryrow['c2c'].")</option>\n";
}
echo "</select></td></tr>\n";
echo "<input type='hidden' name='op' value='ABBlockedRangeEditSave'>\n";
echo "<input type='hidden' name='xop' value='$xop'>\n";
echo "<input type='hidden' name='sip' value='$sip'>\n";
echo "<input type='hidden' name='old_ip_lo' value='".$getIPs['ip_lo']."'>\n";
echo "<input type='hidden' name='old_ip_hi' value='".$getIPs['ip_hi']."'>\n";
echo "<input type='hidden' name='min' value='$min'>\n";
echo "<input type='hidden' name='column' value='$column'>\n";
echo "<input type='hidden' name='direction' value='$direction'>\n";
echo "<tr><td align='center' colspan='2'><input type=submit value='"._AB_SAVECHANGES."'></td></tr>\n";
echo "</form></table>\n";
CloseTable();
include("footer.php");

?>