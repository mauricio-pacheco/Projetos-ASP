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
# Description: draw pie image                                           #
# Last Update: 18 Dec 2004 23:50                                        #
#-----------------------------------------------------------------------#

include "./global.php";

if(!isset($_GET["type"])){
	exit();
}else{
	$type = $_GET["type"];
}

$x = 350;
$y = 160;

$week = 0;
$showtext = 1;

if($type == "browser"){
	$data = $db->getResult("select * from is_browser order by count desc");
	$total = $db->getResult("select sum(count) as sum from is_browser");
	$key = "browser";
	$x = 420;
	$y = 190;
	$week = 0;
}elseif($type == "os"){
	$data = $db->getResult("select * from is_os order by count desc");
	$total = $db->getResult("select sum(count) as sum from is_os");
	$key = "os";
	$x = 380;
	$week = 0;
}elseif($type == "sw"){
	$data = $db->getResult("select * from is_screen order by count desc");
	$total = $db->getResult("select sum(count) as sum from is_screen");
	$key = "width";
	$x = 380;
	$week = 0;
}elseif($type == "sc"){
	$data = $db->getResult("select * from is_color order by count desc");
	$total = $db->getResult("select sum(count) as sum from is_color");
	$key = "color";
	$x = 380;
	$week = 0;
}elseif($type == "week"){
	$data = $db->getResult("select * from is_week_days order by day");
	$total = $db->getResult("select sum(count) as sum from is_week");
	$week = 1;
}elseif($type == "site"){
	$data = $db->getResult("select * from is_ref_site order by count desc limit 8");
	$total[0]["sum"] = 0;
	for($i=0; $i<sizeof($data); $i++){
		$total[0]["sum"] += $data[$i]["count"];
	}
	$key = "domain";
	$x = 410;
	$y = 155;
	$showtext = 1;
}elseif($type == "engine"){
	$data = $db->getResult("select * from is_engine order by count desc limit 6");
	$total[0]["sum"] = 0;
	for($i=0; $i<sizeof($data); $i++){
		$total[0]["sum"] += $data[$i]["count"];
	}
	$key = "name";
	$x = 390;
	$y = 135;
	$showtext = 1;
}elseif($type == "keyword"){
	$data = $db->getResult("select * from is_keyword order by count desc limit 8");
	$total[0]["sum"] = 0;
	for($i=0; $i<sizeof($data); $i++){
		$total[0]["sum"] += $data[$i]["count"];
	}
	$key = "keyword";
	$x = 390;
	$y = 155;
	$showtext = 1;
}

printImage($x, $y, $data, $total[0]["sum"], $key, $week, $showtext);
exit();
?>