<?php

/********************************************************/
/* Event Calendar for PHP-Nuke 7.0                      */
/*                                                      */
/* Based on Event Calendar 1.5 by Rob Sutton            */
/* Development & enhancments by Holbrookau and friends  */
/* http://phpnuke.holbrookau.net                        */
/********************************************************/
if (eregi("functions.php", $_SERVER['PHP_SELF'])) {
    die ("You can't access this file directly...");
}

function buildMonthSelect($month) {
	for ($i = 1; $i <= 12; $i++) {
		if ($i == $month) $sel = "SELECTED";
		else $sel = "";
		echo "<option $sel value=\"$i\">$i\n</option>";
  }
} // buildMonthSelect

function buildDaySelect($day) {
	for ($i = 1; $i <= 31; $i++) {
		if ($i == $day) $sel = "SELECTED";
		else $sel = "";
		echo "<option $sel value=\"$i\">$i\n</option>";
	}
} // buildDaySelect

function buildYearSelect($year) {
	for ($i = 1997; $i <= 2030; $i++) {
		if ($i == $year) $sel = "SELECTED";
		else $sel = "";
		echo "<option $sel value=\"$i\">$i\n</option>";
	}
} // buildYearSelect


function buildHourSelect($hour) {
	global $time24Hour;
	if (!($time24Hour)) {
		for ($i = 1; $i <= 12; $i++) {
			if ($i == $hour) $sel = "SELECTED";
			else $sel = "";
			echo "<option $sel value=\"$i\">$i</option>\n";
		}
	} else {
		for ($i = 0; $i <= 23; $i++) {
			if ($i == $hour) $sel = "SELECTED";
			else $sel = "";
			echo "<option $sel value=\"$i\">";
			if ($i<10) echo "0";
			echo "$i</option>\n";
		}
	}
} // buildHourSelect

function buildMinSelect($min) {
	for ($i = 0; $i <= 45;) {
		if (($i == $min) | (($i == 0) & ($min == "00"))) $sel = "SELECTED";
		else $sel = "";
		if ($i == 0) echo "<option $sel value=\"00\">:00</option>\n";
		else echo "<option $sel value=\"$i\">:$i</option>\n";
		$i = $i + 15;
	}
} // buildMinSelect

function buildAMPMSelect($ampm) {
	if ($ampm == "AM") $sel = "SELECTED";
	else $sel = "";
	echo "<option $sel value=\"AM\">AM</option>\n";
	if ($ampm == "PM") $sel = "SELECTED";
	else $sel = "";
	echo "<option $sel value=\"PM\">PM</option>\n";
} // buildAMPMSelect

function getTimeFormat($hour,$min,$ampm) {
	if (($ampm == "AM") & ($hour == "12")) {
		$hour = "00";
  } elseif (($ampm == "PM") & ($hour != "12")) {
		$hour = 12 + $hour;
	}
	$time = "$hour:$min:00";
	return $time;
} // getTimeFormat


function getTime($time) {
	$time_Array = explode(":",$time);
	$min = $time_Array[1];
	if ($time_Array[0] == "00") {
		$hour = "12";
		$ampm = "AM";
	} elseif ($time_Array[0] == "12") {
		$hour = "12";
		$ampm = "PM";
	} elseif ($time_Array[0] > 12) {
		$hour = $time_Array[0] - 12;
		$ampm = "PM";
	} else {
		if ($time_Array[0] < 10) {
			$hour = substr($time_Array[0],1,1);
			$ampm = "AM";
		} else {
			$hour = $time_Array[0];
			$ampm = "AM";
		}
	}
	$time = "$hour:$min $ampm";
	return $time;
} // getTime


function BuildEventEditor($subject, $topic, $StartDate, $EndDate, $StartTime, $EndTime, $alldayevent, $barcolor, $story) {
	global $prefix, $dbi, $time24Hour,$useInternationalDates, $AllowableHTML, $calcat1, $calcat2, $calcat3, $calcat4, $calcat5;

	/*******************************************************/
	/* Subject, and event topic selection                  */
	/*******************************************************/
	echo "<br><br><b>"._CALSUBTITLE."</b><br>\n";
	// If the subject is empty, then output the 'be descriptive' message
	if ($subject == "") {
		echo "("._CALBEDESCRIPTIVE.")<br>";
	}
	echo "<input type=\"text\" name=\"subject\" size=\"50\" maxlength=\"80\" value=\"$subject\">";
	echo "<br><br>";
	echo "<b>"._CALTOPIC.":</b> <select name=\"topic\">";
	$toplist = sql_query("select topicid, topictext from ".$prefix."_topics order by topictext", $dbi);
	echo "<OPTION VALUE=\"\">"._CALSELECTTOPIC."</option>\n";
	while(list($topicid, $topics) = sql_fetch_row($toplist)) {
		if ($topicid==$topic) { $sel = "selected "; }
		echo "<option $sel value=\"$topicid\">$topics</option>\n";
		$sel = "";
	}
	echo "</select>";

	/*******************************************************/
	/* Creates Date and Time selections for event entry    */
	/* and editing.  Eventually, this should be expanded   */
	/* to do the entire entry, or have more similar routine*/
	/* - Should also use this in Admin functions           */
	/*******************************************************/
	if ($EndDate == "") {
	  $EndDate = $StartDate;
	}
	$StartDate = ereg_replace("/","-",$StartDate);
	$EndDate = ereg_replace("/","-",$EndDate);

	$Start_Array = explode("-",$StartDate);
	$End_Array = explode("-",$EndDate);

	// This routine expects MySQL formatted dates,
	// convert m-d-y to y-m-d
	if ($Start_Array[2] > 31) {
	  $Temp = $Start_Array[2]; // Year
	  $Start_Array[2] = $Start_Array[1]; // day
	  $Start_Array[1] = $Start_Array[0]; // Month
	  $Start_Array[0] = $Temp;
	}
	if ($End_Array[2] > 31) {
	  $Temp = $End_Array[2]; // Year
	  $End_Array[2] = $End_Array[1]; // day
	  $End_Array[1] = $End_Array[0]; // Month
	  $End_Array[0] = $Temp;
	}

	if (!ereg("AM|PM", $StartTime)) {
		if ($time24Hour) {
			$time_Array = explode(":",$StartTime);
			$StartTime = $time_Array[0].":".$time_Array[1];
		} else {
			$StartTime = getTime($StartTime);
		}
	}
	if (!ereg("AM|PM", $EndTime)) {
		if ($time24Hour) {
			$time_Array = explode(":",$EndTime);
			$EndTime = $time_Array[0].":".$time_Array[1];
		} else {
			$EndTime = getTime($EndTime);
		}
	}

	// This is an ugly hack, but works
	$StartTime = ereg_replace(" ",":", $StartTime);
	$EndTime = ereg_replace(" ",":", $EndTime);

	$Start_Time_Array = explode(":",$StartTime);
	$End_Time_Array = explode(":",$EndTime);


	echo "<table border=\"0\" cellpadding=\"0\" cellspacing=\"1\" bgcolor=\"$bgcolor2\"><tr><td>&nbsp;";
  echo "</td></tr><tr><td>";
	echo "<b>"._CALEVENTDATETEXT."</b>:&nbsp;\n</td><td>";
	if ($useInternationalDates) {
		echo "<select name=\"day\">";
		buildDaySelect($Start_Array[2]);
		echo "</select><select name=\"month\">";
		buildMonthSelect($Start_Array[1]);
		echo "</select>";
	} else {
		echo "<select name=\"month\">";
		buildMonthSelect($Start_Array[1]);
		echo "</select><select name=\"day\">";
		buildDaySelect($Start_Array[2]);
		echo "</select>";
	}
	echo "<select name=\"year\">";
	buildYearSelect($Start_Array[0]);
	echo "</select></td></tr>";


	echo "<tr><td>";
	echo "<b>"._CALENDDATETEXT."</b>:&nbsp;</td><td>";
	if ($useInternationalDates) {
		echo "<select name=\"endday\">";
		buildDaySelect($End_Array[2]);
		echo "</select><select name=\"endmonth\">";
		buildMonthSelect($End_Array[1]);
		echo "</select>";
	} else {
		echo "<select name=\"endmonth\">";
		buildMonthSelect($End_Array[1]);
		echo "</select><select name=\"endday\">";
		buildDaySelect($End_Array[2]);
		echo "</select>";
	}
	echo "<select name=\"endyear\">";
	buildYearSelect($End_Array[0]);
	echo "</select></td></tr>";

	echo "<tr><td>&nbsp;</td></tr><tr><td><b>"._CALSTARTTIME."</b>:</td>"
			."<td><select name=\"startHour\">";
	buildHourSelect($Start_Time_Array[0]);
	echo "</select><select name=\"startMin\">";
	buildMinSelect($Start_Time_Array[1]);
	echo "</select>";
	if (!($time24Hour)) {
		echo "<select name=\"startampm\">";
		buildAMPMSelect($Start_Time_Array[2]);
		echo "</select>";
	}

	echo "</td></tr><tr><td>";
	echo "<b>"._CALENDTIME."</b>:</td>"
			."<td><select name=\"endHour\">";
	buildHourSelect($End_Time_Array[0]);
	echo "</select><select name=\"endMin\">";
	buildMinSelect($End_Time_Array[1]);
	echo "</select>";
	if (!($time24Hour)) {
		echo "<select name=\"endampm\">";
		buildAMPMSelect($End_Time_Array[2]);
		echo "</select>";
	}
	echo "</td></tr></table>";

  // Build all day checkbox
	$check = "";
	if ($alldayevent == "1") {
		$check = "CHECKED=TRUE";
	}
	echo "<br><input name=\"alldayevent\" $check type=\"checkbox\" value=\"1\">&nbsp;<b>"._CALALLDAYEVENT
			."</b><br><font size=1>("._CALTIMEIGNORED.")</font>";
			
	// Build color radio buttons
	echo "<br><br><b>"._CALBARCOLORTEXT."</b>:<br>";
	if ($barcolor=="r") $sel="CHECKED"; else $sel="";
	echo "<input type=\"radio\" $sel name=\"barcolor\" value=\"r\">$calcat1&nbsp;<img src=\"images/calendar/ballr.gif\" alt=\"\">&nbsp;&nbsp;&nbsp;";
	if ($barcolor=="g") $sel="CHECKED"; else $sel="";
	echo "<input type=\"radio\" $sel name=\"barcolor\" value=\"g\">$calcat2&nbsp;<img src=\"images/calendar/ballg.gif\" alt=\"\">&nbsp;&nbsp;&nbsp;";
	if ($barcolor=="b") $sel="CHECKED"; else $sel="";
	echo "<input type=\"radio\" $sel name=\"barcolor\" value=\"b\">$calcat3&nbsp;<img src=\"images/calendar/ballb.gif\" alt=\"\">&nbsp;&nbsp;&nbsp;";
	if ($barcolor=="w") $sel="CHECKED"; else $sel="";
	echo "<input type=\"radio\" $sel name=\"barcolor\" value=\"w\">$calcat4&nbsp;<img src=\"images/calendar/ballw.gif\" alt=\"\">&nbsp;&nbsp;&nbsp;";
	if ($barcolor=="y") $sel="CHECKED"; else $sel="";
	echo "<input type=\"radio\" $sel name=\"barcolor\" value=\"y\">$calcat5&nbsp;<img src=\"images/calendar/bally.gif\" alt=\"\"><br>";

	// long text editor
	echo "<br><br><b>"._CALARTICLETEXT."</b>:("._CALHTMLISFINE.")<br>"
			."<textarea cols=\"50\" rows=\"12\" name=\"story\">$story</textarea><br>"
			."<font size=\"2\">"._CALALLOWEDHTML."<br>";
	while (list($key,) = each($AllowableHTML)) echo " &lt;".$key."&gt;";
}

?>