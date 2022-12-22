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

$pagetitle = _AB_NUKESENTINEL.": "._AB_ADMINISTRATION;
include("header.php");
$ip_sets = abget_configs();
title($pagetitle);
OpenMenu();
ipbanmenu();
CarryMenu();
blankmenu();
CloseMenu();
echo "<br />\n";
OpenTable();
echo "<table align='center' border='0' cellpadding='2' cellspacing='2' width='75%'>";
echo "<form action='admin.php' method='post'>";
echo "<tr><td align='center' bgcolor='$bgcolor2' colspan='2'><b>"._AB_GENERALSETTINGS."</b></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2' width='30%'>".help_img(_AB_HELP_048)." "._AB_HELPSWITCH.":</td><td width='70%'>\n";
if($ip_sets['help_switch'] == 1) { $selhelp2 = "selected"; } else { $selhelp1 = "selected"; }
echo "<select name='xhelp_switch'>\n<option value='0' $selhelp1>"._AB_ONMOUSEOVER."</option>\n";
echo "<option value='1' $selhelp2>"._AB_ONMOUSECLICK."</option>\n</select>\n";
echo "</select></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2' valign='top'>".help_img(_AB_HELP_086)." "._AB_IPLOOKUPSITE.":</td><td>\n";
if($ip_sets['lookup_link'] == "http://dnsstuff.com/tools/whois.ch?cache=off&ip=") { $seldns2 = "selected"; } else { $seldns1 = "selected"; }
echo "<select name='xlookup_link'>\n";
echo "<option value='http://ws.arin.net/cgi-bin/whois.pl?queryinput=' $seldns1>Arin Net</option>\n";
echo "<option value='http://dnsstuff.com/tools/whois.ch?cache=off&ip=' $seldns2>DNS Stuff</option>\n";
echo "</select>\n</td></tr>\n";
//echo "<tr><td align='center' bgcolor='$bgcolor2' colspan='2'><b>"._AB_NUKEURLSTATUS."</b></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2' width='25%'>".help_img(_AB_HELP_047)." "._AB_FORCENUKEURL.":</td><td width='75%'><select name='xforce_nukeurl'>\n";
select_box6($ip_sets['force_nukeurl']);
echo "</select></td></tr>\n";
//echo "<tr><td align='center' bgcolor='$bgcolor2' colspan='2'><b>"._AB_BLOCKSETTINGS."</b></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2' width='25%'>".help_img(_AB_HELP_001)." "._AB_DISPLAYLINK.":</td><td width='75%'><select name='xdisplay_link'>\n";
select_box2($ip_sets['display_link']);
echo "</select></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'>".help_img(_AB_HELP_002)." "._AB_DISPLAYREASON.":</td><td><select name='xdisplay_reason'>\n";
select_box2($ip_sets['display_reason']);
echo "</select></td></tr>\n";
//echo "<tr><td align='center' bgcolor='$bgcolor2' colspan='2'><b>"._AB_SITESTATUS."</b></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2' valign='top'>".help_img(_AB_HELP_003)." "._AB_SITESWITCH.":</td><td><select name='xsite_switch'>\n";
$sel1 = $sel2 = "";
if ($ip_sets['site_switch']==1) { $sel2 = " selected"; } else { $sel1 = " selected"; }
echo "<option value='0'$sel1>"._AB_SITEENABLED."</option>\n<option value='1'$sel2>"._AB_SITEDISABLED."</option>\n";
echo "</select></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'>".help_img(_AB_HELP_004)." "._AB_TEMPLATE.":</td><td><select name='xsite_reason'>\n";
select_box9($ip_sets['site_reason']);
echo "</select></td></tr>\n";
//echo "<tr><td align='center' bgcolor='$bgcolor2' colspan='2'><b>"._AB_PROXYSTATUS."</b></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2' valign='top'>".help_img(_AB_HELP_044)." "._AB_PROXYBLOCKER.":</td><td>\n";
if($ip_sets['proxy_switch'] == 1) { $selproxy2 = "selected"; } elseif($ip_sets['proxy_switch'] == 2) { $selproxy3 = "selected"; } elseif($ip_sets['proxy_switch'] == 3) { $selproxy4 = "selected"; } else { $selproxy1 = "selected"; }
echo "<select name='xproxy_switch'>\n";
echo "<option value='0' $selproxy1>"._AB_OFF."</option>\n<option value='1' $selproxy2>"._AB_PROXYLITE."</option>\n";
echo "<option value='2' $selproxy3>"._AB_PROXYMILD."</option>\n<option value='3' $selproxy4>"._AB_PROXYSTRONG."</option>\n";
echo "</select>\n</td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'>".help_img(_AB_HELP_045)." "._AB_TEMPLATE.":</td><td><select name='xproxy_reason'>\n";
select_box9($ip_sets['proxy_reason']);
echo "</select></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2' valign='top'>".help_img(_AB_HELP_042)." "._AB_SELFEXPIRE.":</td><td>\n";
if($ip_sets['self_expire'] == 1) { $selexpire2 = "selected"; } else { $selexpire1 = "selected"; }
echo "<select name='xself_expire'>\n<option value='0' $selexpire1>"._AB_OFF."</option>\n";
echo "<option value='1' $selexpire2>"._AB_ON."</option>\n</select>\n";
echo "</td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2' valign='top'>".help_img(_AB_HELP_046)." "._AB_PREVENTDOS.":</td><td>\n";
if($ip_sets['prevent_dos'] == 1) { $seldos2 = "selected"; } else { $seldos1 = "selected"; }
echo "<select name='xprevent_dos'>\n<option value='0' $seldos1>"._AB_OFF."</option>\n";
echo "<option value='1' $seldos2>"._AB_ON."</option>\n</select>\n";
echo "</td></tr>\n";

echo "<tr><td align='center' bgcolor='$bgcolor2' colspan='2'><b>"._AB_ADMINISTRATIVE."</b></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2' valign='top'>".help_img(_AB_HELP_007)." "._AB_ADMINAUTH.":</td><td>\n";
$apass = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_nsnst_admins WHERE password_md5='' OR password='' OR password_crypt=''"));
if($apass > 0) {
  echo "<b>"._AB_SETPASSWORDS."</b>";
  echo "<input type='hidden' name='xhttp_auth' value='0'>";
} else {
  $sapi_name = strtolower(php_sapi_name());
  if($ip_sets['http_auth'] == 1) { $selauth2 = "selected"; } else if($ip_sets['http_auth'] == 2) { $selauth3 = "selected"; } else { $selauth1 = "selected"; }
  echo "<select name='xhttp_auth'>\n<option value='0' $selauth1>"._AB_OFF."</option>\n";
  if (strpos($sapi_name,"cgi")===FALSE) { echo "<option value='1' $selauth2>"._AB_HTTPAUTH."</option>\n"; }
  echo "<option value='2' $selauth3>"._AB_CGIAUTH."</option>\n</select>\n";
}
echo "<tr><td bgcolor='$bgcolor2' valign='top'>".help_img(_AB_HELP_005)." "._AB_HTACCESSPATH.":</td>\n<td>";
if(stristr($_SERVER['SERVER_SOFTWARE'], "Apache")) {
  echo "<input type='text' name='xhtaccess_path' size='50' value='".$ip_sets['htaccess_path']."'>";
  $rp = strtolower(str_replace ('index.php', '', realpath('index.php')));
  echo "<br />"._AB_NORMALLY.": ".$rp.".htaccess";
  if($ip_sets['htaccess_path']>"") {
    $httest = is_writable($ip_sets['htaccess_path']);
    if(!$httest) {
      echo "<br /><b>"._AB_STWARNING."</b>";
    }
  }
} else {
  echo "<b>"._AB_NOTAVAILABLE."</b><input type='hidden' name='xhtaccess_path' value=''>\n";
}
echo "<tr><td bgcolor='$bgcolor2' valign='top'>".help_img(_AB_HELP_057)." "._AB_STACCESSPATH.":<br /><a href='admin.php?op=ABCGIAuth' target='_blank'>"._AB_CGIAUTHSETUP."</a></td>\n<td>";
if(stristr($_SERVER['SERVER_SOFTWARE'], "Apache")) {
  echo "<input type='text' name='xstaccess_path' size='50' value='".$ip_sets['staccess_path']."'>";
  $rp = strtolower(str_replace ('index.php', '', realpath('index.php')));
  echo "<br />"._AB_NORMALLY.": ".$rp.".staccess";
  if($ip_sets['staccess_path']>"") {
    $httest = is_writable($ip_sets['staccess_path']);
    if(!$httest) {
      echo "<br /><b>"._AB_HTWARNING."</b>";
    }
  }
} else {
  echo "<b>"._AB_NOTAVAILABLE."</b><input type='hidden' name='xstaccess_path' value=''>\n";
}
echo "</td>\n</tr>\n";
echo "<tr><td bgcolor='$bgcolor2'>".help_img(_AB_HELP_067)." "._AB_CRYPTSALT.":</td><td><input type='text' name='xcrypt_salt' size='3' maxlength='2' value='".$ip_sets['crypt_salt']."'></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2' valign='top'>".help_img(_AB_HELP_006)." "._AB_ADMINLIST.":</td><td><textarea name='xadmin_contact' rows='5' cols='40'>".$ip_sets['admin_contact']."</textarea></td></tr>\n";
echo "<tr><td align='center' bgcolor='$bgcolor2' colspan='2'><b>"._AB_IPTRACKERSETTINGS."</b></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2' width='25%'>".help_img(_AB_HELP_050)." "._AB_IPTRACKER.":</td><td><select name='xtrack_active'>\n";
select_box5($ip_sets['track_active']);
echo "</select></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'>".help_img(_AB_HELP_051)." "._AB_MAXIMUMLINES.":</td><td><select name='xtrack_max'>";
if($ip_sets['track_max']==0) { $selmax = _AB_UNLIMITED; }
echo "<option value='0'$selmax>"._AB_UNLIMITED."</option>\n";
$i=1;
while ($i<=100) {
  $j = $i * 1000;
  echo "<option value='$j'";
  if ($ip_sets['track_max']==$j) { echo " selected"; }
  echo ">$j</option>\n";
  $i++;
}
echo "</select></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'>".help_img(_AB_HELP_052)." "._AB_DELETELINES.":</td><td><select name='xtrack_del'>";
$i=1;
while ($i<=100) {
  $j = $i * 100;
  echo "<option value='$j'";
  if ($ip_sets['track_del']==$j) { echo " selected"; }
  echo ">$j</option>\n";
  $i++;
}
echo "</select></td></tr>\n";
echo "<tr><td align='center' bgcolor='$bgcolor2' colspan='2'><b>"._AB_BLOCKEDPAGE."</b></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'>".help_img(_AB_HELP_008)." "._AB_IPSPERPAGE.":</td><td><input type='text' name='xblock_perpage' size='5' value='".$ip_sets['block_perpage']."'></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'>".help_img(_AB_HELP_009)." "._AB_SORTCOLUMN.":</td><td><select name='xblock_sort_column'>\n";
$selcolumn1 = $selcolumn2 = $selcolumn3 = $selcolumn4 = "";
if($ip_sets['block_sort_column'] == "ip_addr") $selcolumn1 = "selected";
if($ip_sets['block_sort_column'] == "expires") $selcolumn2 = "selected";
if($ip_sets['block_sort_column'] == "date") $selcolumn3 = "selected";
if($ip_sets['block_sort_column'] == "reason") $selcolumn4 = "selected";
echo "<option value='ip_addr'$selcolumn1>"._AB_IPBLOCKED."</option>\n";
echo "<option value='expires'$selcolumn2>"._AB_EXPIRES."</option>\n";
echo "<option value='date'$selcolumn3>"._AB_DATE."</option>\n";
echo "<option value='reason'$selcolumn4>"._AB_REASON."</option>\n";
echo "</select></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'>".help_img(_AB_HELP_010)." "._AB_SORTDIRECTION.":</td><td><select name='xblock_sort_direction'>\n";
$seldirection1 = $seldirection2 = "";
if($ip_sets['block_sort_direction'] == "asc") $seldirection1 = "selected";
if($ip_sets['block_sort_direction'] == "desc") $seldirection2 = "selected";
echo "<option value='asc'$seldirection1>"._AB_ASC."</option>\n";
echo "<option value='desc'$seldirection2>"._AB_DESC."</option>\n";
echo "</select></td></tr>\n";

echo "<tr><td align='center' bgcolor='$bgcolor2' colspan='2'><b>"._AB_TRACKEDPAGE."</b></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'>".help_img(_AB_HELP_053)." "._AB_IPSPERPAGE.":</td><td><input type='text' name='xtrack_perpage' size='5' value='".$ip_sets['track_perpage']."'></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'>".help_img(_AB_HELP_054)." "._AB_SORTCOLUMN.":</td><td><select name='xtrack_sort_column'>\n";
$selcolumn1 = $selcolumn2 = $selcolumn3 = $selcolumn4 = $selcolumn5 = "";
if($ip_sets['track_sort_column'] == "ip_addr") $selcolumn1 = "selected";
if($ip_sets['track_sort_column'] == "hostname") $selcolumn2 = "selected";
if($ip_sets['track_sort_column'] == "date") $selcolumn3 = "selected";
if($ip_sets['track_sort_column'] == "username") $selcolumn4 = "selected";
if($ip_sets['track_sort_column'] == 6) $selcolumn5 = "selected";
echo "<option value='ip_addr'$selcolumn1>"._AB_IPTRACKED."</option>\n";
echo "<option value='hostname'$selcolumn2>"._AB_HOSTNAME."</option>\n";
echo "<option value='date'$selcolumn3>"._AB_DATE."</option>\n";
echo "<option value='username'$selcolumn4>"._AB_USERNAME."</option>\n";
echo "<option value=6 $selcolumn5>"._AB_HITS."</option>\n";
echo "</select></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'>".help_img(_AB_HELP_055)." "._AB_SORTDIRECTION.":</td><td><select name='xtrack_sort_direction'>\n";
$seldirection1 = $seldirection2 = "";
if($ip_sets['track_sort_direction'] == "asc") $seldirection1 = "selected";
if($ip_sets['track_sort_direction'] == "desc") $seldirection2 = "selected";
echo "<option value='asc'$seldirection1>"._AB_ASC."</option>\n";
echo "<option value='desc'$seldirection2>"._AB_DESC."</option>\n";
echo "</select></td></tr>\n";

echo "<tr><td align='center' bgcolor='$bgcolor2' colspan='2'><b>"._AB_SEARCHBLOCKEDPAGE."</b></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'>".help_img(_AB_HELP_068)." "._AB_IPSPERPAGE.":</td><td><input type='text' name='xsearch_block_perpage' size='5' value='".$ip_sets['search_block_perpage']."'></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'>".help_img(_AB_HELP_069)." "._AB_SORTCOLUMN.":</td><td><select name='xsearch_block_sort_column'>\n";
$selcolumn1 = $selcolumn2 = $selcolumn3 = $selcolumn4 = "";
if($ip_sets['search_block_sort_column'] == "ip_addr") $selcolumn1 = "selected";
if($ip_sets['search_block_sort_column'] == "expires") $selcolumn2 = "selected";
if($ip_sets['search_block_sort_column'] == "date") $selcolumn3 = "selected";
if($ip_sets['search_block_sort_column'] == "reason") $selcolumn4 = "selected";
echo "<option value='ip_addr'$selcolumn1>"._AB_IPBLOCKED."</option>\n";
echo "<option value='expires'$selcolumn2>"._AB_EXPIRES."</option>\n";
echo "<option value='date'$selcolumn3>"._AB_DATE."</option>\n";
echo "<option value='reason'$selcolumn4>"._AB_REASON."</option>\n";
echo "</select></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'>".help_img(_AB_HELP_070)." "._AB_SORTDIRECTION.":</td><td><select name='xsearch_block_sort_direction'>\n";
$seldirection1 = $seldirection2 = "";
if($ip_sets['search_block_sort_direction'] == "asc") $seldirection1 = "selected";
if($ip_sets['search_block_sort_direction'] == "desc") $seldirection2 = "selected";
echo "<option value='asc'$seldirection1>"._AB_ASC."</option>\n";
echo "<option value='desc'$seldirection2>"._AB_DESC."</option>\n";
echo "</select></td></tr>\n";

echo "<tr><td align='center' bgcolor='$bgcolor2' colspan='2'><b>"._AB_SEARCHTRACKEDPAGE."</b></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'>".help_img(_AB_HELP_071)." "._AB_IPSPERPAGE.":</td><td><input type='text' name='xsearch_track_perpage' size='5' value='".$ip_sets['search_track_perpage']."'></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'>".help_img(_AB_HELP_072)." "._AB_SORTCOLUMN.":</td><td><select name='xsearch_track_sort_column'>\n";
$selcolumn1 = $selcolumn2 = $selcolumn3 = $selcolumn4 = $selcolumn5 = "";
if($ip_sets['search_track_sort_column'] == "ip_addr") $selcolumn1 = "selected";
if($ip_sets['search_track_sort_column'] == "hostname") $selcolumn2 = "selected";
if($ip_sets['search_track_sort_column'] == "date") $selcolumn3 = "selected";
if($ip_sets['search_track_sort_column'] == "username") $selcolumn4 = "selected";
if($ip_sets['search_track_sort_column'] == 6) $selcolumn5 = "selected";
echo "<option value='ip_addr'$selcolumn1>"._AB_IPTRACKED."</option>\n";
echo "<option value='hostname'$selcolumn2>"._AB_HOSTNAME."</option>\n";
echo "<option value='date'$selcolumn3>"._AB_DATE."</option>\n";
echo "<option value='username'$selcolumn4>"._AB_USERNAME."</option>\n";
echo "<option value=6 $selcolumn5>"._AB_HITS."</option>\n";
echo "</select></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'>".help_img(_AB_HELP_073)." "._AB_SORTDIRECTION.":</td><td><select name='xsearch_track_sort_direction'>\n";
$seldirection1 = $seldirection2 = "";
if($ip_sets['search_track_sort_direction'] == "asc") $seldirection1 = "selected";
if($ip_sets['search_track_sort_direction'] == "desc") $seldirection2 = "selected";
echo "<option value='asc'$seldirection1>"._AB_ASC."</option>\n";
echo "<option value='desc'$seldirection2>"._AB_DESC."</option>\n";
echo "</select></td></tr>\n";

echo "<tr><td align='center' bgcolor='$bgcolor2' colspan='2'><b>"._AB_SEARCHLASTPAGE."</b></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'>".help_img(_AB_HELP_074)." "._AB_IPSPERPAGE.":</td><td><input type='text' name='xsearch_user_perpage' size='5' value='".$ip_sets['search_user_perpage']."'></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'>".help_img(_AB_HELP_075)." "._AB_SORTCOLUMN.":</td><td><select name='xsearch_user_sort_column'>\n";
$selcolumn1 = $selcolumn2 = $selcolumn3 = $selcolumn4 = "";
if($ip_sets['search_user_sort_column'] == "username") $selcolumn1 = "selected";
if($ip_sets['search_user_sort_column'] == "user_id") $selcolumn2 = "selected";
if($ip_sets['search_user_sort_column'] == "last_ip") $selcolumn3 = "selected";
if($ip_sets['search_user_sort_column'] == "user_email") $selcolumn4 = "selected";
echo "<option value='username' $selcolumn1>"._AB_USERNAME."</option>\n";
echo "<option value='user_id' $selcolumn2>"._AB_USERID."</option>\n";
echo "<option value='last_ip' $selcolumn3>"._AB_LASTIP."</option>\n";
echo "<option value='user_email' $selcolumn4>"._AB_USEREMAIL."</option>\n";
echo "</select></td></tr>\n";
echo "<tr><td bgcolor='$bgcolor2'>".help_img(_AB_HELP_076)." "._AB_SORTDIRECTION.":</td><td><select name='xsearch_user_sort_direction'>\n";
$seldirection1 = $seldirection2 = "";
if($ip_sets['search_user_sort_direction'] == "asc") $seldirection1 = "selected";
if($ip_sets['search_user_sort_direction'] == "desc") $seldirection2 = "selected";
echo "<option value='asc'$seldirection1>"._AB_ASC."</option>\n";
echo "<option value='desc'$seldirection2>"._AB_DESC."</option>\n";
echo "</select></td></tr>\n";

echo "<input type='hidden' name='op' value='ABMainSave'>\n";
echo "<tr><td align='center' colspan='2'><input type=submit value='"._AB_SAVECHANGES."'></td></tr>\n";
echo "</form></table>\n";
CloseTable();
include("footer.php");

?>