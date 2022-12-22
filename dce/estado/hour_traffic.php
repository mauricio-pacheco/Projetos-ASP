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
# Description: print hour traffic image                                 #
# Last Update: 18 Dec 2004 23:50                                        #
#-----------------------------------------------------------------------#

require_once('global.php');

$per_hour_info = $db->getResult("select * from is_hour order by hour");
$sum_hour = $db->getResult("select sum(count) as sum from is_hour");
$max_hour = $db->getResult("select max(count) as max from is_hour");
$days = $db->getResult("select count(distinct date) as days from is_daycount");
$today_max = $db->getResult("select max(count) as max from is_today_hour");
$today_info = $db->getResult("select * from is_today_hour order by hour");

if($sum_hour[0]['sum'] > 0){
	$max_percent = $max_hour[0]['max'] / $sum_hour[0]['sum'];
	$max_visit = intval($sum_hour[0]['sum'] * $max_percent / $days[0]['days']);
	
	// compare with today max's hour
	if($max_visit < $today_max[0]['max']){
		$max_visit = $today_max[0]['max'];
	}
	
	// do with forecast for current hour
	if(date("i") < 2){
		$hour_forecast = intval($today_info[date("G")]['count'] * 60);
	}else{
		$hour_forecast = intval($today_info[date("G")]['count'] * 60 / date("i"));
	}
	if($max_visit < $hour_forecast){
		$max_visit = $hour_forecast;
	}
}else{
	$max_visit = 0;
}

$remain = $max_visit % 5;
$max_visit = $max_visit + 5 - $remain;


$im = imagecreatetruecolor(585, 200);
$col = ImageColorAllocate($im, 189, 199, 231);
$line_col = ImageColorAllocate($im, 180, 180, 180);
$red = ImageColorAllocate($im, 239, 16, 16);
$blue = ImageColorAllocate($im, 90, 142, 255);
$green = ImageColorAllocate($im, 115, 195, 24);
$color_black = ImageColorAllocate($im, 0, 0, 0);
$color_white = ImageColorAllocate($im, 255, 255, 255);
$color_border = ImageColorAllocate($im, 123, 121, 181);

imagefilledrectangle ($im, 0, 0, 585, 200, $color_white);

$count = 0;
for($i=30; $i<160; $i=$i+15){
	imageline($im, 45, $i, 574, $i, $line_col);
	imageline($im, 45, $i, 40, $i, $color_black);
	$count++;
}
for($i=68; $i<560; $i=$i+23){
	imageline($im, $i, 14, $i, 164, $line_col);
	imageline($im, $i, 164, $i, 169, $color_black);
}

// draw average line
$x = 46;
for($i=0; $i<23; $i++){
	if($max_visit > 0){
		$y = 165 - (($per_hour_info[$i]['count'] / $days[0]['days']) / $max_visit * 150);
	}else{
		$y = 165;
	}

	$y_id = $i+1;

	if($max_visit > 0){
		$y2 = ($per_hour_info[$y_id]['count'] / $days[0]['days']) / $max_visit * 150;
	}else{
		$y2 = 0;
	}
	

	$y2 = 165 - $y2;
	$x2 = $x + 22;
	imageline($im, $x, $y, $x2, $y2, $green);
	imageline($im, $x, $y - 1, $x2, $y2 - 1, $green);
	imageline($im, $x - 1, $y, $x2 - 1, $y2, $green);

	$x += 23;
}

// draw today's line
$x = 46;
for($i=0; $i<24; $i++){
	if($max_visit > 0){
		$y = 165 - ($today_info[$i]['count'] / $max_visit * 150);
	}else{
		$y = 165;
	}

	$y_id = $i+1;
	if($max_visit > 0){
		$y2 = $today_info[$y_id]['count'] / $max_visit * 150;
	}else{
		$y2 = 0;
	}

	$s_x1 = $x - 7;
	$y2 = 165 - $y2;
	$x2 = $x + 22;

	if($today_info[$i]['hour'] < 23){
		imageline($im, $x, $y, $x2, $y2, $blue);
		imageline($im, $x, $y - 1, $x2, $y2 - 1, $blue);
		imageline($im, $x - 1, $y, $x2 - 1, $y2, $blue);
	}

	// draw forecast for current hour
	if($today_info[$i]['hour'] == date("H")){
		if($max_visit > 0){
			$y = 165 - ($hour_forecast / $max_visit * 150);
		}else{
			$y = 165;
		}

		imageline($im, $x-4, $y-3, $x+2, $y+3, $red);
		imageline($im, $x-4, $y+3, $x+2, $y-3, $red);
	}

	// string with each hours for today
	$text_loca = $x - imagefontwidth($today_info[$i]['count'])/2;

	// string with hour and visitors
	imagestring($im, 2, $text_loca, 173, $today_info[$i]['count'], $color_black);
	imagestring($im, 2, $s_x1+2, 185, $today_info[$i]['hour'], $color_black);

	$x += 23;
}


// draw border of this image
imageline($im, 45, 14, 574, 14, $color_black);
imageline($im, 45, 164, 574, 164, $color_black);
imageline($im, 45, 14, 45, 164, $color_black);
imageline($im, 574, 14, 574, 164, $color_black);

// draw border of this image
imageline($im, 1, 199, 584, 199, $color_black);
imageline($im, 1, 1, 584, 1, $color_black);
imageline($im, 1, 1, 1, 200, $color_black);
imageline($im, 584, 1, 584, 200, $color_black);

imageline($im, 45, 14, 40, 14, $color_black);
imageline($im, 45, 164, 40, 164, $color_black);
imageline($im, 45, 164, 45, 169, $color_black);
imageline($im, 574, 164, 574, 169, $color_black);


// write number of line
imagestring($im, 2, 20, 9, $max_visit, $color_black);
imagestring($im, 2, 20, 38, intval($max_visit*8/10), $color_black);
imagestring($im, 2, 20, 68, intval($max_visit*6/10), $color_black);
imagestring($im, 2, 20, 98, intval($max_visit*4/10), $color_black);
imagestring($im, 2, 20, 128, intval($max_visit/5), $color_black);
imagestring($im, 2, 20, 158, 0, $color_black);
imagestringup($im, 5, 1, 132, "visualizações", $color_black);

// write hour and visitors text
imagestring($im, 2, 4, 173, "Hits", $color_black);
imagestring($im, 2, 4, 185, "Hora", $color_black);

header("Content-type: image/png");
imagepng($im);
imagedestroy($im);
?>