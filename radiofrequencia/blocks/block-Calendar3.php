<?php

/********************************************************/
/* Event Calendar for PHP-Nuke 7.0                      */
/*                                                      */
/* Based on Event Calendar 1.5 by Rob Sutton            */
/* Development & enhancments by Holbrookau and friends  */
/* http://phpnuke.holbrookau.net                        */
/********************************************************/

/********************************************************/
/* Calendar Scrolling block by Jeff Hare     1.0        */
/********************************************************/

//  This module shows *all* the upcoming events in a scrolling block

/********************************************************/
if (eregi("block-Calendar3.php", $PHP_SELF)) {
    Header("Location: index.php");
    die();
}

$module_name = "Calendar";

global $prefix, $currentlang;
include("modules/$module_name/language/lang-$currentlang.php");
include("modules/$module_name/configset.php");

$show_cats = 1; // Show the categories legend at the top of block - Yes = 1, No = 0

$Date = Date("m/d/Y");

$Date_Array = explode("/", $Date);
$Last_Day = ($Date_Array[1] - 0) + 7;

$eventsresult = mysql_query("SELECT eid,title,startTime,endTime,alldayevent,barcolor FROM $prefix"._events." WHERE ((eventDate >= '$Date_Array[2]-$Date_Array[0]-$Date_Array[1]')) ORDER BY eventDate ASC");

if (mysql_num_rows($eventsresult) == 0)
{
    $content .= "<center><font class=\"content\">"._CALNOEVENTS."</font></center>";
}
else
{
if ($show_cats == 1) {
$content = "<center><font class=\"content\"><img src=\"images/calendar/ballr.gif\">$calcat1&nbsp;&nbsp;<img src=\"images/calendar/ballg.gif\">$calcat2<br /><img src=\"images/calendar/ballb.gif\">$calcat3&nbsp;&nbsp;<img src=\"images/calendar/ballw.gif\">$calcat4<br /><img src=\"images/calendar/bally.gif\">$calcat5</font></center><br />";
}
	$content .= " <A name= \"scrollingCode\"></A>
	<MARQUEE behavior= \"scroll\" align= \"center\" direction= \"up\" height=\"120\" scrollamount= \"1\" scrolldelay= \"80\" onmouseover='this.stop()' onmouseout='this.start()'>";
	while(list($eid, $title,$startTime,$endTime,$alldayevent,$barcolor) = mysql_fetch_row($eventsresult))
	{
		if ($barcolor == "r") $barcolorchar="r";
		elseif ($barcolor == "g") $barcolorchar="g";
		elseif ($barcolor == "b") $barcolorchar="b";
		elseif ($barcolor == "y") $barcolorchar="y";
		else $barcolorchar="w";

		$content .= "<img src=\"images/calendar/ball$barcolorchar.gif\" border=0>&nbsp;<a href=\"modules.php?op=modload&name=$module_name&file=index&type=view&eid=$eid\">$title</a><br><br>";
	}
}

?>
