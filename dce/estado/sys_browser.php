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
# Description: display browser counter                                  #
# Last Update: 18 Dec 2004 23:50                                        #
#-----------------------------------------------------------------------#


$browser = $db->getResult("select * from is_browser order by count desc");
?>
<table width="585" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td bgcolor="#CCCCCC">&nbsp;<b><?=$text["browser_title"]?></b></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td align="center"><img src="printImage.php?type=browser" border="0"></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td align="center">
		<table width="50%" border="0" cellspacing="1" cellpadding="3" bgcolor="#CCCCCC">
			<tr bgcolor="#DDDDDD">
				<td><b><?=$text["browser_browser"]?></b></td>
				<td align="right"><b><?=$text["browser_count"]?></b>&nbsp;</td>
			</tr>
			<?
			for($i=0; $i<sizeof($browser); $i++){
				if($i % 2){
					$bg_color = "#E6E6E6";
				}else{
					$bg_color = "#FFFFFF";
				}
				echo "<tr bgcolor=\"" . $bg_color . "\"><td>" . $browser[$i]["browser"] . "</td><td align=\"right\">" . $browser[$i]["count"] . "&nbsp;</td></tr>";
			}
			?>
		</table>
		</td>
	</tr>
</table>