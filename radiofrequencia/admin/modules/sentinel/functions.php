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

function abget_country($tempip){
  global $prefix, $db;
  $tempip = str_replace(".*", ".0", $tempip);
  $tempip = sprintf("%u", ip2long($tempip));
  $countryinfo = $db->sql_fetchrow($db->sql_query("SELECT * FROM ".$prefix."_nsnst_ip2country WHERE ip_lo<='$tempip' AND ip_hi>='$tempip'"));
  if(!$countryinfo) {
    $countryinfo['c2c'] = "00";
    $countryinfo['country'] = _AB_UNKNOWN;
  } else {
    if(!file_exists("images/sentinel/countries/".$countryinfo['c2c'].".png")) { $countryinfo['c2c']="00"; }
  }
  return $countryinfo;
}

function abget_countrytitle($c2c){
  global $prefix, $db;
  $countrytitleinfo = $db->sql_fetchrow($db->sql_query("SELECT * FROM ".$prefix."_nsnst_countries WHERE c2c='$c2c'"));
  if(!$countrytitleinfo) {
    $countrytitleinfo['c2c'] = "00";
    $countrytitleinfo['country'] = _AB_UNKNOWN;
  } else {
    if(!file_exists("images/sentinel/countries/".$countrytitleinfo['c2c'].".png")) { $countrytitleinfo['c2c']="00"; }
  }
  return $countrytitleinfo;
}

function absave_config($config_name, $config_value){
  global $prefix, $db;
  $resultnum = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_nsnst_config WHERE config_name='$config_name'"));
  if($resultnum < 1) {
    $db->sql_query("INSERT INTO ".$prefix."_nsnst_config (config_name, config_value) VALUES ('$config_name', '$config_value')");
  } else {
    $db->sql_query("UPDATE ".$prefix."_nsnst_config SET config_value='$config_value' WHERE config_name='$config_name'");
  }
}

function absave_blocker($blocker_row){
  global $prefix, $db;
  $block_list = explode("\r\n", $blocker_row['list']);
  sort($block_list);
  $blocker_row['list'] = implode("\r\n", $block_list);
  $blocker_row['list'] = str_replace("\r\n\r\n", "\r\n", $blocker_row['list']);
  $blocker_row['duration'] = $blocker_row['duration'] * 86400;
  $db->sql_query("UPDATE ".$prefix."_nsnst_blockers SET activate='".$blocker_row['activate']."', block_type='".$blocker_row['block_type']."', email_lookup='".$blocker_row['email_lookup']."', forward='".$blocker_row['forward']."', reason='".$blocker_row['reason']."', template='".$blocker_row['template']."', duration='".$blocker_row['duration']."', htaccess='".$blocker_row['htaccess']."', list='".$blocker_row['list']."' WHERE block_name='".$blocker_row['block_name']."'");
}

function blankmenu() {
  echo "<center>"._AB_SUBMENU."</center>\n";
}

function ipbanmenu() {
  global $abconfig, $getAdmin, $prefix, $db, $op, $admin;
  $sapi_name = strtolower(php_sapi_name());
  //$checkrow = $db->sql_fetchrow($db->sql_query("CHECK TABLE ".$prefix."_nsnst_ip2country"));
  $checkrow = $db->sql_fetchrow($db->sql_query("SHOW TABLES LIKE '".$prefix."_nsnst_ip2country%'"));
  if($checkrow['Msg_type']=="error") { $tableexist = 0; } else { $tableexist = 1; }
  echo "<div id=\"overDiv\" style=\"position:absolute; visibility:hidden; z-index:9999;\"></div>\n";
  echo "<table align='center' border='0' cellpadding='2' cellspacing='2' width='90%'>\n";
  echo "<tr>\n";
  echo "<td align='center' valign='top' width='50%'>\n<table align='center' border='0' cellpadding='2' cellspacing='2'>\n";
  echo "<tr><td>".help_img(_AB_HELP_023)."</td><td><a href='admin.php?op=ABMain'>"._AB_NUKESENTINEL." "._AB_ADMINISTRATION."</a></td></tr>\n";
  echo "<tr><td>".help_img(_AB_HELP_065)."</td><td><a href='admin.php?op=ABBlockedIPMenu'>"._AB_BLOCKEDIPMENU."</a></td></tr>\n";
  echo "<tr><td>".help_img(_AB_HELP_097)."</td><td><a href='admin.php?op=ABBlockedRangeMenu'>"._AB_BLOCKEDRANGEMENU."</a></td></tr>\n";
  echo "<tr><td>".help_img(_AB_HELP_066)."</td><td><a href='admin.php?op=ABTrackedMenu'>"._AB_TRACKEDIPMENU."</a></td></tr>\n";
  echo "<tr><td>".help_img(_AB_HELP_081)."</td><td><a href='admin.php?op=ABReservedMenu'>"._AB_RESERVEDRANGEMENU."</a></td></tr>\n";
  echo "<tr><td>".help_img(_AB_HELP_098)."</td><td><a href='admin.php?op=ABExcludedMenu'>"._AB_EXCLUDEDRANGEMENU."</a></td></tr>\n";
  echo "<tr><td>".help_img(_AB_HELP_099)."</td><td><a href='admin.php?op=ABProtectedMenu'>"._AB_PROTECTEDRANGEMENU."</a></td></tr>\n";
  echo "</table>\n</td>\n";
  echo "<td align='center' valign='top' width='50%'>\n<table align='center' border='0' cellpadding='2' cellspacing='2'>\n";
  echo "<tr><td>".help_img(_AB_HELP_024)."</td><td><a href='admin.php?op=ABConfig'>"._AB_NUKESENTINEL." "._AB_CONFIGURATION."</a></td></tr>\n";
  echo "<tr><td>".help_img(_AB_HELP_030)."</td><td><a href='admin.php?op=ABSearch'>"._AB_SEARCHIPS."</a></td></tr>\n";
  if($tableexist == 1) { echo "<tr><td>".help_img(_AB_HELP_077)."</td><td><a href='admin.php?op=ABIP2Country'>"._AB_IP2COUNTRY."</a></td>\n"; }
  else { echo "<tr><td>".help_img(_AB_HELP_078)."</td><td>"._AB_IP2COUNTRY."</td>\n"; }
  echo "<tr><td>".help_img(_AB_HELP_031)."</td><td>";
  if(is_god($admin)) { echo "<a href='admin.php?op=ABAuthList'>"; }
  echo _AB_LISTHTTPAUTH."</a></td></tr>\n";
  echo "<tr><td>".help_img(_AB_HELP_032)."</td><td>";
  if(is_god($admin)) { echo "<a href='admin.php?op=ABAuthListScan'>"; }
  echo _AB_SCANADMINS."</a></td></tr>\n";
  echo "<tr><td>".help_img(_AB_HELP_058)."</td><td>";
  if(is_god($admin)) { echo "<a href='admin.php?op=ABDBMaintence'>"; }
  echo _AB_DBMAINTENCE."</a></td></tr>\n";
  echo "</table>\n</td>\n";
  echo "</tr>\n";
  //echo "<tr>\n<td align='center' colspan='2'><hr></td>\n</tr>\n";
  echo "<tr>\n<td align='center' colspan='2'>".help_img(_AB_HELP_025)." <a href='admin.php'>"._AB_SITEADMIN."</a></td>\n</tr>\n";
  echo "<tr><td align='center' colspan='2'>";
  if($abconfig['help_switch'] > 0) { echo _AB_HELPNOTE1; } else { echo _AB_HELPNOTE0; }
  //if($op == "ABTracked") { echo "<br>"._AB_BANNNOTE."<br>"._AB_VIEWNOTE."<br>"._AB_PRINTNOTE; }
  echo "</td></tr>\n";
  echo "</table>\n";
}

function searchmenu() {
  global $op, $sip, $nuke_config;
  echo "<table align='center' border='0' cellpadding='2' cellspacing='2'>\n";
  echo "<form action='admin.php' method='post'>\n";
  echo "<tr><td align='center' colspan='2'><i>"._AB_SEARCHNOTE."</i></td></tr>\n";
  echo "<tr><td align='center'><b>"._AB_SEARCHFOR.":</b><br /><input type='text' name='sip' value='$sip'></td></tr>\n";
  echo "<tr><td align='center'><b>"._AB_SEARCHIN.":</b><br /><select name='op'>";
  echo "<option value='ABSearchBlocked'";
  if($op=="ABSearchBlocked") { echo " selected"; }
  echo ">"._AB_SEARCHBLOCKEDIPS."</option>\n";
  echo "<option value='ABSearchTracked'";
  if($op=="ABSearchTracked") { echo " selected"; }
  echo ">"._AB_SEARCHTRACKEDIPS."</option>\n";
  if($nuke_config['Version_Num'] >= '7.5') {
    echo "<option value='ABSearchUsers'";
    if($op=="ABSearchUsers") { echo " selected"; }
    echo ">"._AB_USERSDB."</option>\n";
  }
  echo "<option value='ABSearchBlockedRanges'";
  if($op=="ABSearchBlockedRanges") { echo " selected"; }
  echo ">"._AB_SEARCHBLOCKEDRANGES."</option>\n";
  echo "<option value='ABSearchExcludedRanges'";
  if($op=="ABSearchExcludedRanges") { echo " selected"; }
  echo ">"._AB_SEARCHEXCLUDEDRANGES."</option>\n";
  echo "<option value='ABSearchProtectedRanges'";
  if($op=="ABSearchProtectedRanges") { echo " selected"; }
  echo ">"._AB_SEARCHPROTECTEDRANGES."</option>\n";
  echo "<option value='ABSearchProtectedRanges'";
  if($op=="ABSearchProtectedRanges") { echo " selected"; }
  echo ">"._AB_SEARCHRESERVEDRANGES."</option>\n";
  if(file_exists("admin/modules/sentinel/ABSearchIP2Country.php")) {
    echo "<option value='ABSearchIP2Country'";
    if($op=="ABSearchIP2Country") { echo " selected"; }
    echo ">"._AB_IP2CSEARCH."</option>\n";
  }
  echo "</select></td></tr>\n";
  echo "<tr><td align='center'><input type='submit' value='"._AB_GO."'></td></tr>\n";
  
  echo "</form>\n";
  echo "</table>\n";
}

function ipsubmenu() {
  global $abconfig;
  echo "<table align='center' border='0' cellpadding='2' cellspacing='2' width='90%'>\n";
  echo "<tr><td align='center' valign='top' width='33%'>\n<table align='center' border='0' cellpadding='2' cellspacing='0'>\n";
  echo "<tr><td>".help_img(_AB_HELP_064)."</td><td><a href='admin.php?op=ABConfigAdmin'>"._AB_ADMINBLOCKER."</a></td></tr>\n";
  echo "<tr><td>".help_img(_AB_HELP_033)."</td><td><a href='admin.php?op=ABConfigAuthor'>"._AB_AUTHORBLOCKER."</a></td></tr>\n";
  echo "<tr><td>".help_img(_AB_HELP_034)."</td><td><a href='admin.php?op=ABConfigClike'>"._AB_CLIKEBLOCKER."</a></td></tr>\n";
  echo "<tr><td>".help_img(_AB_HELP_035)."</td><td><a href='admin.php?op=ABConfigUnion'>"._AB_UNIONBLOCKER."</a></td></tr>\n";
  echo "<tr><td>".help_img(_AB_HELP_036)."</td><td><a href='admin.php?op=ABConfigFilter'>"._AB_FILTERBLOCKER."</a></td></tr>\n";
  echo "<tr><td>".help_img(_AB_HELP_037)."</td><td><a href='admin.php?op=ABConfigHarvester'>"._AB_HARVESTBLOCKER."</a></td></tr>\n";
  echo "<tr><td>".help_img(_AB_HELP_038)."</td><td><a href='admin.php?op=ABConfigReferer'>"._AB_REFERERBLOCKER."</a></td></tr>\n";
  echo "<tr><td>".help_img(_AB_HELP_039)."</td><td><a href='admin.php?op=ABConfigScript'>"._AB_SCRIPTBLOCKER."</a></td></tr>\n";
  echo "<tr><td>".help_img(_AB_HELP_040)."</td><td><a href='admin.php?op=ABConfigRequest'>"._AB_REQUESTBLOCKER."</a></td></tr>\n";
  echo "<tr><td>".help_img(_AB_HELP_041)."</td><td><a href='admin.php?op=ABConfigString'>"._AB_STRINGBLOCKER."</a></td></tr>\n";
  echo "</table>\n</td>\n</tr>\n";
  echo "</table>\n";
}

function ipdbmenu() {
  global $admin;
  echo "<table align='center' border='0' cellpadding='2' cellspacing='2' width='90%'>\n";
  echo "<tr><td align='center' valign='top' width='33%'>\n<table align='center' border='0' cellpadding='2' cellspacing='0'>\n";
  echo "<tr><td>".help_img(_AB_HELP_059)."</td><td><a href='admin.php?op=ABDBStructure'>"._AB_DBSTRUCTURE."</a></td></tr>\n";
  echo "<tr><td>".help_img(_AB_HELP_060)."</td><td><a href='admin.php?op=ABDBOptimize'>"._AB_DBOPTIMIZE."</a></td></tr>\n";
  echo "<tr><td>".help_img(_AB_HELP_061)."</td><td><a href='admin.php?op=ABDBRepair'>"._AB_DBREPAIR."</a></td></tr>\n";
  echo "</table>\n</td>\n</tr>\n";
  echo "</table>\n";
}

function ip2cmenu() {
  global $admin;
  echo "<table align='center' border='0' cellpadding='2' cellspacing='2' width='90%'>\n";
  echo "<tr>\n<td align='center' valign='top' width='33%'>\n<table align='center' border='0' cellpadding='2' cellspacing='0'>\n";
  echo "<tr><td>".help_img(_AB_HELP_085)."</td><td><a href='admin.php?op=ABIP2CountryAdd'>"._AB_IP2CADD."</a></td></tr>\n";
  echo "<tr><td>".help_img(_AB_HELP_079)."</td><td><a href='admin.php?op=ABIP2CountryList'>"._AB_IP2CLISTING."</a></td></tr>\n";
  echo "<tr><td>".help_img(_AB_HELP_080)."</td><td><a href='admin.php?op=ABIP2CountrySearch'>"._AB_IP2CSEARCH."</a></td></tr>\n";
  echo "<tr><td>".help_img(_AB_HELP_083)."</td><td><a href='admin.php?op=ABIP2CountryUpdateBlocked'>"._AB_IP2CUPDATEBLOCKED."</a></td></tr>\n";
  echo "<tr><td>".help_img(_AB_HELP_084)."</td><td><a href='admin.php?op=ABIP2CountryUpdateTracked'>"._AB_IP2CUPDATETRACKED."</a></td></tr>\n";
  echo "<tr><td>".help_img(_AB_HELP_110)."</td><td><a href='admin.php?op=ABIP2CountryUpdateBlockedRanges'>"._AB_IP2CUPDATEBLOCKEDRANGES."</a></td></tr>\n";
  echo "<tr><td>".help_img(_AB_HELP_111)."</td><td><a href='admin.php?op=ABIP2CountryUpdateExcludedRanges'>"._AB_IP2CUPDATEEXCLUDEDRANGES."</a></td></tr>\n";
  echo "<tr><td>".help_img(_AB_HELP_112)."</td><td><a href='admin.php?op=ABIP2CountryUpdateProtectedRanges'>"._AB_IP2CUPDATEPROTECTEDRANGES."</a></td></tr>\n";
  echo "<tr><td>".help_img(_AB_HELP_113)."</td><td><a href='admin.php?op=ABIP2CountryUpdateReservedRanges'>"._AB_IP2CUPDATERESERVEDRANGES."</a></td></tr>\n";
  echo "</table>\n</td>\n</tr>\n";
  echo "</table>\n";
}

function reservedmenu() {
  global $admin;
  echo "<table align='center' border='0' cellpadding='2' cellspacing='2' width='90%'>\n";
  echo "<tr>\n<td align='center' valign='top' width='33%'>\n<table align='center' border='0' cellpadding='2' cellspacing='0'>\n";
  echo "<tr><td>".help_img(_AB_HELP_087)."</td><td><a href='admin.php?op=ABReservedAdd'>"._AB_ADDRESERVED."</a></td></tr>\n";
  echo "<tr><td>".help_img(_AB_HELP_095)."</td><td><a href='admin.php?op=ABReservedClear'>"._AB_CLEARRESERVED."</a></td></tr>\n";
  echo "<tr><td>".help_img(_AB_HELP_088)."</td><td><a href='admin.php?op=ABReservedList'>"._AB_RESERVEDLISTING."</a></td></tr>\n";
  echo "<tr><td>".help_img(_AB_HELP_092)."</td><td><a href='admin.php?op=ABPrintReserved' target='_blank'>"._AB_PRINTRESERVEDRANGES."</a></td></tr>\n";
  echo "</table>\n</td>\n</tr>\n";
  echo "</table>\n";
}

function excludedmenu() {
  global $admin;
  echo "<table align='center' border='0' cellpadding='2' cellspacing='2' width='90%'>\n";
  echo "<tr>\n<td align='center' valign='top' width='33%'>\n<table align='center' border='0' cellpadding='2' cellspacing='0'>\n";
  echo "<tr><td>".help_img(_AB_HELP_100)."</td><td><a href='admin.php?op=ABExcludedAdd'>"._AB_ADDEXCLUDED."</a></td></tr>\n";
  echo "<tr><td>".help_img(_AB_HELP_101)."</td><td><a href='admin.php?op=ABExcludedClear'>"._AB_CLEAREXCLUDED."</a></td></tr>\n";
  echo "<tr><td>".help_img(_AB_HELP_102)."</td><td><a href='admin.php?op=ABExcludedList'>"._AB_EXCLUDEDLISTING."</a></td></tr>\n";
  echo "<tr><td>".help_img(_AB_HELP_103)."</td><td><a href='admin.php?op=ABPrintExcludedList' target='_blank'>"._AB_PRINTEXCLUDEDRANGES."</a></td></tr>\n";
  echo "</table>\n</td>\n</tr>\n";
  echo "</table>\n";
}

function protectedmenu() {
  global $admin;
  echo "<table align='center' border='0' cellpadding='2' cellspacing='2' width='90%'>\n";
  echo "<tr>\n<td align='center' valign='top' width='33%'>\n<table align='center' border='0' cellpadding='2' cellspacing='0'>\n";
  echo "<tr><td>".help_img(_AB_HELP_104)."</td><td><a href='admin.php?op=ABProtectedAdd'>"._AB_ADDPROTECTED."</a></td></tr>\n";
  echo "<tr><td>".help_img(_AB_HELP_105)."</td><td><a href='admin.php?op=ABProtectedClear'>"._AB_CLEARPROTECTED."</a></td></tr>\n";
  echo "<tr><td>".help_img(_AB_HELP_106)."</td><td><a href='admin.php?op=ABProtectedList'>"._AB_PROTECTEDLISTING."</a></td></tr>\n";
  echo "<tr><td>".help_img(_AB_HELP_107)."</td><td><a href='admin.php?op=ABPrintProtectedList' target='_blank'>"._AB_PRINTPROTECTEDRANGES."</a></td></tr>\n";
  echo "</table>\n</td>\n</tr>\n";
  echo "</table>\n";
}

function blockedipmenu() {
  global $admin;
  echo "<table align='center' border='0' cellpadding='2' cellspacing='2' width='90%'>\n";
  echo "<tr>\n<td align='center' valign='top' width='33%'>\n<table align='center' border='0' cellpadding='2' cellspacing='0'>\n";
  echo "<tr><td>".help_img(_AB_HELP_027)."</td><td><a href='admin.php?op=ABBlockedIPAdd'>"._AB_ADDIP."</a></td></tr>\n";
  echo "<tr><td>".help_img(_AB_HELP_028)."</td><td><a href='admin.php?op=ABBlockedIPClear'>"._AB_CLEARIP."</a></td></tr>\n";
  echo "<tr><td>".help_img(_AB_HELP_029)."</td><td><a href='admin.php?op=ABBlockedIPClearExpired'>"._AB_CLEAREXPIRED."</a></td></tr>\n";
  echo "<tr><td>".help_img(_AB_HELP_026)."</td><td><a href='admin.php?op=ABBlockedIP'>"._AB_BLOCKEDIPS."</a></td></tr>\n";
  echo "<tr><td>".help_img(_AB_HELP_062)."</td><td><a href='admin.php?op=ABPrintBlockedIP' target='_blank'>"._AB_PRINTBLOCKEDIPS."</a></td></tr>\n";
  echo "</table>\n</td>\n</tr>\n";
  echo "</table>\n";
}

function blockedrangemenu() {
  global $admin;
  echo "<table align='center' border='0' cellpadding='2' cellspacing='2' width='90%'>\n";
  echo "<tr>\n<td align='center' valign='top' width='33%'>\n<table align='center' border='0' cellpadding='2' cellspacing='0'>\n";
  echo "<tr><td>".help_img(_AB_HELP_089)."</td><td><a href='admin.php?op=ABBlockedRangeAdd'>"._AB_ADDRANGE."</a></td></tr>\n";
  echo "<tr><td>".help_img(_AB_HELP_093)."</td><td><a href='admin.php?op=ABBlockedRangeClear'>"._AB_CLEARRANGE."</a></td></tr>\n";
  echo "<tr><td>".help_img(_AB_HELP_094)."</td><td><a href='admin.php?op=ABBlockedRangeClearExpired'>"._AB_CLEARRANGEEXPIRED."</a></td></tr>\n";
  echo "<tr><td>".help_img(_AB_HELP_090)."</td><td><a href='admin.php?op=ABBlockedRange'>"._AB_BLOCKEDRANGES."</a></td></tr>\n";
  echo "<tr><td>".help_img(_AB_HELP_091)."</td><td><a href='admin.php?op=ABPrintBlockedRange' target='_blank'>"._AB_PRINTBLOCKEDRANGES."</a></td></tr>\n";
  echo "</table>\n</td>\n</tr>\n";
  echo "</table>\n";
}

function trackedmenu() {
  global $admin;
  echo "<table align='center' border='0' cellpadding='2' cellspacing='2' width='90%'>\n";
  echo "<tr>\n<td align='center' valign='top' width='33%'>\n<table align='center' border='0' cellpadding='2' cellspacing='0'>\n";
  echo "<tr><td>".help_img(_AB_HELP_096)."</td><td><a href='admin.php?op=ABTrackedClear'>"._AB_CLEARTRACKED."</a></td></tr>\n";
  echo "<tr><td>".help_img(_AB_HELP_049)."</td><td><a href='admin.php?op=ABTracked'>"._AB_TRACKEDIPS."</a></td></tr>\n";
  echo "<tr><td>".help_img(_AB_HELP_108)."</td><td><a href='admin.php?op=ABTrackedUsers'>"._AB_TRACKEDUSERS."</a></td></tr>\n";
  echo "<tr><td>".help_img(_AB_HELP_063)."</td><td><a href='admin.php?op=ABPrintTracked' target='_blank'>"._AB_PRINTTRACKEDIPS."</a></td></tr>\n";
  echo "<tr><td>".help_img(_AB_HELP_109)."</td><td><a href='admin.php?op=ABPrintTrackedUsers' target='_blank'>"._AB_PRINTTRACKEDUSERS."</a></td></tr>\n";
  echo "</table>\n</td>\n</tr>\n";
  echo "</table>\n";
}

function ip2csearchmenu() {
  global $sip, $nuke_config;
  OpenTable();
  echo "<table align='center' border='0' cellpadding='2' cellspacing='2'>\n";
  echo "<form action='admin.php?op=ABIP2CountrySearch' method='post'>\n";
  echo "<tr><td align='center'>".help_img(_AB_HELP_082)." <b>"._AB_SEARCHFOR.":</b> <input type='text' name='sip' value='$sip'></td></tr>\n";
  echo "<tr><td align='center'><input type='submit' value='"._AB_GO."'></td></tr>\n";
  echo "</form>\n";
  echo "</table>\n";
  CloseTable();
}

function blocker_config($blocker_row) {
  global $bgcolor2, $abconfig;
  echo "<tr><td bgcolor='$bgcolor2' width='25%'>".help_img(_AB_HELP_011)." "._AB_ACTIVATE.":</td><td width='75%'><select name='xblocker_row[activate]'>\n";
  select_box($blocker_row['activate']);
  echo "</select></td></tr>\n";
  echo "<tr><td bgcolor='$bgcolor2'>".help_img(_AB_HELP_012)." "._AB_HTWRITE.":</td>\n";
  if(stristr($_SERVER['SERVER_SOFTWARE'], "Apache") AND $abconfig['htaccess_path'] > "") {
    echo "<td><select name='xblocker_row[htaccess]'>\n";
    select_box6($blocker_row['htaccess']);
    echo "</select></td>\n";
  } else {
    echo "<td><b>"._AB_NOTAVAILABLE."</b><input type='hidden' name='xblocker_row[htaccess]' value=''><td>\n";
  }
  echo "</tr>\n";
  echo "<tr><td bgcolor='$bgcolor2'>".help_img(_AB_HELP_013)." "._AB_FORWARD.":</td><td><input type='text' name='xblocker_row[forward]' size='50' value='".$blocker_row['forward']."'></td></tr>\n";
  echo "<tr><td bgcolor='$bgcolor2'>".help_img(_AB_HELP_014)." "._AB_BLOCKTYPE.":</td><td><select name='xblocker_row[block_type]'>\n";
  select_box3($blocker_row['block_type']);
  echo "</select></td></tr>\n";
  echo "<tr><td bgcolor='$bgcolor2'>".help_img(_AB_HELP_015)." "._AB_TEMPLATE.":</td><td><select name='xblocker_row[template]'>\n";
  select_box4($blocker_row['template']);
  echo "</select></td></tr>\n";
  echo "<tr><td bgcolor='$bgcolor2'>".help_img(_AB_HELP_016)." "._AB_EMAILLOOKUP.":</td>\n";
  $mailtest = @mail();
  if(!$mailtest AND !stristr($_SERVER['SERVER_SOFTWARE'], "PHP-CGI")) {
    $sel0 = $sel1 = $sel2 = "";
    if ($blocker_row['email_lookup']==1) { $sel1 = " selected"; } elseif ($blocker_row['email_lookup']==2) { $sel2 = " selected"; } else { $sel0 = " selected"; }
    echo "<td><select name='xblocker_row[email_lookup]'>\n";
    echo "<option value='0'$sel0>"._AB_OFF."</option>\n<option value='1'$sel1>Arin.net</option>\n<option value='2'$sel2>DNSStuff.com</option>\n";
    echo "</select></td>\n";
  } else {
    echo "<td><b>"._AB_NOTAVAILABLE."</b><input type='hidden' name='xblocker_row[email_lookup]' value='0'><td>\n";
  }
  echo "</tr>\n";
  echo "<tr><td bgcolor='$bgcolor2'>".help_img(_AB_HELP_017)." "._AB_REASON.":</td><td><input type='text' name='xblocker_row[reason]' size='20' maxlength='20' value='".$blocker_row['reason']."'></td></tr>\n";
  echo "<tr><td bgcolor='$bgcolor2'>".help_img(_AB_HELP_018)." "._AB_DURATION.":</td><td><select name='xblocker_row[duration]'>\n";
  select_box7($blocker_row['duration']);
  echo "</select></td></tr>\n";
}

function flag_img($c2c) {
  global $prefix, $db;
  $c2c = strtolower($c2c);
  list($xcountry) = $db->sql_fetchrow($db->sql_query("SELECT country FROM ".$prefix."_nsnst_countries WHERE c2c='$c2c'"));
  if(!file_exists("images/sentinel/countries/".$c2c.".png")) {
    return "<img src='images/sentinel/countries/00.png' border='0' height='10' width='16' alt='($c2c) $xcountry' title='($c2c) $xcountry'>";
  } else {
    return "<img src='images/sentinel/countries/".$c2c.".png' border='0' height='10' width='16' alt='($c2c) $xcountry' title='($c2c) $xcountry'>";
  }
}

function help_img($abinfo) {
  global $abconfig;
  if($abconfig['help_switch'] > 0) {
    return "<a href=\"javascript:void(0);\" onclick=\"return overlib('$abinfo', STICKY, BELOW, RIGHT, CAPTION, '"._AB_HELPSYS."', STATUS, '"._AB_HELPSYS."', WIDTH, 300, OFFSETY, 20, FGCOLOR, '#ffffff', BGCOLOR, '#000000', TEXTCOLOR, '#000000', CAPCOLOR, '#ffffff', CLOSECOLOR, '#ffffff', CAPICON, 'images/sentinel/helpicon.png', BORDER, '2');\"><img src='images/sentinel/helpicon.png' border='0' height='12' width='12'></a>";
  } else {
    return "<a href=\"javascript:void(0);\" onmouseover=\"return overlib('$abinfo', BELOW, RIGHT, CAPTION, '"._AB_HELPSYS."', STATUS, '"._AB_HELPSYS."', WIDTH, 300, OFFSETY, 20, FGCOLOR, '#ffffff', BGCOLOR, '#000000', TEXTCOLOR, '#000000', CAPCOLOR, '#ffffff', CLOSECOLOR, '#ffffff', CAPICON, 'images/sentinel/helpicon.png', BORDER, '2');\" onmouseout=\"return nd();\"><img src='images/sentinel/helpicon.png' border='0' height='12' width='12'></a>";
  }
}

function info_img($abinfo, $abside) {
  global $abconfig;
  if($abside == "l") { $abside = "LEFT"; } else { $abside = "RIGHT"; }
  if($abconfig['help_switch'] > 0) {
    return "<a href=\"javascript:void(0);\" onclick=\"return overlib('$abinfo', STICKY, BELOW, $abside, CAPTION, '"._AB_INFOSYS."', STATUS, '"._AB_INFOSYS."', WIDTH, 300, OFFSETY, 20, FGCOLOR, '#ffffff', BGCOLOR, '#000000', TEXTCOLOR, '#000000', CAPCOLOR, '#ffffff', CLOSECOLOR, '#ffffff', CAPICON, 'images/sentinel/infoicon.png', BORDER, '2');\"><img src='images/sentinel/infoicon.png' border='0' height='12' width='12'></a>";
  } else {
    return "<a href=\"javascript:void(0);\" onmouseover=\"return overlib('$abinfo', BELOW, $abside, CAPTION, '"._AB_INFOSYS."', STATUS, '"._AB_INFOSYS."', WIDTH, 300, OFFSETY, 20, FGCOLOR, '#ffffff', BGCOLOR, '#000000', TEXTCOLOR, '#000000', CAPCOLOR, '#ffffff', CLOSECOLOR, '#ffffff', CAPICON, 'images/sentinel/infoicon.png', BORDER, '2');\" onmouseout=\"return nd();\"><img src='images/sentinel/infoicon.png' border='0' height='12' width='12'></a>";
  }
}

function select_box($abfield) {
  $sel1 = $sel2 = $sel3 = $sel4 = $sel5 = $sel6 = "";
  if ($abfield==1) { $sel2 = " selected"; } elseif ($abfield==2) { $sel3 = " selected"; } elseif ($abfield==3) { $sel4 = " selected"; } elseif ($abfield==4) { $sel5 = " selected"; } elseif ($abfield==5) { $sel6 = " selected"; } elseif ($abfield==6) { $sel7 = " selected"; } elseif ($abfield==7) { $sel8 = " selected"; } else { $sel1 = " selected"; }
  echo "<option value='0'$sel1>"._AB_OFF."</option>\n<option value='1'$sel2>"._AB_EMAILONLY."</option>\n";
  echo "<option value='6'$sel7>"._AB_FORWARDONLY."</option>\n<option value='7'$sel8>"._AB_TEMPLATEONLY."</option>\n";
  echo "<option value='2'$sel3>"._AB_EMAILFORWARD."</option>\n<option value='3'$sel4>"._AB_EMAILTEMPLATE."</option>\n";
  echo "<option value='4'$sel5>"._AB_EMAILBLOCKFORWARD."</option>\n<option value='5'$sel6>"._AB_EMAILBLOCKTEMPLATE."</option>\n";
}

function select_box2($abfield) {
  $sel1 = $sel2 = $sel3 = $sel4 = "";
  if ($abfield==1) { $sel2 = " selected"; } elseif ($abfield==2) { $sel3 = " selected"; } elseif ($abfield==3) { $sel4 = " selected"; } else { $sel1 = " selected"; }
  echo "<option value='0'$sel1>"._AB_NONE."</option>\n<option value='1'$sel2>"._AB_ADMINS."</option>\n";
  echo "<option value='2'$sel3>"._AB_USERS."</option>\n<option value='3'$sel4>"._AB_VISITORS."</option>\n";
}

function select_box3($abfield=0) {
  $sel1 = $sel2 = $sel3 = $sel4 = "";
  if ($abfield==0) { $sel1 = " selected"; } elseif ($abfield==1) { $sel2 = " selected"; } elseif ($abfield==2) { $sel3 = " selected"; } else { $sel4 = " selected"; }
  echo "<option value='0'$sel1>"._AB_0OCTECT."</option>\n<option value='1'$sel2>"._AB_1OCTECT."</option>\n";
  echo "<option value='2'$sel3>"._AB_2OCTECT."</option>\n<option value='3'$sel4>"._AB_3OCTECT."</option>\n";
}

function select_box4($abfield="") {
  $templatedir = dir("abuse");
  while($func=$templatedir->read()) {
    if(substr($func, 0, 6) == "abuse_") {
      $templatelist .= "$func ";
    }
  }
  closedir($templatedir->handle);
  $templatelist = explode(" ", $templatelist);
  sort($templatelist);
  for ($i=0; $i < sizeof($templatelist); $i++) {
    if($templatelist[$i]!="") {
      $bl = ereg_replace("abuse_","",$templatelist[$i]);
      $bl = ereg_replace(".tpl","",$bl);
      $bl = ereg_replace("_"," ",$bl);
      echo "<option ";
      if ($templatelist[$i]==$abfield) { echo "selected "; }
      echo "value='$templatelist[$i]'>".ucfirst($bl)."</option>\n";
    }
  }
}

function select_box5($abfield=0) {
  $sel1 = $sel2 = "";
  if ($abfield==0) { $sel1 = " selected"; } else { $sel2 = " selected"; }
  echo "<option value='0'$sel1>"._AB_OFF."</option>\n<option value='1'$sel2>"._AB_ON."</option>\n";
}

function select_box6($abfield=0) {
  $sel1 = $sel2 = "";
  if ($abfield==0) { $sel1 = " selected"; } else { $sel2 = " selected"; }
  echo "<option value='0'$sel1>"._AB_NO."</option>\n<option value='1'$sel2>"._AB_YES."</option>\n";
}

function select_box7($abfield=0) {
  echo "<option value='0'";
  if ($abfield==0) { echo " selected"; }
  echo ">"._AB_PERMENANT."</option>\n";
  $i=1;
  while ($i<=365) {
    echo "<option value='$i'";
    if ($abfield==$i) { echo " selected"; }
    $expiredate = date("Y-m-d", time() + ($i * 86400));
    echo ">$i ($expiredate)</option>\n";
    $i++;
  }
}

function select_box8($abfield=0) {
  global $db, $prefix;
  $result = $db->sql_query("SELECT * FROM ".$prefix."_nsnst_blockers ORDER BY block_name");
  while ($blockerrow = $db->sql_fetchrow($result)) {
    echo "<option value='".$blockerrow['blocker']."'";
    if($abfield==$blockerrow['blocker']) { echo " selected"; }
    echo ">".$blockerrow['reason']."</option>\n";
  }
}

function select_box9($abfield="") {
  $templatedir = dir("abuse");
  while($func=$templatedir->read()) {
    if(substr($func, 0, 6) == "admin_") {
      $templatelist .= "$func ";
    }
  }
  closedir($templatedir->handle);
  $templatelist = explode(" ", $templatelist);
  sort($templatelist);
  for ($i=0; $i < sizeof($templatelist); $i++) {
    if($templatelist[$i]!="") {
      $bl = ereg_replace("admin_","",$templatelist[$i]);
      $bl = ereg_replace(".tpl","",$bl);
      $bl = ereg_replace("_"," ",$bl);
      echo "<option ";
      if ($templatelist[$i]==$abfield) { echo "selected "; }
      echo "value='$templatelist[$i]'>".ucfirst($bl)."</option>\n";
    }
  }
}

function OpenMenu() {
  global $bgcolor1, $bgcolor2, $textcolor1, $abconfig, $getAdmin, $prefix, $db, $op, $admin;
  echo "<table width='100%' border='0' cellspacing='1' cellpadding='4' bgcolor='$bgcolor2'>\n";
  echo "<tr bgcolor='$bgcolor1'>\n<td align='center' colspan='2'><a href='http://www.nukescripts.net' target='new'><span class='title'><b>"._AB_NUKESENTINEL." ".$abconfig['version_number']."</b></span></a></td>\n</tr>\n";
  echo "<tr bgcolor='$bgcolor1'><td valign='top' width='66%'>\n";
}

function CarryMenu() {
  echo "</td><td valign='top' width='34%'>\n";
}

function CloseMenu() {
  echo "</td></tr></table>\n";
}

?>