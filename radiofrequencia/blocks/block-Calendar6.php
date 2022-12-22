<?php

/********************************************************/
/* Event Calendar for PHP-Nuke 7.0                      */
/*                                                      */
/* Based on Event Calendar 1.5 by Rob Sutton            */
/* Development & enhancments by Holbrookau and friends  */
/* http://phpnuke.holbrookau.net                        */
/********************************************************/

if (eregi("block-Calendar6.php",$PHP_SELF)) {
   Header("Location: index.php");
   die();
}

$module_name = "Calendar";
include("modules/$module_name/configset.php");
global $prefix, $currentlang, $calsetmonth, $calsetyear;
include("modules/$module_name/language/lang-$currentlang.php");

// Edit to suit
$todaycolor = "#778899";
$daycolor = "#000000";
$daybackground = "#FFFFFF";
$todaybackground = "#FF5555";
$show_cats = 1; // Show the categories legend at the top of block - Yes = 1, No = 0
// End Edits

$Date = Date("m/d/Y");
$Date_Array1 = explode("/", $Date);
$Date_Array = explode("/", $Date);
 if (isset($calsetyear)) {
 $Date_Array[2] = $calsetyear;
  }
if (isset($calsetmonth)) {
 $Date_Array[0] = $calsetmonth;
  }

$content = "";

if ($show_cats == 1) {
$content .= "<center><font class=\"content\"><img src=\"images/calendar/ballr.gif\">&nbsp;$calcat1&nbsp;&nbsp;&nbsp;<img src=\"images/calendar/ballg.gif\">&nbsp;$calcat2&nbsp;&nbsp;&nbsp;<img src=\"images/calendar/ballb.gif\">&nbsp;$calcat3&nbsp;&nbsp;&nbsp;<img src=\"images/calendar/ballw.gif\">&nbsp;$calcat4&nbsp;&nbsp;&nbsp;<img src=\"images/calendar/bally.gif\">&nbsp;$calcat5</font></center><br />";
}

$content .= "<table width=\"100%\"><tr><td width=\"50%\" height=\"100%\"><table width=\"100%\"  height=\"100%\"><tr><td height=\"100%\" width=\"100%\" valign=\"top\" bgcolor=$daybackground>";
$content .= "<center><b>"._CALTODAYS."</b></center><br>";
$eventsresult = mysql_query("SELECT eid,title,startTime,endTime,alldayevent,barcolor FROM ".$prefix."_events WHERE (eventDate <= '$Date_Array1[2]-$Date_Array1[0]-$Date_Array1[1]' AND endDate >= '$Date_Array1[2]-$Date_Array1[0]-$Date_Array1[1]') ORDER BY alldayevent,startTime, endTime ASC");
if ($Date_Array1[2] == $Date_Array[2] && $Date_Array1[0] == $Date_Array[0]) {
if (mysql_num_rows($eventsresult) == 0) 
       {
       $content .= "<center><font class=\"content\">"._CALNOEVENTS."</font></center>";
       }
else
       {
        while(list($eid, $title,$startTime,$endTime,$alldayevent,$barcolor) = mysql_fetch_row($eventsresult)) 
        {
        if ($barcolor == "r") $barcolorchar="r";
        elseif ($barcolor == "g") $barcolorchar="g";
        elseif ($barcolor == "b") $barcolorchar="b";
        elseif ($barcolor == "y") $barcolorchar="y";
        else $barcolorchar="w";
        $content .= "&nbsp;&nbsp;<img src=\"images/calendar/ball$barcolorchar.gif\" border=0> <a href=\"modules.php?name=$module_name&op=modload&file=index&type=view&eid=$eid\">$title</a><br>"; 
        } 
       } 
}

$content .= "</td></tr><tr><td nowrap valign=\"bottom\">";
$content .= "<br><center><a href=\"modules.php?name=$module_name&op=modload&file=submit\">•<FONT FACE=verdana size=\"1\">Create an event</font>•</a><BR><a href=\"modules.php?name=Calendar&op=modload&file=index&type=month&Date=$Date\">•<FONT FACE=verdana size=\"1\">Enlarge Month</font>•</a><BR><a href=\"modules.php?name=Calendar&op=modload&file=index&type=year&Date=$Date\">•<FONT FACE=verdana size=\"1\">View  Year</font>•</a></center>";
$content .= "</td></tr></table></td><td width=\"50%\" valign=\"top\">";

/*this is going to be changed to a switch ASAP*/
$selmon = array();
 for ($i=1; $i <=12; $i++) {
 $selmon[$i] = "";
     }
  $month = $Date_Array[0];
   if ($month == "01" || $month =="1") 
  {
    $monthname = _CALJAN;
      $selmon[1] = "selected";
  } elseif ($month == "02") 
  {
     $monthname = _CALFEB;
     $selmon[2] = "selected";
  } elseif ($month == "03") 
  {
    $monthname = _CALMAR;
     $selmon[3] = "selected";
  } elseif ($month == "04") 
  {
    $monthname = _CALAPR;
    $selmon[4] = "selected";
  } elseif ($month == "05") 
  {
    $monthname = _CALMAY;
    $selmon[5] = "selected";
  } elseif ($month == "06") 
  {
   $monthname = _CALJUN;
   $selmon[6] = "selected";
  } elseif ($month == "07") 
  {
    $monthname = _CALJUL;
    $selmon[7] = "selected";
  } elseif ($month == "08") 
  {
    $monthname = _CALAUG;
$selmon[8] = "selected";
  } elseif ($month == "09") 
  {
    $monthname = _CALSEP;
$selmon[9] = "selected";
  } elseif ($month == "10") 
  {
     $monthname = _CALOCT;
$selmon[10] = "selected";

  } elseif ($month == "11") 
  {
    $monthname = _CALNOV;
$selmon[11] = "selected";
  } elseif ($month == "12") 
  {
     $monthname = _CALDEC;
$selmon[12] = "selected";
  }

$selyear = array();
 for ($i=1; $i <=10; $i++) {
  $selyear[$i] = "";
  if ($Date_Array[2] == ($i+2002)) {
  $selyear[$i] = "selected";
   }
     }
       
$First_Day_of_Month_Date = mktime("", "", "", $Date_Array[0], 1, $Date_Array[2]);
$Date = $First_Day_of_Month_Date;
$Day_of_First_Week = Date("w",$First_Day_of_Month_Date);

$Month = Date("m",$Date);
$day = 27;
do {
    $End_of_Month_Date = mktime("", "", "", $Date_Array[0], $day, $Date_Array[2]);
    $Test_Month = Date("m",$End_of_Month_Date);
    $day += 1;
  } while ( $Month == $Test_Month );
$Last_Day = $day - 2;

$Today_d = Date("d");
$Today_m = Date("m");
$Today_y = Date("Y");

$content .= "\n<center><FORM Name = \"selectcalendar\" action = \"index.php\"><TABLE border=0 cellspacing=1 cellpadding=2>";
$content .= "\n<TR>\n\t<TH colspan=7><FONT class=\"tiny\">";
$content .="<B><center><SELECT Name = \"calsetmonth\" onChange=\"javascript:document.selectcalendar.submit()\">
<OPTION $selmon[1] VALUE='01'>January</OPTION>
<OPTION $selmon[2] VALUE='02'>February</OPTION>
<OPTION $selmon[3] VALUE='03'>March</OPTION>
<OPTION $selmon[4] VALUE='04'>April</OPTION>
<OPTION $selmon[5] VALUE='05'>May</OPTION>
<OPTION $selmon[6] VALUE='06'>June</OPTION>
<OPTION $selmon[7] VALUE='07'>July</OPTION>
<OPTION $selmon[8] VALUE='08'>August</OPTION>
<OPTION $selmon[9] VALUE='09'>September</OPTION>
<OPTION $selmon[10] VALUE='10'>October</OPTION>
<OPTION $selmon[11] VALUE='11'>November</OPTION>
<OPTION $selmon[12] VALUE='12'>December</OPTION>
</SELECT>
<SELECT NAME=\"calsetyear\" onChange=\"javascript:document.selectcalendar.submit()\">
<OPTION $selyear[1] VALUE='2003'>2003</OPTION>
<OPTION $selyear[2] VALUE='2004'>2004</OPTION>
<OPTION $selyear[3] VALUE='2005'>2005</OPTION>
<OPTION $selyear[4] VALUE='2006'>2006</OPTION>
<OPTION $selyear[5] VALUE='2007'>2007</OPTION>
<OPTION $selyear[6] VALUE='2008'>2008</OPTION>
<OPTION $selyear[7] VALUE='2009'>2009</OPTION>
<OPTION $selyear[8] VALUE='2010'>2010</OPTION>
<OPTION $selyear[9] VALUE='2011'>2011</OPTION>
<OPTION $selyear[10] VALUE='2012'>2012</OPTION>
</SELECT></center></b></form>";
$content .= "</TH>\n</TR>";

$content .= "\n<TR>";
if ($Day_of_First_Week != 0)
$content .= "\n\t<TD colspan=$Day_of_First_Week><font class=\"content\"> </TD>";
$day_of_week = $Day_of_First_Week + 1;

for ($day = 1; $day <= $Last_Day; $day++) 
  {
  if ($day_of_week == 1) 
  {
  $content .= "\n<TR>";
  }
$result = mysql_query("SELECT eid,title,eventDate,endDate,startTime,endTime,barcolor FROM ".$prefix."_events WHERE (eventDate <= '$Date_Array[2]-$Date_Array[0]-$day' AND endDate >= '$Date_Array[2]-$Date_Array[0]-$day');");
if (($Date_Array[1] == $day) && ($Date_Array[0] == $Today_m) && ($Date_Array[2] == $Today_y)) 
$content .= "\n\t<TD align=center bgcolor=$todaybackground><b><a href=\"modules.php?name=$module_name&op=modload&file=index&Date=$Date_Array[0]/$day/$Date_Array[2]&type=day\"><FONT FACE=verdana size=\"1\" color=$todaycolor>$day</font></a></b>";
       else
$content .= "\n\t<TD width=\"30\" align=center bgcolor=$daybackground><a href=\"modules.php?name=$module_name&op=modload&file=index&Date=$Date_Array[0]/$day/$Date_Array[2]&type=day\"><FONT FACE=verdana size=\"1\" color=$daycolor>$day</font></a>";
if (mysql_num_rows($result) == 0)
$content .= "<br><img src=\"images/calendar/events0.gif\">";
elseif (mysql_num_rows($result) >= 4)
$content .= "<br><img src=\"images/calendar/events4.gif\">";
elseif (mysql_num_rows($result) >= 3)
$content .= "<br><img src=\"images/calendar/events3.gif\">";
elseif (mysql_num_rows($result) >= 2)
$content .= "<br><img src=\"images/calendar/events2.gif\">";
else
$content .= "<br><img src=\"images/calendar/events1.gif\">";
$content .= "</TD>";
       if ($day_of_week == 7) 
       {
       $day_of_week = 0;
       $content .= "\n</TR>";
       }
       $day_of_week += 1;
}

$day = 1;
if ($day_of_week != 1) 
  {
   $tmp = 8 - $day_of_week;
   $content .= "<TD colspan=$tmp><font class\"tiny\"> </TD>";
  }
 $Date = implode("/", $Date_Array);  
$content .= "</tr></table></td></tr></table>";

?>