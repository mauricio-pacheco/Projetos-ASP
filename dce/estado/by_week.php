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
# Description: display week counter                                     #
# Last Update: 18 Dec 2004 23:50                                        #
#-----------------------------------------------------------------------#

$week_day = $db->getResult("select * from is_week_days order by day");
$week_max = $db->getResult("select max(count) as max from is_week");

$data = $db->getResult("select * from is_week where year='".date("Y")."' order by `week` desc");
$sum = $db->getResult("select sum(count) as sum from is_week where year='".date("Y")."'");
$max = $db->getResult("select max(count) as max from is_week where year='".date("Y")."'");
$report = PrintStats($sum[0]["sum"], $max[0]["max"], $data, sizeof($data), 350);
?>

<table width="585" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td colspan="2" bgcolor="#CCCCCC">&nbsp;<b><?=$text["week_title"]?></b></td>
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>
	</tr>
	<tr>
		<td width="40%">
		<table width="90%" border="0" bgcolor="#CCCCCC" cellspacing="1" cellpadding="2">
			<tr bgcolor="#CCCCCC">
				<td width="65%"><b><?=$text["week_day"]?></b></td>
				<td align="right"><b><?=$text["week_count"]?></b>&nbsp;</td>
			</tr>
			<?
			for($i=0; $i<sizeof($week_day); $i++){
				if($i % 2){
					$bg_color = "#E6E6E6";
				}else{
					$bg_color = "#FFFFFF";
				}
				echo "<tr bgcolor=\"".$bg_color."\">";
				echo "<td>" . $text["wd_".$i] . "</td>";
				echo "<td align=\"right\">" . $week_day[$i]["count"] . "&nbsp;</td></tr>";
			}
			?>
		</table>
		</td>
		<td align="center"><img src="week_days_traffic.php" border="0"></td>
	</tr>
</table>
<br><br>
<table width="585" border="0" bgcolor="#CCCCCC" cellspacing="1" cellpadding="1">
	<tr bgcolor="#CCCCCC">
		<td width="15%"><b>&nbsp;<?=$text["week_week"]?></b></td>
		<td><b>&nbsp;<?=$text["week_percent"]?></b></td>
		<td width="10%" align="center"><b>&nbsp;<?=$text["week_count"]?></b></td>
	</tr>
<?
for($i=0; $i<sizeof($data); $i++){
?>
	<tr bgcolor="<?=$report[$i]["bg_color"]?>">
		<td><?=date("Y-m-d", $data[$i]["date"])?></td>
		<td><img src="images/barsunrise.gif" width="<?=$report[$i]["bar"]?>" height="10"><img src="images/bargray.gif" width="<?=$report[$i]["bg_bar"]?>" height="10"> <?=$report[$i]["percent"]?> %</td>
		<td align="center"><?=$data[$i]["count"]?></td>
	</tr>
<?
}
?>
</table>