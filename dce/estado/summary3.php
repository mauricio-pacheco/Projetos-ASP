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
# Description: display summary stats                                    #
# Last Update: 18 Dec 2004 23:50                                        #
#-----------------------------------------------------------------------#

$summary = CountDays();
?>
<table width="585" border="0" bgcolor="#CCCCCC" cellspacing="1" cellpadding="3">
	<tr>
      <td colspan ="4" bgcolor="#CCCCCC"><b><?=$text['summary']?></b></td>
    </tr>
	<tr>
      <td width="28%" bgcolor="#FFFFFF"><?=$text['total_visit']?></td>
      <td width="22%" bgcolor="#FFFFFF"><?=$summary['total']?></td>
      <td width="28%" bgcolor="#FFFFFF"><?=$text['total_day']?></td>
      <td width="22%" bgcolor="#FFFFFF"><?=$summary['days']?></td>
    </tr>
	<tr>
      <td width="28%" bgcolor="#E6E6E6"><?=$text['today_visit']?></td>
      <td width="22%" bgcolor="#E6E6E6"><?=$summary['today']?></td>
      <td width="28%" bgcolor="#E6E6E6"><?=$text['ava_day']?></td>
      <td width="22%" bgcolor="#E6E6E6"><?printf ("%.0f", $summary['ava_day']);?></td>
    </tr>
	<tr>
      <td width="28%" bgcolor="#FFFFFF"><?=$text['week_visit']?></td>
      <td width="22%" bgcolor="#FFFFFF"><?=$summary['this_week']?></td>
	  <td width="28%" bgcolor="#FFFFFF"><?=$text['ava_week']?></td>
      <td width="22%" bgcolor="#FFFFFF"><?printf ("%.0f", $summary['ava_week']);?></td>
    </tr>
    <tr>
      <td width="28%" bgcolor="#E6E6E6"><?=$text['mth_visit']?></td>
      <td width="22%" bgcolor="#E6E6E6"><?=$summary['this_mth']?></td>
	  <td width="28%" bgcolor="#E6E6E6"><?=$text['ava_mth']?></td>
      <td width="22%" bgcolor="#E6E6E6"><?printf ("%.0f", $summary['ava_mth']);?></td>
    </tr>
    <tr>
      <td width="28%" bgcolor="#FFFFFF"><?=$text['online_visitor']?></td>
      <td width="22%" bgcolor="#FFFFFF"><?=$summary['online']?></td>
	  <td width="28%" bgcolor="#FFFFFF"><?=$text['ava_hour']?></td>
      <td width="22%" bgcolor="#FFFFFF"><?printf ("%.2f",$summary['ava_hour']);?></td>
    </tr>
    <tr>
      <td width="28%" bgcolor="#E6E6E6"><?=$text['busiest_day_visit']?></td>
      <td width="22%" bgcolor="#E6E6E6"><?=$summary['max_daycount']?></td>
	  <td width="28%" bgcolor="#E6E6E6"><?=$text['busiest_day']?></td>
      <td width="22%" bgcolor="#E6E6E6"><?=$summary['max_date']?></td>
    </tr>
    <tr>
      <td width="28%" bgcolor="#FFFFFF"><?=$text['busiest_week_visit']?></td>
      <td width="22%" bgcolor="#FFFFFF"><?=$summary['max_weekcount']?></td>
	  <td width="28%" bgcolor="#FFFFFF"><?=$text['busiest_week']?></td>
      <td width="22%" bgcolor="#FFFFFF"><?=date("Y-m-d", $summary['max_week'])?></td>
    </tr>
    <tr>
      <td width="28%" bgcolor="#E6E6E6"><?=$text['busiest_mth_visit']?></td>
      <td width="22%" bgcolor="#E6E6E6"><?=$summary['max_mthcount']?></td>
	  <td width="28%" bgcolor="#E6E6E6"><?=$text['busiest_mth']?></td>
      <td width="22%" bgcolor="#E6E6E6"><?=$summary['max_mth']?></td>
    </tr>
</table>
<br>
<table width="585" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
	<td valign="top">
	<table border="0" cellspacing="0" cellpadding="3" width="85%" class="border2">
	<tr>
		<td colspan="3" bgcolor="#CCCCCC"><b><?=$text["by_day"]?></b></td>
	</tr>
<?
$db->query("select * from is_daycount order by date desc limit 4");
$day_no = 0;
while($day_visitors = $db->getRows()){
	if($day_no % 2){
		$bgcolor = "#FFFFFF";
	}else{
		$bgcolor = "#E6E6E6";
	}
	$day_no++;
?>

	<tr>
		<td width="7%" height="15" bgcolor="#E6E6E6">&nbsp;</td>
		<td bgcolor="<?=$bgcolor?>">&nbsp;<b><?=$day_visitors["date"]?></b></td>
		<td bgcolor="<?=$bgcolor?>" width="20%" align="right"><b><?=$day_visitors["daycount"]?></b>&nbsp;&nbsp;</td>
	</tr>
<?
}
?>
	</table>
	</td>
	<td width="250" valign="top">
	<table width="100%" border="0" bgcolor="#CCCCCC" cellspacing="1" cellpadding="3">
	<tr>
      <td><b><?=$text['forecast']?></b></td>
    </tr>
    <tr bgcolor="#E6E6E6">
<?
if(date("H") == "00"){
	$hour_info[0]['sum'] = 0;
}else{
	$hour_info = $db->getResult("select sum(count) as sum from is_hour where hour between '00' and '".date("H", time()-3600)."'");
}
$hour_sum = $db->getResult("select sum(count) as sum from is_hour");
$per_hour_info = $db->getResult("select count from is_hour where hour='".date("H")."'");

if($hour_sum[0]['sum'] > 0){
	$gone_mins = date("i") / 60;
	$hour_info[0]['sum'] += intval($per_hour_info[0]['count'] * $gone_mins);
	$today_hour_percent = $hour_info[0]['sum'] / $hour_sum[0]['sum'];
	$cur_percent = $today_hour_percent * 100;
    if($today_hour_percent > 0){
		$today_hits = $summary['today'] / $today_hour_percent;
	}else{
		$today_hits = 0;
	}
}else{
	$cur_percent = 0;
	$today_hits = 0;
}

// count error rate with forecast visitor/s, it is 5% error rate
$error_rate = ($today_hits - $summary['today']) * 0.05;

$text['forecast_text'] = str_replace("{1}", sprintf ("%.2f", $cur_percent), $text['forecast_text']);
$text['forecast_text'] = str_replace("{2}", date("H:i"), $text['forecast_text']);
$text['forecast_text'] = str_replace("{3}", $summary['today'], $text['forecast_text']);
$text['forecast_text'] = str_replace("{4}", intval($today_hits), $text['forecast_text']);

echo "<td>" . $text['forecast_text'] . " (+/- " . intval($error_rate) . ")</td>";
?>
    </tr>
	</table>
	</td>
</tr>
</table>
<br>
<table border="0" cellspacing="1" cellpadding="2" align="center" width="585">
  <TR>
	<TD colspan="5" bgcolor="#CCCCCC"><b>&nbsp;Últimas Visitas</b></TD>
</TR>
<?
$db->query("select * from is_last_visitor order by time desc limit 1000");
$bg_i = 0;
while($l_visitor = $db->getRows()){
	if($bg_i % 2){
		$bg_color = "#DDDDDD";
	}else{
		$bg_color = "#FFFFFF";
	}
	$bg_i++;

	if($l_visitor['referer'] == ""){
		$l_visitor['referer'] = "<i>Acesso Direto</i>";
	}elseif(strlen($l_visitor['referer']) > 40){
		$l_visitor['referer'] = "<a href=\"".$l_visitor['referer']."\" target=\"_blank\">" . substr($l_visitor['referer'], 0, 37) . "...</a>";
	}else{
		$l_visitor['referer'] = "<a href=\"".$l_visitor['referer']."\" target=\"_blank\">" . $l_visitor['referer'] . "</a>";
	}
?>
<TR bgcolor="<?=$bg_color?>">
	<TD width="25">&nbsp;<?=$bg_i?></TD>
	<TD width="125">&nbsp;<?=date("d M Y&\\nb\sp; H:i", $l_visitor['time'])?></TD>
	<TD width="120">&nbsp;<?=$l_visitor['hostname']?></TD>
	<TD>&nbsp;<?=$l_visitor['referer']?></TD>
	</TR>
<?
}
?>
</table>