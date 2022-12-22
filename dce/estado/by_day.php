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
# Description: display daily counter                                    #
# Last Update: 20 Dec 2004 20:45                                        #
#-----------------------------------------------------------------------#


$day_info = $db->query("select date, daycount from is_daycount order by date desc limit 30");
?>
  <table width="585" border="0" cellspacing="0" cellpadding="0">
    <tr bgcolor="#CCCCCC">
      <td>&nbsp;<b><?=$text["traffic_title"]?></b></td>
    </tr>
	<tr>
	  <td>&nbsp;</td>
	</tr>
	<tr>
      <td height="225"><img src="daily_traffic.php" border="0"></td>
    </tr>
  </table>
  <br><br>
  <table width="585" border="0" cellspacing="2" cellpadding="0">
  	<tr>
		<td>
		<table border="0" cellspacing="0" cellpadding="2" width="40%" bgcolor="#E6E6E6" class="border1">
			<tr>
				<td colspan="3" bgcolor="#CCCCCC">&nbsp;<b><?=$text["by_day"]?></b></td>
			</tr>
			<?
			$total = 0;
			for($i=0; $day_info=$db->getRows(); $i++){
				if($i % 2){
					$bgcolor = "#FFFFFF";
				}else{
					$bgcolor = "#E6E6E6";
				}
			?>
			<tr>
				<td width="7%" height="15">&nbsp;</td>
				<td bgcolor="<?=$bgcolor?>">&nbsp;<b><?=$day_info["date"]?></b></td>
				<td bgcolor="<?=$bgcolor?>" width="20%" align="right"><b><?=$day_info["daycount"]?></b>&nbsp;&nbsp;</td>
			</tr>
			<?
				$total += $day_info["daycount"];
			}
			?>
			<tr>
				<td height="20">&nbsp;</td>
				<td bgcolor="#FFFFFF">&nbsp;<b>Total</b></td>
				<td bgcolor="#FFFFFF" align="right"><b><?=$total?></b>&nbsp;&nbsp;</td>
			</tr>
		</table>
		</td>
	</tr>
  </table>