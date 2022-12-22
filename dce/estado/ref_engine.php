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
# Description: display referrer search engine                           #
# Last Update: 20 Dec 2004 20:50                                        #
#-----------------------------------------------------------------------#

if(!isset($_GET['shortby']))  $_GET['shortby'] = "daycount";
if(!isset($_GET['toshort']))  $_GET['toshort'] = "desc";

$db->query("select * from is_engine order by ".$_GET['shortby']." ".$_GET['toshort']." limit 20");

$short_url = mkUrl($_SERVER['PHP_SERVER']."?action=".$action."&", $_GET['shortby'], $_GET['toshort']);
?>
<table width="585" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td bgcolor="#CCCCCC">&nbsp;<b><?=$text['engine_title']?></b></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td align="center"><img src="printImage.php?type=engine" border="0"><br>&nbsp;</td>
	</tr>
	<tr>
		<td>
		<table width="100%" border="0" cellspacing="1" cellpadding="2" bgcolor="#CCCCCC">
			<tr bgcolor="#DDDDDD">
				<td width="32%"><b><?=$text["engine_engine"]?></b></td>
				<td width="17%" align="right"><b><a href="<?=$short_url['count']?>"><?=$text['engine_mth_avg']?></a>&nbsp;</b></td>
				<td width="17%" align="right"><b><a href="<?=$short_url['mthcount']?>"><?=$text['engine_this_mth']?></a>&nbsp;</b></td>
				<td width="17%" align="right"><b><a href="<?=$short_url['count']?>"><?=$text['engine_day_avg']?></a>&nbsp;</b></td>
				<td width="17%" align="right"><b><a href="<?=$short_url['daycount']?>"><?=$text['engine_today']?></a>&nbsp;</b></td>
			</tr>
			<?
			$i = 0;
			for($i=0; $engine=$db->getRows(); $i++){
				if($i % 2){
					$bg_color = "#E6E6E6";
				}else{
					$bg_color = "#FFFFFF";
				}
				$result = getAvgForecast($engine['count'], $engine['mthcount'], $engine['daycount'], $engine['start_time']);
				echo "<tr bgcolor=\"" . $bg_color . "\"><td>" . $engine['name'] . "</td>";
				echo "<td align=\"right\">" . $result['mth_avg'] . "&nbsp;</td>";
				echo "<td align=\"right\">" . $engine['mthcount'] . " (" . $result['mth_forecast'] . ")&nbsp;</td>";
				echo "<td align=\"right\">" . sprintf("%.0f", $result['day_avg']) . "&nbsp;</td>";
				echo "<td align=\"right\">" . $engine['daycount'] . " (" . $result['day_forecast'] . ")&nbsp;</td></tr>";
			}
			?>
		</table>
		</td>
	</tr>
	<tr>
		<td><br> The number contain in ( ), it is the forecast numbers.</td>
	</tr>
</table>