<?php

/********************************************************/
/* Event Calendar for PHP-Nuke 7.0                      */
/*                                                      */
/* Based on Event Calendar 1.5 by Rob Sutton            */
/* Development & enhancments by Holbrookau and friends  */
/* http://phpnuke.holbrookau.net                        */
/********************************************************/

/********************************************************/
/* Based on Calendar Scrolling block by Jeff Hare 1.0   */
/********************************************************/

// This module shows the upcoming events, in x days, in a scrolling block

if (eregi("block-Calendar5.php", $PHP_SELF)) {
Header("Location: index.php");
die();
}
$module_name = "Calendar";
global $prefix, $currentlang;
include("modules/$module_name/language/lang-$currentlang.php");
include("modules/$module_name/configset.php");

//Edit to suit
$days_to_see = 10; // How many days ahead to view
$show_cats = 1; // Show the categories legend at the top of block - Yes = 1, No = 0
$noun="days";
if ($days_to_see == 1) {
$noun="day";
}
// End edits

$timestamp = time();
$date_time_array = getdate($timestamp);
$hours = $date_time_array["hours"];
$minutes = $date_time_array["minutes"];
$seconds = $date_time_array["seconds"];
$month = $date_time_array["mon"];
$day = $date_time_array["mday"];
$year = $date_time_array["year"];
$timestamp = mktime($hours, $minutes,$seconds ,$month, $day + $days_to_see-1,$year);
$date_time_array = getdate($timestamp);
$month = $date_time_array["mon"];
$day = $date_time_array["mday"];
$year = $date_time_array["year"];
$Date = Date("m/d/Y");
$Date_Array = explode("/", $Date);
$eventsresult = mysql_query("SELECT eid,title,eventDate,endDate,startTime,endTime,alldayevent,barcolor FROM $prefix"._events." WHERE ((eventDate BETWEEN '$Date_Array[2]-$Date_Array[0]-$Date_Array[1]' AND '$year-$month-$day') OR (endDate BETWEEN '$Date_Array[2]-$Date_Array[0]-$Date_Array[1]' AND '$year-$month-$day')) ORDER BY eventDate ASC,startTime ASC");
if (mysql_num_rows($eventsresult) == 0)
{
$content .= "<center><font class=\"content\">There are no upcoming events within the next $days_to_see $noun</font></center>";
} else {
$content = "<center><b>Upcoming events for the next $days_to_see $noun</b></center><BR>";
if ($show_cats == 1) {
$content .= "<center><font class=\"content\"><img src=\"images/calendar/ballr.gif\">$calcat1&nbsp;&nbsp;<img src=\"images/calendar/ballg.gif\">$calcat2<br /><img src=\"images/calendar/ballb.gif\">$calcat3&nbsp;&nbsp;<img src=\"images/calendar/ballw.gif\">$calcat4<br /><img src=\"images/calendar/bally.gif\">$calcat5</font></center><br />";
}
$content .= " <A name= \"scrollingCode\"></A>
<MARQUEE behavior= \"scroll\" align= \"center\" direction= \"up\" height=\"120\" scrollamount= \"1\" scrolldelay= \"80\" onmouseover='this.stop()' onmouseout='this.start()'>";
while(list($eid,$title,$eventdate,$enddate,$startTime,$endTime,$alldayevent,$barcolor) = mysql_fetch_row($eventsresult))
{
$end = "";
if ($eventdate != $enddate) {
$End_Date = explode("-", $enddate);
$end = "-$End_Date[1]/$End_Date[2]";
}
$Event_Date = explode("-", $eventdate);
if ($barcolor == "r") $barcolorchar="r";
elseif ($barcolor == "g") $barcolorchar="g";
elseif ($barcolor == "b") $barcolorchar="b";
elseif ($barcolor == "y") $barcolorchar="y";
else $barcolorchar="w";
$content .= "<div align=left><img src=\"images/calendar/ball$barcolorchar.gif\" border=0><a href=\"modules.php?op=modload&name=$module_name&file=index&type=view&eid=$eid\"> $Event_Date[1]/$Event_Date[2]$end&nbsp;&nbsp;$title</a><br><BR></div>";
}
}
?>