<?php

/********************************************************/
/* Event Calendar for PHP-Nuke 6.5                      */
/*                                                      */
/* Based on Event Calendar 1.5 by Rob Sutton            */
/* Development & enhancments by Holbrookau and friends  */
/* http://phpnuke.holbrookau.com                        */
/********************************************************/

/********************************************************/
/*  Printer Friendly Calendar Option                    */
/*  (c) 2002 Perfect Papers                             */ 
/*  Just leave the name in the script and do whatever   */
/*  you want otherwise!                                 */ 
/*********************************************************/

if (!eregi("modules.php", $_SERVER['PHP_SELF'])) {
	die ("You can't access this file directly...");
}

require_once("mainfile.php");
$module_name = "Calendar";
get_lang($module_name);

header("Content-Type: text/html");
global $slogan, $sitename, $banners, $nukeurl, $Version_Num, $artpage, $topic, $hlpfile, $user, $hr, $theme, $cookie, $bgcolor1, $bgcolor2, $bgcolor3, $bgcolor4, $textcolor1, $textcolor2, $forumpage, $adminpage, $userpage, $pagetitle;
echo "<html>\n"
     ."<head>\n"
     ."<title>$sitename - Calendar</title>\n"
     ."<meta name=\"PrinterFriendly\" content=\"True\">\n";
     include("includes/meta.php");
     include("includes/javascript.php");
     include("includes/my_header.php");
	 echo "<LINK REL=\"StyleSheet\" HREF=\"modules/$module_name/style.css\" TYPE=\"text/css\">\n\n\n";	 
echo "</head>\n"
     ."<body>\n\n\n"
     ."<div align=\"center\">\n";
	 
function buildMonthSelect($month) {
        for ($i = 1; $i <= 12; $i++) {
                if ($i == $month) $sel = "SELECTED";
                else $sel = "";
                echo "<option $sel value=\"$i\">$i\n</option>";
        }
}

function buildDaySelect($day) {
        for ($i = 1; $i <= 31; $i++) {
                if ($i == $day) $sel = "SELECTED";
                else $sel = "";
                echo "<option $sel value=\"$i\">$i\n</option>";
        }
}

function buildYearSelect($year) {
        for ($i = 1997; $i <= 2030; $i++) {
                if ($i == $year) $sel = "SELECTED";
                else $sel = "";
                echo "<option $sel value=\"$i\">$i\n</option>";
        }
}

function printAppt($sql) {
        global $module_name,$eventsopeninnewwindow,$time24Hour, $prefix;
$result = mysql_query($sql);
        if (mysql_num_rows($result) == 0) echo "<br>";
        if ($eventsopeninnewwindow) {
                $frame = "target=\"blank\"";
        } else {
                $frame = "";
        }
        while(list($eid, $title, $startTime, $endTime, $barcolor) = mysql_fetch_row($result)) {
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
                print("<br><img src=\"images/calendar/ball$barcolorchar.gif\" border=0> <a
		href=\"modules.php?name=$module_name&file=calprint&type=view&eid=$eid\"
		$frame>$startTime-$endTime, $title</a>");
        }
        mysql_free_result($result);
}

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
                if ($time_Array[0] < 10)
			$hour = substr($time_Array[0],1,1);
		else
			$hour = $time_Array[0];
                $ampm = "AM";
        }
        $time = "$hour:$min $ampm";
        return $time;
}

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
    }

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
}

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

}

function loadStyle() {
        echo" <STYLE TYPE=\"text/css\">
        <!--
                .popper      { position: absolute; visibility: hidden }
        //-->
        </STYLE>";
}

function loadPopups() {
        echo "<DIV ID=\"topdeck\" CLASS=\"popper\">
                &nbsp;
                </DIV>
                <SCRIPT>
                var popback = \"#F2E8CD\";
                var popbord = \"#000066\";
                var nav = (document.layers);
                var iex = (document.all);
                var skn = (nav) ? document.topdeck : topdeck.style;
                if (nav) document.captureEvents(Event.MOUSEMOVE);
                document.onmousemove = get_mouse;

                function pop(title,msg,bord,bak)
                {
                        var content =\"<TABLE WIDTH=260 BORDER=0 CELLPADDING=2 CELLSPACING=0 BGCOLOR=\"+bord+\"><TR><TD><TABLE WIDTH=100% BORDER=0 CELLPADDING=0 CELLSPACING=0><TR><TD><CENTER><FONT COLOR=#FFFFFF SIZE=2><B>\"+title+\"</B></FONT></CENTER></TD></TR></TABLE><TABLE WIDTH=100% BORDER=0 CELLPADDING=2 CELLSPACING=0 BGCOLOR=\"+bak+\"><TR><TD>\"+msg+\"</TD></TR></TABLE></TD></TR></TABLE>\";


                        if (nav)
                        {
                                skn.document.write(content);
                                skn.document.close();
                                skn.visibility = \"visible\";
                        }
                        else if (iex)
                        {
                                document.all(\"topdeck\").innerHTML = content;
                                skn.visibility = \"visible\";
                        }
                }

                function get_mouse(e)
                {
                        var x = (nav) ? e.pageX : event.x+document.body.scrollLeft;
                        var y = (nav) ? e.pageY : event.y+document.body.scrollTop;
                        skn.left = x - 60;
                        skn.top  = y+20;
                }

                function kill()
                {
                        skn.visibility = \"hidden\";
                }
                </SCRIPT>";
}

function buildYear($Date) {
	echo "<table>";
        global $module_name,$yeartableborder,$yeartablecellspacing,$yeartablecellpadding,$trimbgcolor,$trimtextcolor,$yearbgcolor,$selecteddaycolor,$yeartextcolor;
        if (!$Date) {
                $Date = Date("m/d/Y");
                }
        $Date_Array = explode("/", $Date);
        if ($Date_Array[2] < 1970)
                print("ERROR! System can not interpret dates befor 01/01/1970");
        else {
        $Date = mktime("", "", "", $Date_Array[0], $Date_Array[1], $Date_Array[2]);

        /**** Header */
        $Prev_Year = mktime("", "", "", $Date_Array[0], $Date_Array[1], $Date_Array[2] - 1);
        $Prev_Date = Date("m/d/Y",$Prev_Year);
        $Next_Year = mktime("", "", "", $Date_Array[0], $Date_Array[1], $Date_Array[2] + 1);
        $Next_Date = Date("m/d/Y",$Next_Year);
        print("\n<TABLE width=100% border=0 cellpadding=0 cellspacing=0>\n<TR>");

        /**** Print Previous Year Button */
        print("\n\t<TD width=100><FONT FACE=ARIAL SIZE=2><a href=\"modules.php?name=$module_name&file=calprint&Date=$Prev_Date&type=year\"><<< "._CALPREVIOUS."</a></TD>");
        print("\n\t<TD align=center><FONT size=5>");

        /**** Print Year */
        print(Date("Y",$Date));
        print("</FONT></TD>");

        /**** Print Next Year Button */
        print("\n\t<TD width=100 align=right><FONT FACE=ARIAL SIZE=2><a href=\"modules.php?name=$module_name&file=calprint&Date=$Next_Date&type=year\">"._CALNEXT." >>></a></TD>");
        print("\n</TR>\n</TABLE>\n<TABLE BORDER=0 cellpadding=6 width=100%><TR>");
        for ($i=1;$i<13;$i++) {
                /**** Get the Day (Integer) for the first day in the month */
                $First_Day_of_Month_Date = mktime("", "", "", $i, 1, $Date_Array[2]);
                $Date = $First_Day_of_Month_Date;
                $Date_Array[0] = $i;
                $Day_of_First_Week = Date("w",$First_Day_of_Month_Date);

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
                if (($i == 4) || ($i == 7) || ($i == 10)) {
                        print("</TR><TR><TD colspan=3><br></TD></TR><TR>");
                        }
                print("\n<TD valign=top align=center>\n<TABLE border=$yeartableborder cellspacing=$yeartablecellspacing cellpadding=$yeartablecellpadding>");

                print("\n<TR bgcolor=$trimbgcolor>\n\t<TH colspan=7><FONT SIZE=1 color=$trimtextcolor><a href=\"modules.php?name=$module_name&file=calprint&Date=$i/1/$Date_Array[2]&type=month\">");
                print( getMonthName($Date) );
                print("</a></FONT></TH>\n</TR>");

                /**** Previous Greyed month days */
                print("\n<TR>");
                if ($Day_of_First_Week != 0)
                        print("\n\t<TD colspan=$Day_of_First_Week><font face=arial size=1 color=ffffff>.</TD>");
                $day_of_week = $Day_of_First_Week + 1;

                /**** Build Current Month */
                for ($day = 1 ; $day <= $Last_Day ; $day++) {
                        if ($day_of_week == 1) {
                                print("\n<TR>");
                                }
                        if (($day == $Today_d) && ($Date_Array[0] == $Today_m) && ($Date_Array[2] == $Today_y))
                                print("\n\t<TD width=10 align=center bgcolor=$selecteddaycolor><FONT FACE=ARIAL color=$yeartextcolor SIZE=1><a href=\"modules.php?name=$module_name&file=calprint&Date=$Date_Array[0]/$day/$Date_Array[2]&type=day\">$day</a></TD>");
                        else
                                print("\n\t<TD width=10 align=center bgcolor=$yearbgcolor><FONT FACE=ARIAL color=$yeartextcolor SIZE=1><a href=\"modules.php?name=$module_name&file=calprint&Date=$Date_Array[0]/$day/$Date_Array[2]&type=day\">$day</a></TD>");
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
                        print("<TD colspan=$tmp><font face=arial size=1 color=ffffff>.</TD>");
                        }
                print("\n</TR>\n</TABLE>\n</TD>");
                }
        print("</TR></TABLE></CENTER>");
        }
	echo "</table>";
}

function addTimeRange($startTime,$endTime,$year,$month,$day) {
	global $time24Hour,$daytextcolor, $prefix;
	if ($time24Hour) {
		$tmpTime = substr($startTime,0,5);
		$tmpTime2 = substr($endTime,0,5);
	} else {
		$tmpTime = getTime($startTime);
		$tmpTime2 = getTime($endTime);
	}
	print("\n\t\t<br><br><FONT COLOR=$daytextcolor SIZE=2>$tmpTime - $tmpTime2</FONT>");
        $sql = "SELECT eid, title, startTime, endTime, barcolor FROM $prefix"._events." WHERE
	(eventDate<='$year-$month-$day' AND endDate >=
 '$year-$month-$day' AND alldayevent='0' AND startTime >= '$startTime' AND
startTime < '$endTime' ) ORDER BY startTime, endTime ASC;";

        printAppt($sql);
}

function buildDay($Date) {
        global $module_name, $trimbgcolor, $trimtextcolor, $trimbgcolor2, $trimtextcolor2, $daybgcolor, $prefix;
        global $daytextcolor, $eventsopeninnewwindow,$times;
	echo "<table>";
        if (!$Date) {
                $Date = Date("m/d/Y");
                }
        $Date_Array = explode("/", $Date);
        if ($Date_Array[2] < 1970)
                print("ERROR!<br> System can not interpret dates befor 01/01/1970, If you've used a 2 digit year please use a 4 digit one.");
        else {
                $Date = mktime("", "", "", $Date_Array[0], $Date_Array[1], $Date_Array[2]);

                /**** Header */
                $Prev_Month = mktime("", "", "", $Date_Array[0], $Date_Array[1] - 1, $Date_Array[2]);
                $Prev_Date = Date("m/d/Y",$Prev_Month);
                $Next_Month = mktime("", "", "", $Date_Array[0], $Date_Array[1] + 1, $Date_Array[2]);
                $Next_Date = Date("m/d/Y",$Next_Month);
                print("\n<TABLE width=100%>\n<TR>");

                /**** Print Previous Month Button */
                print("\n\t<TD width=100><FONT FACE=ARIAL SIZE=2><a href=\"modules.php?name=$module_name&file=calprint&Date=$Prev_Date&type=day\"><<< "._CALPREVIOUS."</a></TD>");
                print("\n\t<TD align=center><FONT size=5>");

                /**** Print Month Name and Year */
                print(getLongDayName($Date).", ".getMonthName($Date)." ".Date("d, Y",$Date));
                print("</FONT></TD>");

                /**** Print Next Month Button */
                print("\n\t<TD width=100 align=right><FONT FACE=ARIAL SIZE=2><a href=\"modules.php?name=$module_name&file=calprint&Date=$Next_Date&type=day\">"._CALNEXT." >>></a></TD>");
                print("\n</TR>\n</TABLE>");

                print("\n<CENTER>\n<TABLE border=0 cellspacing=5 cellpadding=6 width=100%>\n<TR>");

                /**** Appointments */
                print("\n\t<TD width=50% valign=top bgcolor=$daybgcolor>");
                print("\n\t\t<TABLE width=100% bgcolor=$trimbgcolor border=1 cellspacing=0><TR><TD><FONT color=$trimtextcolor SIZE=2><b>Appointments</TD></TR></TABLE>");

		print("\n\t\t<FONT COLOR=$daytextcolor SIZE=2>Morning</FONT>");
                 $sql = "SELECT eid, title, startTime, endTime, barcolor
FROM $prefix"._events." WHERE
 		(eventDate<='$Date_Array[2]-$Date_Array[0]-$Date_Array[1]'
AND endDate >=
 		'$Date_Array[2]-$Date_Array[0]-$Date_Array[1]' AND
alldayevent='0' AND startTime < '$times[0]' ) ORDER BY startTime, endTime
ASC";
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


                print("\n\t\t<br><br><FONT COLOR=$daytextcolor SIZE=2>Evening</FONT>");
                $sql = "SELECT eid, title, startTime, endTime, barcolor FROM $prefix"._events." WHERE (eventDate<='$Date_Array[2]-$Date_Array[0]-$Date_Array[1]' AND endDate >= '$Date_Array[2]-$Date_Array[0]-$Date_Array[1]' AND alldayevent='0' AND startTime >= '$times[$i]') ORDER BY startTime, endTime ASC;";
		printAppt($sql);

                print("\n\t</TD>");

                /**** Events */
                print("\n\t<TD width=50% valign=top bgcolor=$daybgcolor>");
                print("\n\t\t<TABLE width=100% bgcolor=$trimbgcolor2 border=1 cellspacing=0><TR><TD><FONT color=$trimtextcolor2 SIZE=2><b>Events</TD></TR></TABLE>");
                $result = mysql_query("SELECT eid,title,barcolor FROM $prefix"._events." WHERE (eventDate <= '$Date_Array[2]-$Date_Array[0]-$Date_Array[1]' AND endDate >= '$Date_Array[2]-$Date_Array[0]-$Date_Array[1]' AND alldayevent='1') ORDER BY title ASC");
                if ($eventsopeninnewwindow) {
                                $frame = "target=\"blank\"";
                        } else {
                                $frame = "";
                        }
                while(list($eid, $title, $barcolor) = mysql_fetch_row($result)) {
                        if ($barcolor == "r") $barcolorchar="r";
                        elseif ($barcolor == "g") $barcolorchar="g";
                        elseif ($barcolor == "b") $barcolorchar="b";
                        elseif ($barcolor == "y") $barcolorchar="y";
                        else $barcolorchar="w";
                        print("<img src=\"images/calendar/ball$barcolorchar.gif\" border=0>&nbsp;<a href=\"modules.php?name=$module_name&file=calprint&type=view&eid=$eid\" $frame>$title</a><br>");
                }

                print("\n\t</TD>\n</TR>");
                print("\n</TABLE>\n</CENTER>");
        }
	echo "</table>";
}

function buildMonth($Date) {
        global $module_name, $trimbgcolor, $trimtextcolor, $trimbgcolor2, $trimtextcolor2,$textEvents,
	$monthtableborder, $monthtablecellspacing, $monthtablecellpadding, $monthbgcolor, $selecteddaycolor,
	$eventsopeninnewwindow, $monthshadedbgcolor, $monthshadedtextcolor,$time24Hour, $prefix;
	echo "<table>";
        if (!$Date) {
	        $Date = Date("m/d/Y");
	}
        $Date_Array = explode("/", $Date);
        if ($Date_Array[2] < 1970)
                print("ERROR! System can not interpret dates befor 01/01/1970");
        else {
                loadStyle();
                loadPopups();
                $Date = mktime("", "", "", $Date_Array[0], $Date_Array[1], $Date_Array[2]);

                /**** Header */
                $Prev_Month = mktime("", "", "", $Date_Array[0] - 1, 1, $Date_Array[2]);
                $Prev_Date = Date("m/d/Y",$Prev_Month);
                $Next_Month = mktime("", "", "", $Date_Array[0] + 1, 1, $Date_Array[2]);
                $Next_Date = Date("m/d/Y",$Next_Month);
                print("\n<TABLE cellspacing=2 cellpadding=2 width=100%><tr><td><TABLE width=100%><TR>");

                /**** Print Previous Month Button */
                print("\n<TD width=100><FONT SIZE=2><a href=\"modules.php?name=$module_name&file=calprint&Date=$Prev_Date&type=month\"><<< "._CALPREVIOUS."</a></TD>");
                print("\n<TD align=center><FONT size=4>");

                /**** Print Month Name and Year */
                print(getMonthName($Date)." ".Date("Y",$Date));
                print("</FONT></TD>");

                /**** Print Next Month Button */
                print("\n<TD width=100 align=right><FONT SIZE=2><a href=\"modules.php?name=$module_name&file=calprint&Date=$Next_Date&type=month\">"._CALNEXT." >>></a></TD>");
                print("</TR></TABLE>");

                /**** Get the Day (Integer) for the first day in the month */
                $First_Day_of_Month_Date = mktime("", "", "", $Date_Array[0], 1, $Date_Array[2]);
                $Day_of_First_Week = Date("w",$First_Day_of_Month_Date);

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

                /**** Set up data */
                $count = -1;
                $result = mysql_query("SELECT eid,title,hometext,eventDate,endDate,barcolor FROM $prefix"._events." WHERE (((eventDate >= '$Date_Array[2]-$Date_Array[0]-1' AND eventDate <= '$Date_Array[2]-$Date_Array[0]-$Last_Day') OR (endDate >= '$Date_Array[2]-$Date_Array[0]-1' AND endDate <= '$Date_Array[2]-$Date_Array[0]-$Last_Day') OR (endDate >= '$Date_Array[2]-$Date_Array[0]-$Last_Day' AND eventDate <= '$Date_Array[2]-$Date_Array[0]-1')) AND alldayevent='1') ORDER BY eventDate ASC");

                while(list($eid, $title, $description, $eventDate, $endDate,$barcolor) = mysql_fetch_row($result)) {
                        $eid_Array[] = $eid;
                        $title_Array[] = $title;
                        $eventDate_Array[] = $eventDate;
                        $endDate_Array[] = $endDate;
                        $barcolor_Array[] = $barcolor;
                        $desc_Array[] = valueToText($description);
                        $count++;
                }
                //$count = $count - 1;
                mysql_free_result($result);
                /**** Build Month */
                print("\n<CENTER>\n<TABLE border=$monthtableborder cellspacing=$monthtablecellspacing cellpadding=$monthtablecellpadding width=100% bgcolor=$monthbgcolor>");
                $day_of_week = 1;

                echo "<TR bgcolor=$trimbgcolor>
                        <TH width=15%><FONT SIZE=2 color=$trimtextcolor>"._CALFIRSTDAY."</TH>
                        <TH width=15%><FONT color=$trimtextcolor SIZE=2>"._CALSECONDDAY."</TH>
                        <TH width=15%><FONT color=$trimtextcolor SIZE=2>"._CALTHIRDDAY."</TH>
                        <TH width=15%><FONT color=$trimtextcolor SIZE=2>"._CALFOURTHDAY."</TH>
                        <TH width=15%><FONT color=$trimtextcolor SIZE=2>"._CALFIFTHDAY."</TH>
                        <TH width=15%><FONT color=$trimtextcolor SIZE=2>"._CALSIXTHDAY."</TH>
                        <TH width=15%><FONT color=$trimtextcolor SIZE=2>"._CALSEVENTHDAY."</TH>
                      </TR>";

                /**** Previous Greyed month days */
                While ($day_of_week < ($Day_of_First_Week + 1)) {
                        if ($day_of_week == 1) {
                                print("\n<TR>");
                                }
                        $Tmp_Date = mktime("", "", "", $Date_Array[0], 1 - (($Day_of_First_Week + 1) - $day_of_week), $Date_Array[2]);
                        $Tmp_Day = Date("d",$Tmp_Date);
                        print("<TD bgcolor=$monthshadedbgcolor align=center valign=top><FONT SIZE=2 color=$monthshadedtextcolor>$Tmp_Day</TD>");
                        $day_of_week += 1;
                }
                $usedcount = 0;
                $cellcount = 0;
                /**** Build Current Month */
                for ($day = 1 ; $day <= $Last_Day ; $day++) {
                        if ($day_of_week == 1) {
                                print("\n<TR>");
                                }
                        if (($day == $Today_d) && ($Date_Array[0] == $Today_m) && ($Date_Array[2] == $Today_y))
                                print("\n\t<TD valign=top><TABLE width=100% cellpadding=0 cellspacing=0
				bgcolor=$selecteddaycolor border=0><TR><TD align=center><FONT SIZE=2><b><a href=\"modules.php?op=modload&name=$module_name&file=calprint&Date=$Date_Array[0]/$day/$Date_Array[2]&type=day\">$day</a></b></TD></TR></TABLE>");
                        else
                                print("\n\t<TD valign=top><TABLE width=100% cellpadding=0 cellspacing=0 border=0><TR><TD
				align=center><FONT SIZE=2><b><a

href=\"modules.php?op=modload&name=$module_name&file=calprint&Date=$Date_Array[0]/$day/$Date_Array[2]&type=day\">$day</a></b></center></font></TD></TR></TABLE>");

                        /************************/
                        /**** SET UP DATA!!! ****/
                        /************************/

                        /**** Reset Cell Array */
                        $cellDate = mktime (0, 0, 0, $Date_Array[0], $day, $Date_Array[2]);
                        for ($i=0;$i <= $cellcount - 1;$i++) {
                                $tmpEndDate_Array = explode("-", $cellArrayEndDate[$i]);
                                $tmpEndDate = mktime (0, 0, 0, $tmpEndDate_Array[1], $tmpEndDate_Array[2], $tmpEndDate_Array[0]);
                                if ($tmpEndDate < $cellDate) {
                                        $cellArray[$i] = "FALSE";
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

                        /**************************************/
                        /**** INSERT DATA INTO CALENDAR!!! ****/
                        /**************************************/
                        if ($eventsopeninnewwindow == 1) {
                                $frame = "target=\"blank\"";
                        } else {
                                $frame = "";
                        }
                        for ($i=0;$i<=$cellcount - 1;$i++) {
                                echo "<table width=\"100%\" cellpadding=0 cellspacing=0 border=0>
                                      <tr>";

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
                                                echo "<font size=2><img src=\"images/calendar/ball$barcolorchar.gif\" border=0> <a href=\"modules.php?op=modload&name=$module_name&file=calprint&type=view&eid=$cellArray[$i]\" $frame>$cellArrayTitle[$i]</a></font><br>";
                                        } else {
                                                $popuptext = " ONMOUSEOVER=\"pop('$cellArrayTitle[$i]','$cellArrayDesc[$i]',popbord,popback)\" ONMOUSEOUT=\"kill()\"";
                                                if (($cellDate == $tmpEndDate) && ($tmpEndDate == $tmpEventDate)) {
                                                        echo "<td><a href=\"modules.php?op=modload&name=$module_name&file=calprint&type=view&eid=$cellArray[$i]\" $frame $popuptext><img src=\"images/calendar/leftbar$barcolorchar.gif\" border=\"0\"></a></td>
                                                        <td align=\"right\" width=100% background=\"images/calendar/mainbar$barcolorchar.gif\"><a href=\"modules.php?name=$module_name&file=calprint&type=view&eid=$cellArray[$i]\" $frame $popuptext><img src=\"images/calendar/mainbar2$barcolorchar.gif\" border=\"0\"></a></td>
                                                        <td align=\"right\"><a href=\"modules.php?name=$module_name&file=calprint&type=view&eid=$cellArray[$i]\" $frame $popuptext><img src=\"images/calendar/rightbarcap$barcolorchar.gif\" border=\"0\"></a></td>";
                                                } elseif ($cellDate == $tmpEventDate) {
                                                        echo "<td><a href=\"modules.php?name=$module_name&file=calprint&type=view&eid=$cellArray[$i]\" $frame $popuptext><img src=\"images/calendar/leftbar$barcolorchar.gif\" border=\"0\"></a></td>
                                                        <td align=\"center\" width=100% background=\"images/calendar/mainbar$barcolorchar.gif\"><a href=\"modules.php?name=$module_name&file=calprint&type=view&eid=$cellArray[$i]\" $frame $popuptext><img src=\"images/calendar/mainbar2$barcolorchar.gif\" border=\"0\"></a></td>";
                                                } elseif ($cellDate == $tmpEndDate) {
                                                        echo "<td align=\"center\" width=100% background=\"images/calendar/mainbar$barcolorchar.gif\"><a href=\"modules.php?name=$module_name&file=calprint&type=view&eid=$cellArray[$i]\" $frame $popuptext><img src=\"images/calendar/mainbar2$barcolorchar.gif\" border=\"0\"></a></td>
                                                        <td><a href=\"modules.php?op=modload&name=$module_name&file=calprint&type=view&eid=$cellArray[$i]\" $frame $popuptext><img src=\"images/calendar/rightbar$barcolorchar.gif\" border=\"0\"></a></td>";
                                                } else {
                                                        if ($day == 1) {
                                                                echo "<td><a href=\"modules.php?name=$module_name&file=calprint&type=view&eid=$cellArray[$i]\" $frame $popuptext><img src=\"images/calendar/leftbar2$barcolorchar.gif\" border=\"0\"></a></td>
                                                                <td align=\"center\" width=99% background=\"images/calendar/mainbar$barcolorchar.gif\"><a href=\"modules.php?name=$module_name&file=calprint&type=view&eid=$cellArray[$i]\" $frame $popuptext><img src=\"images/calendar/mainbar2$barcolorchar.gif\" border=\"0\"></a></td>";
                                                        } else {
                                                                echo "<td align=\"center\" background=\"images/calendar/mainbar$barcolorchar.gif\"><a href=\"modules.php?name=$module_name&file=calprint&type=view&eid=$cellArray[$i]\" $frame $popuptext><img src=\"images/calendar/mainbar$barcolorchar.gif\" border=\"0\"></a></td>";
                                                        }
                                                }
                                        }
                                } else {
                                        if (!$textEvents) {
                                                echo "<td width=100%><img src=\"images/calendar/blankbar.gif\"></td>";
                                        }
                                }
                                echo "</tr>
                                      </table>";
                        }

                        $resultAPPT = mysql_query("SELECT eid,title,eventDate,endDate,startTime,endTime,barcolor FROM $prefix"._events." WHERE (eventDate <= '$Date_Array[2]-$Date_Array[0]-$day' AND endDate >= '$Date_Array[2]-$Date_Array[0]-$day' AND alldayevent='0') ORDER BY startTime, endTime ASC");
                        while(list($eid, $title, $eventDate, $endDate, $startTime, $endTime, $barcolor) = mysql_fetch_row($resultAPPT)) {
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
                                echo "<font size=2><img src=\"images/calendar/ball$barcolorchar.gif\" border=0> <a href=\"modules.php?name=$module_name&file=calprint&type=view&eid=$eid\" $frame>$startTime - $endTime<br> $title</a></font><br>";
                        }
                        mysql_free_result($resultAPPT);
                        print("</td>");
                        if ($day_of_week == 7) {
                                $day_of_week = 0;
                                print("\n</TR>");
                        }
                        $day_of_week += 1;
                }

                /**** Next Greyed month days */
                $day = 1;
                While (($day_of_week <= 7) && ($day_of_week != 1)) {
                        print("<TD bgcolor=$monthshadedbgcolor align=center valign=top><FONT SIZE=2 color=$monthshadedtextcolor>$day</TD>");
                        $day_of_week += 1;
                        $day += 1;
                }
                print("\n</TR>\n</TABLE>\n</td></tr></table></CENTER>");
        }
	echo "</table>";
}

function buildMonthforNetscape($Date) {
        global $module_name, $trimbgcolor, $trimtextcolor, $trimbgcolor2, $trimtextcolor2,$textEvents,
	$monthtableborder, $monthtablecellspacing, $monthtablecellpadding, $monthbgcolor, $selecteddaycolor,
	$eventsopeninnewwindow, $monthshadedbgcolor, $monthshadedtextcolor,$time24Hour;
        if (!$Date) {
	        $Date = Date("m/d/Y");
	}
        $Date_Array = explode("/", $Date);
        if ($Date_Array[2] < 1970)
                print("ERROR! System can not interpret dates befor 01/01/1970");
        else {
                $Date = mktime("", "", "", $Date_Array[0], $Date_Array[1], $Date_Array[2]);

                /**** Header */
                $Prev_Month = mktime("", "", "", $Date_Array[0] - 1, 1, $Date_Array[2]);
                $Prev_Date = Date("m/d/Y",$Prev_Month);
                $Next_Month = mktime("", "", "", $Date_Array[0] + 1, 1, $Date_Array[2]);
                $Next_Date = Date("m/d/Y",$Next_Month);
                print("\n<TABLE width=100%><TR>");

                /**** Print Previous Month Button */
                print("\n<TD width=100><FONT SIZE=2><a href=\"modules.php?name=$module_name&file=calprint&Date=$Prev_Date&type=month\"><<< "._CALPREVIOUS."</a></TD>");
                print("\n<TD align=center><FONT size=4>");

                /**** Print Month Name and Year */
                print(getMonthName($Date)." ".Date("Y",$Date));
                print("</FONT></TD>");

                /**** Print Next Month Button */
                print("\n<TD width=100 align=right><FONT SIZE=2><a href=\"modules.php?name=$module_name&file=calprint&Date=$Next_Date&type=month\">"._CALNEXT." >>></a></TD>");
                print("</TR></TABLE>");

                /**** Get the Day (Integer) for the first day in the month */
                $First_Day_of_Month_Date = mktime("", "", "", $Date_Array[0], 1, $Date_Array[2]);
                $Day_of_First_Week = Date("w",$First_Day_of_Month_Date);

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

                //$result = mysql_query("SELECT eid,title,hometext,eventDate,endDate,barcolor FROM $prefix"._events." WHERE (((eventDate >= '$Date_Array[2]-$Date_Array[0]-1' AND eventDate <= '$Date_Array[2]-$Date_Array[0]-$Last_Day') OR (endDate >= '$Date_Array[2]-$Date_Array[0]-1' AND endDate <= '$Date_Array[2]-$Date_Array[0]-$Last_Day') OR (endDate >= '$Date_Array[2]-$Date_Array[0]-$Last_Day' AND eventDate <= '$Date_Array[2]-$Date_Array[0]-1')) AND alldayevent='1') ORDER BY eventDate ASC");




                /**** Build Month */
                print("\n<CENTER>\n<TABLE border=$monthtableborder cellspacing=$monthtablecellspacing cellpadding=$monthtablecellpadding width=100% bgcolor=$monthbgcolor>");
                $day_of_week = 1;

                echo "<TR bgcolor=$trimbgcolor>
                        <TH width=15%><FONT SIZE=2 color=$trimtextcolor>"._CALFIRSTDAY."</TH>
                        <TH width=15%><FONT color=$trimtextcolor SIZE=2>"._CALSECONDDAY."</TH>
                        <TH width=15%><FONT color=$trimtextcolor SIZE=2>"._CALTHIRDDAY."</TH>
                        <TH width=15%><FONT color=$trimtextcolor SIZE=2>"._CALFOURTHDAY."</TH>
                        <TH width=15%><FONT color=$trimtextcolor SIZE=2>"._CALFIFTHDAY."</TH>
                        <TH width=15%><FONT color=$trimtextcolor SIZE=2>"._CALSIXTHDAY."</TH>
                        <TH width=15%><FONT color=$trimtextcolor SIZE=2>"._CALSEVENTHDAY."</TH>
                      </TR>";

                /**** Previous Greyed month days */
                While ($day_of_week < ($Day_of_First_Week + 1)) {
                        if ($day_of_week == 1) {
                                print("\n<TR>");
                                }
                        $Tmp_Date = mktime("", "", "", $Date_Array[0], 1 - (($Day_of_First_Week + 1) - $day_of_week), $Date_Array[2]);
                        $Tmp_Day = Date("d",$Tmp_Date);
                        print("<TD bgcolor=$monthshadedbgcolor align=center valign=top><FONT SIZE=2 color=$monthshadedtextcolor>$Tmp_Day</TD>");
                        $day_of_week += 1;
                }

                /**** Build Current Month */
                for ($day = 1 ; $day <= $Last_Day ; $day++) {
                        if ($day_of_week == 1) {
                                print("\n<TR>");
                                }
                        if (($day == $Today_d) && ($Date_Array[0] == $Today_m) && ($Date_Array[2] == $Today_y))
                                print("\n\t<TD valign=top><center><FONT SIZE=2><b><a href=\"modules.php?name=$module_name&file=calprint&Date=$Date_Array[0]/$day/$Date_Array[2]&type=day\">$day</a></b></center>");
                        else
                                print("\n\t<TD valign=top><center><FONT SIZE=2><b><a href=\"modules.php?opname=$module_name&=modload&file=calprint&Date=$Date_Array[0]/$day/$Date_Array[2]&type=day\">$day</a></b></center></font>");


                        /**************************************/
                        /**** INSERT DATA INTO CALENDAR!!! ****/
                        /**************************************/
                        if ($eventsopeninnewwindow == 1) {
                                $frame = "target=\"blank\"";
                        } else {
                                $frame = "";
                        }

                        $result = mysql_query("SELECT eid,title,eventDate,endDate,barcolor FROM $prefix"._events." WHERE (eventDate <= '$Date_Array[2]-$Date_Array[0]-$day' AND endDate >= '$Date_Array[2]-$Date_Array[0]-$day' AND alldayevent='1') ORDER BY title ASC");
                        while(list($eid, $title, $eventDate, $endDate, $barcolor) = mysql_fetch_row($result)) {
                                if ($barcolor == "r") $barcolorchar="r";
                                elseif ($barcolor == "g") $barcolorchar="g";
                                elseif ($barcolor == "b") $barcolorchar="b";
                                elseif ($barcolor == "y") $barcolorchar="y";
                                else $barcolorchar="w";
                                echo "<font size=2><img src=\"images/calendar/ball$barcolorchar.gif\" border=0> <a href=\"modules.php?name=$module_name&file=calprint&type=view&eid=$eid\" $frame>$title</a></font><br>";
                        }
                        mysql_free_result($result);

                        $resultAPPT = mysql_query("SELECT eid,title,eventDate,endDate,startTime,endTime,barcolor FROM $prefix"._events." WHERE (eventDate <= '$Date_Array[2]-$Date_Array[0]-$day' AND endDate >= '$Date_Array[2]-$Date_Array[0]-$day' AND alldayevent='0') ORDER BY startTime, endTime ASC");
                        while(list($eid, $title, $eventDate, $endDate, $startTime, $endTime, $barcolor) = mysql_fetch_row($resultAPPT)) {
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
                                echo "<font size=2><img src=\"images/calendar/ball$barcolorchar.gif\" border=0> <a href=\"modules.php?name=$module_name&file=calprint&type=view&eid=$eid\" $frame>$startTime - $endTime<br> $title</a></font><br>";
                        }
                        mysql_free_result($resultAPPT);

                        print("</td>");
                        if ($day_of_week == 7) {
                                $day_of_week = 0;
                                print("\n</TR>");
                        }
                        $day_of_week += 1;
                }

                /**** Next Greyed month days */
                $day = 1;
                While (($day_of_week <= 7) && ($day_of_week != 1)) {
                        print("<TD bgcolor=$monthshadedbgcolor align=center valign=top><FONT SIZE=2 color=$monthshadedtextcolor>$day</TD>");
                        $day_of_week += 1;
                        $day += 1;
                }
                print("\n</TR>\n</TABLE>\n</CENTER>");
        }
}

function viewEvent($eid) {
        global $admin,$module_name,$time24Hour,$useInternationalDates, $prefix;
	echo "<table>";
        $result = mysql_query("SELECT * FROM $prefix"._events." WHERE eid=$eid");
        list($eid,$aid,$title,$datePosted,$body,$comments,$counter,$topic,$informant,$eventDate,$endDate,$startTime,$endTime,$alldayevent) = mysql_fetch_row($result);
        $result = mysql_query("select topicimage from $prefix"._topics." where topicid='$topic'");
        list($topicimage) = mysql_fetch_row($result);
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
	echo "<center><font size=4><b>"._CALVIEWEVENT."</b>: \"$title\"</font><p>
              <font size=2><b>"._CALEVENTDATEPREVIEW."</b>: ";
	if ($useInternationalDates) {
		echo "<a href=\"modules.php?op=modload&name=$module_name&file=calprint&type=day&Date=$Date_Array[1]/$Date_Array[2]/$Date_Array[0]\">$Date_Array[2]/$Date_Array[1]/$Date_Array[0]</a><br>";
	} else {
         	echo "<a href=\"modules.php?op=modload&name=$module_name&file=calprint&type=day&Date=$Date_Array[1]/$Date_Array[2]/$Date_Array[0]\">$Date_Array[1]/$Date_Array[2]/$Date_Array[0]</a><br>";
	}
        if (strtotime($eventDate) != strtotime($endDate)) {
                echo "<font size=2><b>"._CALENDDATEPREVIEW."</b>: ";
		if ($useInternationalDates) {
			echo "<a href=\"modules.php?op=modload&name=$module_name&file=calprint&type=day&Date=$endDate_Array[1]/$endDate_Array[2]/$endDate_Array[0]\">$endDate_Array[2]/$endDate_Array[1]/$endDate_Array[0]</a><br>";
		} else {
                      	echo "<a href=\"modules.php?op=modload&name=$module_name&file=calprint&type=day&Date=$endDate_Array[1]/$endDate_Array[2]/$endDate_Array[0]\">$endDate_Array[1]/$endDate_Array[2]/$endDate_Array[0]</a><br>";
		}
        }
        if (is_admin($admin)) {
	        echo "<br>[ <a href=\"admin.php?op=CalendarEditStory&amp;eid=$eid\">"._EDIT."</a> | <a href=\"admin.php?op=CalendarRemoveStory&amp;eid=$eid\">"._DELETE."</a> ]\n";
        }
        echo "<table width=\"90%\">
              <tr>
                <td width=\"90%\" valign=\"top\">";
        if ($alldayevent == "0") {
              echo "<b>"._CALSTARTTIME."</b>: $startTime<br>
                    <b>"._CALENDTIME."</b>: $endTime<br><br>";
        }
        echo "<b>"._CALARTICLETEXT."</b>:<br>$body<p></font></td>
                <td valign=\"top\"><img src=\"images/topics/$topicimage\" border=\"0\"></td>
              </tr>
              </table>
              <br><br>
              <font size=1>"._CALPOSTEDBY." <a href=\"user.php?op=userinfo&uname=$informant\">$informant</a> "._CALPOSTEDON." $Date_Array2[1]/$Date_Array2[2]/$Date_Array2[0] "._CALACCEPTEDBY." $aid</font></center>";
	echo "</table>";
}

function CalendarIndex($Date,$type,$eid) {
    global $storyhome, $httpref, $httprefmax, $topicname, $topicimage, $topictext, $datetime, $user, $cookie, $nuke_url, $module_name,$eventsopeninnewwindow,$netscapeFriendlyMonthView,$useInternationalDates, $prefix;

    if (isset($cookie[3])) {
	    $storynum = $cookie[3];
    } else {
            $storynum = $storyhome;
    }
    $result = mysql_query("SELECT eid, aid, title, time, hometext, comments, counter, topic, informant FROM $prefix"._events." ORDER BY eid DESC limit $storynum");
    if(!$result) {
            echo mysql_errno(). ": ".mysql_error(). "<br>"; exit();
    }
    formatTimestamp($time);
    $subject = stripslashes($subject);
    $hometext = stripslashes($hometext);
    $introcount = strlen($hometext);
    $totalcount = $introcount + $fullcount;
    echo "<table cellpadding=8 width=\"640\"><tr><td>";
    if (($type == "month") || !($type)) {
        if($netscapeFriendlyMonthView)
                buildMonthforNetscape($Date);
        else
                buildMonth($Date);
    } elseif ($type == "day") {
            buildDay($Date);
    } elseif ($type == "year") {
            buildYear($Date);
    } elseif ($type == "view") {
            viewEvent($eid);
    }
    echo "</td></tr></table>";

    mysql_free_result($result);
    if ($httpref==1) {
	$referer = getenv("HTTP_REFERER");
	if ($referer=="" OR eregi("^unknown", $referer) OR substr("$referer",0,strlen($nuke_url))==$nuke_url OR eregi("^bookmark",$referer)) {
	} else {
    	    mysql_query("insert into $prefix"._referer." values (NULL, '$referer')");
	}
	$result = mysql_query("select * from $prefix"._referer."");
	$numrows = mysql_num_rows($result);
	if($numrows>=$httprefmax) {
    	    mysql_query("delete from $prefix"._referer."");
	}
    }

    if (!(($eventsopeninnewwindow) && ($type == "view"))) {
        echo "</table>";
    }
}

switch ($op) {

    default:
	CalendarIndex($Date,$type,$eid);

}

echo "<SCRIPT LANGUAGE=\"JavaScript\">\n"
     ."<!-- Begin\n"
     ."if (window.print) {\n"
     ."       document.write('<form>" . _CALPRINT1 . " '\n"
     ."       + '<input type=button name=print value=\"" . _CALPRINT2 ."\" '\n"
     ."       + 'onClick=\"javascript:window.print()\">" ._CALPRINT3 . "</form>');\n"
     ."}\n"
     ."// End -->\n"
     ."</script>\n"
    ."</body>\n"
    ."</html>";
//include ("includes/counter.php");

?>