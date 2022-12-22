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
# Description: display referrer url                                     #
# Last Update: 18 Dec 2004 23:50                                        #
#-----------------------------------------------------------------------#

$ref = $db->getResult("select * from is_referer order by count desc limit 50");
$sum = $db->getResult("select sum(count) as sum from is_referer");
$max = $db->getResult("select max(count) as max from is_referer");
$report = PrintStats($sum[0]["sum"], $max[0]["max"], $ref, sizeof($ref), 350);
?>

<table width="585" border="0" bgcolor="#CCCCCC" cellspacing="1" cellpadding="3">
	<tr bgcolor="#CCCCCC">
		<td><b>&nbsp;<?=$text["url_url"]?></b></td>
		<td width="10%" align="center"><b>&nbsp;<?=$text["url_count"]?></b></td>
	</tr>
<?
for($i=0; $i<sizeof($ref); $i++){
	if(strlen($ref[$i]["url"]) > 83){
		$url = substr($ref[$i]["url"], 0, 80) . "...";
	}else{
		$url = $ref[$i]["url"];
	}
?>
	<tr bgcolor="<?=$report[$i]["bg_color"]?>">
		<td><a href="<?=str_replace("%%%%%", "&", $ref[$i]["url"])?>" target="_blank"><?=$url?></a></td>
		<td align="center"><?=$ref[$i]["count"]?></td>
	</tr>
<?
}
?>
</table>