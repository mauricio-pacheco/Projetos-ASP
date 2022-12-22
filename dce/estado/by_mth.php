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
# Description: display mounth counter                                   #
# Last Update: 18 Dec 2004 23:50                                        #
#-----------------------------------------------------------------------#


$data = $db->getResult("select * from is_mth where year='".date("Y")."' order by mth desc");
$sum = $db->getResult("select sum(count) as sum from is_mth where year='".date("Y")."'");
$max = $db->getResult("select max(count) as max from is_mth where year='".date("Y")."'");
$report = PrintStats($sum[0]["sum"], $max[0]["max"], $data, sizeof($data), 350);
?>
  <table width="585" border="0" cellspacing="0" cellpadding="0">
    <tr bgcolor="#CCCCCC">
      <td>&nbsp;<b><?=$text["mth_title"]?></b></td>
    </tr>
	<tr>
	  <td>&nbsp;</td>
	</tr>
	<tr>
      <td height="225"><img src="month_day_traffic.php" border="0"></td>
    </tr>
  </table>
  <br><br>
  <table width="585" border="0" bgcolor="#CCCCCC" cellspacing="1" cellpadding="1">
	<tr bgcolor="#CCCCCC">
		<td width="15%"><b>&nbsp;<?=$text["mth_mth"]?></b></td>
		<td><b>&nbsp;<?=$text["mth_percent"]?></b></td>
		<td width="10%" align="center"><b>&nbsp;<?=$text["mth_count"]?></b></td>
	</tr>
<?
for($i=0; $i<sizeof($data); $i++){
?>
	<tr bgcolor="<?=$report[$i]["bg_color"]?>">
		<td><?=date("Y") . "/" . $data[$i]["mth"]?></td>
		<td><img src="images/barsunrise.gif" width="<?=$report[$i]["bar"]?>" height="10"><img src="images/bargray.gif" width="<?=$report[$i]["bg_bar"]?>" height="10"> <?=$report[$i]["percent"]?> %</td>
		<td align="center"><?=$data[$i]["count"]?></td>
	</tr>
<?
}
?>
</table>