<?php

/********************************************************/
/* Event Calendar for PHP-Nuke 7.0                      */
/*                                                      */
/* Based on Event Calendar 1.5 by Rob Sutton            */
/* Development & enhancments by Holbrookau and friends  */
/* http://phpnuke.holbrookau.net                        */
/********************************************************/
if (!eregi("modules.php", $_SERVER['PHP_SELF'])) {
    die ("You can't access this file directly...");
}

$index = 0;
$module_name = "Calendar";  // CHANGE THIS IF YOU CHANGE THE MODULES FOLDER NAME

include("modules/$module_name/config.php");
include("modules/$module_name/functions.php");

/********************************************************/

function printJavaScript() {
	echo "<script type=\"text/javascript\">
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
} // printJavaScript


function defaultDisplay($type) {
	global $module_name,$time24Hour,$useInternationalDates, $prefix, $postdirect;
	include ('header.php');
	global $user, $cookie, $anonymous;
	printJavaScript();
	OpenTable();
	if($postdirect == "1") {
		echo "<center><font size=\"4\"><b>"._CALSUBMITNAME."</b></font><br><br>";
		echo "<font size=\"2\"><i>"._CALSUBMITADVICENOMOD."</i></font></center><br><br>";
	} else {
		echo "<center><font size=\"4\"><b>"._CALSUBMITNAME."</b></font><br><br>";
		echo "<font size=\"2\"><i>"._CALSUBMITADVICE."</i></font></center><br><br>";
	}
	CloseTable();
	echo "<br>";
	OpenTable();
	if (is_user($user)) getusrinfo($user);
	echo "<p><form onSubmit=\"return verify();\" action=\"modules.php?name=$module_name&file=submit\" method=\"post\" NAME=\"calendar\">";
	echo "<b>"._CALYOURNAME.":</b> ";
	if (is_user($user)) {
		cookiedecode($user);
		echo "<a href=\"modules.php?name=Your_Account\">$cookie[1]</a> <font size=2>[ "
				."<a href=\"modules.php?name=Your_Account&op=logout\">"._CALLOGOUT."</a> ]</font>";
	} else {
		echo "$anonymous <font size=2>[ <a href=\"modules.php?name=Your_Account&op=new_user\">"._NEWUSER."</a> ]</font>";
	}

	$Date = Date("m/d/Y");
	$Date_Array = explode("/", $Date);

	BuildEventEditor("", "", $Date, $Date, "09:00:00", "11:00:00", "0", "g", "");

	echo "<br>("._CALAREYOUSURE.")</font><br><br>"
			."<input type=\"hidden\" name=\"type\" value=\"$type\">"
			."<input style=\"font-weight: bold\" type=\"submit\" name=\"op2\" value="._CALPREVIEW
			.">&nbsp;<input style=\"font-weight: bold\" type=\"reset\" name=\"op2\" value="._CALRESET
			."><br>("._CALSUBPREVIEW.")</form>";
	CloseTable();
	include ('footer.php');
} // defaultDisplay

function PreviewStory($name, $address, $subject, $day, $month, $year, $endday, $endmonth, $endyear, $story, $topic, $type, $startHour, $startMin, $startampm, $endHour, $endMin, $endampm, $alldayevent, $barcolor) {
	global $user, $cookie, $tipath, $bgcolor1, $bgcolor2, $anonymous,$module_name,$time24Hour,$useInternationalDates, $prefix;
	include ('header.php');
	$subject = stripslashes(check_html($subject, "nohtml"));
	$story = stripslashes(check_html($story, ""));
	printJavaScript();
	OpenTable();
	echo "<center><font size=\"4\"><b>"._CALNEWSUBPREVIEW."</b></font>";
	CloseTable();
	echo "<br>";
	OpenTable();
	echo "<center><i>"._CALSTORYLOOK."</i></center><br><br>";
	echo "<table width=\"70%\" bgcolor=\"$bgcolor2\" cellpadding=\"0\" cellspacing=\"1\" border=\"0\"align=\"center\"><tr><td>"
			."<table width=\"100%\" bgcolor=\"$bgcolor1\" cellpadding=\"8\" cellspacing=\"1\" border=\"0\"><tr><td>";
	if ($topic=="") {
		$topicimage="AllTopics.gif";
		$warning = "<center><blink><b>"._CALTOPICERROR."</b></blink></center>";
	} else {
		$warning = "";
		$result = mysql_query("select topicimage from $prefix"._topics." where topicid='$topic'");
		list($topicimage) = mysql_fetch_row($result);
	}
	echo "<img src=\"$tipath$topicimage\" border=\"0\" align=\"right\" alt=\"\">"
			."<b>"._CALEVENTDATEPREVIEW."</b>"
			."$month/$day/$year<br><br><br>";
	themepreview($subject, nl2br($story));
	echo "$warning"
			."</td></tr></table></td></tr></table>"
			."<br><br><center><font size=\"1\">"._CALCHECKSTORY."</font></center>";
	CloseTable();
	echo "<br>";
	OpenTable();

	echo "<p><form onSubmit=\"return verify();\" action=\"modules.php?name=$module_name&file=submit\" "
			."method=\"post\" NAME=\"calendar\"><b>"._CALYOURNAME.":</b> ";
	if (is_user($user)) {
		cookiedecode($user);
		echo "<a href=\"modules.php?name=Your_Account\">$cookie[1]</a> <font size=\"2\">[ "
				."<a href=\"modules.php?name=Your_Account&op=logout\">"._CALLOGOUT."</a> ]</font>";
	} else {
		echo "$anonymous";
	}

	BuildEventEditor($subject, $topic, $year."-".$month."-".$day,
										$endyear."-".$endmonth."-".$endday,
										$startHour.":".$startMin." ".$startampm,
										$endHour.":".$endMin." ".$endampm,
										$alldayevent, $barcolor, $story);

	echo "<font size=\"2\">("._CALAREYOUSURE.")</font><br><br><input type=\"hidden\" name=\"type\" value=\"$type\">"
			."<input style=\"font-weight: bold\" type=\"submit\" name=\"op2\" value="._CALPREVIEW."> "
			."<input style=\"font-weight: bold\" type=\"submit\" name=\"op2\" value="._CALOK."></form>"
			."<form action=\"modules.php?name=Calendar&file=submit\" method=\"post\">"
			."<input style=\"font-weight: bold\" type=\"submit\" name=\"op2\" value="._CALRESTART."></form>";
	CloseTable();
	include ('footer.php');
} // PreviewStory

function SubmitStory($name, $address, $subject, $day, $month, $year, $endday, $endmonth, $endyear, $story, $topic, $type, $startHour, $startMin, $startampm, $endHour, $endMin, $endampm, $alldayevent, $barcolor) {
	global $uid, $postdirect, $user, $EditedMessage, $cookie, $anonymous, $notify, $notify_email, $notify_subject, $notify_message,
				$notify_from,$module_name,$time24Hour, $prefix;
	if (is_user($user)) {
		cookiedecode($user);
		$uid = $cookie[0];
		$name = $cookie[1];
	} else {
		$uid = 1;
		$name = "$anonymous";
	}
	$subject = stripslashes(FixQuotes(check_html($subject, "nohtml")));
	$story = nl2br(stripslashes(FixQuotes(check_html($story, ""))));
	$newDate = "$year-$month-$day";
	$endDate = "$endyear-$endmonth-$endday";
	if ($time24Hour) {
		$startTime = "$startHour:$startMin:00";
		$endTime = "$endHour:$endMin:00";
	} else {
		$startTime = getTimeFormat($startHour,$startMin,$startampm);
		$endTime = getTimeFormat($endHour,$endMin,$endampm);
	}
	if($postdirect) {
		$result = mysql_query("insert into $prefix"._events." values (NULL, '$name', '$subject', now(), '$story', '0', '0', '$topic','$name','$newDate','$endDate','$startTime','$endTime', '$alldayevent', '$barcolor')");
		if(!$result) {
			echo mysql_errno(). ": ".mysql_error(). "<br>";
			exit();
		}
		include ('header.php');
		OpenTable();
		$result = mysql_query("select * from $prefix"._events_queue."");
		$waiting = mysql_num_rows($result);
		echo "<center><br><br><font size=\"3\"><b>"._CALTHANKSPUB."</b><br><br>";
		CloseTable();
	} else {
		$result = mysql_query("insert into $prefix"._events_queue." values (NULL, '$uid', '$name', '$subject', '$story', now(), '$topic', '$newDate','$endDate','$startTime','$endTime','$alldayevent', '$barcolor')");
		if(!$result) {
			echo mysql_errno(). ": ".mysql_error(). "<br>";
			exit();
		}
		include ('header.php');
		OpenTable();
		$result = mysql_query("select * from $prefix"._events_queue."");
		$waiting = mysql_num_rows($result);
		echo "<center><font size=\"4\">"._CALSUBSENT."</font><br><br>"
				."<font size=\"3\"><b>"._CALTHANKSSUB."</b><br><br>"
				.""._CALSUBTEXT.""
				."<br>"._CALWEHAVESUB." $waiting "._CALWAITING."";
		CloseTable();
	}
	OpenTable();
	/**** Get todays date */
	$Today_d = Date("d");
	$Today_m = Date("m");
	$Today_y = Date("Y");
	echo "<center><table border=0 cellpadding=0 cellspacing=0 width=100%>\n"
			."<tr>\n"
			."	<td align=\"center\">\n"
			."		<table border=0 width=100% cellpadding=4 cellspacing=0>\n"
			."			<tr>\n"
			."				<td nowrap width=25% valign=\"top\">\n"
			."					<strong><big>·</big></strong> <a href=\"modules.php?name=$module_name&file=submit\">"._CALMOREEVENT."</a><br>\n"
			."					<strong><big>·</big></strong> <a href=\"modules.php?name=$module_name&file=index&type=day\">"._CALDAYLINK."</a>\n"
			."				</td>\n"
			."				<td nowrap width=25% valign=\"top\">\n"
			."					<strong><big>·</big></strong> <a href=\"modules.php?name=$module_name&file=index&type=month\">"._CALMONTHLINK."</a><br>\n"
			."					<strong><big>·</big></strong> <a href=\"modules.php?name=$module_name&file=index&type=year\">"._CALYEARLINK."</a>\n"
			."				</td>\n"
			."				<td nowrap width=50% valign=\"top\">\n"
			."					<form name=\"jump\">\n";
	echo "<b>"._CALJUMPTOTEXT."</b>:<br>\n"
			."<select name=\"jumpmonth\">";
	buildMonthSelect($Today_m);
	echo "</select>\n"
			."<select name=\"jumpday\">";
	buildDaySelect($Today_d);
	echo "</select>\n"
			."<select name=\"jumpyear\">";
	buildYearSelect($Today_y);
	echo "</select>\n"
			."<select name=\"view\">\n"
			."<option value=\"day\">Visualização diária</option>\n"
			."<option SELECTED value=\"month\">Visualização mensal</option>\n"
			."<option value=\"year\">Visualização anual</option>\n"
			."</select>\n"
			."&nbsp;<input type=button value=\""._CALJUMPBUTTON."\" onClick=\"location.href='modules.php?name=$module_name&file=index&type=' + document.jump.view.options[document.jump.view.options.selectedIndex].value + '&Date=' + document.jump.jumpmonth.options[document.jump.jumpmonth.options.selectedIndex].value + '/' + document.jump.jumpday.options[document.jump.jumpday.options.selectedIndex].value + '/' + document.jump.jumpyear.options[document.jump.jumpyear.options.selectedIndex].value;\"></form></td>\n";
	echo "				</tr>\n"
			."			</table>\n"
			."		</td>\n"
			."	</tr>\n"
			."</table></center>";
	CloseTable();
	include ('footer.php');
} // SubmitStory



switch($op2) {

	case _CALPREVIEW:
	PreviewStory($name, $address, $subject, $day, $month, $year, $endday, $endmonth, $endyear, $story, $topic, $type, $startHour, $startMin, $startampm, $endHour, $endMin, $endampm, $alldayevent, $barcolor);
	break;

	case _CALOK:
	SubmitStory($name, $address, $subject, $day, $month, $year, $endday, $endmonth, $endyear, $story, $topic, $type, $startHour, $startMin, $startampm, $endHour, $endMin, $endampm, $alldayevent, $barcolor);
	break;

	default:
	defaultDisplay($type);
	break;

}

?>