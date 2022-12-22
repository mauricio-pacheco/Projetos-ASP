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
# Description: display country counter                                  #
# Last Update: 18 Dec 2004 23:50                                        #
#-----------------------------------------------------------------------#

$data = $db->getResult("select * from is_country where count>'0' order by count desc limit 50");
$sum = $db->getResult("select sum(count) as sum from is_country");
$report = PrintStats($sum[0]['sum'], $data[0]['count'], $data, sizeof($data), 290);
?>
<b><?=$text['country_title']?></b><br><br>
<table width="585" border="0" bgcolor="#CCCCCC" cellspacing="1" cellpadding="1">
	<tr bgcolor="#CCCCCC">
		<td width="22%"><b>&nbsp;<?=$text['country_country']?></b></td>
		<td><b>&nbsp;<?=$text['country_percent']?></b></td>
		<td width="10%" align="center"><b>&nbsp;<?=$text['country_count']?></b></td>
		<td width="25" align="center"><b>&nbsp;<?=$text['country_flag']?></b></td>
	</tr>
<?
for($i=0; $i<sizeof($data); $i++){
?>
	<tr bgcolor="<?=$report[$i]['bg_color']?>">
		<td><?=$data[$i]['country_name']?></td>
		<td><img src="images/barsunrise.gif" width="<?=$report[$i]['bar']?>" height="10"><img src="images/bargray.gif" width="<?=$report[$i]['bg_bar']?>" height="10"> <?=$report[$i]['percent']?> %</td>
		<td align="center"><?=$data[$i]['count']?></td>
		<td align="center"><img src="./world/<?=strtolower($data[$i]['country_code'])?>.png" border="0"></td>
	</tr>
<?
}
?>
</table>