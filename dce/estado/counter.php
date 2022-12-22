<?php
#-----------------------------------------------------------------------#
# PHP i-Stats: Web Traffic Analysis System                              #
# =========================================                             #
#                                                                       #
# Copyright (c) 2004 by Sam Tang                                        #
# http://www.samphp.com/                                                #
#                                                                       #
# This program is free software. You can redistribute it and/or modify  #
# it under the terms of the GNU General Public License as published by  #
# the Free Software Foundation; either version 2 of the License.        #
#                                                                       #
#-----------------------------------------------------------------------#
# This product includes GeoIP data created by MaxMind, available        #
# from http://maxmind.com/                                              #
#-----------------------------------------------------------------------#
# Description: insert new visitors data to database                     #
# Last Update: 18 Dec 2004 23:50                                        #
#-----------------------------------------------------------------------#

require_once('global.php');
require_once(LIBPATH . 'search_engine.inc.php');
require_once(LIBPATH . 'user_agent.inc.php');
require_once(INCLUDEPATH . 'geoip.inc');


// clear ' on all $_GET variables
$_GET['sw'] = trim(str_replace("'", "", $_GET['sw']));
$_GET['sc'] = trim(str_replace("'", "", $_GET['sc']));
$_GET['referer'] = trim(str_replace("'", "", $_GET['referer']));
$_GET['page'] = trim(str_replace("'", "", $_GET['page']));


#########################################################################
/* update online counter */
#########################################################################

if(!isset($_COOKIE['is_hash'])){
	$hash = md5(time());
}else{
	$hash = $_COOKIE['is_hash'];
}

if($db->getTotalRows("select `hash` from `is_session` where `hash`='".$hash."'") > 0){
	$db->query("update `is_session` set `time`='".time()."' where `hash`='".$hash."'");
}else{
	$db->query("insert into `is_session` values('".$hash."', '".time()."')");
}

setcookie("is_hash", $hash, time()+43200);



#########################################################################
/* update page counter here */
#########################################################################

if($cfg['pagestats'] == "fulladd"){
	$page = parse_url($_GET['page']);
	$page_info = $page['path'];
	if($page['query'] != "")  $page_info .= "?" . $page['query'];
}elseif($cfg['pagestats'] == "filename"){
	$page = parse_url($_GET['page']);
	if($page['path'] == ""){
		$page_info = "/";
	}else{
		$page_info = $page['path'];
	}
}elseif($cfg['pagestats'] == "title"){
	$html_content = file_get_contents($_GET['page']);
	preg_match("/<title>(.*)<\/title>/i", $html_content, $match);
	$page_info = $match[1];
}else{
	$page = parse_url($_GET['page']);
	$page_info = $page['path'];
	if($page['query'] != "")  $page_info .= "?" . $page['query'];
}

if($db->getTotalRows("select `count` from `is_page` where `page`='".$page['path']."'") > 0){
	$db->query("update is_page set count=count+'1' where page='".$page['path']."'");
}else{
	$db->query("insert into `is_page` values('".$page['path']."', '1')");
}



// remember visitor's ip address and using cookie remember him/her 12 hours
$db->query("insert into is_ip values('".$_SERVER['REMOTE_ADDR']."', '".date("YmdH")."')");
setcookie("is_visitor", 1, time()+43200);



#########################################################################
/* update counter data: day visitors, pageviews and total visit */
#########################################################################

$date = date("Y-m-d");
if($db->getTotalRows("select `daycount` from is_daycount where `date`='".$date."'") > 0){
	$db->query("update is_daycount set daycount=daycount+'1' where date='".date("Y-m-d")."'");
}else{
	$db->query("insert into is_daycount values('".$date."', '1')");
	$db->query("update is_count set days=days+'1'");
	$db->query("update is_today_hour set count='0'");
	// delete all session, ip, referer, last_visitor and hostname inforamtion
	$db->query("TRUNCATE table is_session");
	$db->query("TRUNCATE table is_ip");
	$db->query("TRUNCATE table is_page");
	$db->query("TRUNCATE table is_hostname");

	// update search country, engine, keyword and referer website's information
	$db->query("TRUNCATE table is_referer");
	$db->query("update is_engine set daycount='0'");
	$db->query("update is_keyword set daycount='0'");
	$db->query("update is_ref_site set daycount='0'");
	$db->query("update is_country set daycount='0'");

	$db->query("insert into `is_page` values('".$page['path']."', '1')");
}

$db->query("update is_count set count=count+1");



#########################################################################
/* update monthly counter information */
#########################################################################

// these variables using on "week" also 
$year = date("Y");
$mth = date("m");
$day = date("d");

if($db->getTotalRows("select `count` from is_mth where `mth`='".$mth."' and `year`='".$year."'") > 0){
	$db->query("update is_mth set count=count+1 where `mth`='".$mth."' and `year`='".$year."'");
	$db->query("update is_mth_days set count=count+1 where `day`='".$day."'");
}else{
	$db->query("insert into is_mth values('".$mth."', '".$year."', '1')");
	$db->query("update is_mth_days set count='1' where `day`='".$day."'");
	$db->query("update is_mth_days set count='0' where `day`!='".$day."'");
	// update search country, engine, keyword and referer website's information
	$db->query("update is_engine set mthcount='0'");
	$db->query("update is_keyword set mthcount='0'");
	$db->query("update is_ref_site set mthcount='0'");
	$db->query("update is_country set mthcount='0'");
}



#########################################################################
/* update week information */
#########################################################################

if($db->getTotalRows("select `count` from is_week where `week`='".date("W")."' and `year`='".$year."'") > 0){
	$db->query("update is_week set count=count+1 where `week`='".date("W")."' and `year`='".$year."'");
}else{
	$db->query("insert into is_week values('".date("W")."', '".$year."', '".time()."', '1')");
}
// update week days counter
$db->query("update is_week_days set count=count+1 where `day`='".date("w")."'");



#########################################################################
/* update referer data: referer url, search engine and keyword */
#########################################################################

$_GET['referer'] = str_replace("[i-Stats]", "&", addslashes($_GET['referer']));
if(isRef($_GET['referer'], $cfg['siteurl']) && strstr($_GET['referer'], ".")){
	if($db->getTotalRows("select `count` from is_referer where url='".$_GET['referer']."'") > 0){
		$db->query("update is_referer set count=count+'1' where url='".$_GET['referer']."'");
	}else{
		$db->query("insert into is_referer values('".$_GET['referer']."', '1')");
	}

	/* start search engine and keyword section */
	$ref_data = getHostInfo($_GET['referer']);

	if($engine_key = isEngine($ref_data['host'], $searchEngine)){
		// update search engine counter
		if($db->getTotalRows("select `name` from is_engine where name='".$engine_key."'") > 0){
			$db->query("update is_engine set mthcount=mthcount+'1', daycount=daycount+'1', count=count+'1' where name='".$engine_key."'");
		}else{
			$db->query("insert into is_engine values('".$engine_key."', '1', '1', '".time()."', '1')");
		}

		// update keyword counter
		if($keyword = getSearchKey($ref_data['query'], $searchKeyword[$engine_key])){
			if($db->getTotalRows("select `count` from is_keyword where keyword like '".$keyword."'") > 0){
				$db->query("update is_keyword set mthcount=mthcount+'1', daycount=daycount+'1', count=count+'1' where keyword like '".$keyword."'");
			}else{
				$db->query("insert into is_keyword values('".$keyword."', '1', '1', '".time()."', '1')");
			}
		}
	}else{
		// update referer website
		$ref_data['host'] = str_replace("www.", "", $ref_data['host']);
		if($db->getTotalRows("select `count` from is_ref_site where domain='".$ref_data['host']."'") > 0){
			$db->query("update is_ref_site set mthcount=mthcount+'1', daycount=daycount+'1', count=count+'1' where domain='".$ref_data['host']."'");
		}else{
			$db->query("insert into is_ref_site values('".$ref_data['host']."', '1', '1', '".time()."', '1')");
		}
	}
}



#########################################################################
/* update OS, browser, screen sizse and color resolution */
#########################################################################

// update os
$os_key = getAgent($_SERVER['HTTP_USER_AGENT'], $userOS, "Other");
$db->query("update is_os set count=count+1 where os='".$os_key."'");

// update browser
$browser_key = getAgent($_SERVER['HTTP_USER_AGENT'], $userBrowser, "Other");
$db->query("update is_browser set count=count+1 where browser='".$browser_key."'");

// update screen
$screen_key = getAgent($_GET['sw'], $userScreen, "Unknow");
$db->query("update is_screen set count=count+1 where width='".$screen_key."'");

// update color
$color_key = getAgent($_GET['sc'], $userColor, "Unknow");
$db->query("update is_color set count=count+1 where color='".$color_key."'");



#########################################################################
/* update hour counter */
#########################################################################

$db->query("update is_today_hour set count=count+1 where hour='".date("H")."'");
$db->query("update is_hour set count=count+1 where hour='".date("H")."'");



#########################################################################
/* update hostname counter */
#########################################################################

// hostname also using for last 10 visitors
$hostname = gethostbyaddr($_SERVER['REMOTE_ADDR']);
if($hostname == $_SERVER['REMOTE_ADDR']){
	$hostname = "IP Only";
}else{
	$hostname = explode(".", $hostname);
	$host_size = sizeof($hostname);
	if($host_size > 3){
		$hostname = $hostname[$host_size-3].".".$hostname[$host_size-2].".".$hostname[$host_size-1];
	}else{
		$hostname = $hostname[$host_size-2].".".$hostname[$host_size-1];
	}
}

if($db->getTotalRows("select `hostname` from is_hostname where hostname='".$hostname."'") > 0){
	$db->query("update is_hostname set count=count+1 where hostname='".$hostname."'");
}else{
	$db->query("insert into is_hostname values('".$hostname."', '1')");
}



#########################################################################
/* update country counter */
#########################################################################

// read GeoIP database
$handle = geoip_open(LIBPATH . "GeoIP.dat", GEOIP_STANDARD);

$country_code = geoip_country_code_by_addr($handle, $_SERVER['REMOTE_ADDR']);
$country_name = geoip_country_name_by_addr($handle, $_SERVER['REMOTE_ADDR']);
$db->query("update is_country set mthcount=mthcount+'1', daycount=daycount+'1', count=count+'1' where country_code='".$country_code."'");
geoip_close($handle);



#########################################################################
/* update last 10 visitors */
#########################################################################

$db->query("insert into is_last_visitor values('".$_SERVER['HTTP_USER_AGENT']."', '".$hostname."', '".$country_code."', '".$country_name."', '".$_GET['referer']."', '".time()."')");

// delete old data from is_last_visitor table
$db->query("select @del_time:=`time` from `is_last_visitor` order by `time` desc limit 9, 1;
			delete from `is_last_visitor` where `time`<@del_time;");

// close mysql connection
$db->dbClose();
?>