<?php

/********************************************************/
/* Event Calendar for PHP-Nuke 7.0                      */
/*                                                      */
/* Based on Event Calendar 1.5 by Rob Sutton            */
/* Development & enhancments by Holbrookau and friends  */
/* http://phpnuke.holbrookau.net                        */
/********************************************************/
/********************************************************/

if (!eregi("modules.php", $_SERVER['PHP_SELF'])) {
    die ("You can't access this file directly...");
}
// START COMMENTS

$index = 0;
$module_name = "Calendar";  // CHANGE THIS IF YOU CHANGE THE MODULES FOLDER NAME
include("modules/$module_name/config.php");
include("modules/$module_name/functions.php");


function CalendarDisplayComments($eid) {
	global $module_name,$combgcolor,$comtextcolor,$allowcomments,$user,$admin,$cid, $dbi, $prefix;
	$eid2 = $eid;
	if ($allowcomments) {
		$out = "<table cellpadding=\"2\" cellspacing=\"3\" width=\"100%\">"
				 ."<tr><td width=\"100%\" colspan=\"3\" align=\"center\"><br><br><b>"._CALCOMMPOST."</b><br><br></td></tr>";
		$result3 = sql_query("select cid, eid, comment, date, name from ".$prefix."_events_comments where eid=$eid order by date ASC",$dbi);
		if (sql_num_rows($result3) == 0) {
			$out .= "<tr><td colspan=\"2\" align=\"center\">"._CALNOCOMM."</font></td></tr>\n";
		}	else {
			while(list($cid, $eid, $comment, $date, $name) = sql_fetch_array($result3)) {
				$poster = "<a href=\"modules.php?name=Your_Account&op=userinfo&username=$name\"><font color=\"$comtextcolor\">$name</font></a>\n";
				$out .= "<tr><td nowrap width=\"25%\" align=\"left\" bgcolor=\"$combgcolor\" valign=\"top\">\n"
							."<font color=\"$comtextcolor\">&nbsp;<b>"._CALCOMMENTPOSTED."</b> $poster<br>&nbsp;<b>"._CALCOMMENTON."</b> $date<br></font>\n";
				if (is_admin($admin)) {
					$out .= "&nbsp;[ <a href=\"modules.php?name=$module_name&op=CalendarEditComments&cid=$cid&eid=$eid\"><font color=\"$comtextcolor\">"._CALCOMMENTEDIT
								."</font></a> | <a href=\"modules.php?name=$module_name&op=CalendarRemoveComments&cid=$cid&eid=$eid\">"
								._CALCOMMENTDELETE."</a> ]\n";
				}
				$out .= "</td><td width=\"75%\" align=\"left\" bgcolor=\"$combgcolor\" valign=\"top\"><font color=\"$comtextcolor\">&nbsp;$comment</font></td>";
				$out .= "</tr><tr><td>&nbsp;</td></tr>";
			}
		}
		$out .= "<tr><td colspan=\"2\" align=\"center\">"._CALCOMMENTINVITE."</td></tr>\n"
					."<tr><td colspan=\"2\">\n"
					."<form action=\"modules.php?name=$module_name&op=CalendarPostComments\" method=\"post\">\n"
					."<b>"._CALCOMMENTNAME."</b><br>\n"
					."<input type=\"text\" size=\"20\" name=\"ename\" value=\"$user\"><br><br>\n"
					."<b>"._CALCOMMENTBOX."</b><br>\n"
					."<textarea cols=\"50\" rows=\"5\" name=\"comment\"></textarea><br><br>\n"
					."<input type=\"hidden\" name=\"eid\" value=\"$eid2\">\n"
					."<input type=\"reset\" value=\"Reset\"> <input type=\"submit\" value=\"Post\">\n"
					."</form>\n"
					."</td></tr></table>\n";
		return $out;
  }
} // CalendarDisplayComments


function CalendarPostComments() {
	global $eid, $comment, $ename, $module_name,$prefix,$dbi;
	header("location: modules.php?name=$module_name&file=index&type=view&eid=$eid");
	sql_query("insert into ".$prefix."_events_comments values (NULL, '$eid', '$comment', now(), '$ename')",$dbi)
			or die("Error: unable to insert comment into Database!");
	exit;
} // CalendarPostComments

function CalendarRemoveComments($eid,$cid,$ok=0) {
	global $cid ,$eid,$admin,$module_name, $dbi, $prefix;
	include ("header.php");
	if (is_admin($admin)) {
		if($ok) {
		Header("Location: modules.php?name=$module_name&file=index&type=view&eid=$eid");
		sql_query("delete from ".$prefix."_events_comments where cid=$cid limit 1",$dbi);
		exit;
	} else {
		OpenTable();
		echo "<center>"._CALCOMMENTSURE."<br>";
		echo "<br>[ <a href=\"modules.php?name=$module_name&file=index&type=view&eid=$eid\">"
				._CALNO."</a> | <a href=\"modules.php?name=$module_name&op=CalendarRemoveComments&cid=$cid&eid=$eid&ok=1\">"
				._CALYES."</a> ]</center>\n";
		CloseTable();
	}
	} else {
		OpenTable();
		echo "No Access";
		CloseTable();
	}
	include ("footer.php");
} // CalendarRemoveComments


function CalendarEditComments($eid,$cid) {
	global $module_name,$combgcolor,$comtextcolor,$allowcomments,$admin,$cid,$module_name, $dbi, $prefix;
	include("header.php");
	OpenTable();
	if (is_admin($admin)) {
		echo "<table width=\"100%\"><tr><td width=\"100%\" colspan=3 align=center><b>"
				._CALCOMMENTADMIN."</b><br><br></td></tr>\n";
		$result3 = sql_query("select cid, eid, comment, date, name from ".$prefix."_events_comments where cid=$cid", $dbi);
		list($cid, $eid, $comment,$date, $name) = sql_fetch_array($result3);
		$poster ='<a href="modules.php?name=Your_Account&op=userinfo&username='.$name.'"><font color="'.$comtextcolor.'\n">'
						.$name.'</font></a>';
		echo "<tr><td nowrap width=30% align=left bgcolor=$combgcolor valign=top ><b><font color=$comtextcolor>"
				._CALCOMMENTPOSTED."</b> ".$poster."<br><b>"._CALCOMMENTON."</b> ".$date."<br>\n";
		echo "<td width=70% align=left bgcolor=$combgcolor valign=top><font color=$comtextcolor>"
				.$comment."</font></td></tr><tr><td>&nbsp;</td></tr>\n";

		echo "<tr><td colspan=2>"
				."<form action=\"modules.php?name=$module_name&op=CalendarRePostComments\" method=\"post\">\n"
				."<b>"._CALCOMMENTEDITBOX."</b><br>\n"
				."<textarea class=\"textbox\" wrap=\"virtual\" cols=\"50\" rows=\"5\" name=\"comment\">$comment</textarea>\n"
				."<input type=\"hidden\" name=\"cid\" value=$cid>\n"
				."<input type=\"hidden\" name=\"eid\" value=$eid><br>\n"
				."<input type=\"reset\" value="._CALRESET."> <input type=\"submit\" value="._CALSAVE.">\n"
				."</form>\n"
				."</td></tr></table>\n";
		CloseTable();
  } else {
		header("location: modules.php?name=$module_name&file=index&type=view&eid=$eid");
	}
	include("footer.php");
} // CalendarEditComments


function CalendarRePostComments() {
	global $cid, $eid, $comment,$module_name, $dbi, $prefix;
	header("location: modules.php?name=$module_name&file=index&type=view&eid=$eid");
	sql_query("update ".$prefix."_events_comments set comment='$comment'where cid=$cid", $dbi)
			or die("Error: unable to insert new comment into Database!");
	exit;
} // CalendarRePostComments

//END COMMENTS


function printAppt($sql) {
	global $module_name,$eventsopeninnewwindow,$time24Hour, $prefix, $dbi;
	$result = sql_query($sql,$dbi);
	if (sql_num_rows($result) == 0) echo "<br>";
	if ($eventsopeninnewwindow) {
		$frame = "target=\"blank\"";
	} else {
		$frame = "";
	}
	while(list($eid, $title, $startTime, $endTime, $barcolor) = sql_fetch_row($result)) {
		if ($barcolor == "r") $barcolorchar="r";
		elseif ($barcolor == "g") $barcolorchar="g";
		elseif ($barcolor == "b") $barcolorchar="b";
		elseif ($barcolor == "y") $barcolorchar="y";
		else $barcolorchar="w";
		if ($time24Hour) {
			$time_Array = explode(":",$startTime);
			$startTime = $time_Array[0].":".$time_Array[1];
			$time_Array = explode(":",$endTime);
			$endTime = $time_Array[0].":".$time_Array[1];
		} else {
			$startTime = getTime($startTime);
			$endTime = getTime($endTime);
		}
		print("<br><img src=\"images/calendar/ball$barcolorchar.gif\" alt=\"\" border=0>&nbsp;"
				."<a href=\"modules.php?name=$module_name&file=index&type=view&eid=$eid\" $frame>"
				."$startTime-$endTime, $title</a>");
	}
	sql_free_result($result);
} // printAppt


function getMonthName($Date) {
	$month = Date("m",$Date);
	if ($month == "01") {
		$monthname = _CALJAN;
	} elseif ($month == "02") {
		$monthname = _CALFEB;
	} elseif ($month == "03") {
		$monthname = _CALMAR;
	} elseif ($month == "04") {
		$monthname = _CALAPR;
	} elseif ($month == "05") {
		$monthname = _CALMAY;
	} elseif ($month == "06") {
		$monthname = _CALJUN;
	} elseif ($month == "07") {
		$monthname = _CALJUL;
	} elseif ($month == "08") {
		$monthname = _CALAUG;
	} elseif ($month == "09") {
		$monthname = _CALSEP;
	} elseif ($month == "10") {
		$monthname = _CALOCT;
	} elseif ($month == "11") {
		$monthname = _CALNOV;
	} elseif ($month == "12") {
		$monthname = _CALDEC;
	}
	return $monthname;
} // getMonthName

function getLongDayName($Date) {
	$month = Date("w",$Date);
	if ($month == "0") {
		$dayname = _CALLONGFIRSTDAY;
	} elseif ($month == "1") {
		$dayname = _CALLONGSECONDDAY;
	} elseif ($month == "2") {
		$dayname = _CALLONGTHIRDDAY;
	} elseif ($month == "3") {
		$dayname = _CALLONGFOURTHDAY;
	} elseif ($month == "4") {
		$dayname = _CALLONGFIFTHDAY;
	} elseif ($month == "5") {
		$dayname = _CALLONGSIXTHDAY;
	} elseif ($month == "6") {
		$dayname = _CALLONGSEVENTHDAY;
	}
	return $dayname;
} // getLongDayName

function valueToText($tmp) {
	$tmp = ereg_replace(10,"",$tmp);
	$tmp = ereg_replace(9,"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;",$tmp);
	$tmp = ereg_replace("<","&lt;",$tmp);
	$tmp = ereg_replace(">","&gt;",$tmp);
	$tmp = ereg_replace("\"","&quot;",$tmp);
	$tmp = ereg_replace(13,"<br>",$tmp);
	//$tmp = str_replace("\\","\\\\",$tmp);
	$tmp = ereg_replace("'","`",$tmp);
	return $tmp;
} // valueToText

function loadPopups() {
echo "<div id=\"overDiv\" style=\"position:absolute; visibility:hidden; z-index:1;\"></div>\n"
."<script language=\"JavaScript\" src=\"includes/overlib_mini.js\" type=\"text/javascript\"><!-- overLIB © Erik Bosrup --></script>";
} // loadPopups 

function buildYear($Date) {
	global $module_name,$yeartableborder,$yeartablecellspacing,$yeartablecellpadding,$trimbgcolor,$trimtextcolor,$yearbgcolor,$selecteddaycolor,$yeartextcolor, $eventbackground, $dbi, $prefix, $Week_Start;
	OpenTable();
	if (!$Date) {
		$Date = Date("m/d/Y");
	}
	$Date_Array = explode("/", $Date);
	if ($Date_Array[2] < 1970) {
		print("ERROR! System can not interpret dates befor 01/01/1970");
	} else {
		$Date = mktime("", "", "", $Date_Array[0], $Date_Array[1], $Date_Array[2]);

		/**** Header */
		$Prev_Year = mktime("", "", "", $Date_Array[0], $Date_Array[1], $Date_Array[2] - 1);
		$Prev_Date = Date("m/d/Y",$Prev_Year);
		$Next_Year = mktime("", "", "", $Date_Array[0], $Date_Array[1], $Date_Array[2] + 1);
		$Next_Date = Date("m/d/Y",$Next_Year);
		print("\n<TABLE width=\"100%\" border=0 cellpadding=0 cellspacing=0>\n<TR>");

		/**** Print Previous Year Button */
		print("\n\t<TD width=100><FONT FACE=ARIAL SIZE=2><a href=\"modules.php?name=$module_name&file=index&Date=$Prev_Date&type=year\"><<< "._CALPREVIOUS."</a></font></TD>");
		print("\n\t<TD align=center><FONT class=\"boxtitle\">");

		/**** Print Year */
		print(Date("Y",$Date));
		print("</FONT></TD>");

		/**** Print Next Year Button */
		print("\n\t<TD width=100 align=right><FONT FACE=ARIAL SIZE=2><a href=\"modules.php?name=$module_name&file=index&Date=$Next_Date&type=year\">"._CALNEXT." >>></a></font></TD>");
		print("\n</TR>\n</TABLE>\n<TABLE BORDER=0 cellpadding=6 width=\"100%\"><TR>");

		for ($i=1;$i<13;$i++) {
			/**** Get the Day (Integer) for the first day in the month */
			$First_Day_of_Month_Date = mktime("", "", "", $i, 1, $Date_Array[2]);
			$Date = $First_Day_of_Month_Date;
			$Date_Array[0] = $i;
			$Day_of_First_Week = Date("w",$First_Day_of_Month_Date) - $Week_Start;

			/**** Find the last day of the month */
			$Month = Date("m",$Date);
			$day = 27;
			do {
				$End_of_Month_Date = mktime("", "", "", $Date_Array[0], $day, $Date_Array[2]);
				$Test_Month = Date("m",$End_of_Month_Date);
				$day += 1;
			} while ( $Month == $Test_Month );
			$Last_Day = $day - 2;

			/**** Get todays date */
			$Today_d = Date("d");
			$Today_m = Date("m");
			$Today_y = Date("Y");

			/**** Build Month */
			// End row
			if (($i == 4) || ($i == 7) || ($i == 10)) {
				print("</TR><TR><TD colspan=3><br></TD></TR><TR>");
			}
			print("\n<TD valign=top align=center>\n<TABLE border=$yeartableborder cellspacing=$yeartablecellspacing cellpadding=$yeartablecellpadding>");
			print("\n<TR bgcolor=\"$trimbgcolor\">\n\t<TH colspan=7><FONT SIZE=1 color=\"$trimtextcolor\"><a href=\"modules.php?name=$module_name&file=index&Date=$i/1/$Date_Array[2]&type=month\"><FONT color=\"$trimtextcolor\">");
			print(getMonthName($Date) );
			print("</FONT></a></FONT></TH>\n</TR>");

			/**** Previous Greyed month days */
			print("\n<TR>");
			if ($Day_of_First_Week != 0)
			print("\n\t<TD colspan=$Day_of_First_Week><font face=arial size=1 color=\"ffffff\">&nbsp;</font></TD>");
			$day_of_week = $Day_of_First_Week + 1;

			/**** Build Current Month */
			for ($day = 1 ; $day <= $Last_Day ; $day++) {
				if (($day_of_week == 1) && ($day != 1)) {
					print("\n<TR>");
				}
				$thisbackground=$yearbgcolor;
				$anyevent = sql_query("SELECT eid,title,eventDate,endDate,startTime,endTime,barcolor FROM ".$prefix."_events WHERE (eventDate <= '$Date_Array[2]-$Date_Array[0]-$day' AND endDate >= '$Date_Array[2]-$Date_Array[0]-$day');", $dbi);
				if (sql_num_rows($anyevent) >= 1) {
					$thisbackground="$eventbackground";
				}
				if (($day == $Today_d) && ($Date_Array[0] == $Today_m) && ($Date_Array[2] == $Today_y)) {
					$thisbackground =$selecteddaycolor;
				}
				print("\n\t<TD width=\"10\" align=center bgcolor=\"$thisbackground\"><FONT FACE=ARIAL color=\"$yeartextcolor\" SIZE=1><a href=\"modules.php?name=$module_name&file=index&Date=$Date_Array[0]/$day/$Date_Array[2]&type=day\">$day</a></font></TD>");
				if ($day_of_week == 7) {
					$day_of_week = 0;
					print("\n</TR>");
				}
				$day_of_week += 1;
			}

			/**** Next Greyed month days */
			$day = 1;
			if ($day_of_week != 1) {
				$tmp = 8 - $day_of_week;
				print("<TD colspan=$tmp><font face=arial size=1 color=\"ffffff\">&nbsp;</font></TD>");
			}
			print("\n</TABLE>\n</TD>");
		}
		print("</TR></TABLE>");
	}
	CloseTable();
} // buildYear

function addTimeRange($startTime,$endTime,$year,$month,$day) {
	global $time24Hour,$daytextcolor, $prefix;
	if ($time24Hour) {
		$tmpTime = substr($startTime,0,5);
		$tmpTime2 = substr($endTime,0,5);
	} else {
		$tmpTime = getTime($startTime);
		$tmpTime2 = getTime($endTime);
	}
	print("\n\t\t<br><br><FONT COLOR=\"$daytextcolor\" SIZE=2>$tmpTime - $tmpTime2</FONT>");
	$sql = "SELECT eid, title, startTime, endTime, barcolor FROM ".$prefix."_events WHERE "
				."(eventDate<='$year-$month-$day' AND endDate >= "
				."'$year-$month-$day' AND alldayevent='0' AND startTime >= '$startTime' AND "
				."startTime < '$endTime' ) ORDER BY startTime, endTime ASC;";
	printAppt($sql);
} // addTimeRange

function buildDay($Date) {
	global $module_name, $trimbgcolor, $trimtextcolor, $trimbgcolor2, $trimtextcolor2, $daybgcolor, $prefix, $dbi, $daytextcolor, $eventsopeninnewwindow, $times, $calcat1, $calcat2, $calcat3, $calcat4, $calcat5;
	OpenTable();
	if (!$Date) {
		$Date = Date("m/d/Y");
	}
	$Date_Array = explode("/", $Date);
	if ($Date_Array[2] < 1970) {
		print("ERROR!<br> System can not interpret dates befor 01/01/1970, If you've used a 2 digit year please use a 4 digit one.");
	} else {
		$Date = mktime("", "", "", $Date_Array[0], $Date_Array[1], $Date_Array[2]);

		/**** Header */
		$Prev_Month = mktime("", "", "", $Date_Array[0], $Date_Array[1] - 1, $Date_Array[2]);
		$Prev_Date = Date("m/d/Y",$Prev_Month);
		$Next_Month = mktime("", "", "", $Date_Array[0], $Date_Array[1] + 1, $Date_Array[2]);
		$Next_Date = Date("m/d/Y",$Next_Month);
		echo "<center><table>\n"
."<tr><td width=\"100%\" align=\"center\">"._CALTYPES.":&nbsp;&nbsp;$calcat1&nbsp;<img src=\"images/calendar/ballr.gif\">&nbsp;&nbsp;&nbsp;$calcat2&nbsp;<img src=\"images/calendar/ballg.gif\">&nbsp;&nbsp;&nbsp;$calcat3&nbsp;<img src=\"images/calendar/ballb.gif\">&nbsp;&nbsp;&nbsp;$calcat4&nbsp;<img src=\"images/calendar/ballw.gif\">&nbsp;&nbsp;&nbsp;$calcat5&nbsp;<img src=\"images/calendar/bally.gif\"></td></tr></table></center><br />\n";
		print("\n<TABLE width=\"100%\">\n<TR>");

		/**** Print Previous Month Button */
		print("\n\t<TD width=100><FONT FACE=ARIAL SIZE=2><a href=\"modules.php?name=$module_name&file=index&Date=$Prev_Date&type=day\"><<< "._CALPREVIOUS."</a></font></TD>");
		print("\n\t<TD align=center><FONT class=\"boxtitle\">");

		/**** Print Month Name and Year */
		print(getLongDayName($Date).", ".getMonthName($Date)." ".Date("d, Y",$Date));
		print("</FONT></TD>");

		/**** Print Next Month Button */
		print("\n\t<TD width=100 align=right><FONT FACE=ARIAL SIZE=2><a href=\"modules.php?name=$module_name&file=index&Date=$Next_Date&type=day\">"._CALNEXT." >>></a></font></TD>");
		print("\n</TR>\n</TABLE>");

		print("\n<CENTER>\n<TABLE border=0 cellspacing=5 cellpadding=6 width=\"100%\">\n<TR>");

		/**** Appointments */
		print("\n\t<TD width=\"50%\" valign=top bgcolor=\"$daybgcolor\">");
		print("\n\t\t<TABLE width=\"100%\" bgcolor=\"$trimbgcolor\" border=1 cellspacing=0><TR><TD><FONT color=\"$trimtextcolor\" SIZE=2><b>Horário</b></font></TD></TR></TABLE>");

		print("\n\t\t<FONT COLOR=\"$daytextcolor\" SIZE=2>Manhã</FONT>");
		$sql = "SELECT eid, title, startTime, endTime, barcolor FROM ".$prefix."_events WHERE "
					."(eventDate<='$Date_Array[2]-$Date_Array[0]-$Date_Array[1]' AND endDate >= "
					."'$Date_Array[2]-$Date_Array[0]-$Date_Array[1]' AND alldayevent='0' AND "
					."startTime < '$times[0]' ) ORDER BY startTime, endTime ASC";
		printAppt($sql);

		$i = 0;
		while ($times[$i]) {
			addTimeRange($times[$i],$times[$i+1],$Date_Array[2],$Date_Array[0],$Date_Array[1]);
			//echo $times[$i]."<br>";
			$i++;
			if (!($times[$i+1])) {
				break;
			}
		}

		print("\n\t\t<br><br><FONT COLOR=\"$daytextcolor\" SIZE=2>Noite</FONT>");
		$sql = "SELECT eid, title, startTime, endTime, barcolor FROM ".$prefix."_events "
					."WHERE (eventDate<='$Date_Array[2]-$Date_Array[0]-$Date_Array[1]' AND "
					."endDate >= '$Date_Array[2]-$Date_Array[0]-$Date_Array[1]' AND alldayevent='0' AND "
					."startTime >= '$times[$i]') ORDER BY startTime, endTime ASC;";
		printAppt($sql);
		print("\n\t</TD>");

		/**** Events */
		print("\n\t<TD width=\"50%\" valign=top bgcolor=\"$daybgcolor\">");
		print("\n\t\t<TABLE width=\"100%\" bgcolor=\"$trimbgcolor2\" border=1 cellspacing=0><TR><TD><FONT color=\"$trimtextcolor2\" SIZE=2><b>Eventos</b></font></TD></TR></TABLE>");
		$result = sql_query("SELECT eid,title,barcolor FROM ".$prefix."_events WHERE "
											."(eventDate <= '$Date_Array[2]-$Date_Array[0]-$Date_Array[1]' AND "
											."endDate >= '$Date_Array[2]-$Date_Array[0]-$Date_Array[1]' AND "
											."alldayevent='1') ORDER BY title ASC", $dbi);
		if ($eventsopeninnewwindow) {
			$frame = "target=\"blank\"";
		} else {
			$frame = "";
		}
		while(list($eid, $title, $barcolor) = sql_fetch_row($result)) {
			if ($barcolor == "r") $barcolorchar="r";
			elseif ($barcolor == "g") $barcolorchar="g";
			elseif ($barcolor == "b") $barcolorchar="b";
			elseif ($barcolor == "y") $barcolorchar="y";
			else $barcolorchar="w";
			print("<img src=\"images/calendar/ball$barcolorchar.gif\" alt=\"\" border=0>&nbsp;"
					."<a href=\"modules.php?name=$module_name&file=index&type=view&eid=$eid\" $frame>$title</a><br>");
		}
		print("\n\t</TD>\n</TR>");
		print("\n</TABLE>\n</CENTER>");
	}
	CloseTable();
} // buildDay

function buildMonth($Date) {
	global $eventspopupwindow, $module_name, $trimbgcolor, $trimtextcolor, $trimbgcolor2, $trimtextcolor2,$textEvents, $monthtableborder, $monthtablecellspacing, $monthtablecellpadding, $monthbgcolor, $selecteddaycolor, $eventsopeninnewwindow, $monthshadedbgcolor, $monthshadedtextcolor,$time24Hour, $Week_Start, $prefix, $dbi, $calcat1, $calcat2, $calcat3, $calcat4, $calcat5;

	OpenTable();
	if (!$Date) {
		 $Date = Date("m/d/Y");
	}
	$Date_Array = explode("/", $Date);
	if ($Date_Array[2] < 1970) {
		print("ERROR! System can not interpret dates befor 01/01/1970");
	} else {
		loadPopups();

		/**** Find the last day of the month */
		$Month = $Date_Array[0];
		$day = 27;
		do {
			$End_of_Month_Date = mktime("", "", "", $Date_Array[0], $day, $Date_Array[2]);
			$Test_Month = Date("m",$End_of_Month_Date);
			$day += 1;
		} while ( $Month == $Test_Month );
		$Last_Day = $day - 2;
		if ($Date_Array[1] > $Last_Day) {
			$Date_Array[1] = $Last_Day;
		}
		$Date = mktime("", "", "", $Date_Array[0], $Date_Array[1], $Date_Array[2]);

		/**** Header */
		$Prev_Month = mktime("", "", "", $Date_Array[0] - 1, 1, $Date_Array[2]);
		$Prev_Date = Date("m/d/Y",$Prev_Month);
		$Next_Month = mktime("", "", "", $Date_Array[0] + 1, 1, $Date_Array[2]);
		$Next_Date = Date("m/d/Y",$Next_Month);
		echo "<center><table>\n"
."<tr><td width=\"100%\" align=\"center\">"._CALTYPES.":&nbsp;&nbsp;$calcat1&nbsp;<img src=\"images/calendar/ballr.gif\">&nbsp;&nbsp;&nbsp;$calcat2&nbsp;<img src=\"images/calendar/ballg.gif\">&nbsp;&nbsp;&nbsp;$calcat3&nbsp;<img src=\"images/calendar/ballb.gif\">&nbsp;&nbsp;&nbsp;$calcat4&nbsp;<img src=\"images/calendar/ballw.gif\">&nbsp;&nbsp;&nbsp;$calcat5&nbsp;<img src=\"images/calendar/bally.gif\"></td></tr></table></center><br />\n";
		print("\n<TABLE cellspacing=2 cellpadding=2 width=\"100%\"><tr><td><TABLE width=\"100%\"><TR>");

		/**** Print Previous Month Button */
		print("\n<TD width=100><FONT SIZE=2><a href=\"modules.php?name=$module_name&file=index&Date=$Prev_Date&type=month\"><<< "._CALPREVIOUS."</a></font></TD>");
		print("\n<TD align=center><FONT class='boxtitle'>");

		/**** Print Month Name and Year */
		print(getMonthName($Date)." ".Date("Y",$Date));
		print("</FONT></TD>");

		/**** Print Next Month Button */
		print("\n<TD width=100 align=right><FONT SIZE=2><a href=\"modules.php?name=$module_name&file=index&Date=$Next_Date&type=month\">"._CALNEXT." >>></a></font></TD>");
		print("</TR></TABLE>");

		/**** Get the Day (Integer) for the first day in the month */
		$First_Day_of_Month_Date = mktime("", "", "", $Date_Array[0], 1, $Date_Array[2]);
		$Day_of_First_Week = Date("w",$First_Day_of_Month_Date) - $Week_Start;

		/**** Get todays date */
		$Today_d = Date("d");
		$Today_m = Date("m");
		$Today_y = Date("Y");

		/**** Get All Day events for entire month ****/
		$count = -1;
		$result = sql_query("SELECT eid,title,hometext,eventDate,endDate,barcolor FROM ".$prefix."_events "
											."WHERE (((eventDate >= '$Date_Array[2]-$Date_Array[0]-1'"
											." AND eventDate <= '$Date_Array[2]-$Date_Array[0]-$Last_Day') "
											."OR (endDate >= '$Date_Array[2]-$Date_Array[0]-1' "
												."AND endDate <= '$Date_Array[2]-$Date_Array[0]-$Last_Day') "
											."OR (endDate >= '$Date_Array[2]-$Date_Array[0]-$Last_Day' "
												."AND eventDate <= '$Date_Array[2]-$Date_Array[0]-1')) "
											."AND alldayevent='1') ORDER BY eventDate ASC", $dbi);

		while(list($eid, $title, $description, $eventDate, $endDate,$barcolor) = sql_fetch_row($result)) {
			$eid_Array[] = $eid;
			$title_Array[] = valueToText($title);
			$eventDate_Array[] = $eventDate;
			$endDate_Array[] = $endDate;
			$barcolor_Array[] = $barcolor;
			$desc_Array[] = valueToText($description);
			$count++;
		}
		sql_free_result($result);


		/**** Build Month */
		print("\n<CENTER>\n<TABLE border=$monthtableborder cellspacing=$monthtablecellspacing "
					."cellpadding=$monthtablecellpadding width=\"100%\" bgcolor=\"$monthbgcolor\">");
		$day_of_week = 1;

		// Print day of week headings
		if ($Week_Start == 1){
		echo "<TR bgcolor=\"$trimbgcolor\">"
					."<TH width=\"13%\"><FONT SIZE=2 color=\"$trimtextcolor\">"._CALSECONDDAY."</font></TH>"

					."<TH width=\"15%\"><FONT color=\"$trimtextcolor\" SIZE=2>"._CALTHIRDDAY."</font></TH>"
					."<TH width=\"15%\"><FONT color=\"$trimtextcolor\" SIZE=2>"._CALFOURTHDAY."</font></TH>"
					."<TH width=\"15%\"><FONT color=\"$trimtextcolor\" SIZE=2>"._CALFIFTHDAY."</font></TH>"
					."<TH width=\"15%\"><FONT color=\"$trimtextcolor\" SIZE=2>"._CALSIXTHDAY."</font></TH>"
					."<TH width=\"15%\"><FONT color=\"$trimtextcolor\" SIZE=2>"._CALSEVENTHDAY."</font></TH>"
					."<TH width=\"13%\"><FONT color=\"$trimtextcolor\" SIZE=2>"._CALFIRSTDAY."</font></TH>"
				."</TR>";	
			}else{
		echo "<TR bgcolor=\"$trimbgcolor\">"
					."<TH width=\"13%\"><FONT SIZE=2 color=\"$trimtextcolor\">"._CALFIRSTDAY."</font></TH>"
					."<TH width=\"15%\"><FONT color=\"$trimtextcolor\" SIZE=2>"._CALSECONDDAY."</font></TH>"
					."<TH width=\"15%\"><FONT color=\"$trimtextcolor\" SIZE=2>"._CALTHIRDDAY."</font></TH>"
					."<TH width=\"15%\"><FONT color=\"$trimtextcolor\" SIZE=2>"._CALFOURTHDAY."</font></TH>"
					."<TH width=\"15%\"><FONT color=\"$trimtextcolor\" SIZE=2>"._CALFIFTHDAY."</font></TH>"
					."<TH width=\"15%\"><FONT color=\"$trimtextcolor\" SIZE=2>"._CALSIXTHDAY."</font></TH>"
					."<TH width=\"13%\"><FONT color=\"$trimtextcolor\" SIZE=2>"._CALSEVENTHDAY."</font></TH>"
				."</TR>";}


		/**** Previous Greyed month days */
		While ($day_of_week < ($Day_of_First_Week + 1)) {
			if ($day_of_week == 1) {
				print("\n<TR>");
			}
			$Tmp_Date = mktime("", "", "", $Date_Array[0], 1 - (($Day_of_First_Week + 1) - $day_of_week), $Date_Array[2]);
			$Tmp_Day = Date("d",$Tmp_Date);
			print("<TD bgcolor=\"$monthshadedbgcolor\" align=center valign=top><FONT SIZE=2 color=\"$monthshadedtextcolor\">"
					."$Tmp_Day</font></TD>");
			$day_of_week += 1;
		}


		$usedcount = 0;
		$cellcount = 0;

		/**** Build Current Month */
		for ($day = 1 ; $day <= $Last_Day ; $day++) {

			/************************/
			/**** SET UP DATA!!! ****/
			/************************/

			/**** Reset Cell Array */
			$cellDate = mktime (0, 0, 0, $Date_Array[0], $day, $Date_Array[2]);
			for ($i=0;$i <= $cellcount - 1;$i++) {
				$tmpEndDate_Array = explode("-", $cellArrayEndDate[$i]);
				$tmpEndDate = mktime (0, 0, 0, $tmpEndDate_Array[1], $tmpEndDate_Array[2], $tmpEndDate_Array[0]);
				if ($tmpEndDate < $cellDate) {
					$cellArray[$i] = "FALSE"; // Flag for deletion in the next step
				}
			}

			/**** Clean out Cell Array */
			if ($cellcount != 0) {
				$j = $cellcount;
				for ($i=$cellcount - 1;$i >= 0;$i--) {
					if ($cellArray[$i] == "FALSE") {
						Array_pop($cellArray);
						Array_pop($cellArrayTitle);
						Array_pop($cellArrayEventDate);
						Array_pop($cellArrayEndDate);
						Array_pop($cellArrayBarColor);
						Array_pop($cellArrayDesc);
						$j--;
					} else {
						break;
					}
				}
				$cellcount = $j;
			}

			/**** Add neccessary additions to cellArray */
			while ((strtotime($eventDate_Array[$usedcount]) <= strtotime("$Date_Array[2]-$Date_Array[0]-$day")) && ($usedcount <= $count)) {
				$added = "FALSE";
				/**** First Try to find a spot in the cell for the event */
				for ($i=0;$i <= $cellcount - 1;$i++) {
					if ($cellArray[$i] == "FALSE") {
						/**** Found spot in cellArray */
						$cellArray[$i] = $eid_Array[$usedcount];
						$cellArrayTitle[$i] = $title_Array[$usedcount];
						$cellArrayEventDate[$i] = $eventDate_Array[$usedcount];
						$cellArrayEndDate[$i] = $endDate_Array[$usedcount];
						$cellArrayBarColor[$i] = $barcolor_Array[$usedcount];
						$cellArrayDesc[$i] = $desc_Array[$usedcount];
						$added = "TRUE";
						break 1;
					}
				}

				/**** If all spots are taken in the current cellArray then add it to the end */
				if ($added == "FALSE") {
					$cellArray[] = $eid_Array[$usedcount];
					$cellArrayTitle[] = $title_Array[$usedcount];
					$cellArrayEventDate[] = $eventDate_Array[$usedcount];
					$cellArrayEndDate[] = $endDate_Array[$usedcount];
					$cellArrayBarColor[] = $barcolor_Array[$usedcount];
					$cellArrayDesc[] = $desc_Array[$usedcount];
					$cellcount++;  /**** Increase cell count since added to the end of the array */
				}
				$usedcount++;
			}

			// Build HTML for current day events (excludes 'alldayevents', which are taken care of above
			$DaysEventHTML = "";
			$resultAPPT = sql_query("SELECT eid,title,eventDate,endDate,startTime,endTime,barcolor FROM ".$prefix."_events WHERE (eventDate <= '$Date_Array[2]-$Date_Array[0]-$day' AND endDate >= '$Date_Array[2]-$Date_Array[0]-$day' AND alldayevent='0') ORDER BY startTime, endTime ASC", $dbi);
			while(list($eid, $title, $eventDate, $endDate, $startTime, $endTime, $barcolor) = sql_fetch_row($resultAPPT)) {
				if ($barcolor == "r") $barcolorchar="r";
				elseif ($barcolor == "g") $barcolorchar="g";
				elseif ($barcolor == "b") $barcolorchar="b";
				elseif ($barcolor == "y") $barcolorchar="y";
				else $barcolorchar="w";
				if ($time24Hour) {
					$time_Array = explode(":",$startTime);
					$startTime = $time_Array[0].":".$time_Array[1];
					$time_Array = explode(":",$endTime);
					$endTime = $time_Array[0].":".$time_Array[1];
				} else {
					$startTime = getTime($startTime);
					$endTime = getTime($endTime);
				}
				// Popup Mod
				if ($eventspopupwindow == "1") {
					$DaysEventHTML .= "<script type=\"text/javascript\">\n";
					$DaysEventHTML .= "<!--\n";
					$DaysEventHTML .= "function popup(){\n";
					$DaysEventHTML .= "window.open (\"modules/$module_name/popup.php?admin=$admin&module_name=$module_name";
					$DaysEventHTML .= "&time24Hour=$time24Hour&useInternationalDates=$useInternationalDates&prefix=$prefix&eid=$eid\"";
					$DaysEventHTML .= ",\"Event\",\"toolbar=no,location=no,directories=no,status=no,scrollbars=yes,resizable=yes,";
					$DaysEventHTML .= "copyhistory=no,width=500,height=330\");\n";
					$DaysEventHTML .= "}\n";
					$DaysEventHTML .= "//-->\n";
					$DaysEventHTML .= "</SCRIPT>\n\n";
					$DaysEventHTML .= "<font size=2><img src=\"images/calendar/ball$barcolorchar.gif\" alt=\"\" border=0>";
					$DaysEventHTML .= "<a href=\"javascript:popup()\">$startTime - $endTime<br> $title</a></font><br>";
				} else {
					$DaysEventHTML .= "<font size=2><img src=\"images/calendar/ball$barcolorchar.gif\" alt=\"\" border=0>&nbsp;";
					$DaysEventHTML .= "<a href=\"modules.php?name=$module_name&file=index&type=view&eid=$eid\" $frame>";
					$DaysEventHTML .= "$startTime - $endTime<br> $title</a></font><br>\n";
				}
				// End
			}


			if ($day_of_week == 1) {
				print("\n<TR>");
			}

			// If the current day doesn't have any events, set the rowheight to 50 to give it a little room
			if (($cellcount == 0) && ($DaysEventHTML == "")) {
				$rowheight="height=\"50\"";
			} else {
				$rowheight="";
			}
			if (($day == $Today_d) && ($Date_Array[0] == $Today_m) && ($Date_Array[2] == $Today_y)) {
				print("\n\t<TD valign=top><TABLE width=\"100%\" cellpadding=0 cellspacing=0 "
							."bgcolor=\"$selecteddaycolor\" border=0><TR><TD align=\"center\"  valign=\"top\"><FONT SIZE=2><b><a "
							."href=\"modules.php?name=$module_name&file=index&Date=$Date_Array[0]/$day/$Date_Array[2]&type=day\">"
							."$day</a></b></font></TD></TR></TABLE>");
			} else {
				print("\n\t<TD valign=\"top\"><TABLE width=\"100%\" cellpadding=0 cellspacing=0 border=0>"
							."<TR><TD align=\"center\" $rowheight valign=\"top\"><FONT SIZE=2><b>"
							."<a href=\"modules.php?name=$module_name&file=index&Date=$Date_Array[0]/$day/$Date_Array[2]&type=day\">$day"
							."</a></b></font></TD></TR></TABLE>");
			}



			/******************************************/
			/**** Add All Day Events to Month view ****/
			/******************************************/
			if ($eventsopeninnewwindow == 1) {
        $frame = "target=\"blank\"";
			} else {
				$frame = "";
			}
			for ($i=0;$i<=$cellcount - 1;$i++) {
				echo "<table width=\"100%\" cellpadding=0 cellspacing=0 border=0><tr>";
				if ($cellArrayBarColor[$i] == "r") $barcolorchar="r";
				elseif ($cellArrayBarColor[$i] == "g") $barcolorchar="g";
				elseif ($cellArrayBarColor[$i] == "b") $barcolorchar="b";
				elseif ($cellArrayBarColor[$i] == "y") $barcolorchar="y";
				else $barcolorchar="w";
				if ($cellArray[$i] != "FALSE") {
					$tmpEventDate_Array = explode("-", $cellArrayEventDate[$i]);
					$tmpEventDate = mktime (0, 0, 0, $tmpEventDate_Array[1], $tmpEventDate_Array[2], $tmpEventDate_Array[0]);
					$tmpEndDate_Array = explode("-", $cellArrayEndDate[$i]);
					$tmpEndDate = mktime (0, 0, 0, $tmpEndDate_Array[1], $tmpEndDate_Array[2], $tmpEndDate_Array[0]);
					if ($textEvents) {
						echo "<td><font size=2><img src=\"images/calendar/ball$barcolorchar.gif\" alt=\"\" border=0>&nbsp;"
								."<a href=\"modules.php?name=$module_name&file=index&type=view&eid=$cellArray[$i]\" "
								."$frame>$cellArrayTitle[$i]</a><br></font></td>";
					} else {
						$popuptext = " ONMOUSEOVER=\"return overlib('$cellArrayDesc[$i]', CAPTION, '$cellArrayTitle[$i]', "
												."ABOVE, LEFT, FGCOLOR, '$trimtextcolor',BGCOLOR,'$trimtextcolor2'); \" onmouseout=\"return nd();\"";
						if (($cellDate == $tmpEndDate) && ($tmpEndDate == $tmpEventDate)) {
			        echo "<td><a href=\"modules.php?name=$module_name&file=index&type=view&eid=$cellArray[$i]\" $frame $popuptext>"
										."<img src=\"images/calendar/leftbar$barcolorchar.gif\" alt=\"\" border=\"0\"></a></td>";
							echo "<td align=\"right\" width=\"100%\" style=\"background-image:url(images/calendar/mainbar$barcolorchar.gif);"
										."background-repeat:repeat-x;\"><a href=\"modules.php?name=$module_name&file=index&type=view&eid=$cellArray[$i]\" "
										."$frame $popuptext><img src=\"images/calendar/mainbar2$barcolorchar.gif\" alt=\"\" border=\"0\"></a></td>";
							echo "<td align=\"right\"><a href=\"modules.php?name=$module_name&file=index&type=view&eid=$cellArray[$i]\" "
									."$frame $popuptext><img src=\"images/calendar/rightbarcap$barcolorchar.gif\" border=\"0\" alt=\"\"></a></td>";
						} elseif ($cellDate == $tmpEventDate) {
							echo "<td><a href=\"modules.php?name=$module_name&file=index&type=view&eid=$cellArray[$i]\" $frame "
									."$popuptext><img src=\"images/calendar/leftbar$barcolorchar.gif\" border=\"0\"></a></td>";
							echo "<td align=\"center\" width=\"100%\" background=\"images/calendar/mainbar$barcolorchar.gif\">"
									."<a href=\"modules.php?name=$module_name&file=index&type=view&eid=$cellArray[$i]\" $frame "
									."$popuptext><img src=\"images/calendar/mainbar2$barcolorchar.gif\" alt=\"\" border=\"0\"></a></td>";
						} elseif ($cellDate == $tmpEndDate) {
							echo "<td align=\"center\" width=\"100%\" background=\"images/calendar/mainbar$barcolorchar.gif\">"
									."<a href=\"modules.php?name=$module_name&file=index&type=view&eid=$cellArray[$i]\" $frame "
									."$popuptext><img src=\"images/calendar/mainbar2$barcolorchar.gif\" alt=\"\" border=\"0\"></a></td>";
							echo "<td><a href=\"modules.php?name=$module_name&file=index&type=view&eid=$cellArray[$i]\" $frame "
									."$popuptext><img src=\"images/calendar/rightbar$barcolorchar.gif\" border=\"0\"></a></td>";
						} else {
							if ($day == 1) {
								echo "<td><a href=\"modules.php?name=$module_name&file=index&type=view&eid=$cellArray[$i]\" $frame "
										."$popuptext><img src=\"images/calendar/leftbar2$barcolorchar.gif\" border=\"0\"></a></td>";
                echo "<td align=\"center\" width=\"99%\" background=\"images/calendar/mainbar$barcolorchar.gif\">"
										."<a href=\"modules.php?name=$module_name&file=index&type=view&eid=$cellArray[$i]\" $frame "
										."$popuptext><img src=\"images/calendar/mainbar2$barcolorchar.gif\" alt=\"\" border=\"0\"></a></td>";
							} else {
								echo "<td align=\"center\" background=\"images/calendar/mainbar$barcolorchar.gif\">"
										."<a href=\"modules.php?name=$module_name&file=index&type=view&eid=$cellArray[$i]\" $frame "
										."$popuptext><img src=\"images/calendar/mainbar$barcolorchar.gif\" alt=\"\" border=\"0\"></a></td>";
							} // if ($day == 1)
						} // if (($cellDate == $tmpEndDate) && ($tmpEndDate == $tmpEventDate))
        	} // if ($textevents
	      } else {
					if (!$textEvents) {
						echo "<td width=\"100%\" height=\"100\"><img src=\"images/calendar/blankbar.gif\" alt=\"\" ></td>";
					}
				} // if ($cellArray[$i] != "FALSE")
        echo "</tr></table>";
			} // for ($i=0;$i<=$cellcount - 1;$i++)

			/*******************************************************/
			/* At this point, we've got the days 'all day events'. */
			/* finish up with appointments and close tables        */
			/*******************************************************/

			echo $DaysEventHTML;
			echo "</td>";
			if ($day_of_week == 7) {
				$day_of_week = 0;
				echo "\n</TR>";
			}
			$day_of_week += 1;
		} // for ($day = 1 ; $day <= $Last_Day ; $day++)

		/**** Next Greyed month days */
		$day = 1;
		While (($day_of_week <= 7) && ($day_of_week != 1)) {
			echo "<TD bgcolor=\"$monthshadedbgcolor\" align=center valign=top><FONT SIZE=2 color=\"$monthshadedtextcolor\">"
					."$day</font></TD>";
			$day_of_week += 1;
			$day += 1;
		}
		echo "\n</TR>\n</TABLE>\n</CENTER></table>";
	}
	CloseTable();
} // buildMonth


function viewEvent($eid) {
	global $admin,$module_name,$time24Hour,$useInternationalDates, $prefix, $eventsopeninnewwindow, $dbi, $user, $cookie, $calcat1, $calcat2, $calcat3, $calcat4, $calcat5, $postdirect;

	if($eventsopeninnewwindow =="0") {
		OpenTable();
	} else {
		include("header.php");
		OpenTable();
	}
	$result = sql_query("SELECT * FROM ".$prefix."_events WHERE eid=$eid", $dbi);
	list($eid,$aid,$title,$datePosted,$body,$comments,$counter,$topic,$informant,$eventDate,$endDate,$startTime,$endTime,$alldayevent, $barcolor) = sql_fetch_row($result);
	if ($informant == "") $informant = "$anonymous";
	if ($topic == "0") {
		$topic = "1";
	}
	$result = sql_query("select topicimage from ".$prefix."_topics where topicid='$topic'", $dbi);
	list($topicimage) = sql_fetch_row($result);
	$Date_Array = explode("-", $eventDate);
	$endDate_Array = explode("-", $endDate);
	$Date_Array2 = explode(" ", $datePosted);
	$Date_Array2 = explode("-",$Date_Array2[0]);
	if ($time24Hour) {
		$time_Array = explode(":",$startTime);
		$startTime = $time_Array[0].":".$time_Array[1];
		$time_Array = explode(":",$endTime);
		$endTime = $time_Array[0].":".$time_Array[1];
	} else {
		$startTime = getTime($startTime);
		$endTime = getTime($endTime);
	}
if ($barcolor == "r") $caltype=$calcat1;
elseif ($barcolor == "g") $caltype=$calcat2;
elseif ($barcolor == "b") $caltype=$calcat3;
elseif ($barcolor == "w") $caltype=$calcat4;
else $caltype=$calcat5;
	echo "<center><b>"._CALVIEWEVENT."</b>: \"$title\"<p><b>"._CALTYPE.":</b>&nbsp;$caltype&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>"._CALEVENTDATEPREVIEW."</b>: ";
	if ($useInternationalDates) {
		echo "<a href=\"modules.php?name=$module_name&file=index&Date=$Date_Array[1]/$Date_Array[2]/$Date_Array[0]&"
				."type=day\">$Date_Array[2]/$Date_Array[1]/$Date_Array[0]</a>&nbsp;&nbsp;&nbsp;&nbsp;";
	} else {
		echo "<a href=\"modules.php?name=$module_name&file=index&Date=$Date_Array[1]/$Date_Array[2]/$Date_Array[0]&"
				."type=day\">$Date_Array[1]/$Date_Array[2]/$Date_Array[0]</a>&nbsp;&nbsp;&nbsp;&nbsp;";
	}
	if (strtotime($eventDate) != strtotime($endDate)) {
		echo "<font size=2><b>"._CALENDDATEPREVIEW."</b>: ";
		if ($useInternationalDates) {
			echo "<a href=\"modules.php?name=$module_name&file=index&Date=$endDate_Array[1]/$endDate_Array[2]/$endDate_Array[0]&"
					."type=day\">$endDate_Array[2]/$endDate_Array[1]/$endDate_Array[0]</a>";
		} else {
			echo "<a href=\"modules.php?name=$module_name&file=index&type=day&Date=$endDate_Array[1]/$endDate_Array[2]/$endDate_Array[0]&"
					."type=day\">$endDate_Array[1]/$endDate_Array[2]/$endDate_Array[0]</a>";
		}
		echo "</font>";
	}

	if (is_user($user)) {
		cookiedecode($user);
		$uid = $cookie[0];
			$user = $cookie[1];
	} else {
		$uid = 1;
		$user = "$anonymous";
	}

	echo "<table width=\"90%\"><tr><td width=\"90%\" valign=\"top\">";
	if ($alldayevent == "0") {
		echo "<center><b>"._CALSTARTTIME."</b>: $startTime&nbsp;&nbsp;&nbsp;&nbsp;"
				."<b>"._CALENDTIME."</b>: $endTime</center><br><br>";
	}
	echo "<b>"._CALARTICLETEXT."</b>:<br>$body<p></td>"
			."<td valign=\"middle\"><img src=\"images/topics/$topicimage\" alt=\"\" border=\"0\"></td>"
			."</tr>"
			."</table>"
			."<br><br>"
			."<font size=1>"._CALPOSTEDBY." <a href=\"modules.php?name=Your_Account&op=userinfo&username=$informant\">"
			."$informant</a> "._CALPOSTEDON." $Date_Array2[1]/$Date_Array2[2]/$Date_Array2[0] ";
if ($postdirect =="0") echo ""._CALACCEPTEDBY." $aid";
echo "</font></center>";
	if (is_admin($admin)) {
		echo "<center>[ <a href=\"admin.php?op=CalendarEditStory&amp;eid=$eid\">"._EDIT."</a> | "
				."<a href=\"admin.php?op=CalendarRemoveStory&amp;eid=$eid\">"._DELETE."</a> ]</center>\n";
		$isadmin = "1";
	}

	// START NO-ADMIN EDIT/DELETE
	if (($user != $anonymous & $user == $informant & $isadmin != "1")) {
		echo "<center>[ <a href=\"modules.php?name=Calendar&op=CalendarEditStory&eid=$eid\">"._EDIT
				."</a> | <a href=\"modules.php?name=Calendar&op=CalendarRemoveStory&eid=$eid\">"._DELETE."</a> ]</center>\n";
	}
	// END

	//START COMMENTS MOD
	$comments = CalendarDisplayComments($eid);
	echo "<br>$comments";
	//END COMMENTS MOD
	CloseTable();
} // viewEvent

function CalendarIndex($Date,$type,$eid) {
	global $topicname, $topicimage, $topictext, $datetime, $user, $nuke_url, $trimtextcolor, $module_name,$eventsopeninnewwindow,$netscapeFriendlyMonthView,$useInternationalDates, $prefix, $dbi, $calcat1, $calcat2, $calcat3, $calcat4, $calcat5;

	if (!(($eventsopeninnewwindow) && ($type == "view"))) {
		include("header.php");
		OpenTable();
		/**** Get todays date */
		$Today_d = Date("d");
		$Today_m = Date("m");
		$Today_y = Date("Y");
		echo "<center>"
				."<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n"
				."	<tr>\n"
				."		<td width=\"33%\" align=\"left\" valign=\"top\"><img src=\"images/calendar/calendar.gif\" alt=\"\">\n"
				."		</td>\n"
				."		<td width=\"34%\" valign=\"middle\" align=\"center\"><font class=\"title\"><b>"._CALNAME."</b></font>\n"
				."		</td>\n"
				."		<td align=\"right\" width=\"33%\">\n"
				."		<table align=\"right\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\n"
				."			<tr>\n"
				."				<td width=\"100%\" valign=\"bottom\" align=\"right\">\n"
				."					<a href=\"modules.php?name=$module_name&file=calprint\" target=\"_blank\">\n"
				."					<img border=\"0\" src=\"images/calendar/printer.gif\" alt=\"\"></a>\n"
				."				</td>\n"
				."				<td valign=\"top\" align=\"left\">\n"
				."					<a href=\"modules.php?name=$module_name&file=calprint\" target=\"_blank\">" . _CALPRINT4 . "</a>\n"
				."				</td>\n"
				."			</tr>\n"
				."		</table>\n"
				."		</td>\n"
				."	</tr>\n"
				."	<tr>\n"
				."		<td colspan=\"3\" align=\"center\" width=\"100%\"><br>\n"
				."			<table cellpadding=\"10\" cellspacing=\"0\" border=\"0\" width=\"100%\" align=\"center\">\n"
				."	<tr>\n"
				."	<td align=\"left\" valign=\"bottom\" nowrap width=\"18%\">\n"
				."		<font size=\"2\"><strong><big>·</big></strong> <a href=\"modules.php?name=$module_name&file=submit\">"._CALEVENTLINK."\n"
				."			</a><br><strong><big>·</big></strong> <a href=\"modules.php?name=$module_name&file=index&type=day\">"._CALDAYLINK."</a>\n"
				."		</font>\n"
				."	</td>\n"
				."	<td align=\"left\" valign=\"bottom\" nowrap width=\"22%\">\n"
				."		<font size=\"2\"><strong><big>·</big></strong> <a href=\"modules.php?name=$module_name&file=index&type=month\">"._CALMONTHLINK."\n"
				."			</a><br>\n"
				."			<strong><big>·</big></strong> <a href=\"modules.php?name=$module_name&file=index&type=year\">"._CALYEARLINK."</a>\n"
				."		</font>\n"
				."	</td>\n"
				."	<td align=\"center\" nowrap width=\"60%\" valign=\"bottom\">\n"
				."		<form  action=\"post\" name=\"jump\">\n";
		echo "<font size=\"2\">"._CALJUMPTOTEXT.":<br>";
		if ($useInternationalDates) {
			echo "<select name=\"jumpday\">";
			buildDaySelect($Today_d);
			echo "</select><select name=\"jumpmonth\">";
			buildMonthSelect($Today_m);
			echo "</select><select name=\"jumpyear\">";
			buildYearSelect($Today_y);
			echo "</select>";
		} else {
			echo "<select name=\"jumpmonth\">";
			buildMonthSelect($Today_m);
			echo "</select><select name=\"jumpday\">";
			buildDaySelect($Today_d);
			echo "</select><select name=\"jumpyear\">";
			buildYearSelect($Today_y);
			echo "</select>";
		}

		echo "<select name=\"view\">"
				."<option value=\"day\">Visualização diária</option>"
				."<option SELECTED value=\"month\">Visualização mensal</option>"
				."<option value=\"year\">Visualização anual</option>"
				."</select>";
		/******************************************************/
		/* Below code is useful if you are rewriting URL's    */
		/* in my case, I rewrite the urls as:                 */
		/*     cal-<month>-<day>-<year>-<viewtype.html        */
		/* So I needed to change the form submission, so that */
		/* it too would rewrite, works like a charm           */
/*		echo "&nbsp;<input type=button value=\""._CALJUMPBUTTON."\"\n"
				."onClick=\"location.href='cal-' +\n"
				."document.jump.jumpmonth.options[document.jump.jumpmonth.options.selectedIndex].value + '-' +\n"
				."document.jump.jumpday.options[document.jump.jumpday.options.selectedIndex].value + '-' +\n"
				."document.jump.jumpyear.options[document.jump.jumpyear.options.selectedIndex].value + '-' +\n"
				."document.jump.view.options[document.jump.view.options.selectedIndex].value + '.html';\">\n"
				."</font></form></td>";*/
		/******************************************************/
		/* End URL rewrite modification.                      */
		/******************************************************/
		// Uncomment below block, and comment or remove above URL rewriting block to not use rewriting
		echo "&nbsp;<input type=button value=\""._CALJUMPBUTTON."\" onClick=\"location.href='modules.php?name=$module_name&file=index&"
				."type=' + document.jump.view.options[document.jump.view.options.selectedIndex].value + '&Date=' + "
				."document.jump.jumpmonth.options[document.jump.jumpmonth.options.selectedIndex].value + '/' + "
				."document.jump.jumpday.options[document.jump.jumpday.options.selectedIndex].value + '/' + "
				."document.jump.jumpyear.options[document.jump.jumpyear.options.selectedIndex].value;\">"
				."</font></td></form>";
		echo "</table>\n"
				."</td>\n"
				."</tr>\n"

."<tr><td colspan=\"3\" width=\"100%\"><hr size=\"1\" color=$trimtextcolor width=\"100%\"></td></tr>\n"
				."</table>\n"
				."</center>\n";
		CloseTable();
  } // If not viewing single event in new window, ie: header controls

	formatTimestamp($time);
	$subject = stripslashes($subject);
	$hometext = stripslashes($hometext);
	$introcount = strlen($hometext);
	$totalcount = $introcount + $fullcount;
	echo "<table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\"><tr><td>";
	if (($type == "month") || !($type)) {
		if($netscapeFriendlyMonthView) {
			buildMonthforNetscape($Date);
		} else {
			buildMonth($Date);
		}
	} elseif ($type == "day") {
		buildDay($Date);
	} elseif ($type == "year") {
		buildYear($Date);
	} elseif ($type == "view") {
		viewEvent($eid);
	}
	echo "</td></tr></table>";

	if (!(($eventsopeninnewwindow) && ($type == "view"))) {
		include("footer.php");
	}
}

// START NO-ADMIN EDIT/DELETE

function CalendarEditStory($eid) {
	global $module_name, $user, $cookie, $tipath, $bgcolor1, $bgcolor2, $aid, $time24Hour,$useInternationalDates,$prefix,$dbi;
	$result = sql_query("select aid, informant from ".$prefix."_events where eid='$eid'",$dbi);
	list($aid, $informant) = sql_fetch_row($result);
	include ('header.php');

	if (is_user($user)) {
		cookiedecode($user);
		$uid = $cookie[0];
		$user = $cookie[1];
	} else {
		$uid = 1;
		$user = "$anonymous";
	}
	if (($aid == $informant) && ($aid == $user)) {
		OpenTable();
		echo "<center><font size=\"4\"><b>"._CALEVENTADMIN."</b></font></center>\n";
		CloseTable();
		echo "<br>";
		$result = sql_query("SELECT aid, title, hometext, topic, informant, eventDate, endDate, startTime, endTime, "
											."alldayevent, barcolor FROM ".$prefix."_events where eid=$eid", $dbi);
		list($aid, $subject, $story, $topic, $author, $eventDate, $endDate, $startTime, $endTime, $alldayevent, $barcolor) = sql_fetch_row($result);
		sql_free_result($result);
		$subject = stripslashes($subject);
		$story = stripslashes($story);
		if ($author == "") $author="Anonynous";
		OpenTable();
		if($topic=="0") {
			$topic = 1;
		}
		$result = sql_query("select topicimage from ".$prefix."_topics where topicid=$topic", $dbi);
		list($topicimage) = sql_fetch_row($result);
		echo "<table border=\"0\" width=\"70%\" cellpadding=\"0\" cellspacing=\"1\" bgcolor=\"$bgcolor2\" align=\"center\"><tr><td>\n"
				."<table border=\"0\" width=\"100%\" cellpadding=\"8\" cellspacing=\"1\" bgcolor=\"$bgcolor1\"><tr><td>\n"
				."<img src=\"$tipath$topicimage\" border=\"0\" align=\"right\" alt=\"\">\n";
		themepreview($subject, $story);
		echo "</td></tr></table></td></tr></table><center><hr noshade size=\"1\" width=\"99%\"><br><br>\n";
		echo "<b>"._CALREPOSTSTORY."</b><br><font size=\"3\"></center>\n"
				."<form onSubmit=\"return verify();\" action=\"modules.php?name=Calendar&op=CalendarChangeStory\" method=\"post\">\n"
				."<b>"._CALNAMEFIELD."</b><br>\n"
				."<input type=\"text\" NAME=\"author\" size=\"25\" value=\"$author\">\n";

		BuildEventEditor($subject, $topic, $eventDate, $enddate, $startTime, $endTime,
											$alldayevent, $barcolor, $story);

		echo "<br><br>"
				."<input type=hidden value=\"$eid\" name=\"eid\">"
				."<input type=hidden value=\"$user\" name=\"user\">"
				."<input type=\"reset\" value=\""._CALRESET."\">"
				."<input type=\"submit\" value=\""._CALREPOSTSTORY."\">"
				."</form>";
		CloseTable();
	} else {
		Header("Location: modules.php?name=$module_name&file=index");
	}
	include("footer.php");
} // CalendarEditStory


function CalendarChangeStory($eid, $uid, $author, $subject, $story, $topic, $day, $month, $year, $endday, $endmonth, $endyear, $startHour, $startMin, $startampm, $endHour, $endMin, $endampm, $alldayevent, $barcolor) {
	global $aid, $module_name,$time24Hour,$prefix,$dbi;
	$result = sql_query("select aid, informant from ".$prefix."_events where eid='$eid'",$dbi);
	list($aid, $informant) = sql_fetch_row($result);

	if ($aid == $informant) {
		$subject = stripslashes(FixQuotes($subject));
		$story = stripslashes(FixQuotes($story));
		if ($time24Hour) {
			$startTime = "$startHour:$startMin:00";
			$endTime = "$endHour:$endMin:00";
		} else {
			$startTime = getTimeFormat($startHour,$startMin,$startampm);
			$endTime = getTimeFormat($endHour,$endMin,$endampm);
		}
		sql_query("update ".$prefix."_events set title='$subject', hometext='$story', topic='$topic', informant='$author', eventDate='$year-$month-$day', endDate='$endyear-$endmonth-$endday', startTime='$startTime', endTime='$endTime', alldayevent='$alldayevent', barcolor='$barcolor' where eid=$eid",$dbi);
		Header("Location: modules.php?name=$module_name&file=index");
	}
} // CalendarChangeStory

function CalendarRemoveStory($eid, $ok=0) {
	global $module_name, $user, $cookie, $aid, $prefix, $dbi;

	if (is_user($user)) {
		cookiedecode($user);
		$uid = $cookie[0];
		$user = $cookie[1];
	} else {
		$uid = 1;
		$user = "$anonymous";
	}
	$result = sql_query("select counter, radminarticle, radminsuper, radminCalendarAdmin from ".$prefix."_authors where aid='$aid'", $dbi);
	list($counter, $radminarticle, $radminsuper, $radminCalendarAdmin) = sql_fetch_row($result);
	$result2 = sql_query("select eid, aid, informant from ".$prefix."_events where eid='$eid'", $dbi);
	list($eid, $aid, $informant) = sql_fetch_row($result2);
	if (($aid == $informant) && ($aid == $user)) {
		if($ok) {
			$counter--;
			sql_query("DELETE FROM ".$prefix."_events where eid=$eid", $dbi);
			// START COMMENTS MOD
			sql_query("DELETE FROM ".$prefix."_events_comments where eid=$eid", $dbi);
			// END COMMENTS MOD
			$result = sql_query("update ".$prefix."_authors set counter='$counter' where aid='$aid'", $dbi);
			Header("Location: modules.php?name=$module_name&file=index");
		} else {
			include("header.php");
			OpenTable();
			echo "<center><font size=\"4\"><b>"._CALEVENTADMIN."</b></font></center>";
			CloseTable();
			echo "<br>";
			OpenTable();
			echo "<center>"._CALREMOVETEST."<br>";
			echo "<br>[ <a href=\"modules.php?name=$module_name&file=index\">"._CALNO."</a> | <a href=\"modules.php?name=$module_name&op=CalendarRemoveStory&eid=$eid&ok=1\">"._CALYES."</a> ]</center>";
			CloseTable();
			include("footer.php");
		}
	} else {
	Header("Location: modules.php?name=$module_name&file=index");
	}
} // CalendarRemoveStory

switch ($op) {

	//START COMMENTS
	case "CalendarPostComments":
	CalendarPostComments();
	break;

	case "CalendarRemoveComments":
	CalendarRemoveComments($eid,$cid,$ok);
	break;

	case "CalendarEditComments":
	CalendarEditComments($eid,$cid);
	break;

	case "CalendarRePostComments":
	CalendarRePostComments();
	break;

	//END COMMENTS

	// START NO-ADMIN EDIT/DELETE

	case "CalendarEditStory":
	CalendarEditStory($eid,$ok);
	break;

	case "CalendarRemoveStory":
	CalendarRemoveStory($eid,$ok);
	break;

	case "CalendarChangeStory":
	CalendarChangeStory($eid, $uid, $author, $subject, $story, $topic, $day, $month, $year, $endday, $endmonth, $endyear, $startHour, $startMin, $startampm, $endHour, $endMin, $endampm, $alldayevent, $barcolor);
	break;

	// END

	default:
	CalendarIndex($Date,$type,$eid);
}

?>