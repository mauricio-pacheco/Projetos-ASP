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
# Description: display page counter                                     #
# Last Update: 18 Dec 2004 23:50                                        #
#-----------------------------------------------------------------------#


$page = $db->getResult("select * from is_page order by count desc limit 50");
$sum = $db->getResult("select sum(count) as sum from is_page");
$max = $db->getResult("select max(count) as max from is_page");
$report = PrintStats($sum[0]["sum"], $max[0]["max"], $page, sizeof($page), 30);
?>

<table width="585" border="0" bgcolor="#CCCCCC" cellspacing="1" cellpadding="3">
	<tr bgcolor="#CCCCCC">
		<td><b>&nbsp;<?=$text["page_page"]?></b></td>
		<td width="10%" align="center"><b>&nbsp;<?=$text["page_count"]?></b></td>
	</tr>
<?
for($i=0; $i<sizeof($page); $i++){
?>
	<tr bgcolor="<?=$report[$i]["bg_color"]?>">
		<td><?=$page[$i]["page"]?></td>
		<td align="center"><?=$page[$i]["count"]?></td>
	</tr>
<?
}
?>
</table>