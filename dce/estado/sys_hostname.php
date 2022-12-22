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
# Description: display hostname counter                                 #
# Last Update: 18 Dec 2004 23:50                                        #
#-----------------------------------------------------------------------#


$hostname = $db->getResult("select * from is_hostname order by count desc limit 50");
$sum = $db->getResult("select sum(count) as sum from is_hostname");
$max = $db->getResult("select max(count) as max from is_hostname");
$report = PrintStats($sum[0]["sum"], $max[0]["max"], $hostname, sizeof($hostname), 280);
?>

<table width="585" border="0" bgcolor="#CCCCCC" cellspacing="1" cellpadding="3">
	<tr bgcolor="#CCCCCC">
		<td width="30%"><b>&nbsp;<?=$text["hostname_hostname"]?></b></td>
		<td><b>&nbsp;<?=$text["hostname_percent"]?></b></td>
		<td width="10%" align="center"><b>&nbsp;<?=$text["hostname_count"]?></b></td>
	</tr>
<?
for($i=0; $i<sizeof($hostname); $i++){
?>
	<tr bgcolor="<?=$report[$i]["bg_color"]?>">
	  <td><?=$hostname[$i]["hostname"]?></td>
	  <td><img src="images/barsunrise.gif" width="<?=$report[$i]["bar"]?>" height="10" /><img src="images/bargray.gif" width="<?=$report[$i]["bg_bar"]?>" height="10" />
        <?=$report[$i]["percent"]?>
%</td>
	  <td align="center"><?=$hostname[$i]["count"]?></td>
  </tr>
<?
}
?>
</table>
