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
# Description: display hour counter                                     #
# Last Update: 18 Dec 2004 23:50                                        #
#-----------------------------------------------------------------------#


$hour = $db->getResult("select * from is_hour order by hour");
$sum = $db->getResult("select sum(count) as sum from is_hour");
?>
  <table width="585" border="0" cellspacing="0" cellpadding="0">
    <tr bgcolor="#CCCCCC">
      <td>&nbsp;<b><?=$text["hour_today_title"]?></b></td>
    </tr>
	<tr>
      <td height="235"><img src="hour_traffic.php" border="0"></td>
    </tr>
	<tr>
	  <td><br><img src="./images/graph_color01.gif" border="_blank" align="absmiddle"> &nbsp;&nbsp; <?=$text["hour_today"]?> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
	  <img src="./images/graph_color02.gif" border="_blank" align="absmiddle"> &nbsp;&nbsp; <?=$text["hour_ava"]?> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
	  <font color="#FF0000">X</font> &nbsp;&nbsp; Previsão para a hora atual
	  </td>
	</tr>
  	<tr>
		<td>
		<br><br>
		<table border="0" cellspacing="1" cellpadding="0" width="100%" bgcolor="#CCCCCC">
			<tr>
				<td colspan="4" bgcolor="#DDDDDD">&nbsp;<b><?=$text["hour_per_hour"]?></b></td>
			</tr>
			<?
			$count_color = 0;
			for($i=0; $i<sizeof($hour); $i=$i+2){
				if($count_color % 2){
					$bg_color = "#FFFFFF";
				}else{
					$bg_color = "#E6E6E6";
				}
				$count_color++;
				echo "<tr bgcolor=\"".$bg_color."\">";
				$check_no = $i + 2;
				for($j=$i; $j<$check_no; $j++){
					if($sum[0]["sum"] > 0){
						$hour_percent = $hour[$j]["count"] / $sum[0]["sum"] * 100;
					}else{
						$hour_percent = 0;
					}
					echo "<td width=\"25%\">&nbsp;".$hour[$j]["hour"].":00 - ".$hour[$j]["hour"].":59</td>";
					echo "<td width=\"25%\">&nbsp;".sprintf ("%.2f", $hour_percent)."%</td>";
				}
				echo "</tr>";
			}
			?>
		</table>
		</td>
	</tr>
  </table>