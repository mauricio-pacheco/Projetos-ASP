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
#-----------------------------------------------------------------------#
# Description: common functions                                         #
# Last Update: 18 Dec 2004 23:50                                        #
#-----------------------------------------------------------------------#

#----------------------------------------------------------------
# return URL's components for update search engine and referer.
#----------------------------------------------------------------
function getHostInfo($referer){
	$host = parse_url($referer);

	$result['host'] = strtolower($host['host']);
	$result['query'] = explode("&", $host['query']);
	$result['search_engine'] = str_replace("www.", "", $result['host']);

	return $result;
}


#----------------------------------------------------------------
# check the referer URL is search engine or not
#----------------------------------------------------------------
function isRef($url, $siteurl){
	foreach($siteurl as $key => $value){
		if(preg_match("/".str_replace("/", "\/", $value)."/i", $url)){
			$not_ref = true;
		}
	}

	if(!isset($not_ref) && $url != ""){
		return true;
	}else{
		return false;
	}
}


#----------------------------------------------------------------
# check the referer URL is search engine or not
#----------------------------------------------------------------
function isEngine($host, $engine){
	foreach($engine as $key => $value){
		if(preg_match("/".$value.".*/i", $host)){
			$engineKey = $key;
		}
	}

	if(isset($engineKey)){
		return $engineKey;
	}else{
		return false;
	}
}


#----------------------------------------------------------------
# search keyword in query array
#----------------------------------------------------------------
function getSearchKey($query, $key){
	for($i=0; $i<sizeof($query); $i++){	
		if(preg_match("/\b".$key['key']."=/i", $query[$i])){
			$keyword = str_replace("=", "", strstr($query[$i], "="));
			$i = sizeof($query);
		}
	}

	if(isset($keyword)){
		// covert keyword to utf8
		if($key['charset'] != "UTF-8"){
			$keyword = iconv($key['charset'], "UTF-8", $keyword);
		}
		return $keyword;
	}else{
		return false;
	}
}


#----------------------------------------------------------------
# get update key for user agent
#----------------------------------------------------------------
function getAgent($agent, $search_var, $other_key){
	foreach($search_var as $key => $value){
		if(preg_match("/".$value."/i", $agent)){
			$result = $key;
		}
	}

	if(!isset($result)){
		return $other_key;
	}else{
		return $result;
	}
}


#----------------------------------------------------------------
# return an array for last update date
#----------------------------------------------------------------
function getLastUpdate(){
	global $db;
	//global $cfg['dbPrefix'];

	$db->query("select `date` from ".$cfg['dbPrefix']."lastupdate");
	$date = explode("-", $db->getRows());

	$result['year'] = $date[0];
	$result['mth'] = $date[1];
	$result['day'] = $date[2];

	return $result;
}


#----------------------------------------------------------------
# count the infomration that show on summary
#----------------------------------------------------------------
function CountDays(){
	global $db;

	$date = date("Y-m-d");
	$week = date("W");
	$mth = date("m");
	$year = date("Y");

	$total_visits = $db->getResult("select * from is_count");
	$result['total'] = $total_visits[0]['count'];

    $result['days'] = $total_visits[0]['days'];

	if($result['total'] > 0){
		$result['ava_day'] = $result['total'] / $result['days'];
		$result['ava_hour'] = $result['ava_day'] / 24;
		$result['ava_week'] = $result['ava_day'] * 7;
		$result['ava_mth'] = $result['ava_day'] * 30;
	}else{
		$result['ava_day'] = 0;
		$result['ava_hour'] = 0;
		$result['ava_week'] = 0;
		$result['ava_mth'] = 0;
		$result['total'] = 0;
	}
	
	$online_time = time() - 600;
	$online_counter = $db->getResult("select count(*) as total from `is_session` where `time`>'".$online_time."'");
	$result['online'] = $online_counter[0]['total'];

	$max_date = $db->getResult("select date, daycount from is_daycount order by daycount desc limit 1");
	
	if($max_date){
		$result['max_date'] = $max_date[0]['date'];
	    $result['max_daycount'] = $max_date[0]['daycount'];
	}else{
		$result['max_date'] = "------";
		$result['max_daycount'] = 0;
	}

	$today = $db->getResult("select daycount from is_daycount where date='$date'");
	$this_week = $db->getResult("select count from is_week where week='$week' and year='$year'");
	$this_mth = $db->getResult("select count from is_mth where mth='$mth' and year='$year'");

	if($today){
		$result['today'] = $today[0]['daycount'];
	}else{
		$result['today'] = 0;
	}

	if($this_week){
		$result['this_week'] = $this_week[0]['count'];
	}else{
		$result['this_week'] = 0;
	}

	if($this_mth){
		$result['this_mth'] = $this_mth[0]['count'];
	}else{
		$result['this_mth'] = 0;
	}

	$max_week = $db->getResult("select date, count from is_week order by count desc limit 1");
	$max_mth = $db->getResult("select year, mth, count from is_mth order by count desc limit 1");
	
	if($max_week){
		$result['max_week'] = $max_week[0]['date'];
		$result['max_weekcount'] = $max_week[0]['count'];
	}else{
		$result['max_week'] = "------";
		$result['max_weekcount'] = 0;
	}

	if($max_mth){
		$result['max_mth'] = $max_mth[0]['year']."/".$max_mth[0]['mth'];
		$result['max_mthcount'] = $max_mth[0]['count'];
	}else{
		$result['max_mth'] = "------";
		$result['max_mthcount'] = 0;
	}
	
	if(isset($result)){
		return $result;
	}
}


#----------------------------------------------------------------
# using for print image
#----------------------------------------------------------------
function printImage($x, $y, $data, $total, $key, $week=0, $showtext=1){

	$days = array("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday");


	$image = imagecreatetruecolor($x, $y);
	$white = imagecolorallocate($image, 255, 255, 255);
	$bg_col = imagecolorallocate($image, 184, 197, 226);
	$dark_col = imagecolorallocate($image, 110, 110, 110);
	$textcolor = imagecolorallocate($image, 0x00, 0x00, 0x00);

	imagefilledrectangle($image, 0, 0, $x, $y, $white);

	$col[0] = imagecolorallocate($image, 0, 113, 189);
	$col[1] = imagecolorallocate($image, 178, 210, 52);
	$col[2] = imagecolorallocate($image, 0, 115, 106);
	$col[3] = imagecolorallocate($image, 255, 168, 81);
	$col[4] = imagecolorallocate($image, 206, 48, 0);
	$col[5] = imagecolorallocate($image, 24, 24, 173);
	$col[6] = imagecolorallocate($image, 8, 190, 195);
	$col[7] = imagecolorallocate($image, 0, 204, 51);
	$col[8] = imagecolorallocate($image, 255, 215, 66);
	$col[9] = imagecolorallocate($image, 173, 16, 165);


	// make the 3D effect
	for ($i = 75; $i > 60; $i--) {
		imagefilledarc($image, 105, $i, 200, 100, 0, 360, $dark_col, IMG_ARC_PIE);
	}

	$start = 0;
	$point_y = 10;
	if($total > 0){
		for($i=0; $i<sizeof($data); $i++){
			$temp = $i + 1;
			if($temp < sizeof($data)){
				$rate = intval($data[$i]["count"] / $total * 360);
			}else{
				$rate = intval($data[$i]["count"] / $total * 360);
				$temp_rate = $rate + $start;
				if($temp_rate < 360){
					$rate = 360 - $start;
				}
			}
			$percent = sprintf("%.1f", $data[$i]["count"] / $total * 100);
			imagefilledarc($image, 105, 60, 200, 100, $start, $rate+$start, $col[$i], IMG_ARC_PIE);
			
			if($showtext == 1){
				imagefilledrectangle($image, 225, $point_y+7, 237, $point_y+12, $col[$i]);

				if($week > 0){
					$text = $days[$data[$i]["day"]];
				}else{
					$text = $data[$i][$key];
				}
				imagestring($image, 2, 250, $point_y+2, $text . " (" . $percent . "%)", $textcolor);
			}


			$start += $rate;
			$point_y += 18;
		}
	}else{
		imagefilledarc($image, 105, 60, 200, 100, 0, 360, $col[6], IMG_ARC_PIE);
		imagestring($image, 2, 63, 53, "No record today", $textcolor);
	}

	imagepng($image);
	imagedestroy($image);
}


#----------------------------------------------------------------
# this function used by print report
#----------------------------------------------------------------
function PrintStats($sum, $max, $visit, $period, $d_bar=380){
	$total_bar = $d_bar + 10;
	for($i=0; $i<$period; $i++){
		if($max > 0){
			$percent = $visit[$i]["count"] / $sum * 100;
			$percent = sprintf("%.2f", $percent);
			$bar = $visit[$i]["count"] / $max * $d_bar;
			$bar = sprintf("%.0f", $bar);
			$bg_bar = $total_bar - $bar;
		}else{
			$percent = 0;
			$bar = 0;
			$bg_bar = $total_bar;
		}

		if($i % 2){
			$bg_color = "#E6E6E6";
	    }else{
		    $bg_color = "#FFFFFF";
	    }

		$result[$i]["percent"] = $percent;
		$result[$i]["bar"] = $bar;
		$result[$i]["bg_bar"] = $bg_bar;
		$result[$i]["bg_color"] = $bg_color;
	}

	if(isset($result)){
		return $result;
	}
}


#----------------------------------------------------------------
# return average, forecast of day and month
#----------------------------------------------------------------
function getAvgForecast($total_count, $mth_count, $day_count, $start_time){

	$days = (time() - $start_time) / (3600 * 24);
	
	// count average number
	$result['day_avg'] = $total_count / $days;
	$result['mth_avg'] = sprintf("%.0f", $result['day_avg'] * 30);

	// count forecast number
	$result['day_forecast'] = sprintf("%.0f", ($day_count * 1440) / (date("G")*60 + date("i")));
	$result['mth_forecast'] = sprintf("%.0f", ($mth_count * 1440 * date("t")) / (((date("j")-1)*1440) + date("G")*60 + date("i")));

	return $result;
}


#----------------------------------------------------------------
# make url for shorting options
#----------------------------------------------------------------
function mkUrl($baseurl, $shortby, $toshort){

	// define the default url
	$result['count'] = $baseurl . "shortby=count&toshort=desc";
	$result['mthcount'] = $baseurl . "shortby=mthcount&toshort=desc";
	$result['daycount'] = $baseurl . "shortby=daycount&toshort=desc";
	
	
	if($toshort == "desc"){
		$result[$shortby] = $baseurl . "shortby=".$shortby."&toshort=asc";
	}

	return $result;
}


#----------------------------------------------------------------
# delete repeat keyword in is_keyword
#----------------------------------------------------------------
function rmKeyword(){
	global $db;
	$rm_sql = "";
	$insert_sql = "";

	$rows = $db->getResult("SELECT `keyword`, `mthcount`, `daycount`, start_time, `count`, count(*) as total FROM `is_keyword` group by `keyword` having `total`>'1'");

	for($i=0; $i<sizeof($rows); $i++){
		$rows[$i]['keyword'] = mysql_escape_string($rows[$i]['keyword']);
		$db->query("delete from `is_keyword` where `keyword` like '".$rows[$i]['keyword']."'", 1);
		$db->query("insert into `is_keyword` values('".$rows[$i]['keyword']."', '".$rows[$i]['mthcount']."', '".$rows[$i]['daycount']."', '".$rows[$i]['start_time']."', '".$rows[$i]['count']."')", 1);
	}
}


#----------------------------------------------------------------
# check user login
#----------------------------------------------------------------
function check_login(){
	global $_COOKIE;
	global $cfg;

	if($cfg['username'] != $_COOKIE['username'] or md5($cfg['password']) != $_COOKIE['password']){
		return false;
	}else{
		return true;
	}
}
?>