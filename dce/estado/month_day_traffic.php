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
# Description: print month-day traffic image                            #
# Last Update: 18 Dec 2004 23:50                                        #
#-----------------------------------------------------------------------#

require_once('global.php');

$day_info = $db->getResult("select * from is_mth_days order by day");

$max_visit = 0;
for($i=0; $i<sizeof($day_info); $i++){
	if($day_info[$i]["count"] > $max_visit){
		$max_visit = $day_info[$i]["count"];
	}
}

$im = imagecreatetruecolor(585, 240);
$col = ImageColorAllocate($im, 189, 199, 231);
$line_col = ImageColorAllocate($im, 180, 180, 180);
$white = ImageColorAllocate($im, 255, 255, 255);
$red = ImageColorAllocate($im, 239, 16, 16);
$blue = ImageColorAllocate($im, 66, 69, 107);
$color_black = ImageColorAllocate($im, 0, 0, 0);
$color_border = ImageColorAllocate($im, 123, 121, 181);
imagefilledrectangle($im, 0, 0, 585, 240, $white);
for($i=20; $i<205; $i=$i+20){
	imageline($im, 50, $i, 582, $i, $line_col);
	imageline($im, 50, $i, 45, $i, $color_black);
}

imageline($im, 50, 10, 582, 10, $color_black);
imageline($im, 50, 220, 582, 220, $color_black);
imageline($im, 50, 10, 50, 220, $color_black);
imageline($im, 582, 10, 582, 220, $color_black);

imagestring($im, 2, 2, 12, $max_visit, $color_black);
imagestring($im, 2, 2, 33, intval($max_visit*9/10), $color_black);
imagestring($im, 2, 2, 53, intval($max_visit*8/10), $color_black);
imagestring($im, 2, 2, 73, intval($max_visit*7/10), $color_black);
imagestring($im, 2, 2, 93, intval($max_visit*6/10), $color_black);
imagestring($im, 2, 2, 113, intval($max_visit/2), $color_black);
imagestring($im, 2, 2, 133, intval($max_visit*4/10), $color_black);
imagestring($im, 2, 2, 153, intval($max_visit*3/10), $color_black);
imagestring($im, 2, 2, 173, intval($max_visit/5), $color_black);
imagestring($im, 2, 2, 193, intval($max_visit/10), $color_black);
imagestring($im, 2, 2, 212, 0, $color_black);

imagestring($im, 2, 2, 225, "Dias", $color_black);
 

$x = 62;
$last_line_x = 62;
for($i=0; $i<31; $i++){
	$day = $i + 1;
	if($day < 10){
		$day = "0" . $day;
	}

	if($max_visit > 0){
		$y = 220 - ($day_info[$i]["count"] / $max_visit * 200);
	}else{
		$y = 220;
	}

	$s_x1 = $x - 5;
	$s_x2 = $x + 6;
	imagefilledrectangle($im, $s_x1, $y, $s_x2, 220, $blue);
	imageline($im, $s_x2 + 1, $y, $s_x2 + 1, 220, $color_black);
	imageline($im, $s_x2 + 2, $y, $s_x2 + 2, 220, $color_black);
	imageline($im, $s_x1 - 1, $y + 1, $s_x1 - 1, 220, $color_border);
	imageline($im, $s_x1 - 1, $y - 1, $s_x2 + 2, $y - 1, $color_border);
	imageline($im, $s_x1 - 2, $y, $s_x1 - 2, 220, $color_border);

	// draw the red line
	if(date("j") > $i){
		if(!isset($last_line_y)){
			$last_line_y = $y - 1;
		}else{
			$curr_y = intval(($y - 1 + $last_line_y) / 2);
			imageline($im, $x, $curr_y, $last_line_x, $last_line_y, $red);
			imageline($im, $x, $curr_y-1, $last_line_x, $last_line_y-1, $red);
			imageline($im, $x, $curr_y+1, $last_line_x, $last_line_y+1, $red);
			$last_line_y = $curr_y;
			$last_line_x = $x;
		}
	}
	
	// write day
	imageline($im, $x, 220, $x, 225, $color_black);
	imagestring($im, 2, $s_x1+1, 225, $day, $color_black);

	$x += 17;
}

header("Content-type: image/png");
imagepng($im);
imagedestroy($im);
?>