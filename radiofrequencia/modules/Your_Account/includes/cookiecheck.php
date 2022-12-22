<?php

/*********************************************************************************/
/* CNB Your Account: An Advanced User Management System for phpnuke     		*/
/* ============================================                         		*/
/*                                                                      		*/
/* Copyright (c) 2004 by Comunidade PHP Nuke Brasil                     		*/
/* http://dev.phpnuke.org.br & http://www.phpnuke.org.br                		*/
/*                                                                      		*/
/* Contact author: escudero@phpnuke.org.br                              		*/
/* International Support Forum: http://ravenphpscripts.com/forum76.html 		*/
/*                                                                      		*/
/* This program is free software. You can redistribute it and/or modify 		*/
/* it under the terms of the GNU General Public License as published by 		*/
/* the Free Software Foundation; either version 2 of the License.       		*/
/*                                                                      		*/
/*********************************************************************************/
/* CNB Your Account it the official successor of NSN Your Account by Bob Marion	*/
/*********************************************************************************/

/********************************************************/
/* Coded by Richard van Oosterhout, the Netherlands	  */
/* (menelaos dot hetnet dot nl)				  */
/* based on MyCookies Manager by A_Jelly_Doughnut       */
/* and work by Josh Pettit of UBB.Threads		  */
/********************************************************/

if ( (!eregi("modules.php", $_SERVER['SCRIPT_NAME'])) AND (!eregi("admin.php", $_SERVER['SCRIPT_NAME'])) ) {
    header("Location: ../../../index.php");
    die ();
}
if (!defined('CNBYA')) { echo "CNBYA protection"; exit; }
/*************************************************************************************/
// function yacookiecheck()
/*************************************************************************************/
function yacookiecheck(){
global $ya_config;
setcookie("CNB_test1","value1"); 
setcookie("CNB_test2","value2",time()+3600); 
setcookie("CNB_test3","value3",time()+3600,"/"); 
setcookie("CNB_test4","value4",time()+3600,"$ya_config[cookiepath]"); 
}
/*************************************************************************************/
// function yacookiecheckresults()
/*************************************************************************************/
function yacookiecheckresults(){
global $ya_config,$module_name;
$cookiedebug = "0";		// cookiedebug: set this to '1' if you want additional debug info

if (($_COOKIE ['CNB_test3'] != "value3") OR ($cookiedebug == "1")){
include("header.php");
Show_CNBYA_menu();
OpenTable();
}
	$debugcookie = "<table width=\"100%\" cellspacing=\"10\" cellpadding=\"0\" border=\"0\" align=\"center\">";
	  if($_COOKIE ['CNB_test1'] == "value1")
		{$debugcookie .= "<tr><td>1: setcookie('CNB_test1','value1';)";
		 $debugcookie .= "</td><td><font color=\"#009933\"><b>"._YA_COOKIEOK."</b></font></td></tr>";	}
	  else	{$debugcookie .= "<tr><td>1: setcookie('CNB_test1','value1';)";
		 $debugcookie .= "</td><td><font color=\"#FF3333\"><b>"._YA_COOKIEFAIL."</b></font></td></tr>";	}
	  if($_COOKIE ['CNB_test2'] == "value2")
		{$debugcookie .= "<tr><td>2: setcookie('CNB_test2','value2',time()+120)";
		 $debugcookie .= "</td><td><font color=\"#009933\"><b>"._YA_COOKIEOK."</b></font></td></tr>";	}
	  else	{$debugcookie .= "<tr><td>2: setcookie('CNB_test2','value2',time()+120)";
		 $debugcookie .= "</td><td><font color=\"#FF3333\"><b>"._YA_COOKIEFAIL."</b></font></td></tr>";	}
	  if($_COOKIE ['CNB_test3'] == "value3") 
		{$debugcookie .= "<tr><td>3: setcookie('CNB_test3','value3',time()+120,'/')";
		 $debugcookie .= "</td><td><font color=\"#009933\"><b>"._YA_COOKIEOK."</b></font></td></tr>";	}
	  else	{$debugcookie .= "<tr><td>3: setcookie('CNB_test3','value3',time()+120,'/')";
		 $debugcookie .= "</td><td><font color=\"#FF3333\"><b>"._YA_COOKIEFAIL."</b></font></td></tr>";	}
	  if($_COOKIE ['CNB_test4'] == "value4")
		{$debugcookie .= "<tr><td>4: setcookie('CNB_test4','value4',time()+120,'$ya_config[cookiepath]')";
		 $debugcookie .= "</td><td><font color=\"#009933\"><b>"._YA_COOKIEOK."</b></font></td></tr>";	}
	  else	{$debugcookie .= "<tr><td>4: setcookie('CNB_test4','value4',time()+120,'$ya_config[cookiepath]')";
		 $debugcookie .= "</td><td><font color=\"#FF3333\"><b>"._YA_COOKIEFAIL."</b></font></td></tr>";	}
	$debugcookie .= "</td></tr></table>";

	if ($_COOKIE ['CNB_test3'] != "value3") {
		echo "<table width=\"100%\" cellspacing=\"0\" cellpadding=\"5\" border=\"0\"><tr>";
		echo "<td colspan=\"2\"><img src=\"modules/$module_name/images/warning.png\" align=\"left\" width=\"40\" height=\"40\">";
		echo "<font color=\"#FF3333\"><b>"._YA_COOKIENO."</b></font>";
		echo "</td></tr><tr><td valign=\"top\">";
		if ($cookiedebug == "1") {OpenTable();echo $debugcookie;CloseTable();}
		// In a next devellopment stage we will give users some tips on how to enable cookies in their browser
		// echo "We will give you some ideas on how to solve this.<br><br>";
		// echo "If you use Internet Explorer, click here<br>";
		// echo "If you use Mozilla, click here<br>";
		// echo "If you use Opera, click here<br>";
		// echo "If you use Netscape, click here<br>";
		echo "</td></tr></table>";
	} 
	else if ($cookiedebug == "1")
	{	echo "<table width=\"100%\" cellspacing=\"0\" cellpadding=\"5\" border=\"0\"><tr>";
		echo "<td colspan=\"2\"><img src=\"modules/$module_name/images/warning.png\" align=\"left\" width=\"40\" height=\"40\">";
		echo "<font color=\"#009933\"><b>"._YA_COOKIEYES."</b></font>";
		echo "</td></tr><tr><td valign=\"top\">";
		if ($cookiedebug == "1") {OpenTable();echo $debugcookie;CloseTable();}
		echo "</td><tr><form action=\"modules.php?name=$module_name\" method=\"post\">";
		echo "<td align=\"right\"><input type=\"submit\" name=\"submit\" value='"._YA_CONTINUE."'></td></form></tr></table>";
	}
setcookie("CNB_test1","expired1",time()-604800,"");
setcookie("CNB_test2","expired2",time()-604800,"");
setcookie("CNB_test3","expired3",time()-604800,"/");
setcookie("CNB_test4","expired4",time()-604800,"$ya_config[cookiepath]");

   if (($_COOKIE ['CNB_test3'] != "value3") OR  ($cookiedebug == "1")){
   CloseTable();
   echo "<br>";
   include("footer.php");}
}
/*************************************************************************************/
// function ShowCookiesRedirect()
/*************************************************************************************/
function ShowCookiesRedirect() {
global $ya_config,$module_name;

setcookie("CNB_test1","1",time()-604800,"");
setcookie("CNB_test2","2",time()-604800,"");
setcookie("CNB_test3","3",time()-604800,"/");
setcookie("CNB_test4","4",time()-604800,"$ya_config[cookiepath]");

Header("Location: modules.php?name=$module_name&op=ShowCookies");
}

/*************************************************************************************/
// function ShowCookies()
/*************************************************************************************/
function ShowCookies() {
global $ya_config,$module_name;

include("header.php");
Show_CNBYA_menu();
OpenTable();

$CookieArray	= $HTTP_COOKIE_VARS;
if (!is_array($HTTP_COOKIE_VARS)) {
$CookieArray = $_COOKIE;
}
	echo "<table width=\"100%\" cellspacing=\"0\" cellpadding=\"5\" border=\"0\"><tr>";
	echo "<form action=\"modules.php?name=$module_name&op=DeleteCookies\" method=\"post\">";
	echo "<td colspan=\"2\"><img src=\"modules/$module_name/images/warning.png\" align=\"left\" width=\"40\" height=\"40\">";
	echo "<font class=\"content\">"._YA_DELCOOKIEINFO1."</font></td></tr><tr><td width=\"100%\">";

	echo "<table cellspacing=\"0\" cellpadding=\"5\" border=\"1\" align=\"left\"><tr><td colspan=\"2\">";
	echo "<font class=\"title\">"._YA_CURRENTCOOKIE."</font></td></tr>";
	echo "<tr><td nowrap=\"nowrap\"><b>"._YA_COOKIENAME."</b></td><td width=\"100%\"><b>"._YA_COOKIEVAL."</b></td></tr>";
	if (is_array($CookieArray) && !empty($CookieArray)) {
		while(list($cName,$cValue) = each($CookieArray)) {
			$cName	 = str_replace(" ","",$cName);
			if ($cValue	== "") $cValue = "(empty)";
			$cMore	 = substr("$cValue", 36, 1);
			if ($cMore	!= "") 
			$cValue = substr("$cValue", 0, 35)." ( . . . )";
			echo "<tr><td align=\"left\" nowrap=\"nowrap\">$cName</td><td width=\"100%\" align=\"left\">$cValue</td></tr>";
		}
	echo "</table></td><td valign=\"top\"><input type=\"submit\" name=\"submit\" value='"._YA_COOKIEDELTHESE."'></td></form></tr></table>";
	}
	else {
	echo "<tr><td colspan=\"2\">"._YA_COOKIENOCUR1."</td></tr></table>";
	echo "</td><td valign=\"top\"><input type=\"submit\" name=\"submit\" value='"._YA_COOKIEDELALL."'></td></form></tr></table>";
	}
CloseTable();
include("footer.php");
$CookieArray = "";
}
/*************************************************************************************/
// function DeleteCookies()
/*************************************************************************************/
function DeleteCookies() {
global $ya_config,$module_name,$prefix,$user,$username,$CookieArray;
include("header.php");
Show_CNBYA_menu();
OpenTable();

	cookiedecode($user);
	$r_uid		= $cookie[0];
	$r_username	= $cookie[1];
	echo $r_username;
	echo $r_uid;
	echo $username;

	$CookieArray	= $HTTP_COOKIE_VARS;
	if (!is_array($HTTP_COOKIE_VARS)) {
	$CookieArray = $_COOKIE;
	}
	$db->sql_query("DELETE FROM ".$prefix."_session WHERE uname='$r_username'");
	$db->sql_query("OPTIMIZE TABLE ".$prefix."_session");
//	$db->sql_query("DELETE FROM	 ".$prefix."_bbsessions WHERE session_user_id='$r_uid'");
//	$db->sql_query("OPTIMIZE TABLE ".$prefix."_bbsessions");

	echo "<table width=\"100%\" cellspacing=\"0\" cellpadding=\"5\" border=\"0\"><tr>";
	echo "<form action=\"modules.php?name=$module_name&op=ShowCookies\" method=\"post\">";
	echo "<td colspan=\"2\"><img src=\"modules/$module_name/images/warning.png\" align=\"left\" width=\"40\" height=\"40\">";
	echo "<font class=\"content\">"._YA_COOKIEDEL1."</td></tr><tr><td  width=\"100%\">";

	echo "<table cellspacing=\"0\" cellpadding=\"5\" border=\"1\" align=\"left\"><tr><td colspan=\"2\">";
	echo "<font class=\"title\">"._YA_CURRENTCOOKIE."</font></td></tr>";
	echo "<tr><td nowrap=\"nowrap\"><b>"._YA_COOKIENAME."</b></td><td width=\"100%\"><b>"._YA_COOKIESTAT."</b></td></tr>";
	if (is_array($CookieArray) && !empty($CookieArray)) {
		while(list($cName,$cValue) = each($CookieArray)) {
			$cName = str_replace(" ","",$cName);
			// Multiple cookie paths used to expire cookies that are no longer in use as well.
			setcookie("$cName","1",time()-604800,"");					// Directory only path
			setcookie("$cName","2",time()-604800,"/");				// Site wide path
			setcookie("$cName","3",time()-604800,"$ya_config[cookiepath]");	// Configured path
			echo "<tr><td align=\"left\" nowrap=\"nowrap\">$cName</td><td width=\"100%\" align=\"left\">"._YA_COOKIEDEL2."</td></tr>";
			unset($cName);
		}
	echo "</table><td valign=\"top\"><input type=\"submit\" name=\"submit\" value='"._YA_COOKIESHOWALL."'></td></form></tr></table>";
	}
	else {
	echo "<tr><td width=\"100%\" colspan=\"2\">"._YA_COOKIENOCUR2."</td></tr></table>";
	echo "</td><td valign=\"top\"><input type=\"submit\" name=\"submit\" value='"._YA_COOKIESHOWALL."'></td></form></tr></table>";
	}

// menelaos: these lines need some more study: which are usefull, which are not
unset($user);
unset($cookie);
$user="";
if(isset($_SESSION)){session_unset();}
if(isset($_SESSION)){session_destroy();} 
if( isset($HTTP_COOKIE_VARS[session_name()]))
unset( $HTTP_COOKIE_VARS[session_name()] );
// menelaos: these lines need some more study: which are usefull, which are not

CloseTable();
include("footer.php");
}

?>