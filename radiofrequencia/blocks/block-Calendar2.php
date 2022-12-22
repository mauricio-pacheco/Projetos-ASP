<?php

/********************************************************/
/* Event Calendar for PHP-Nuke 7.0                      */
/*                                                      */
/* Based on Event Calendar 1.5 by Rob Sutton            */
/* Development & enhancments by Holbrookau and friends  */
/* http://phpnuke.holbrookau.net                        */
/********************************************************/

if (eregi("block-Calendar2.php",$PHP_SELF)) {
    Header("Location: index.php");
    die();
}

$module_name = "Calendar";
$Date = Date("m/d/Y");
$Date_Array = explode("/", $Date);

include("modules/$module_name/configset.php");

/**** Specific front display variables */
/*EDIT THESE TO SPECIFY COLORS BELOW*/

$todaycolor = "#778899";
$daycolor = "#000000";
$daybackground = "#FFFFFF";
$todaybackground = "#FF5555";
$show_cats = 1; // Show the categories legend at the top of block - Yes = 1, No = 0

$content = "";

/*No need to edit below here now */
global $prefix, $currentlang, $dbi;
include("modules/$module_name/language/lang-$currentlang.php");

$eventsresult = sql_query("SELECT eid,title,startTime,endTime,alldayevent,barcolor FROM ".$prefix."_events WHERE (eventDate <= '$Date_Array[2]-$Date_Array[0]-$Date_Array[1]' AND endDate >= '$Date_Array[2]-$Date_Array[0]-$Date_Array[1]') ORDER BY alldayevent,startTime, endTime ASC",$dbi);
if (sql_num_rows($eventsresult) == 0)
        {
        $content .= "<center><font class=\"content\">"._CALNOEVENTS."</font></center>";
        }
 else
        {
if ($show_cats == 1) {
$content = "<center><font class=\"content\"><img src=\"images/calendar/ballr.gif\">$calcat1&nbsp;&nbsp;<img src=\"images/calendar/ballg.gif\">$calcat2<br /><img src=\"images/calendar/ballb.gif\">$calcat3&nbsp;&nbsp;<img src=\"images/calendar/ballw.gif\">$calcat4<br /><img src=\"images/calendar/bally.gif\">$calcat5</font></center><br />";
}
         while(list($eid, $title,$startTime,$endTime,$alldayevent,$barcolor) = sql_fetch_row($eventsresult)) 
         {
         if ($barcolor == "r") $barcolorchar="r";
         elseif ($barcolor == "g") $barcolorchar="g";
         elseif ($barcolor == "b") $barcolorchar="b";
         elseif ($barcolor == "y") $barcolorchar="y";
         else $barcolorchar="w";
         $content .= "<img src=\"images/calendar/ball$barcolorchar.gif\" border=0 ALT=\"\">&nbsp;<a href=\"modules.php?name=$module_name&file=index&type=view&eid=$eid\">$title</a><br />"; 
         } 
        } 
$content .= "<br />";
/*this is going to be changed to a switch ASAP*/
function getMonthName2($Date) 
   {
   $month = Date("m",$Date);
   if ($month == "01") 
   {
     $monthname = _CALJAN;
   } elseif ($month == "02") 
   {
      $monthname = _CALFEB;
   } elseif ($month == "03") 
   {
     $monthname = _CALMAR;
   } elseif ($month == "04") 
   {
     $monthname = _CALAPR;
   } elseif ($month == "05") 
   {
     $monthname = _CALMAY;
   } elseif ($month == "06") 
   {
    $monthname = _CALJUN;
   } elseif ($month == "07") 
   {
     $monthname = _CALJUL;
   } elseif ($month == "08") 
   {
     $monthname = _CALAUG;
   } elseif ($month == "09") 
   {
     $monthname = _CALSEP;
   } elseif ($month == "10")
   {
      $monthname = _CALOCT;
   } elseif ($month == "11") 
   {
     $monthname = _CALNOV;
   } elseif ($month == "12") 
   {
      $monthname = _CALDEC;
   }
   return $monthname;
}

/**** Get the Day (Integer) for the first day in the month */
$First_Day_of_Month_Date = mktime("", "", "", $Date_Array[0], 1, $Date_Array[2]);
$Date = $First_Day_of_Month_Date;

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
$content .= "\n<center><TABLE width =128 border=0 cellspacing=1 cellpadding=2>";
$content .= "\n<TR>\n\t<Td align=\"center\" bgcolor=\"#f2f1ed\" colspan=7><FONT class=\"tiny\"><a
href=\"modules.php?name=$module_name&file=index&Date=$Date_Array[0]/1/$Date_Array[2]&type=month\">";
$content .= getMonthName2($Date)." ".$Today_y;
$content .= "</a></FONT></Td>\n</TR>";

/**** Previous Greyed month days */
$content .= "\n<TR>";
if ($Day_of_First_Week != 0)
$content .= "\n\t<TD colspan=$Day_of_First_Week><font class=\"content\">&nbsp;</font></TD>";
$day_of_week = $Day_of_First_Week + 1;
 /**** Build Current Month */
for ($day = 1 ; $day <= $Last_Day ; $day++) 
   {
   if ($day_of_week == 1) 
   {
   $content .= "\n<TR>";
   }
	$result = sql_query("SELECT eid,title,eventDate,endDate,startTime,endTime,barcolor FROM ".$prefix."_events WHERE (eventDate <= '$Date_Array[2]-$Date_Array[0]-$day' AND endDate >= '$Date_Array[2]-$Date_Array[0]-$day');",$dbi);
	if ($day == $Today_d)
$content .= "\n\t<TD align=center ><b><a href=\"modules.php?name=$module_name&file=index&Date=$Date_Array[0]/$day/$Date_Array[2]&type=day\"><FONT FACE=verdana size=\"1\" color=\"$todaycolor\">$day</font></a></b>";
        else
$content .= "\n\t<TD align=center ><a href=\"modules.php?name=$module_name&file=index&Date=$Date_Array[0]/$day/$Date_Array[2]&type=day\"><FONT FACE=verdana size=\"1\" color=\"$daycolor\">$day</font></a>";
	if (sql_num_rows($result) == 0)
$content .= "<br><img src=\"images/calendar/events0.gif\" ALT=\"\">";
	elseif (sql_num_rows($result) >= 4)
$content .= "<br><img src=\"images/calendar/events4.gif\" ALT=\"\">";
	elseif (sql_num_rows($result) >= 3)
$content .= "<br><img src=\"images/calendar/events3.gif\" ALT=\"\">";
	elseif (sql_num_rows($result) >= 2)


$content .= "<br><img src=\"images/calendar/events2.gif\" ALT=\"\">";
	else
$content .= "<br><img src=\"images/calendar/events1.gif\" ALT=\"\">";
$content .= "</TD>";
        if ($day_of_week == 7) 
        {
        $day_of_week = 0;
        $content .= "\n</TR>";
        }
	
        $day_of_week += 1;
}

/**** Next Greyed month days */
$day = 1;
if ($day_of_week != 1) 
   {
    $tmp = 8 - $day_of_week;
    $content .= "<TD colspan=$tmp><font class=\"tiny\">&nbsp;</font></TD>";
   }
$content .= "\n</TR>\n</TABLE></center>";

?>
