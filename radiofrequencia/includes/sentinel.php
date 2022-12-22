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
define("SENTINEL_IS_LOADED", TRUE);

if (stristr($_SERVER['PHP_SELF'], "sentinel.php") OR stristr($_SERVER['SCRIPT_NAME'], "sentinel.php")) {
  Header("Location: ../index.php");
  die();
}
// Load required scripts
if (defined('FORUM_ADMIN')) {
  require_once("../../../config.php");
  require_once("../../../db/db.php");
  $lang_dir = "../../../";
} elseif ($inside_mod == 1) {
  require_once("../../config.php");
  require_once("../../db/db.php");
  $lang_dir = "../../";
} else {
  require_once("config.php");
  require_once("db/db.php");
  $lang_dir = "";
}

// Load required configs
$nuke_config = $db->sql_fetchrow($db->sql_query("SELECT * FROM ".$prefix."_config"));
$ab_config = abget_configs();

// Load required lang file
if(!isset($lang)) { $lang = $nuke_config['language']; }
if (!stristr("$lang", ".") AND file_exists($lang_dir."language/sentinel/lang-$lang.php")) {
  require_once($lang_dir."language/sentinel/lang-$lang.php");
} else {
  require_once($lang_dir."language/sentinel/lang-english.php");
}

// DOS Attack Blocker
if($ab_config['prevent_dos'] == 1 AND !stristr($_SERVER['SCRIPT_NAME'], "backend.php") AND !stristr($nuke_config['nukeurl'], $_SERVER['SERVER_NAME'])) {
  if ($_SERVER['HTTP_USER_AGENT'] == "" || $_SERVER['HTTP_USER_AGENT'] == "-" || !isset($_SERVER['HTTP_USER_AGENT'])) {
    die(_AB_GETOUT);
  }
}

// Site Switch Check
if($ab_config['site_switch'] == 1 AND !stristr($_SERVER['PHP_SELF'], "admin.php") AND !stristr($_SERVER['SCRIPT_NAME'], "admin.php") AND !is_admin($admin)) {
  $display_page = abget_template($ab_config['site_reason']);
  $display_page .= "<hr noshade>\n<div align='right'>"._AB_NUKESENTINEL." ".$ab_config['version_number']." "._AB_BYNSN."</div>\n";
  die($display_page);
}

// Clearing of expired blocks
// CAUTION: This function can slow your sites load time
if($ab_config['self_expire'] == 1) {
  $expiretime = time();
  $clearresult = $db->sql_query("SELECT * FROM ".$prefix."_nsnst_blocked_ips WHERE (expires<'$expiretime' AND expires!='0')");
  while($clearblock = $db->sql_fetchrow($clearresult)) {
    $db->sql_query("DELETE FROM ".$prefix."_nsnst_blocked_ips WHERE ip_addr='".$clearblock['ip_addr']."'");
    $db->sql_query("OPTIMIZE TABLE ".$prefix."_nsnst_blocked_ips");
    if($ab_config['htaccess_path'] != "") {
      $ipfile = file($ab_config['htaccess_path']);
      $ipfile = implode("", $ipfile);
      $i = 1;
      while ($i <= 3) {
        $tip = substr($clearblock['ip_addr'], -2);
        if ($tip == ".*") { $clearblock['ip_addr'] = substr($clearblock['ip_addr'], 0, -2); }
        $i++;
      }
      $testip = "deny from ".$clearblock['ip_addr']."\n";
      $ipfile = str_replace($testip, "", $ipfile);
      $doit = fopen($ab_config['htaccess_path'], "w");
      fwrite($doit, $ipfile);
      fclose($doit);
    }
  }
}

// Basic Value Setup
if($aid AND (!isset($admin) OR empty($admin)) AND $op!='login') {
  unset($aid);
  unset($admin);
}
$remote = get_ip();
//if($remote=="none") { die("Invalid IP used"); }
$temprm = get_request_method();
if(strtolower($temprm)!="get" AND strtolower($temprm)!="head" AND strtolower($temprm)!="post" AND strtolower($temprm)!="put") { die("Invalid Method used"); }
$bantime = time();
$querystring = get_query_string();
$querystringBase64 = base64_decode($querystring);
$ip = explode(".", $remote);
if(is_array($user)) {
  $user = implode(":", $user);
  $user = base64_encode($user);
}
$uinfo = getusrinfo($user);
if ($uinfo['user_id']>1) {
  $banuser = $uinfo['user_id'];
  $banname = $uinfo['username'];
} else {
  $banuser = 1;
  $banname = $nuke_config['anonymous'];
}

// Proxy Blocker
if($ab_config['proxy_switch'] == 1) {
  $proxy0 = $remote;
  $proxy1 = get_client_ip();
  $proxy2 = get_x_forwarded();
  $proxy_host = @getHostByAddr($proxy0);
  //Lite:
  if($ab_config['proxy_switch'] == 1 AND ($proxy1 != "none" OR $proxy2 != "none")) {
    $display_page = abget_template($ab_config['proxy_reason']);
    $display_page .= "<hr noshade>\n<div align='right'>"._AB_NUKESENTINEL." ".$ab_config['version_number']." "._AB_BYNSN."</div>\n";
    die($display_page);
  }
  //Mild:
  if($ab_config['proxy_switch'] == 2 AND ($proxy1 != "none" OR $proxy2 != "none" OR stristr($proxy_host,"proxy"))) {
    $display_page = abget_template($ab_config['proxy_reason']);
    $display_page .= "<hr noshade>\n<div align='right'>"._AB_NUKESENTINEL." ".$ab_config['version_number']." "._AB_BYNSN."</div>\n";
    die($display_page);
  }
  //Strong:
  if($ab_config['proxy_switch'] == 3 AND ($proxy1 != "none" OR $proxy2 != "none" OR stristr($proxy_host,"proxy") OR $proxy0 == $proxy_host)) {
    $display_page = abget_template($ab_config['proxy_reason']);
    $display_page .= "<hr noshade>\n<div align='right'>"._AB_NUKESENTINEL." ".$ab_config['version_number']." "._AB_BYNSN."</div>\n";
    die($display_page);
  }
}

// Check if ip is blocked
$blocked_row = abget_blocked($ip);
if ($blocked_row) { blocked($blocked_row); }

// Check if range is blocked
$blockedrange_row = abget_blockedrange($remote);
if ($blockedrange_row) { blockedrange($blockedrange_row); }

$result = $db->sql_query("SELECT * FROM ".$prefix."_nsnst_blockers");
$num_rows = $db->sql_numrows($result);
for ($i = 0; $i < $num_rows; $i++) {
$array[$i] = mysql_fetch_array($result);
}
$arrayother = $array[0];
$arrayunion = $array[1];
$arrayclike = $array[2];
$arrayharvester = $array[3];
$arrayscript   = $array[4];
$arrayauthor   = $array[5];
$arrayreferer = $array[6];
$arrayfilter   = $array[7];
$arrayrequest = $array[8];
$arraystring   = $array[9];
$arrayadmin = $array[10];

// AUTHOR Protection
$blocker_row = $arrayauthor;
if($blocker_row['activate'] > 0) {
  if(($op=="mod_authors" OR $op=="modifyadmin" OR $op=="UpdateAuthor" OR $op=="AddAuthor" OR $op=="deladmin2" OR $op=="deladmin" OR $op=="assignstories" OR $op=="deladminconf") AND !is_god($admin)) {
    block_ip($ip, $banuser, $bantime, $blocker_row);
  }
}

// ADMIN protection
$blocker_row = $arrayadmin;
if($blocker_row['activate'] > 0) {
  if(stristr($_SERVER['PHP_SELF'],"admin.php") AND ($op!="login" AND $op!="adminMain" AND $op!="gfx" AND isset($op)) AND !is_admin($admin)) {
    block_ip($ip, $banuser, $bantime, $blocker_row);
  }
}

// Check for UNION attack
// Copyright 2004(c) Raven PHP Scripts
$blocker_row = $arrayunion;
if($blocker_row['activate'] > 0) {
  if (stristr($querystring,'%20union%20') OR stristr($querystring,'*/union/*') OR stristr($querystring,' union ') OR stristr($querystringBase64,'%20union%20') OR stristr($querystringBase64,'*/union/*') OR stristr($querystringBase64,' union ')) {
    block_ip($ip, $banuser, $bantime, $blocker_row);
  }
}

// Check for CLIKE attack
// Copyright 2004(c) Raven PHP Scripts
$blocker_row = $arrayclike;
if($blocker_row['activate'] > 0) {
  if (stristr($querystring,'/*') OR stristr($querystringBase64,'/*')) {
    block_ip($ip, $banuser, $bantime, $blocker_row);
  }
}

// Check Filters
$blocker_row = $arrayfilter;
if($blocker_row['activate'] > 0) {
  // Check for Forum attack
  // Copyright 2004(c) GanjaUK & ChatServ
  if (!stristr($querystring,'&file=nickpage') AND stristr($querystring,'&user=') AND ($name==Private_Messages || $name==Forums || $name==Members_List)) {
    block_ip($ip, $banuser, $bantime, $blocker_row);
  }
  // Check for News attack
  // Copyright 2004(c) ChatServ
  if (stristr($querystring,'%25') AND ($name==News || $name==Reviews)) {
    block_ip($ip, $banuser, $bantime, $blocker_row);
  }
  // Check for XSS attack
  if (eregi("http\:\/\/", $name) OR (stristr($querystring, "cmd") AND !stristr($querystring, "&cmd")) OR (stristr($querystring, "exec") AND !stristr($querystring, "execu")) OR stristr($querystring,"concat")) {
    block_ip($ip, $banuser, $bantime, $blocker_row);
  }
}

// Check for SCRIPTING attack
// Copyright 2004(c) ChatServ
$blocker_row = $arrayscript;
if($blocker_row['activate'] > 0) {

  foreach ($_GET as $secvalue) {
    $secvalue = strtolower($secvalue);
    str_replace("%3c", "<", $secvalue);
    str_replace("%3e", ">", $secvalue);
    if ((eregi("<[^>]script*\"?[^>]*>", $secvalue)) || (eregi("<[^>]*object*\"?[^>]*>", $secvalue)) || (eregi("<[^>]*iframe*\"?[^>]*>", $secvalue)) || (eregi("<[^>]*applet*\"?[^>]*>", $secvalue)) || (eregi("<[^>]*meta*\"?[^>]*>", $secvalue)) || (eregi("<[^>]style*\"?[^>]*>", $secvalue)) || (eregi("<[^>]*form*\"?[^>]*>", $secvalue)) || (eregi("\([^>]*\"?[^)]*\)", $secvalue))) {
      block_ip($ip, $banuser, $bantime, $blocker_row);
    }
  }
  foreach ($_POST as $secvalue) {
    $secvalue = strtolower($secvalue);
    str_replace("%3c", "<", $secvalue);
    str_replace("%3e", ">", $secvalue);
    if ((eregi("<[^>]script*\"?[^>]*>", $secvalue)) || (eregi("<[^>]style*\"?[^>]*>", $secvalue))) {
      block_ip($ip, $banuser, $bantime, $blocker_row);
    }
  }
}

// Check for Referer
$blocker_row = $arrayreferer;
if($blocker_row['activate'] > 0) {
  if($RefererList > "") {
    $RefererList = explode("\r\n",$blocker_row['list']);
    $streferer = get_referer();
    for ($i=0; $i < count($RefererList); $i++) {
      $refered = $RefererList[$i];
      if (stristr($streferer, "$refered") AND $refered != "") {
        $abmatch = $refered;
        block_ip($ip, $banuser, $bantime, $blocker_row, $abmatch);
      }
    }
  }
}

// Check for Harvester
$blocker_row = $arrayharvester;
if($blocker_row['activate'] > 0) {
  if($HarvestList > "") {
    $HarvestList = explode("\r\n",$blocker_row['list']);
    $agent = get_user_agent();
    for ($i=0; $i < count($HarvestList); $i++) {
      $harvest = $HarvestList[$i];
      if (stristr($agent, "$harvest") AND $harvest != "") {
        $abmatch = $harvest;
        block_ip($ip, $banuser, $bantime, $blocker_row, $abmatch);
      }
    }
  }
}

// Check for Strings
$blocker_row = $arraystring;
if($blocker_row['activate'] > 0) {
  if($StringList > "") {
    $StringList = explode("\r\n",$blocker_row['list']);
    for ($i=0; $i < count($StringList); $i++) {
      $stringl = $StringList[$i];
      if (stristr($querystring, "$stringl") AND $stringl != "") {
        $abmatch = $stringl;
        block_ip($ip, $banuser, $bantime, $blocker_row, $abmatch);
      }
    }
  }
}

// Check for Request
$blocker_row = $arrayrequest;
if($blocker_row['activate'] > 0) {
  if($RequestList > "") {
    $RequestList = explode("\r\n",$blocker_row['list']);
    $method = get_request_method();
    for ($i=0; $i < count($RequestList); $i++) {
      $request = $RequestList[$i];
      if (stristr($method, "$request") AND $request != "") {
        $abmatch = $request;
        block_ip($ip, $banuser, $bantime, $blocker_row, $abmatch);
      }
    }
  }
}

// Force to NUKEURL
if($ab_config['force_nukeurl'] == 1 AND !stristr($_SERVER['SCRIPT_NAME'], "backend.php")) {
  $servtemp1 = strtolower(str_replace("http://", "", $nuke_config['nukeurl']));
  if(substr($servtemp1, -1) == "/") { $servtemp1 = substr($servtemp1, 0, strlen($servtemp1)-1); }
  $servrqst1 = strtolower($_SERVER['HTTP_HOST']);
  //$servrqst1 = str_replace("/".basename($servrqst1), "", $servrqst1);
  //if(substr($servrqst1, -1) == "/") { $servrqst1 = substr($servrqst1, 0, strlen($servrqst1)-1); }
  if ($servrqst1 != $servtemp1 AND (!stristr($_SERVER['REQUEST_URI'], "modules/Forums/admin/") AND !stristr($_SERVER['REQUEST_URI'], "abuse/"))) {
    $rphp1 = $_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
    $rphp2 = str_replace($servrqst1, $servtemp1, $rphp1);
    $rphp2 = "http://".$rphp2;
    Header("Location: $rphp2");
  }
}

// IP Tracking
// CAUTION: This function can slow your sites load time
if($ab_config['track_active'] == 1 AND !is_excluded($ip)) {
  $hostnm = @gethostbyaddr("$remote");
  $pg = get_script_name();
  $qs = get_query_string();
  $gua = get_user_agent();
  $gxf = get_x_forwarded();
  $gci = get_client_ip();
  $gra = get_remote_addr();
  $grp = get_remote_port();
  $grm = get_request_method();
  if($qs != "") { $pg = $pg . "?" . $qs ; }
  if(!stristr($pg, "op=gfx") AND !stristr($pg, "gfx=gfx") AND !stristr($pg, "backend.php") AND !stristr($pg, "backend2.php") AND !stristr($pg, "clicks.php") AND $pg != '/modules.php' AND !stristr($pg, "name=ErrorDocs")) {
  //if(!stristr($pg, "op=gfx") AND !stristr($pg, "gfx=gfx")) {
    //$checkrow = $db->sql_fetchrow($db->sql_query("CHECK TABLE ".$prefix."_nsnst_ip2country"));
    $checkrow = $db->sql_fetchrow($db->sql_query("SHOW TABLES LIKE '".$prefix."_nsnst_ip2country%'"));
    if($checkrow['Msg_type']!="error") {
      $remote_long = sprintf("%u", ip2long($remote));
      list($c2c) = $db->sql_fetchrow($db->sql_query("SELECT c2c FROM ".$prefix."_nsnst_ip2country WHERE ip_lo<='$remote_long' AND ip_hi>='$remote_long'"));
    }
    if(!$c2c) { $c2c = "00"; }
    if($banuser==1) { $inname = ""; } else { $inname = $banname; }
    $db->sql_query("INSERT INTO ".$prefix."_nsnst_tracked_ips (user_id, username, date, ip_addr, hostname, page, user_agent, x_forward_for, client_ip, remote_addr, remote_port, request_method, c2c) VALUES ('$banuser', '$inname', '$bantime', '$remote', '$hostnm', '$pg', '$gua', '$gxf', '$gci', '$gra', '$grp', '$grm', '$c2c')");
    if($ab_config['track_max'] > 0 and $ab_config['track_del'] > 0) {
      if($ab_config['track_max'] <= $ab_config['track_del']) { $ab_config['track_del'] = round($ab_config['track_max']/10); }
      $tresult = $db->sql_query("SELECT COUNT(*) FROM ".$prefix."_nsnst_tracked_ips");
      list($numrows) = $db->sql_fetchrow($tresult);
      if($numrows >= $ab_config['track_max']) {
        $db->sql_query("DELETE FROM ".$prefix."_nsnst_tracked_ips ORDER BY date LIMIT ".$ab_config['track_del']); 
        $db->sql_query("OPTIMIZE TABLE ".$prefix."_nsnst_tracked_ips"); 
      }
    }
  }
}

function get_remote_port() {
  if (isset($_SERVER["REMOTE_PORT"])) {
    return $_SERVER["REMOTE_PORT"];
  } elseif (isset($HTTP_SERVER_VARS["REMOTE_PORT"])) {
    return $HTTP_SERVER_VARS["REMOTE_PORT"];
  } elseif (getenv("REMOTE_PORT")) {
    return getenv("REMOTE_PORT");
  } else {
    return "none";
  }
}

function get_request_method() {
  if (isset($_SERVER["REQUEST_METHOD"])) {
    return $_SERVER["REQUEST_METHOD"];
  } elseif (isset($HTTP_SERVER_VARS["REQUEST_METHOD"])) {
    return $HTTP_SERVER_VARS["REQUEST_METHOD"];
  } elseif (getenv("REQUEST_METHOD")) {
    return getenv("REQUEST_METHOD");
  } else {
    return "none";
  }
}

function get_script_name() {
  if (isset($_SERVER["SCRIPT_NAME"])) {
    return $_SERVER["SCRIPT_NAME"];
  } elseif (isset($HTTP_SERVER_VARS["SCRIPT_NAME"])) {
    return $HTTP_SERVER_VARS["SCRIPT_NAME"];
  } elseif (getenv("SCRIPT_NAME")) {
    return getenv("SCRIPT_NAME");
  } else {
    return "none";
  }
}

function get_http_host() {
  if (isset($_SERVER["HTTP_HOST"])) {
    return $_SERVER["HTTP_HOST"];
  } elseif (isset($HTTP_SERVER_VARS["HTTP_HOST"])) {
    return $HTTP_SERVER_VARS["HTTP_HOST"];
  } elseif (getenv("HTTP_HOST")) {
    return getenv("HTTP_HOST");
  } else {
    return "none";
  }
}

function get_query_string() {
  if (isset($_SERVER["QUERY_STRING"])) {
    return str_replace("%09", "%20", $_SERVER["QUERY_STRING"]);
  } elseif (isset($HTTP_SERVER_VARS["QUERY_STRING"])) {
    return str_replace("%09", "%20", $HTTP_SERVER_VARS["QUERY_STRING"]);
  } elseif (getenv("QUERY_STRING")) {
    return str_replace("%09", "%20", getenv("QUERY_STRING"));
  } else {
    return "none";
  }
}

function get_user_agent() {
  if (isset($_SERVER["HTTP_USER_AGENT"])) {
    return $_SERVER["HTTP_USER_AGENT"];
  } elseif (isset($HTTP_SERVER_VARS["HTTP_USER_AGENT"])) {
    return $HTTP_SERVER_VARS["HTTP_USER_AGENT"];
  } elseif (getenv("HTTP_USER_AGENT")) {
    return getenv("HTTP_USER_AGENT");
  } else {
    return "none";
  }
}

function get_referer() {
  if (isset($_SERVER["HTTP_REFERER"])) {
    return $_SERVER["HTTP_REFERER"];
  } elseif (isset($HTTP_SERVER_VARS["HTTP_REFERER"])) {
    return $HTTP_SERVER_VARS["HTTP_REFERER"];
  } elseif (getenv("HTTP_REFERER")) {
    return getenv("HTTP_REFERER");
  } else {
    return "none";
  }
}

function in_range($rangeip) {
  global $db, $prefix;
  $rangelong = sprintf("%u", ip2long($rangeip));
  $rangenum = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_nsnst_reserved_ranges WHERE ip_lo<='$rangelong' AND ip_hi>='$rangelong'"));
  if($rangenum > 0) { return 1; } else { return 0; }
  return 0;
}

function get_ip() {
  $client_ip = get_client_ip(); // HTTP_CLIENT_IP
  if (strpos($client_ip, ', ') AND isset($client_ip)) {
    $client_ips = explode(', ', $client_ip);
    if($client_ips[0] != 'unknown' AND $client_ips[0] != 'none' AND $client_ips[0] != '' AND !in_range($client_ips[0])) {
      $client_ip = $client_ips[0];
    } else {
      $client_ip = $client_ips[1];
    }
  }
  $x_forwarded = get_x_forwarded(); // HTTP_X_FORWARDED_FOR
  if (strpos($x_forwarded, ', ') AND isset($x_forwarded)) {
    $x_forwardeds = explode(', ', $x_forwarded);
    if($x_forwardeds[0] != 'unknown' AND $x_forwardeds[0] != 'none' AND $x_forwardeds[0] != '' AND !in_range($x_forwardeds[0])) {
      $x_forwarded = $x_forwardeds[0];
    } else {
      $x_forwarded = $x_forwardeds[1];
    }
  }
  $remote_addr = get_remote_addr(); // REMOTE_ADDR
  if (strpos($remote_addr, ', ') AND isset($remote_addr)) {
    $remote_addrs = explode(', ', $remote_addr);
    if($remote_addrs[0] != 'unknown' AND $remote_addrs[0] != 'none' AND $remote_addrs[0] != '' AND !in_range($remote_addrs[0])) {
      $remote_addr = $remote_addrs[0];
    } else {
      $remote_addr = $remote_addrs[1];
    }
  }
  if (isset($client_ip) && !stristr($client_ip, "none") && !stristr($client_ip, "unknown") AND !in_range($client_ip)) {
    return $client_ip;
  } elseif (isset($x_forwarded) && !stristr($x_forwarded, "none") && !stristr($x_forwarded, "unknown") AND !in_range($x_forwarded)) {
    return $x_forwarded;
  } elseif (isset($remote_addr) && !stristr($remote_addr, "none") && !stristr($remote_addr, "unknown") AND !in_range($remote_addr)) {
    return $remote_addr;
  } else {
    return "none";
  }
}

function get_client_ip () {
  if(isset($_SERVER["HTTP_CLIENT_IP"])) {
    return $_SERVER["HTTP_CLIENT_IP"];
  } elseif (isset($HTTP_SERVER_VARS["HTTP_CLIENT_IP"])) {
    return $HTTP_SERVER_VARS["HTTP_CLIENT_IP"];
  } elseif (getenv("HTTP_CLIENT_IP")) {
    return getenv("HTTP_CLIENT_IP");
  } else {
    return "none";
  }
}

function get_x_forwarded () {
  if(isset($_SERVER["HTTP_X_FORWARDED_FOR"])) {
    return $_SERVER["HTTP_X_FORWARDED_FOR"];
  } elseif (isset($HTTP_SERVER_VARS["HTTP_X_FORWARDED_FOR"])) {
    return $HTTP_SERVER_VARS["HTTP_X_FORWARDED_FOR"];
  } elseif (getenv("HTTP_X_FORWARDED_FOR")) {
    return getenv("HTTP_X_FORWARDED_FOR");
  } else {
    return "none";
  }
}

function get_remote_addr () {
  if(isset($_SERVER["REMOTE_ADDR"])) {
    return $_SERVER["REMOTE_ADDR"];
  } elseif (isset($HTTP_SERVER_VARS["REMOTE_ADDR"])) {
    return $HTTP_SERVER_VARS["REMOTE_ADDR"];
  } elseif (getenv("REMOTE_ADDR")) {
    return getenv("REMOTE_ADDR");
  } else {
    return "none";
  }
}

function clear_session(){
  global $prefix, $db;
  // Clear nuke_session location
  $x_forwarded = get_x_forwarded();
  $client_ip = get_client_ip();
  $remote_addr = get_remote_addr();
  $db->sql_query("DELETE FROM ".$prefix."_session WHERE host_addr='$x_forwarded' OR host_addr='$client_ip' OR host_addr='$remote_addr'");
  // Clear nuke_bbsessions location
  $x_f = explode(".", $x_forwarded);
  $x_forwarded = str_pad(dechex($x_f[0]), 2, "0", STR_PAD_LEFT).str_pad(dechex($x_f[1]), 2, "0", STR_PAD_LEFT).str_pad(dechex($x_f[2]), 2, "0", STR_PAD_LEFT).str_pad(dechex($x_f[3]), 2, "0", STR_PAD_LEFT);
  $c_p = explode(".", $client_ip);
  $client_ip = str_pad(dechex($c_p[0]), 2, "0", STR_PAD_LEFT).str_pad(dechex($c_p[1]), 2, "0", STR_PAD_LEFT).str_pad(dechex($c_p[2]), 2, "0", STR_PAD_LEFT).str_pad(dechex($c_p[3]), 2, "0", STR_PAD_LEFT);
  $r_a = explode(".", $remote_addr);
  $remote_addr = str_pad(dechex($r_a[0]), 2, "0", STR_PAD_LEFT).str_pad(dechex($r_a[1]), 2, "0", STR_PAD_LEFT).str_pad(dechex($r_a[2]), 2, "0", STR_PAD_LEFT).str_pad(dechex($r_a[3]), 2, "0", STR_PAD_LEFT);
  $db->sql_query("DELETE FROM ".$prefix."_bbsessions WHERE session_ip='$x_forwarded' OR session_ip='$client_ip' OR session_ip='$remote_addr'");
}

function is_excluded($ip){
  global $prefix, $db;
  $testip = implode(".", $ip);
  $longip = sprintf("%u", ip2long($testip));
  $excludenum = $db->sql_fetchrow($db->sql_query("SELECT * FROM ".$prefix."_nsnst_excluded_ranges WHERE ip_lo<='$longip' AND ip_hi>='$longip'"));
  if($excludenum > 0) { return 1; } else { return 0; }
  return 0;
}

function is_protected($ip){
  global $prefix, $db;
  $testip = implode(".", $ip);
  $longip = sprintf("%u", ip2long($testip));
  $protectnum = $db->sql_fetchrow($db->sql_query("SELECT * FROM ".$prefix."_nsnst_protected_ranges WHERE ip_lo<='$longip' AND ip_hi>='$longip'"));
  if($protectnum > 0) { return 1; } else { return 0; }
  return 0;
}

function abget_blocked($ip){
  global $prefix, $db;
  $testip1 = "$ip[0].*.*.*";
  $testip2 = "$ip[0].$ip[1].*.*";
  $testip3 = "$ip[0].$ip[1].$ip[2].*";
  $testip4 = "$ip[0].$ip[1].$ip[2].$ip[3]";
  $blocked_result = $db->sql_query("SELECT * FROM ".$prefix."_nsnst_blocked_ips WHERE ip_addr = '$testip1' OR ip_addr = '$testip2' OR ip_addr = '$testip3' OR ip_addr = '$testip4'");
  $blocked_row = $db->sql_fetchrow($blocked_result);
  return $blocked_row;
}

function abget_blockedrange($ip){
  global $prefix, $db;
  $longip = sprintf("%u", ip2long($ip));
  $blockedrange_result = $db->sql_query("SELECT * FROM ".$prefix."_nsnst_blocked_ranges WHERE ip_lo<='$longip' AND ip_hi>='$longip'");
  $blockedrange_row = $db->sql_fetchrow($blockedrange_result);
  return $blockedrange_row;
}

function abget_blocker($blocker_name){
  global $prefix, $db;
  $blockerresult = $db->sql_query("SELECT * FROM ".$prefix."_nsnst_blockers WHERE block_name='$blocker_name'");
  $blocker_row = $db->sql_fetchrow($blockerresult);
  return $blocker_row;
}

function abget_blockerrow($reason){
  global $prefix, $db;
  $blockerresult = $db->sql_query("SELECT * FROM ".$prefix."_nsnst_blockers WHERE blocker='$reason'");
  $blocker_row = $db->sql_fetchrow($blockerresult);
  return $blocker_row;
}

function abget_admin($author){
  global $prefix, $db;
  $adminresult = $db->sql_query("SELECT * FROM ".$prefix."_nsnst_admins WHERE aid='$author'");
  $admin_row = $db->sql_fetchrow($adminresult);
  return $admin_row;
}

function abget_config($config_name){
  global $prefix, $db;
  $configresult = $db->sql_query("SELECT config_value FROM ".$prefix."_nsnst_config WHERE config_name='$config_name'");
  list($config_value) = $db->sql_fetchrow($configresult);
  return $config_value;
}

function abget_configs(){
  global $prefix, $db;
  $configresult = $db->sql_query("SELECT config_name, config_value FROM ".$prefix."_nsnst_config");
  while (list($config_name, $config_value) = $db->sql_fetchrow($configresult)) {
    $config[$config_name] = $config_value;
  }
  return $config;
}

function abget_reason($reason_id){
  global $prefix, $db;
  $reasonresult = $db->sql_query("SELECT reason FROM ".$prefix."_nsnst_blockers WHERE blocker='$reason_id'");
  list($title_long) = $db->sql_fetchrow($reasonresult);
  $reason_value = $title_long;
  return $reason_value;
}

function write_ban($banip, $htip, $banuser, $bantime, $blocker_row) {
  global $ab_config, $nuke_config, $db, $prefix, $user_prefix, $admin, $remote;
  if(isset($admin) && $admin != "") {
    $abadmin = base64_decode($admin);
    $abadmin = explode(":", $abadmin);
    $a_aid = "$abadmin[0]";
  }
  $admin_row = abget_admin($a_aid);
  if((!isset($admin) || $admin == "") || $admin_row['protected'] < 1) {
    if($blocker_row['activate'] > 3 AND $blocker_row['activate'] < 6) {
      if($blocker_row['duration'] > 0) {
        $abexpires = $blocker_row['duration'] + $bantime;
      } else {
        $abexpires = 0;
      }
      $agent = get_user_agent();
      $querystring = get_query_string();
      $x_forwarded = get_x_forwarded();
      $client_ip = get_client_ip();
      $remote_addr = get_remote_addr();
      $remote_port = get_remote_port();
      $script_name = get_script_name();
      $request_method = get_request_method();
      $http_host = get_http_host();
      if($querystring > "") {
        $full_url = $http_host."".$script_name."?".$querystring;
      } else {
        $full_url = $http_host."".$script_name;
      }
      list($banname) = $db->sql_fetchrow($db->sql_query("SELECT username FROM ".$user_prefix."_users WHERE user_id='$banuser'"));
      $addby = _AB_ADDBY." "._AB_NUKESENTINEL;
      $datastring = base64_encode($full_url);
      //$checkrow = $db->sql_fetchrow($db->sql_query("CHECK TABLE ".$prefix."_nsnst_ip2country"));
      $checkrow = $db->sql_fetchrow($db->sql_query("SHOW TABLES LIKE '".$prefix."_nsnst_ip2country%'"));
      if($checkrow['Msg_type']!="error") {
        $remote_long = sprintf("%u", ip2long($remote));
        list($c2c) = $db->sql_fetchrow($db->sql_query("SELECT c2c FROM ".$prefix."_nsnst_ip2country WHERE ip_lo<='$remote_long' AND ip_hi>='$remote_long'"));
      }
      if(!$c2c) { $c2c = "00"; }
      $db->sql_query("INSERT INTO ".$prefix."_nsnst_blocked_ips VALUES ('$banip', '$banuser', '$banname', '$agent', '$bantime', '$addby', '".$blocker_row['blocker']."', '$datastring', '$x_forwarded', '$client_ip', '$remote_addr', '$remote_port', '$request_method', '$abexpires', '$c2c')");
      if ($ab_config['htaccess_path'] != "" AND $blocker_row['htaccess'] > 0 AND file_exists($ab_config['htaccess_path'])) {
        $ipfile = file($ab_config['htaccess_path']);
        $ipfile = implode("", $ipfile);
        if(!stristr($ipfile, $htip)) {
          $doit = fopen($ab_config['htaccess_path'], "a");
          fwrite($doit, $htip);
          fclose($doit);
        }
      }
    }
  }
}

function write_mail($banip, $banuser, $bantime, $blocker_row, $abmatch="") {
  global $ab_config, $nuke_config, $db, $prefix, $user_prefix;
  if($blocker_row['activate'] > 0 AND $blocker_row['activate'] < 6) {
    $admincontact = explode("\r\n", $ab_config['admin_contact']);
    $agent = get_user_agent();
    $querystring = get_query_string();
    $x_forwarded = get_x_forwarded();
    $client_ip = get_client_ip();
    $remote_addr = get_remote_addr();
    $remote_port = get_remote_port();
    $script_name = get_script_name();
    $request_method = get_request_method();
    $http_host = get_http_host();
    if($querystring > "") {
      $full_url = $http_host."".$script_name."?".$querystring;
    } else {
      $full_url = $http_host."".$script_name;
    }
    list($banname) = $db->sql_fetchrow($db->sql_query("SELECT username FROM ".$user_prefix."_users WHERE user_id='$banuser'"));
    $subject = ""._AB_BLOCKEDON." ".$nuke_config['sitename'];
    $message  = ""._AB_DATETIME.": ".date("Y-m-d H:i:s",$bantime)."\n"._AB_IPBLOCKED.": $banip"."\n";
    $message .= ""._AB_USERID.": $banname ($banuser)\n"._AB_REASON.": ".$blocker_row['reason']."\n";
    if($abmatch!="") { $message .= ""._AB_MATCH.": $abmatch\n"; }
    $message .= "--------------------\n";
    $message .= ""._AB_USERAGENT.": $agent\n"._AB_QUERY.": $full_url\n";
    $message .= ""._AB_X_FORWARDED.": $x_forwarded\n"._AB_CLIENT_IP.": $client_ip\n";
    $message .= ""._AB_REMOTE_ADDR.": $remote_addr\n"._AB_REMOTE_PORT.": $remote_port\n";
    $message .= ""._AB_REQUEST_METHOD.": $request_method\n";
    if ($blocker_row['email_lookup'] == 1) {
      $message .= "--------------------\n"._AB_WHOISFOR."\n";
      $ipToSearch = @get_ip();
      // Copyright 2004(c) Raven PHP Scripts
      $data = @file_get_contents("http://ws.arin.net/cgi-bin/whois.pl?queryinput=".$ipToSearch) or die('Unable to query WhoIs information for '.$ipToSearch.'.');
      $data = explode('Search results for: ',$data);
      $data = explode('#',$data[1]);
      $data = explode('(NET-',strip_tags($data[0]));
      if (empty($data[1])) $msg .= $data[0];
      else {
        $data = explode(')',$data[1]);
        $data = @file_get_contents("http://ws.arin.net/cgi-bin/whois.pl?queryinput="."!%20NET-".strip_tags($data[0])) or die('Unable to query WhoIs information for '.strip_tags($data[0]).'.');
        $data = explode('Search results for: ',$data);
        $data = explode('Name',$data[1],2);
        $data = explode('# ARIN WHOIS ',$data[1]);
        $msg .= 'OrgName'.nl2br($data[0]);
      }
      $message .= strip_tags($msg);
    } elseif ($blocker_row['email_lookup'] == 2) {
      $message .= "--------------------\n";
      // Copyright 2004(c) NukeScripts
      $ipToSearch = @get_ip();
      $data = @file_get_contents("http://dnsstuff.com/tools/whois.ch?email=on&ip=".$ipToSearch) or die('Unable to query WhoIs information for '.$ipToSearch.'.');
      $data = str_replace("</H1><H5>", "\n", $data);
      $data = str_replace("status = \"Getting WHOIS results...\";", "\n", $data);
      $data = str_replace("status = \"Done!\";", "\n", $data);
      $message .= strip_tags($data);
    }
    for($i=0; $i < count($admincontact); $i++) {
      @mail($admincontact[$i], $subject, $message,"From: $admincontact[$i]\r\nX-Mailer: "._AB_NUKESENTINEL);
    }
  }
}

function block_ip($ip, $banuser, $bantime, $blocker_row, $abmatch="") {
  global $ab_config, $nuke_config, $db, $prefix, $user_prefix;
  if(is_protected($ip)) return;
    clear_session();
    $banip = "$ip[0].$ip[1].$ip[2].$ip[3]";
    $testip1 = "$ip[0].*.*.*";
    $testip1p = "deny from $ip[0]\n";
    $resultag1 = $db->sql_query("SELECT * FROM ".$prefix."_nsnst_blocked_ips WHERE ip_addr='$testip1'");
    $numag1 = $db->sql_numrows($resultag1);
    if ($numag1 == 0 AND $blocker_row['block_type'] == 3) {
      write_mail($testip1, $banuser, $bantime, $blocker_row, $abmatch);
      write_ban($testip1, $testip1p, $banuser, $bantime, $blocker_row);
    } elseif ($numag1 == 0 AND $blocker_row['block_type'] < 3) {
      $testip2 = "$ip[0].$ip[1].*.*";
      $testip2p = "deny from $ip[0].$ip[1]\n";
      $resultag2 = $db->sql_query("SELECT * FROM ".$prefix."_nsnst_blocked_ips WHERE ip_addr='$testip2'");
      $numag2 = $db->sql_numrows($resultag2);
      if ($numag2 == 0 AND $blocker_row['block_type'] == 2) {
        write_mail($testip2, $banuser, $bantime, $blocker_row, $abmatch);
        write_ban($testip2, $testip2p, $banuser, $bantime, $blocker_row);
      } elseif ($numag2 == 0 AND $blocker_row['block_type'] < 2) {
        $testip3 = "$ip[0].$ip[1].$ip[2].*";
        $testip3p = "deny from $ip[0].$ip[1].$ip[2]\n";
        $resultag3 = $db->sql_query("SELECT * FROM ".$prefix."_nsnst_blocked_ips WHERE ip_addr='$testip3'");
        $numag3 = $db->sql_numrows($resultag3);
        if ($numag3 == 0 AND $blocker_row['block_type'] == 1) {
          write_mail($testip3, $banuser, $bantime, $blocker_row, $abmatch);
          write_ban($testip3, $testip3p, $banuser, $bantime, $blocker_row);
        } elseif ($numag3 == 0 AND $blocker_row['block_type'] < 1) {
          $testip4 = "$ip[0].$ip[1].$ip[2].$ip[3]";
          $testip4p = "deny from $ip[0].$ip[1].$ip[2].$ip[3]\n";
          $resultag4 = $db->sql_query("SELECT * FROM ".$prefix."_nsnst_blocked_ips WHERE ip_addr='$testip4'");
          $numag4 = $db->sql_numrows($resultag4);
          if ($numag4 == 0 AND $blocker_row['block_type'] == 0) {
            write_mail($testip4, $banuser, $bantime, $blocker_row, $abmatch);
            write_ban($testip4, $testip4p, $banuser, $bantime, $blocker_row);
          }
        }
      }
    }
    $blocked_row = abget_blocked($ip);
    blocked($blocked_row, $blocker_row);
    die();
}

function is_god($admin) {
  global $db, $prefix, $aname;
  if(!is_array($admin)) {
    $tmpadm = base64_decode($admin);
    $tmpadm = explode(":", $tmpadm);
    $aname = $tmpadm[0];
    $apwd = $tmpadm[1];
  } else {
    $aname = $admin[0];
    $apwd = $admin[1];
  }
  if ($aname != "" AND $apwd != "") {
    $aname = trim($aname);
    $apwd = trim($apwd);
    $admrow = $db->sql_fetchrow($db->sql_query("SELECT * FROM ".$prefix."_authors WHERE aid='$aname'"));
    if((strtolower($admrow['name']) == "god" OR $admrow['radminsuper']==1) AND $admrow['pwd']==$apwd) { return 1; }
  }
  return 0;
}

if (!function_exists("file_get_contents")) {
  function file_get_contents($filename, $use_include_path = 0) {
    $file = @fopen($filename, "rb", $use_include_path);
    if ($file) {
      while (!feof($file)) $data .= fread($file, 1024);
      fclose($file);
    }
    return $data;
  }
}

function abget_template($template="") {
  global $nuke_config, $ab_config, $bantime, $db, $prefix, $ip;
  if($template=="") { $template = "abuse_default.tpl"; }
  $sitename = $nuke_config['sitename'];
  $adminmail = $nuke_config['adminmail'];
  $adminmail = str_replace("@", "(at)", $adminmail);
  $adminmail = str_replace(".", "(dot)", $adminmail);
  $adminmail2 = urlencode($nuke_config['adminmail']);
  $agent = get_user_agent();
  $querystring = get_query_string();
  $x_forwarded = get_x_forwarded();
  $client_ip = get_client_ip();
  $remote_addr = get_remote_addr();
  $remote_port = get_remote_port();
  $script_name = get_script_name();
  $request_method = get_request_method();
  $http_host = get_http_host();
  $filename = "abuse/".$template;
  if(!file_exists($filename)) { $filename = "abuse/abuse_default.tpl"; }
  $handle = fopen($filename, "r");
  $display_page = fread($handle, filesize($filename));
  fclose($handle);
  $display_page = str_replace("__SITENAME__", $sitename, $display_page);
  $display_page = str_replace("__ADMINMAIL1__", $adminmail, $display_page);
  $display_page = str_replace("__ADMINMAIL2__", $adminmail2, $display_page);
  $display_page = str_replace("__REMOTEPORT__", $remote_port, $display_page);
  $display_page = str_replace("__REQUESTMETHOD__", $request_method, $display_page);
  $display_page = str_replace("__SCRIPTNAME__", $script_name, $display_page);
  $display_page = str_replace("__HTTPHOST__", $http_host, $display_page);
  $display_page = str_replace("__USERAGENT__", $agent, $display_page);
  $display_page = str_replace("__CLIENTIP__", $client_ip, $display_page);
  $display_page = str_replace("__FORWARDEDFOR__", $x_forwarded, $display_page);
  $display_page = str_replace("__REMOTEADDR__", $remote_addr, $display_page);
  return $display_page;
}

function blocked($blocked_row="", $blocker_row="") {
  global $nuke_config, $ab_config, $bantime, $db, $prefix, $ip;
  include("includes/counter.php");
  if(!$bantime OR $bantime == "") { $bantime = time(); }
  if($blocked_row=="") { $blocked_row = abget_blocked($ip); }
  if($blocked_row=="") { $blocked_row['reason'] = 0; }
  if($blocker_row=="") { $blocker_row = abget_blockerrow($blocked_row['reason']); }
  if(($blocker_row['activate'] == 2 OR $blocker_row['activate'] == 4 OR $blocker_row['activate'] == 6) AND $blocker_row['forward'] != "") {
    header("Location: ".$blocker_row['forward']);
    die();
  } elseif($blocker_row['activate'] == 3 OR $blocker_row['activate'] == 5 OR $blocker_row['activate'] == 7) {
    $display_page = abget_template($blocker_row['template']);
    $display_page = str_replace("__TIMEDATE__", date("Y-m-d H:i:s", $blocked_row['date']), $display_page);
    if($blocked_row['expires']>0) {
      $display_page = str_replace("__DATEEXPIRES__", date("Y-m-d H:i:s", $blocked_row['expires']), $display_page);
    } else {
      $display_page = str_replace("__DATEEXPIRES__", _AB_PERMENANT, $display_page);
    }
    $display_page .= "<hr noshade>\n<div align='right'>"._AB_NUKESENTINEL." ".$ab_config['version_number']." "._AB_BYNSN."</div>\n";
    die($display_page);
  } else {
    $display_page = abget_template();
    $display_page = str_replace("__TIMEDATE__", date("Y-m-d H:i:s", time()), $display_page);
    if($blocked_row['expires']>0) {
      $display_page = str_replace("__DATEEXPIRES__", date("Y-m-d H:i:s", $blocked_row['expires']), $display_page);
    } else {
      $display_page = str_replace("__DATEEXPIRES__", _AB_PERMENANT, $display_page);
    }
    $display_page .= "<hr noshade>\n<div align='right'>"._AB_NUKESENTINEL." ".$ab_config['version_number']." "._AB_BYNSN."</div>\n";
    die($display_page);
  }
}

function blockedrange($blockedrange_row="") {
  global $nuke_config, $ab_config, $bantime, $db, $prefix, $ip, $remote;
  include("includes/counter.php");
  if(!$bantime OR $bantime == "") { $bantime = time(); }
  if($blockedrange_row=="") { $blockedrange_row = abget_blockedrange($remote); }
  if($blockedrange_row=="") { $blockedrange_row['reason'] = 0; }
  if($blocker_row=="") { $blocker_row = abget_blockerrow($blockedrange_row['reason']); }
  if(($blocker_row['activate'] == 2 OR $blocker_row['activate'] == 4 OR $blocker_row['activate'] == 6) AND $blocker_row['forward'] != "") {
    header("Location: ".$blocker_row['forward']);
    die();
  } elseif($blocker_row['activate'] == 3 OR $blocker_row['activate'] == 5 OR $blocker_row['activate'] == 7) {
    $display_page = abget_template($blocker_row['template']);
    $display_page = str_replace("__TIMEDATE__", date("Y-m-d H:i:s", $blockedrange_row['date']), $display_page);
    if($blockedrange_row['expires']>0) {
      $display_page = str_replace("__DATEEXPIRES__", date("Y-m-d H:i:s", $blockedrange_row['expires']), $display_page);
    } else {
      $display_page = str_replace("__DATEEXPIRES__", _AB_PERMENANT, $display_page);
    }
    $display_page .= "<hr noshade>\n<div align='right'>"._AB_NUKESENTINEL." ".$ab_config['version_number']." "._AB_BYNSN."</div>\n";
    die($display_page);
  } else {
    $display_page = abget_template();
    $display_page = str_replace("__TIMEDATE__", date("Y-m-d H:i:s", time()), $display_page);
    if($blockedrange_row['expires']>0) {
      $display_page = str_replace("__DATEEXPIRES__", date("Y-m-d H:i:s", $blockedrange_row['expires']), $display_page);
    } else {
      $display_page = str_replace("__DATEEXPIRES__", _AB_PERMENANT, $display_page);
    }
    $display_page .= "<hr noshade>\n<div align='right'>"._AB_NUKESENTINEL." ".$ab_config['version_number']." "._AB_BYNSN."</div>\n";
    die($display_page);
  }
}

/** From phpMyAdmin v2.6
 * Gets advanced authentication settings
 *
 * @global  string    the username if register_globals is on
 * @global  string    the password if register_globals is on
 * @global  array     the array of server variables if register_globals is
 *                    off
 * @global  array     the array of environment variables if register_globals
 *                    is off
 * @global  string    the username for the ? server
 * @global  string    the password for the ? server
 * @global  string    the username for the WebSite Professional server
 * @global  string    the password for the WebSite Professional server
 * @global  string    the username of the user who logs out
 *
 * @return  boolean   whether we get authentication settings or not
 *
 * @access  public
 */
function PMA_auth_check() {
  global $PHP_AUTH_USER, $PHP_AUTH_PW;
  global $REMOTE_USER, $AUTH_USER, $REMOTE_PASSWORD, $AUTH_PASSWORD;
  global $HTTP_AUTHORIZATION;

  // Grabs the $PHP_AUTH_USER variable whatever are the values of the
  // 'register_globals' and the 'variables_order' directives
  // loic1 - 2001/25/11: use the new globals arrays defined with php 4.1+
  if (empty($PHP_AUTH_USER)) {
    if (!empty($_SERVER) && isset($_SERVER['PHP_AUTH_USER'])) {
      $PHP_AUTH_USER = $_SERVER['PHP_AUTH_USER'];
    } else if (isset($REMOTE_USER)) {
      $PHP_AUTH_USER = $REMOTE_USER;
    } else if (!empty($_ENV) && isset($_ENV['REMOTE_USER'])) {
      $PHP_AUTH_USER = $_ENV['REMOTE_USER'];
    } else if (@getenv('REMOTE_USER')) {
      $PHP_AUTH_USER = getenv('REMOTE_USER');
    // Fix from Matthias Fichtner for WebSite Professional - Part 1
    } else if (isset($AUTH_USER)) {
      $PHP_AUTH_USER = $AUTH_USER;
    } else if (!empty($_ENV) && isset($_ENV['AUTH_USER'])) {
      $PHP_AUTH_USER = $_ENV['AUTH_USER'];
    } else if (@getenv('AUTH_USER')) {
      $PHP_AUTH_USER = getenv('AUTH_USER');
    }
  }
  // Grabs the $PHP_AUTH_PW variable whatever are the values of the
  // 'register_globals' and the 'variables_order' directives
  // loic1 - 2001/25/11: use the new globals arrays defined with php 4.1+
  if (empty($PHP_AUTH_PW)) {
    if (!empty($_SERVER) && isset($_SERVER['PHP_AUTH_PW'])) {
      $PHP_AUTH_PW = $_SERVER['PHP_AUTH_PW'];
    } else if (isset($REMOTE_PASSWORD)) {
      $PHP_AUTH_PW = $REMOTE_PASSWORD;
    } else if (!empty($_ENV) && isset($_ENV['REMOTE_PASSWORD'])) {
      $PHP_AUTH_PW = $_ENV['REMOTE_PASSWORD'];
    } else if (@getenv('REMOTE_PASSWORD')) {
      $PHP_AUTH_PW = getenv('REMOTE_PASSWORD');
    // Fix from Matthias Fichtner for WebSite Professional - Part 2
    } else if (isset($AUTH_PASSWORD)) {
      $PHP_AUTH_PW = $AUTH_PASSWORD;
    } else if (!empty($_ENV) && isset($_ENV['AUTH_PASSWORD'])) {
      $PHP_AUTH_PW = $_ENV['AUTH_PASSWORD'];
    } else if (@getenv('AUTH_PASSWORD')) {
      $PHP_AUTH_PW = getenv('AUTH_PASSWORD');
    }
  }
  // Gets authenticated user settings with IIS
  if (empty($PHP_AUTH_USER) && empty($PHP_AUTH_PW)
    && function_exists('base64_decode')) {
    if (!empty($HTTP_AUTHORIZATION)
      && substr($HTTP_AUTHORIZATION, 0, 6) == 'Basic ') {
      list($PHP_AUTH_USER, $PHP_AUTH_PW) = explode(':', base64_decode(substr($HTTP_AUTHORIZATION, 6)));
    } else if (!empty($_ENV)
      && isset($_ENV['HTTP_AUTHORIZATION'])
      && substr($_ENV['HTTP_AUTHORIZATION'], 0, 6) == 'Basic ') {
      list($PHP_AUTH_USER, $PHP_AUTH_PW) = explode(':', base64_decode(substr($_ENV['HTTP_AUTHORIZATION'], 6)));
    } else if (@getenv('HTTP_AUTHORIZATION')
      && substr(getenv('HTTP_AUTHORIZATION'), 0, 6) == 'Basic ') {
      list($PHP_AUTH_USER, $PHP_AUTH_PW) = explode(':', base64_decode(substr(getenv('HTTP_AUTHORIZATION'), 6)));
    }
  } // end IIS

  // Returns whether we get authentication settings or not
  if (empty($PHP_AUTH_USER)) {
    return FALSE;
  } else {
    if (get_magic_quotes_gpc()) {
      $PHP_AUTH_USER = stripslashes($PHP_AUTH_USER);
      $PHP_AUTH_PW = stripslashes($PHP_AUTH_PW);
    }
    return TRUE;
  }
} // end of the 'PMA_auth_check()' function

/*********************************************************************************************/
// HTTP Auth code for admin.php protection.  Tried to make it a function call
// but there are too many variables that would have to be globalized.
// This assumes that myprivatefile.php and basicauthfile.php are in the nuke root directory.
// Copyright 2004(c) Raven
/*********************************************************************************************/
$sapi_name = strtolower(php_sapi_name());
$apass = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_nsnst_admins WHERE password_md5='' OR password=''"));
if($apass > 0 AND $ab_config['http_auth'] > 0) {
  require_once("admin/modules/sentinel/functions.php");
  absave_config("http_auth",'0');
}
if($ab_config['http_auth'] == 1 AND strpos($sapi_name,"cgi")===FALSE) {
  if (basename($_SERVER['SCRIPT_NAME'], '.php')=='admin') {
    $allowPassageToAdmin = FALSE;
    $authresult = $db->sql_query("SELECT login, password_md5 FROM ".$prefix."_nsnst_admins");
    while ($getauth = $db->sql_fetchrow($authresult)) {
//      if ($PHP_AUTH_USER==$getauth['login'] AND md5($PHP_AUTH_PW)==trim($getauth['password_md5'])) {

    if ($_SERVER['PHP_AUTH_USER']==$getauth['login'] AND md5($_SERVER['PHP_AUTH_PW'])==trim($getauth['password_md5'])) {

        $allowPassageToAdmin = TRUE;
        break;
      }
    }
    if (!$allowPassageToAdmin) {
      header("WWW-Authenticate: Basic realm=Protected");
      header("HTTP/1.0 401 Unauthorized");
      die(_AB_GETOUT);
    }
  }
}
/*********************************************************************************************/
/*********************************************************************************************/

?>