<?php 

/********************************************************/ 
/* Event Calendar for PHP-Nuke 7.0 */ 
/* */ 
/* Based on Event Calendar 1.5 by Rob Sutton */ 
/* Development & enhancments by Holbrookau and friends */ 
/* http://phpnuke.holbrookau.net */ 
/********************************************************/ 
if ( !defined('ADMIN_FILE') ) 
{ 
die("Illegal File Access"); 
} 
global $prefix, $db; 
if (!stristr($_SERVER['SCRIPT_NAME'], "admin.php")) { die ("Access Denied"); } 

$aid = substr("$aid", 0,25); 
$row = $db->sql_fetchrow($db->sql_query("SELECT title, admins FROM ".$prefix."_modules WHERE title='Calendar'")); 
$row2 = $db->sql_fetchrow($db->sql_query("SELECT name, radminsuper FROM ".$prefix."_authors WHERE aid='$aid'")); 
$admins = explode(",", $row['admins']); 
$auth_user = 0; 
for ($i=0; $i < sizeof($admins); $i++) { 
if ($row2['name'] == "$admins[$i]" AND $row['admins'] != "") { 
$auth_user = 1; 
} 
} 

if ($row2['radminsuper'] == 1 || $auth_user == 1) { 

$module_name = "Calendar"; // CHANGE THIS IF YOU CHANGE THE MODULES FOLDER NAME 

include("modules/$module_name/config.php"); 

function buildMonthSelect($month) { 
for ($i = 1; $i <= 12; $i++) { 
if ($i == $month) $sel = "SELECTED"; 
else $sel = ""; 
echo "<option $sel value=\"$i\">$i</option>\n"; 
} 
} 

function buildDaySelect($day) { 
for ($i = 1; $i <= 31; $i++) { 
if ($i == $day) $sel = "SELECTED"; 
else $sel = ""; 
echo "<option $sel value=\"$i\">$i</option>\n"; 
} 
} 

function buildYearSelect($year) { 
for ($i = 2001; $i <= 2030; $i++) { 
if ($i == $year) $sel = "SELECTED"; 
else $sel = ""; 
echo "<option $sel value=\"$i\">$i</option>\n"; 
} 
} 

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
} 

function buildMinSelect($min) { 
for ($i = 0; $i <= 45;) { 
echo $i; 
if (($i == $min) | (($i == 0) & ($min == "00"))) $sel = "SELECTED"; 
else $sel = ""; 
if ($i == 0) echo "<option $sel value=\"00\">:00</option>\n"; 
else echo "<option $sel value=\"$i\">:$i</option>\n"; 
$i = $i + 15; 
} 
} 

function buildAMPMSelect($ampm) { 
if ($ampm == "AM") $sel = "SELECTED"; 
else $sel = ""; 
echo "<option $sel value=\"AM\">AM</option>\n"; 
if ($ampm == "PM") $sel = "SELECTED"; 
else $sel = ""; 
echo "<option $sel value=\"PM\">PM</option>\n"; 
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
$hour = $time_Array[0]; 
$ampm = "AM"; 
} 
$time = "$hour:$min:$ampm"; 
return $time; 
} 

function getTimeFormat($hour,$min,$ampm) { 
if (($ampm == "AM") & ($hour == "12")) { 
$hour = "00"; 
} elseif (($ampm == "PM") & ($hour != "12")) { 
$hour = 12 + $hour; 
} 
$time = "$hour:$min:00"; 
return $time; 
} 

function CalendarDeleteStory($qid) { 
global $prefix; 
$result = mysql_query("delete from ".$prefix."_events_queue where qid=$qid"); 
if (!$result) { 
echo mysql_errno(). ": ".mysql_error(). "<br>"; 
return; 
} 
Header("Location: admin.php?op=CalendarAdmin"); 
} 

function printJavaScript() { 
echo "<script> 
function verify() { 
var msg = \""._CALVALIDERRORMSG."\\n__________________________________________________\\n\\n\"; 
var errors = \"FALSE\"; 
var starthour; 
var endhour; 
var startampm; 
var endampm; 
eventDate = new Date(document.calendar.month.options[document.calendar.month.selectedIndex].value +\"/\"+ document.calendar.day.options[document.calendar.day.selectedIndex].value+\"/\"+document.calendar.year.options[document.calendar.year.selectedIndex].value); 
endDate = new Date(document.calendar.endmonth.options[document.calendar.endmonth.selectedIndex].value + \"/\" + document.calendar.endday.options[document.calendar.endday.selectedIndex].value + \"/\" + document.calendar.endyear.options[document.calendar.endyear.selectedIndex].value); 

if (document.calendar.subject.value == \"\") { 
errors = \"TRUE\"; 
msg += \""._CALVALIDSUBJECT."\\n\"; 
} 
if (eventDate.getMonth()+1 != document.calendar.month.options[document.calendar.month.selectedIndex].value) { 
errors = \"TRUE\"; 
msg += \"** "._CALVALIDEVENTDATE."\\n\"; 
} 
if (endDate.getMonth()+1 != document.calendar.endmonth.options[document.calendar.endmonth.selectedIndex].value) { 
errors = \"TRUE\"; 
msg += \"** "._CALVALIDENDDATE."\\n\"; 
} 
if (endDate.getTime() < eventDate.getTime()) { 
errors = \"TRUE\"; 
msg += \"** "._CALVALIDDATES."\\n\"; 
} 
if (errors == \"TRUE\") { 
msg += \"__________________________________________________\\n\\n"._CALVALIDFIXMSG."\\n\"; 
alert(msg); 
return false; 
} 
} 
</script>"; 
} 

function CalendarDisplayStory($qid) { 
global $user, $subject, $story, $tipath, $bgcolor1, $bgcolor2,$anonymous,$time24Hour,$useInternationalDates,$prefix, $dbi, $calcat1, $calcat2, $calcat3, $calcat4, $calcat5; 
include ('header.php'); 
GraphicAdmin($hlpfile); 
printJavaScript(); 
OpenTable(); 
echo "<center><font size=\"4\">"._CALSUBMISSIONSADMIN."</font></center>"; 
CloseTable(); 
echo "<br>"; 
$today = getdate(); 
$tday = $today[mday]; 
if ($tday < 10){ 
$tday = "0$tday"; 
} 
$tmonth = $today[month]; 
$ttmon = $today[mon]; 
if ($ttmon < 10){ 
$ttmon = "0$ttmon"; 
} 
$tyear = $today[year]; 
$thour = $today[hours]; 
if ($thour < 10){ 
$thour = "0$thour"; 
} 
$tmin = $today[minutes]; 
if ($tmin < 10){ 
$tmin = "0$tmin"; 
} 
$tsec = $today[seconds]; 
if ($tsec < 10){ 
$tsec = "0$tsec"; 
} 
$date = "$tmonth $tday, $tyear @ $thour:$tmin:$tsec"; 
$result = mysql_query("SELECT qid, uid, uname, title, story, topic, eventDate, endDate, startTime, endTime, alldayevent, barcolor FROM ".$prefix."_events_queue where qid=$qid"); 
list($qid, $uid, $uname, $subject, $story, $topic, $eventDate, $endDate, $startTime, $endTime, $alldayevent, $barcolor) = mysql_fetch_row($result); 
mysql_free_result($result); 
$subject = stripslashes($subject); 
$story = stripslashes($story); 
OpenTable(); 
if($topic=="") { 
$topic = 1; 
} 
$result = mysql_query("select topicimage from ".$prefix."_topics where topicid=$topic"); 
list($topicimage) = mysql_fetch_row($result); 
echo "<table border=\"0\" width=\"70%\" cellpadding=\"0\" cellspacing=\"1\" bgcolor=\"$bgcolor2\" align=\"center\"><tr><td>" 
."<table border=\"0\" width=\"100%\" cellpadding=\"8\" cellspacing=\"1\" bgcolor=\"$bgcolor1\"><tr><td>" 
."<img src=\"$tipath$topicimage\" border=\"0\" align=\"right\" alt=\"\">"; 
themepreview($subject, $story); 
echo "</td></tr></table></td></tr></table><hr noshade size=\"1\" width=\"99%\"><br><br>"; 
echo "<br><font size=\"3\">" 
."<form onSubmit=\"return verify();\" action=\"admin.php\" method=\"post\" NAME=\"calendar\">" 
.""._CALNAMEFIELD."<br>" 
."<input type=\"text\" NAME=\"author\" size=\"25\" value=\"$uname\">"; 
if ($uname != $anonymous) { 
$res = mysql_query("select user_email, user_id from ".$prefix."_users where username='$uname'"); 
list($email, $user_id) = mysql_fetch_row($res); 
echo " ;; ;;<font size=\"2\">[ <a href=\"mailto:$email\">Email User</a> | <a href=\"modules.php?name=Private_Messages&mode=post&u=$user_id 
\">Send Private Message</a> ]</font>"; 
} 
echo "<br><br>"._CALSUBTITLE."<br>" 
."<input type=\"text\" name=\"subject\" size=\"50\" value=\"$subject\"><br><br>" 
."<br>"._CALTOPIC." <select name=\"topic\">"; 
$toplist = mysql_query("select topicid, topictext from ".$prefix."_topics order by topictext"); 
echo "<option value=\"\">"._CALSELECTTOPIC."</option>\n"; 
while(list($topicid, $topics) = mysql_fetch_row($toplist)) { 
if ($topicid==$topic) { 
$sel = "selected "; 
} 
echo "<option $sel value=\"$topicid\">$topics</option>\n"; 
$sel = ""; 
} 
$Date_Array = explode("-",$eventDate); 
$Date_Array2 = explode("-",$endDate); 
if ($time24Hour) { 
$time_Array = explode(":",$startTime); 
$startTime = $time_Array[0].":".$time_Array[1]; 
$time_Array = explode(":",$endTime); 
$endTime = $time_Array[0].":".$time_Array[1]; 
} else { 
$startTime = getTime($startTime); 
$endTime = getTime($endTime); 
} 
$start_Array = explode(":",$startTime); 
$end_Array = explode(":",$endTime); 
echo "</select> 
<br><br> 
"._CALEVENTDATETEXT.": ;;"; 
if ($useInternationalDates) { 
echo "<select name=\"day\">"; 
buildDaySelect($Date_Array[2]); 
echo "</select> 
<select name=\"month\">"; 
buildMonthSelect($Date_Array[1]); 
echo "</select>"; 
} else { 
echo "<select name=\"month\">"; 
buildMonthSelect($Date_Array[1]); 
echo "</select> 
<select name=\"day\">"; 
buildDaySelect($Date_Array[2]); 
echo "</select>"; 
} 
echo "<select name=\"year\">"; 
buildYearSelect($Date_Array[0]); 
echo "</select>"; 
echo "<br> 
"._CALENDDATETEXT.": ;;"; 
if ($useInternationalDates) { 
echo "<select name=\"endday\">"; 
buildDaySelect($Date_Array2[2]); 
echo "</select> 
<select name=\"endmonth\">"; 
buildMonthSelect($Date_Array2[1]); 
echo "</select>"; 
} else { 
echo "<select name=\"endmonth\">"; 
buildMonthSelect($Date_Array2[1]); 
echo "</select> 
<select name=\"endday\">"; 
buildDaySelect($Date_Array2[2]); 
echo "</select>"; 
} 
echo "<select name=\"endyear\">"; 
buildYearSelect($Date_Array2[0]); 
echo "</select>"; 

echo "<br><br>"._CALSTARTTIME.": ;; 
<select name=\"startHour\">"; 
buildHourSelect($start_Array[0]); 
echo "</select> 
<select name=\"startMin\">"; 
buildMinSelect($start_Array[1]); 
echo "</select>"; 
if (!($time24Hour)) { 
echo "<select name=\"startampm\">"; 
buildAMPMSelect($start_Array[2]); 
echo "</select>"; 
} 
echo "<br>"._CALENDTIME.": 
<select name=\"endHour\">"; 
buildHourSelect($end_Array[0]); 
echo "</select> 
<select name=\"endMin\">"; 
buildMinSelect($end_Array[1]); 
echo "</select>"; 
if (!($time24Hour)) { 
echo "<select name=\"endampm\">"; 
buildAMPMSelect($end_Array[2]); 
echo "</select>"; 
} 
$check = ""; 
if ($alldayevent == "1") { 
$check = "CHECKED=TRUE"; 
} 
echo "<br><input name=\"alldayevent\" $check type=\"checkbox\" value=\"1\"> ;;"._CALALLDAYEVENT."<br> 
<font size=1>("._CALTIMEIGNORED.")</font>"; 
echo "<br><br>"._CALBARCOLORTEXT.":<br>"; 
if ($barcolor=="r") $sel="CHECKED"; else $sel=""; 
echo "<input type=\"radio\" $sel name=\"barcolor\" value=\"r\">$calcat1 ;;<img src=\"images/calendar/ballr.gif\"> ;; ;; ;;"; 
if ($barcolor=="g") $sel="CHECKED"; else $sel=""; 
echo "<input type=\"radio\" $sel name=\"barcolor\" value=\"g\">$calcat2 ;;<img src=\"images/calendar/ballg.gif\"> ;; ;; ;;"; 
if ($barcolor=="b") $sel="CHECKED"; else $sel=""; 
echo "<input type=\"radio\" $sel name=\"barcolor\" value=\"b\">$calcat3 ;;<img src=\"images/calendar/ballb.gif\"> ;; ;; ;;"; 
if ($barcolor=="w") $sel="CHECKED"; else $sel=""; 
echo "<input type=\"radio\" $sel name=\"barcolor\" value=\"w\">$calcat4 ;;<img src=\"images/calendar/ballw.gif\"> ;; ;; ;;"; 
if ($barcolor=="y") $sel="CHECKED"; else $sel=""; 
echo "<input type=\"radio\" $sel name=\"barcolor\" value=\"y\">$calcat5 ;;<img src=\"images/calendar/bally.gif\"> 
<br>"; 
echo "<br><br>"._CALARTICLETEXT."<br>" 
."<textarea wrap=\"virtual\" cols=\"50\" rows=\"7\" name=\"hometext\">$story</textarea><br><br>" 
."<input type=\"hidden\" NAME=\"qid\" size=\"50\" value=\"$qid\">" 
."<input type=\"hidden\" NAME=\"uid\" size=\"50\" value=\"$uid\">"; 
echo "<br><br> 
<select name=\"op\"> 
<option value=\"CalendarDeleteStory\">"._CALDELETESTORY."</option> 
<option value=\"CalendarPreviewAgain\" selected>"._CALPREVIEWSTORY."</option> 
<option value=\"CalendarPostStory\">"._CALPOSTSTORY."</option> 
</select> 
<input type=\"submit\" value=\""._OK."\"> 
</form>"; 
CloseTable(); 
include ('footer.php'); 
} 

function CalendarPreviewStory($qid, $uid, $author, $subject, $hometext, $topic, $day, $month, $year, $endday, $endmonth, $endyear, $startHour, $startMin, $startampm, $endHour, $endMin, $endampm, $alldayevent, $barcolor) { 
global $user, $boxstuff, $tipath, $anonymous, $bgcolor1, $bgcolor2,$time24Hour,$useInternationalDates,$prefix, $calcat1, $calcat2, $calcat3, $calcat4, $calcat5; 
include ('header.php'); 
GraphicAdmin($hlpfile); 
printJavaScript(); 
OpenTable(); 
echo "<center><font size=\"4\">"._CALSUBMISSIONSADMIN."</font></center>"; 
CloseTable(); 
echo "<br>"; 
$today = getdate(); 
$tday = $today[mday]; 
if ($tday < 10){ 
$tday = "0$tday"; 
} 
$tmonth = $today[month]; 
$tyear = $today[year]; 
$thour = $today[hours]; 
if ($thour < 10){ 
$thour = "0$thour"; 
} 
$tmin = $today[minutes]; 
if ($tmin < 10){ 
$tmin = "0$tmin"; 
} 
$tsec = $today[seconds]; 
if ($tsec < 10){ 
$tsec = "0$tsec"; 
} 
$date = "$tmonth $tday, $tyear @ $thour:$tmin:$tsec"; 
$subject = stripslashes($subject); 
$hometext = stripslashes($hometext); 
OpenTable(); 

$result = mysql_query("select topicimage from ".$prefix."_topics where topicid=$topic"); 
list($topicimage) = mysql_fetch_row($result); 
echo "<table width=\"70%\" bgcolor=\"$bgcolor2\" cellpadding=\"0\" cellspacing=\"1\" border=\"0\"align=\"center\"><tr><td>" 
."<table width=\"100%\" bgcolor=\"$bgcolor1\" cellpadding=\"8\" cellspacing=\"1\" border=\"0\"><tr><td>" 
."<img src=\"$tipath$topicimage\" border=\"0\" align=\"right\">"; 
themepreview($subject, $hometext); 
echo "</td></tr></table></td></tr></table><hr noshade size=\"1\" width=\"99%\"><br><br>" 
."<br>"; 
echo "<font size=\"3\">" 
."<form onSubmit=\"return verify();\" action=\"admin.php\" method=\"post\" NAME=\"calendar\">" 
.""._NAME."<br>" 
."<input type=\"text\" name=\"author\" size=\"25\" value=\"$author\">"; 
if ($author != $anonymous) { 
$res = mysql_query("select user_email, user_id from ".$prefix."_users where username='$author'"); 
list($email, $user_id) = mysql_fetch_row($res); 
echo " ;; ;;<font size=\"2\">[ <a href=\"mailto:$email\">Email User</a> | <a href=\"modules.php?name=Private_Messages&mode=post&u=$user_id\">Send Private Message</a> ]</font>"; 
} 
echo "<br><br>"._CALSUBTITLE."<br>" 
."<input type=\"text\" name=\"subject\" size=\"50\" value=\"$subject\"><br><br>"; 

echo ""._CALTOPIC." <select name=\"topic\">"; 
$toplist = mysql_query("select topicid, topictext from ".$prefix."_topics order by topictext"); 
echo "<option value=\"\">"._CALSELECTTOPIC."</option>\n"; 
while(list($topicid, $topics) = mysql_fetch_row($toplist)) { 
if ($topicid==$topic) { 
$sel = "selected "; 
} 
echo "<option $sel value=\"$topicid\">$topics</option>\n"; 
$sel = ""; 
} 
echo "</select> 
<br><br> 
"._CALEVENTDATETEXT.": ;;"; 
if ($useInternationalDates) { 
echo "<select name=\"day\">"; 
buildDaySelect($day); 
echo "</select> 
<select name=\"month\">"; 
buildMonthSelect($month); 
echo "</select>"; 
} else { 
echo "<select name=\"month\">"; 
buildMonthSelect($month); 
echo "</select> 
<select name=\"day\">"; 
buildDaySelect($day); 
echo "</select>"; 
} 
echo "<select name=\"year\">"; 
buildYearSelect($year); 
echo "</select>"; 
echo "<br> 
"._CALENDDATETEXT.": ;;"; 
if ($useInternationalDates) { 
echo "<select name=\"endday\">"; 
buildDaySelect($endday); 
echo "</select> 
<select name=\"endmonth\">"; 
buildMonthSelect($endmonth); 
echo "</select>"; 
} else { 
echo "<select name=\"endmonth\">"; 
buildMonthSelect($endmonth); 
echo "</select> 
<select name=\"endday\">"; 
buildDaySelect($endday); 
echo "</select>"; 
} 
echo "<select name=\"endyear\">"; 
buildYearSelect($endyear); 
echo "</select>"; 

echo "<br><br>"._CALSTARTTIME.": ;; 
<select name=\"startHour\">"; 
buildHourSelect($startHour); 
echo "</select> 
<select name=\"startMin\">"; 
buildMinSelect($startMin); 
echo "</select>"; 
if (!($time24Hour)) { 
echo "<select name=\"startampm\">"; 
buildAMPMSelect($startampm); 
echo "</select>"; 
} 
echo "<br>"._CALENDTIME.": 
<select name=\"endHour\">"; 
buildHourSelect($endHour); 
echo "</select> 
<select name=\"endMin\">"; 
buildMinSelect($endMin); 
echo "</select>"; 
if (!($time24Hour)) { 
echo "<select name=\"endampm\">"; 
buildAMPMSelect($endampm); 
echo "</select>"; 
} 
$check = ""; 
if ($alldayevent == "1") { 
$check = "CHECKED=TRUE"; 
} 
echo "<br><input name=\"alldayevent\" $check type=\"checkbox\" value=\"1\"> ;;"._CALALLDAYEVENT."<br> 
<font size=1>("._CALTIMEIGNORED.")</font>"; 
echo "<br><br>"._CALBARCOLORTEXT.":<br>"; 
if ($barcolor=="r") $sel="CHECKED"; else $sel=""; 
echo "<input type=\"radio\" $sel name=\"barcolor\" value=\"r\">$calcat1 ;;<img src=\"images/calendar/ballr.gif\"> ;; ;; ;;"; 
if ($barcolor=="g") $sel="CHECKED"; else $sel=""; 
echo "<input type=\"radio\" $sel name=\"barcolor\" value=\"g\">$calcat2 ;;<img src=\"images/calendar/ballg.gif\"> ;; ;; ;;"; 
if ($barcolor=="b") $sel="CHECKED"; else $sel=""; 
echo "<input type=\"radio\" $sel name=\"barcolor\" value=\"b\">$calcat3 ;;<img src=\"images/calendar/ballb.gif\"> ;; ;; ;;"; 
if ($barcolor=="w") $sel="CHECKED"; else $sel=""; 
echo "<input type=\"radio\" $sel name=\"barcolor\" value=\"w\">$calcat4 ;;<img src=\"images/calendar/ballw.gif\"> ;; ;; ;;"; 
if ($barcolor=="y") $sel="CHECKED"; else $sel=""; 
echo "<input type=\"radio\" $sel name=\"barcolor\" value=\"y\">$calcat5 ;;<img src=\"images/calendar/bally.gif\"> 
<br>"; 
echo "<br><br>"._CALARTICLETEXT."<br>" 
."<textarea wrap=\"virtual\" cols=\"50\" rows=\"7\" name=\"hometext\">$hometext</textarea><br><br>" 
."<input type=\"hidden\" NAME=\"qid\" size=\"50\" value=\"$qid\">" 
."<input type=\"hidden\" NAME=\"uid\" size=\"50\" value=\"$uid\">"; 

echo "<br><br>" 
."<select name=\"op\">" 
."<option value=\"CalendarDeleteStory\">"._CALDELETESTORY."</option>" 
."<option value=\"CalendarPreviewAgain\" selected>"._CALPREVIEWSTORY."</option>" 
."<option value=\"CalendarPostStory\">"._CALPOSTSTORY."</option>" 
."</select>" 
."<input type=\"submit\" value=\""._OK."\">" 
."</form>"; 
CloseTable(); 
include ('footer.php'); 
} 

function CalendarPostStory($qid, $uid, $author, $subject, $hometext, $topic, $day, $month, $year, $endday, $endmonth, $endyear, $startHour, $startMin, $startampm, $endHour, $endMin, $endampm, $alldayevent, $barcolor) { 
global $aid, $time24Hour, $prefix; 
if ($uid == 1) $author = "Anonymous"; 
$subject = stripslashes(FixQuotes($subject)); 
$hometext = stripslashes(FixQuotes($hometext)); 
$newDate = "$year-$month-$day"; 
$endDate = "$endyear-$endmonth-$endday"; 
if ($time24Hour) { 
$startTime = "$startHour:$startMin:00"; 
$endTime = "$endHour:$endMin:00"; 
} else { 
$startTime = getTimeFormat($startHour,$startMin,$startampm); 
$endTime = getTimeFormat($endHour,$endMin,$endampm); 
} 
$result = mysql_query("insert into ".$prefix."_events values (NULL, '$aid', '$subject', now(), '$hometext', '0', '0', '$topic','$author','$newDate','$endDate','$startTime','$endTime', '$alldayevent', '$barcolor')"); 
if (!$result) { 
echo mysql_errno(). ": ".mysql_error(). "<br>"; 
return; 
} 
if ($uid == 1) { 
} else { 
mysql_query("update ".$prefix."_users set counter=counter+1 where uid='$uid'"); 
} 
mysql_query("update ".$prefix."_authors set counter=counter+1 where aid='$aid'"); 
CalendarDeleteStory($qid); 
} 

function CalendarEditStory($eid) { 
global $db, $user, $tipath, $bgcolor1, $bgcolor2, $aid, $time24Hour,$useInternationalDates, $prefix, $calcat1, $calcat2, $calcat3, $calcat4, $calcat5; 
$result = mysql_query("select name, radminsuper from ".$prefix."_authors where aid='$aid'"); 
list($nome, $radminsuper) = mysql_fetch_row($result); 
$result2 = mysql_query("select aid from ".$prefix."_events where eid='$eid'"); 
list($aaid) = mysql_fetch_row($result2); 

$row2 = $db->sql_fetchrow($db->sql_query("SELECT title, admins FROM ".$prefix."_modules WHERE title='Calendar'")); 
$admins = explode(",", $row2['admins']); 
$auth_user = 0; 
for ($i=0; $i < sizeof($admins); $i++) { 
if ($nome == "$admins[$i]" AND $row2['admins'] != "") { 
$auth_user = 1; 
} 
} 
$row3 = $db->sql_fetchrow($db->sql_query("SELECT title, admins FROM ".$prefix."_modules WHERE title='News'")); 
$admins = explode(",", $row3['admins']); 
$auth_user2 = 0; 
for ($i=0; $i < sizeof($admins); $i++) { 
if ($nome == "$admins[$i]" AND $row3['admins'] != "") { 
$auth_user2 = 1; 
} 
} 

if (($auth_user2 == 1) AND ($aaid == $aid) OR ($radminsuper == 1) OR ($auth_user == 1)) { 
include ('header.php'); 
GraphicAdmin($hlpfile); 
printJavaScript(); 
OpenTable(); 
echo "<center><font size=\"4\">"._CALSUBMISSIONSADMIN."</font></center>"; 
CloseTable(); 
echo "<br>"; 
$result = mysql_query("SELECT aid, title, hometext, topic, informant, eventDate, endDate, startTime, endTime, alldayevent, barcolor FROM ".$prefix."_events where eid=$eid"); 
list($aid, $subject, $story, $topic, $author, $eventDate, $endDate, $startTime, $endTime, $alldayevent, $barcolor) = mysql_fetch_row($result); 
mysql_free_result($result); 
$subject = stripslashes($subject); 
$story = stripslashes($story); 
if ($author == "") $author="$anonymous"; 
OpenTable(); 
if($topic=="0") { 
$topic = 1; 
} 
$result = mysql_query("select topicimage from ".$prefix."_topics where topicid=$topic"); 
list($topicimage) = mysql_fetch_row($result); 
echo "<table border=\"0\" width=\"70%\" cellpadding=\"0\" cellspacing=\"1\" bgcolor=\"$bgcolor2\" align=\"center\"><tr><td>" 
."<table border=\"0\" width=\"100%\" cellpadding=\"8\" cellspacing=\"1\" bgcolor=\"$bgcolor1\"><tr><td>" 
."<img src=\"$tipath$topicimage\" border=\"0\" align=\"right\" alt=\"\">"; 
themepreview($subject, $story); 
echo "</td></tr></table></td></tr></table><hr noshade size=\"1\" width=\"99%\"><br><br>"; 
echo "<br><font size=\"3\">" 
."<form onSubmit=\"return verify();\" action=\"admin.php\" method=\"post\" NAME=\"calendar\">" 
.""._CALNAMEFIELD."<br>" 
."<input type=\"text\" NAME=\"author\" size=\"25\" value=\"$author\">"; 
if ($uname != $anonymous) { 
$res = mysql_query("select user_email, user_id from ".$prefix."_users where username='$uname'"); 
list($email, $user_id) = mysql_fetch_row($res); 
echo " ;; ;;<font size=\"2\">[ <a href=\"mailto:$email\">Email User</a> | <a href=\"modules.php?name=Private_Messages&mode=post&u=$user_id\">Send Private Message</a> ]</font>"; 
} 
echo "<br><br>"._CALSUBTITLE."<br>" 
."<input type=\"text\" name=\"subject\" size=\"50\" value=\"$subject\"><br><br>" 
."<br>"._CALTOPIC." <select name=\"topic\">"; 
$toplist = mysql_query("select topicid, topictext from ".$prefix."_topics order by topictext"); 
echo "<option value=\"\">"._CALSELECTTOPIC."</option>\n"; 
while(list($topicid, $topics) = mysql_fetch_row($toplist)) { 
if ($topicid==$topic) { 
$sel = "selected "; 
} 
echo "<option $sel value=\"$topicid\">$topics</option>\n"; 
$sel = ""; 
} 
$Date_Array = explode("-",$eventDate); 
$Date_Array2 = explode("-",$endDate); 
if ($time24Hour) { 
$time_Array = explode(":",$startTime); 
$startTime = $time_Array[0].":".$time_Array[1]; 
$time_Array = explode(":",$endTime); 
$endTime = $time_Array[0].":".$time_Array[1]; 
} else { 
$startTime = getTime($startTime); 
$endTime = getTime($endTime); 
} 
$start_Array = explode(":",$startTime); 
$end_Array = explode(":",$endTime); 
echo "</select> 
<br><br> 
"._CALEVENTDATETEXT.": ;;"; 
if ($useInternationalDates) { 
echo "<select name=\"day\">"; 
buildDaySelect($Date_Array[2]); 
echo "</select> 
<select name=\"month\">"; 
buildMonthSelect($Date_Array[1]); 
echo "</select>"; 
} else { 
echo "<select name=\"month\">"; 
buildMonthSelect($Date_Array[1]); 
echo "</select> 
<select name=\"day\">"; 
buildDaySelect($Date_Array[2]); 
echo "</select>"; 
} 
echo "<select name=\"year\">"; 
buildYearSelect($Date_Array[0]); 
echo "</select>"; 
echo "<br> 
"._CALENDDATETEXT.": ;;"; 
if ($useInternationalDates) { 
echo "<select name=\"endday\">"; 
buildDaySelect($Date_Array2[2]); 
echo "</select> 
<select name=\"endmonth\">"; 
buildMonthSelect($Date_Array2[1]); 
echo "</select>"; 
} else { 
echo "<select name=\"endmonth\">"; 
buildMonthSelect($Date_Array2[1]); 
echo "</select> 
<select name=\"endday\">"; 
buildDaySelect($Date_Array2[2]); 
echo "</select>"; 
} 
echo "<select name=\"endyear\">"; 
buildYearSelect($Date_Array2[0]); 
echo "</select>"; 

echo "<br><br>"._CALSTARTTIME.": ;; 
<select name=\"startHour\">"; 
buildHourSelect($start_Array[0]); 
echo "</select> 
<select name=\"startMin\">"; 
buildMinSelect($start_Array[1]); 
echo "</select>"; 
if (!($time24Hour)) { 
echo "<select name=\"startampm\">"; 
buildAMPMSelect($start_Array[2]); 
echo "</select>"; 
} 
echo "<br>"._CALENDTIME.": 
<select name=\"endHour\">"; 
buildHourSelect($end_Array[0]); 
echo "</select> 
<select name=\"endMin\">"; 
buildMinSelect($end_Array[1]); 
echo "</select>"; 
if (!($time24Hour)) { 
echo "<select name=\"endampm\">"; 
buildAMPMSelect($end_Array[2]); 
echo "</select>"; 
} 
$check = ""; 
if ($alldayevent == "1") { 
$check = "CHECKED=TRUE"; 
} 
echo "<br><input name=\"alldayevent\" $check type=\"checkbox\" value=\"1\"> ;;"._CALALLDAYEVENT."<br> 
<font size=1>("._CALTIMEIGNORED.")</font>"; 
echo "<br><br>"._CALBARCOLORTEXT.":<br>"; 
if ($barcolor=="r") $sel="CHECKED"; else $sel=""; 
echo "<input type=\"radio\" $sel name=\"barcolor\" value=\"r\">$calcat1 ;;<img src=\"images/calendar/ballr.gif\"> ;; ;; ;;"; 
if ($barcolor=="g") $sel="CHECKED"; else $sel=""; 
echo "<input type=\"radio\" $sel name=\"barcolor\" value=\"g\">$calcat2 ;;<img src=\"images/calendar/ballg.gif\"> ;; ;; ;;"; 
if ($barcolor=="b") $sel="CHECKED"; else $sel=""; 
echo "<input type=\"radio\" $sel name=\"barcolor\" value=\"b\">$calcat3 ;;<img src=\"images/calendar/ballb.gif\"> ;; ;; ;;"; 
if ($barcolor=="w") $sel="CHECKED"; else $sel=""; 
echo "<input type=\"radio\" $sel name=\"barcolor\" value=\"w\">$calcat4 ;;<img src=\"images/calendar/ballw.gif\"> ;; ;; ;;"; 
if ($barcolor=="y") $sel="CHECKED"; else $sel=""; 
echo "<input type=\"radio\" $sel name=\"barcolor\" value=\"y\">$calcat5 ;;<img src=\"images/calendar/bally.gif\"> 
<br>"; 
echo "<br><br>"._CALARTICLETEXT."<br>" 
."<textarea wrap=\"virtual\" cols=\"50\" rows=\"7\" name=\"hometext\">$story</textarea><br><br>"; 
echo "<br><br> 
<input type=hidden value=\"$eid\" name=\"eid\"> 
<input type=hidden value=\"CalendarChangeStory\" name=\"op\"> 
<input type=\"submit\" value=\""._CALPOSTSTORY."\"> 
</form>"; 
CloseTable(); 
include("footer.php"); 
} 
} 

function CalendarRemoveStory($eid, $ok=0) { 
global $db, $module_name, $aid, $prefix; 
$result = mysql_query("select name, counter, radminsuper from ".$prefix."_authors where aid='$aid'"); 
list($nome, $counter, $radminsuper) = mysql_fetch_row($result); 
$result2 = mysql_query("select aid from ".$prefix."_events where eid='$eid'"); 
list($aaid) = mysql_fetch_row($result2); 

$row2 = $db->sql_fetchrow($db->sql_query("SELECT title, admins FROM ".$prefix."_modules WHERE title='Calendar'")); 
$admins = explode(",", $row2['admins']); 
$auth_user = 0; 
for ($i=0; $i < sizeof($admins); $i++) { 
if ($nome == "$admins[$i]" AND $row2['admins'] != "") { 
$auth_user = 1; 
} 
} 
$row3 = $db->sql_fetchrow($db->sql_query("SELECT title, admins FROM ".$prefix."_modules WHERE title='News'")); 
$admins = explode(",", $row3['admins']); 
$auth_user2 = 0; 
for ($i=0; $i < sizeof($admins); $i++) { 
if ($nome == "$admins[$i]" AND $row3['admins'] != "") { 
$auth_user2 = 1; 
} 
} 

if (($auth_user2 == 1) AND ($aaid == $aid) OR ($radminsuper == 1) OR ($auth_user == 1)) { 
if($ok) { 
$counter--; 
mysql_query("DELETE FROM ".$prefix."_events where eid=$eid"); 
// START COMMENTS MOD 
mysql_query("DELETE FROM ".$prefix."_events_comments where eid=$eid"); 
// END COMMENTS MOD 
$result = mysql_query("update ".$prefix."_authors set counter='$counter' where aid='$aid'"); 
Header("Location: modules.php?op=modload&name=$module_name&file=index"); 
} else { 
include("header.php"); 
GraphicAdmin($hlpfile); 
OpenTable(); 
echo "<center><font size=\"4\">"._CALSUBMISSIONSADMIN."</font></center>"; 
CloseTable(); 
echo "<br>"; 
OpenTable(); 
echo "<center>"._CALREMOVETEST." $eid<br>"; 
echo "<br>[ <a href=\"modules.php?op=modload&name=$module_name&file=index\">"._CALNO."</a> | <a href=\"admin.php?op=CalendarRemoveStory&eid=$eid&ok=1\">"._CALYES."</a> ]</center>"; 
CloseTable(); 
include("footer.php"); 
} 
} else { 
include ('header.php'); 
GraphicAdmin($hlpfile); 
OpenTable(); 
echo "<center><font size=\"4\">"._CALSUBMISSIONSADMIN."</font></center>"; 
CloseTable(); 
echo "<br>"; 
OpenTable(); 
echo "<center>"._CALNOTAUTHORIZED1."<br><br>" 
.""._CALNOTAUTHORIZED2."<br><br>"; 
CloseTable(); 
include("footer.php"); 
} 
} 


function CalendarChangeStory($eid, $uid, $author, $subject, $hometext, $topic, $day, $month, $year, $endday, $endmonth, $endyear, $startHour, $startMin, $startampm, $endHour, $endMin, $endampm, $alldayevent, $barcolor) { 
global $db, $aid, $module_name,$time24Hour,$prefix; 
$result = mysql_query("select name, radminsuper from ".$prefix."_authors where aid='$aid'"); 
list($nome, $radminsuper) = mysql_fetch_row($result); 
$result2 = mysql_query("select aid from ".$prefix."_events where eid='$eid'"); 
list($aaid) = mysql_fetch_row($result2); 

$row3 = $db->sql_fetchrow($db->sql_query("SELECT title, admins FROM ".$prefix."_modules WHERE title='News'")); 
$admins = explode(",", $row3['admins']); 
$auth_user2 = 0; 
for ($i=0; $i < sizeof($admins); $i++) { 
if ($nome == "$admins[$i]" AND $row3['admins'] != "") { 
$auth_user2 = 1; 
} 
} 

if (($auth_user2 == 1) AND ($aaid == $aid) OR ($radminsuper == 1)) { 
$subject = stripslashes(FixQuotes($subject)); 
$hometext = stripslashes(FixQuotes($hometext)); 
if ($time24Hour) { 
$startTime = "$startHour:$startMin:00"; 
$endTime = "$endHour:$endMin:00"; 
} else { 
$startTime = getTimeFormat($startHour,$startMin,$startampm); 
$endTime = getTimeFormat($endHour,$endMin,$endampm); 
} 
mysql_query("update ".$prefix."_events set title='$subject', hometext='$hometext', topic='$topic', informant='$author', eventDate='$year-$month-$day', endDate='$endyear-$endmonth-$endday', startTime='$startTime', endTime='$endTime', alldayevent='$alldayevent', barcolor='$barcolor' where eid=$eid"); 
Header("Location: modules.php?op=modload&name=$module_name&file=index"); 
} 
} 

function CalendarSubmissions() { 
global $hlpfile, $admin, $bgcolor1, $bgcolor2, $postdirect, $allowcomments, $textEvents, $time24Hour, $Week_Start, $useInternationalDates, $eventsopeninnewwindow, $times, $calcat1, $calcat2, $calcat3, $calcat4, $calcat5, $monthshadedbgcolor, $monthshadedtextcolor, $monthbgcolor, $monthtableborder, $monthtablecellspacing, $monthtablecellpadding, $yearbgcolor, $yeartextcolor, $yeartableborder, $yeartablecellspacing, $yeartablecellpadding, $trimbgcolor, $trimtextcolor, $trimbgcolor2, $trimtextcolor2, $selecteddaycolor, $daybgcolor, $daytextcolor, $eventbackground, $comtextcolor, $combgcolor, $prefix; 
include ("header.php"); 
GraphicAdmin($hlpfile); 
OpenTable(); 
echo "<center><font size=\"4\">"._CALSUBMISSIONSADMIN."</font></center>"; 
echo "<br>"; 
$result = mysql_query("SELECT qid, title, timestamp FROM ".$prefix."_events_queue order by timestamp"); 
if($postdirect == "1") { 
echo "<table width=\"100%\"><tr><td bgcolor=\"$bgcolor1\" align=\"center\">"._CALNOMODSUBMISSIONS."</td></tr></table>\n"; 
} else { 
if(mysql_num_rows($result) == 0) { 
echo "<table width=\"100%\"><tr><td bgcolor=\"$bgcolor1\" align=\"center\">"._CALNOSUBMISSIONS."</td></tr></table>\n"; 
} else { 
echo "<center><font size=\"2\">"._CALNEWSUBMISSIONS."</font><table width=\"100%\" border=\"1\" bgcolor=\"$bgcolor2\">\n"; 
while (list($qid, $subject, $timestamp) = mysql_fetch_row($result)) { 
echo "<tr>\n" 
."<td align=\"center\" width=60><font size=\"2\"> ;;[<a href=\"admin.php?op=CalendarDeleteStory&amp;qid=$qid\">"._CALDELETE."</a>] ;;</td>\n" 
."<td width=100%><font size=3>\n"; 
if ($subject == "") { 
echo " ;;<a href=\"admin.php?op=CalendarDisplayStory&amp;qid=$qid\">"._CALNOSUBJECT."</a></font>\n"; 
} else { 
echo " ;;<a href=\"admin.php?op=CalendarDisplayStory&amp;qid=$qid\">$subject</a></font>\n"; 
} 
$timestamp = ereg_replace(" ", "@", $timestamp); 
echo "</td><td align=\"right\"><font size=\"2\"> ;;$timestamp ;;</font></td></tr>\n"; 
} 

echo "</table>\n"; 
} 
} 
CloseTable(); 

echo "<br>"; 
OpenTable(); 
echo "<center>"._CALCONFIG."</center> 
<form action='admin.php?op=CalendarConfig' method='post'> 
<table border='0' width='100%'><tr><td width='50%'> 
"._CALMODYN."</td><td width='50%'>"; 
if ($postdirect==1) { 
echo "<input type='radio' name='xpostdirect' value='0'>"._CALYES." ;; 
<input type='radio' name='xpostdirect' value='1' checked>"._CALNO.""; 
} else { 
echo "<input type='radio' name='xpostdirect' value='0' checked>"._CALYES." ;; 
<input type='radio' name='xpostdirect' value='1'>"._CALNO.""; 
} 
echo "</td></tr><tr><td>" 
._CALCOMMENTSYN."</td><td>"; 
if ($allowcomments==1) { 
echo "<input type='radio' name='xallowcomments' value='1'checked>"._CALYES." ;; 
<input type='radio' name='xallowcomments' value='0'>"._CALNO.""; 
} else { 
echo "<input type='radio' name='xallowcomments' value='1' >"._CALYES." ;; 
<input type='radio' name='xallowcomments' value='0' checked>"._CALNO.""; 
} 
echo "</td></tr><tr><td>" 

._CALTEXTYN."</td><td>"; 
if ($textEvents==1) { 
echo "<input type='radio' name='xtextEvents' value='1'checked>"._CALTEXT." ;; 
<input type='radio' name='xtextEvents' value='0'>"._CALBAR.""; 
} else { 
echo "<input type='radio' name='xtextEvents' value='1' >"._CALTEXT." ;; 
<input type='radio' name='xtextEvents' value='0' checked>"._CALBAR.""; 
} 
echo "</td></tr><tr><td>" 
._CALTIMEYN."</td><td>"; 
if ($time24Hour ==1) { 
echo "<input type='radio' name='xtime24Hour' value='1' checked>"._CALTIME24." ;; 
<input type='radio' name='xtime24Hour' value='0'>"._CALTIME12.""; 
} else { 
echo "<input type='radio' name='xtime24Hour' value='1'>"._CALTIME24." ;; 
<input type='radio' name='xtime24Hour' value='0' checked>"._CALTIME12.""; 
} 
echo "</td></tr><tr><td>" 
._CALWEEKYN."</td><td>"; 
if ($Week_Start ==1) { 
echo "<input type='radio' name='xWeek_Start' value='1' checked>"._CALWEEKMON." ;; 
<input type='radio' name='xWeek_Start' value='0'>"._CALWEEKSUN.""; 
} else { 
echo "<input type='radio' name='xWeek_Start' value='1'>"._CALWEEKMON." ;; 
<input type='radio' name='xWeek_Start' value='0' checked>"._CALWEEKSUN.""; 
} 
echo "</td></tr><tr><td>" 
._CALDATESYN."</td><td>"; 
if ($useInternationalDates ==1) { 
echo "<input type='radio' name='xuseInternationalDates' value='1' checked>"._CALDATESDMY." ;; 
<input type='radio' name='xuseInternationalDates' value='0'>"._CALDATESMDY.""; 
} else { 
echo "<input type='radio' name='xuseInternationalDates' value='1'>"._CALDATESDMY." ;; 
<input type='radio' name='xuseInternationalDates' value='0' checked>"._CALDATESMDY.""; 
} 
echo "</td></tr><tr><td>" 
._CALNEWWINDOWYN."</td><td>"; 
if ($eventsopeninnewwindow ==1) { 
echo "<input type='radio' name='xeventsopeninnewwindow' value='1' checked>"._CALYES." ;; 
<input type='radio' name='xeventsopeninnewwindow' value='0'>"._CALNO.""; 
} else { 
echo "<input type='radio' name='xeventsopeninnewwindow' value='1'>"._CALYES." ;; 
<input type='radio' name='xeventsopeninnewwindow' value='0' checked>"._CALNO.""; 
} 

echo "</td></tr><tr><td valign=middle>"._CALTYPES."</td><td><br>"; 
echo "<img src=\"images/calendar/ballr.gif\"> ;;<input type=\"text\" name=\"xcalcat1\" size=\"15\" value=\"$calcat1\"><br> 
<img src=\"images/calendar/ballg.gif\"> ;;<input type=\"text\" name=\"xcalcat2\" size=\"15\" value=\"$calcat2\"><br> 
<img src=\"images/calendar/ballb.gif\"> ;;<input type=\"text\" name=\"xcalcat3\" size=\"15\" value=\"$calcat3\"><br> 
<img src=\"images/calendar/ballw.gif\"> ;;<input type=\"text\" name=\"xcalcat4\" size=\"15\" value=\"$calcat4\"><br> 
<img src=\"images/calendar/bally.gif\"> ;;<input type=\"text\" name=\"xcalcat5\" size=\"15\" value=\"$calcat5\"><br>"; 

echo "</td></tr><tr><td valign=middle>"._CALTIMES."</td><td><br>"; 
echo "<input type=\"text\" name=\"times1\" size=\"8\" value=\"$times[0]\"><br> 
<input type=\"text\" name=\"times2\" size=\"8\" value=\"$times[1]\"><br> 
<input type=\"text\" name=\"times3\" size=\"8\" value=\"$times[2]\"><br> 
<input type=\"text\" name=\"times4\" size=\"8\" value=\"$times[3]\"><br> 
<input type=\"text\" name=\"times5\" size=\"8\" value=\"$times[4]\"><br> 
<input type=\"text\" name=\"times6\" size=\"8\" value=\"$times[5]\"><br> 
<input type=\"text\" name=\"times7\" size=\"8\" value=\"$times[6]\"><br> 
<input type=\"text\" name=\"times8\" size=\"8\" value=\"$times[7]\"><br> 
<input type=\"text\" name=\"times9\" size=\"8\" value=\"$times[8]\"><br> 
<input type=\"text\" name=\"times10\" size=\"8\" value=\"$times[9]\"><br> 
<input type=\"text\" name=\"times11\" size=\"8\" value=\"$times[10]\"><br>"; 

echo "<br></td></tr><tr><td valign=middle>"._CALMONTHSHADEBG."</td><td> 
<input type=\"text\" name=\"monthshadebg\" size=\"8\" value=\"$monthshadedbgcolor\"> 
</td></tr><tr><td valign=middle>"._CALMONTHSHADETEXT."</td><td> 
<input type=\"text\" name=\"monthshadetext\" size=\"8\" value=\"$monthshadedtextcolor\"> 
</td></tr><tr><td valign=middle>"._CALMONTHBG."</td><td> 
<input type=\"text\" name=\"monthbg\" size=\"8\" value=\"$monthbgcolor\"> 
</td></tr><tr><td valign=middle>"._CALMONTHBORDER."</td><td> 
<input type=\"text\" name=\"monthborder\" size=\"1\" value=\"$monthtableborder\"> 
</td></tr><tr><td valign=middle>"._CALMONTHSPACING."</td><td> 
<input type=\"text\" name=\"monthspacing\" size=\"1\" value=\"$monthtablecellspacing\"> 
</td></tr><tr><td valign=middle>"._CALMONTHPADDING."</td><td> 
<input type=\"text\" name=\"monthpadding\" size=\"1\" value=\"$monthtablecellpadding\"> 
</td></tr><tr><td valign=middle>"._CALYEARBG."</td><td> 
<input type=\"text\" name=\"yearbg\" size=\"8\" value=\"$yearbgcolor\"> 
</td></tr><tr><td valign=middle>"._CALYEARTEXT."</td><td> 
<input type=\"text\" name=\"yeartext\" size=\"8\" value=\"$yeartextcolor\"> 
</td></tr><tr><td valign=middle>"._CALYEAREVENTBG."</td><td> 
<input type=\"text\" name=\"yeareventbg\" size=\"8\" value=\"$eventbackground\"> 
</td></tr><tr><td valign=middle>"._CALYEARBORDER."</td><td> 
<input type=\"text\" name=\"yearborder\" size=\"1\" value=\"$yeartableborder\"> 
</td></tr><tr><td valign=middle>"._CALYEARSPACING."</td><td> 
<input type=\"text\" name=\"yearspacing\" size=\"1\" value=\"$yeartablecellspacing\"> 
</td></tr><tr><td valign=middle>"._CALYEARPADDING."</td><td> 
<input type=\"text\" name=\"yearpadding\" size=\"1\" value=\"$yeartablecellpadding\"> 
</td></tr><tr><td valign=middle>"._CALDAYBG."</td><td> 
<input type=\"text\" name=\"daybg\" size=\"8\" value=\"$daybgcolor\"> 
</td></tr><tr><td valign=middle>"._CALDAYTEXT."</td><td> 
<input type=\"text\" name=\"daytext\" size=\"8\" value=\"$daytextcolor\"> 
</td></tr><tr><td valign=middle>"._CALTRIMBG2."</td><td> 
<input type=\"text\" name=\"trimbg2\" size=\"8\" value=\"$trimbgcolor2\"> 
</td></tr><tr><td valign=middle>"._CALTRIMTEXT2."</td><td> 
<input type=\"text\" name=\"trimtext2\" size=\"8\" value=\"$trimtextcolor2\"> 
</td></tr><tr><td valign=middle>"._CALTRIMBG."</td><td> 
<input type=\"text\" name=\"trimbg\" size=\"8\" value=\"$trimbgcolor\"> 
</td></tr><tr><td valign=middle>"._CALTRIMTEXT."</td><td> 
<input type=\"text\" name=\"trimtext\" size=\"8\" value=\"$trimtextcolor\"> 

</td></tr><tr><td valign=middle>"._CALCOMBG."</td><td> 
<input type=\"text\" name=\"combg\" size=\"8\" value=\"$combgcolor\"> 
</td></tr><tr><td valign=middle>"._CALCOMTEXT."</td><td> 
<input type=\"text\" name=\"comtext\" size=\"8\" value=\"$comtextcolor\"> 

</td></tr><tr><td valign=middle>"._CALSELECTDAY."</td><td> 
<input type=\"text\" name=\"selectday\" size=\"8\" value=\"$selecteddaycolor\"><br>"; 

echo "</td></tr><tr><td colspan=2><center><br /><br /><input type='submit' value='SAVE'>"; 
echo "</center></td></tr></table></form>"; 
CloseTable(); 

include ("footer.php"); 
} 

function CalendarConfig() { 
global $module_name, $xpostdirect, $xallowcomments, $xtextEvents, $xtime24Hour, $xWeek_Start, $xeventsopeninnewwindow, $xuseInternationalDates, $times1, $times2, $times3, $times4, $times5, $times6, $times7, $times8, $times9, $times10, $times11, $monthshadebg, $monthshadetext, $monthbg, $monthborder, $monthspacing, $monthpadding, $yearborder, $yearspacing, $yearpadding, $yearbg, $yeartext, $trimbg, $trimtext, $trimbg2, $trimtext2, $daybg, $daytext, $selectday, $yeareventbg, $combg, $comtext, $xcalcat1, $xcalcat2, $xcalcat3, $xcalcat4, $xcalcat5; 

$filename = 'modules/'.$module_name.'/configset.php'; 
$xpost='<?php 
$postdirect = '.$xpostdirect.'; 
$allowcomments = '.$xallowcomments.'; 
$textEvents = '.$xtextEvents.'; 
$time24Hour = '.$xtime24Hour.'; 
$Week_Start = '.$xWeek_Start.'; 
$eventsopeninnewwindow = '.$xeventsopeninnewwindow.'; 
$useInternationalDates = '.$xuseInternationalDates.'; 
$calcat1 = "'.$xcalcat1.'"; 
$calcat2 = "'.$xcalcat2.'"; 
$calcat3 = "'.$xcalcat3.'"; 
$calcat4 = "'.$xcalcat4.'"; 
$calcat5 = "'.$xcalcat5.'"; 
$times = array("'.$times1.'", 
"'.$times2.'", 
"'.$times3.'", 
"'.$times4.'", 
"'.$times5.'", 
"'.$times6.'", 
"'.$times7.'", 
"'.$times8.'", 
"'.$times9.'", 
"'.$times10.'", 
"'.$times11.'"); 
$monthshadedbgcolor = "'.$monthshadebg.'"; 
$monthshadedtextcolor = "'.$monthshadetext.'"; 
$monthbgcolor = "'.$monthbg.'"; 
$monthtableborder = '.$monthborder.'; 
$monthtablecellspacing = '.$monthspacing.'; 
$monthtablecellpadding = '.$monthpadding.'; 
$yeartableborder = '.$yearborder.'; 
$yeartablecellspacing = '.$yearspacing.'; 
$yeartablecellpadding = '.$yearpadding.'; 
$yearbgcolor = "'.$yearbg.'"; 
$yeartextcolor = "'.$yeartext.'"; 
$eventbackground = "'.$yeareventbg.'"; 
$trimbgcolor = "'.$trimbg.'"; 
$trimtextcolor = "'.$trimtext.'"; 
$trimbgcolor2 = "'.$trimbg2.'"; 
$trimtextcolor2 = "'.$trimtext2.'"; 
$daybgcolor = "'.$daybg.'"; 
$daytextcolor = "'.$daytext.'"; 
$selecteddaycolor = "'.$selectday.'"; 
$combgcolor = "'.$combg.'"; 
$comtextcolor = "'.$comtext.'"; 
?>'; 
//unlink($filename); 
//chmod($filename , 0666); 
if (!$handle = @fopen($filename, 'w+b')) { 
print "Cannot open file ($filename) - doesn't exist or path is wrong"; 
exit; 
} 
if (!@fwrite($handle, $xpost)) { 
print "Cannot write to file ($filename) - check permissions"; 
exit; 
} 

print "Success, wrote ($xpost) to file ($filename)"; 

@fclose($handle); 
//chmod($filename , 0644); 
header('Location: admin.php?op=CalendarAdmin'); 
exit; 
} 

switch($op) { 

case "CalendarDisplayStory": 
CalendarDisplayStory($qid); 
break; 

case "CalendarPreviewAgain": 
CalendarPreviewStory($qid, $uid, $author, $subject, $hometext, $topic, $day, $month, $year, $endday, $endmonth, $endyear, $startHour, $startMin, $startampm, $endHour, $endMin, $endampm, $alldayevent, $barcolor); 
break; 

case "CalendarPostStory": 
CalendarPostStory($qid, $uid, $author, $subject, $hometext, $topic, $day, $month, $year, $endday, $endmonth, $endyear, $startHour, $startMin, $startampm, $endHour, $endMin, $endampm, $alldayevent, $barcolor); 
break; 

case "CalendarEditStory": 
CalendarEditStory($eid); 
break; 

case "CalendarRemoveStory": 
CalendarRemoveStory($eid, $ok); 
break; 

case "CalendarChangeStory": 
CalendarChangeStory($eid, $uid, $author, $subject, $hometext, $topic, $day, $month, $year, $endday, $endmonth, $endyear, $startHour, $startMin, $startampm, $endHour, $endMin, $endampm, $alldayevent, $barcolor); 
break; 

case "CalendarDeleteStory": 
CalendarDeleteStory($qid); 
break; 

case "CalendarAdmin": 
CalendarSubmissions(); 
break; 


case "CalendarConfig": 
CalendarConfig(); 
break; 

} 

} else { 
echo "Access Denied"; 
} 

?>