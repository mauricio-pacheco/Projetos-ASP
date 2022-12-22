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
# Description: display screen resolution counter                        #
# Last Update: 18 Dec 2004 23:50                                        #
#-----------------------------------------------------------------------#


$sw = $db->getResult("select * from is_screen order by count desc");
?>
<table width="585" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td bgcolor="#CCCCCC">&nbsp;<b><?=$text["sw_title"]?></b></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td align="center"><img src="printImage.php?type=sw" border="0"></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td align="center">
		<table width="50%" border="0" cellspacing="1" cellpadding="3" bgcolor="#CCCCCC">
			<tr bgcolor="#DDDDDD">
				<td><b><?=$text["sw_sw"]?></b></td>
				<td align="right"><b><?=$text["sw_count"]?></b>&nbsp;</td>
			</tr>
			<?
			for($i=0; $i<sizeof($sw); $i++){
				if($i % 2){
					$bg_color = "#E6E6E6";
				}else{
					$bg_color = "#FFFFFF";
				}
				echo "<tr bgcolor=\"" . $bg_color . "\"><td>" . $sw[$i]["width"] . "</td><td align=\"right\">" . $sw[$i]["count"] . "&nbsp;</td></tr>";
			}
			?>
		</table>
		</td>
	</tr>
</table>