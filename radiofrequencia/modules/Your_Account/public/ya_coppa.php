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
/* COPPA Pluggin sixonetonoffun http://www.netflake.com */
/* Minimal basic COPPA Compliance mod for CNBYA         */
/********************************************************/

if (!eregi("modules.php", $_SERVER['SCRIPT_NAME'])) {
    header("Location: ../../../index.php");
    die ();
}
if (!defined('CNBYA')) { echo "CNBYA protection"; exit; }

$coppa=intval($_POST['coppa_yes']);
if (isset($_POST['coppa_yes']) AND $ya_config['coppa'] == intval(1)) {
	$coppa=intval($_POST['coppa_yes']); 
	if($coppa != intval(1)){
		include("header.php");
		title(_USERAPPLOGIN);
		OpenTable();
		echo "<img src=\"modules/$module_name/images/warning.png\" align=\"left\" width=\"40\" height=\"40\"></td><td>"._YACOPPA2."\n";
		CloseTable();
		echo "<br>";
		OpenTable();
		echo "<center><font class=\"title\">"._YACOPPA1."</center><P>\n";
		echo "<font color=\"#FF3333\">"._YACOPPA4."</font>\n";
		echo "<font color=\"#FF3333\">"._YACOPPAFAX."</font>\n";
		CloseTable();
		include("footer.php");
	}
}

  $sel1 = "checked";
  $sel2 = "";
  include("header.php");
  title(_USERAPPLOGIN);
  OpenTable();
  echo "<img src=\"modules/$module_name/images/warning.png\" align=\"left\" width=\"40\" height=\"40\"></td><td>"._YACOPPA2."\n";
  CloseTable();
  echo "<br>";
OpenTable();
  OpenTable();
  echo "<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"center\"><tr>\n";
  echo "<form name=\"coppa1\" action=\"modules.php?name=$module_name&op=new_user\" method=\"POST\">\n";
  echo "<td align=\"center\" colspan=\"2\" class=\"title\">"._YACOPPA1."<P></td></tr>\n";
  echo "<tr><td align=\"center\" colspan=\"2\" ><p class=\"content\">"._YACOPPA3."<P></td></tr>\n";
  echo "<tr><td align=\"right\">"._YES."&nbsp;</td><td align=\"left\"><input type=\"radio\" name=\"coppa_yes\" value='1' $sel2></td></tr>\n";
  echo "<tr><td align=\"right\">"._NO."&nbsp;</td><td align=\"left\"><input type=\"radio\" name=\"coppa_yes\" value='0' $sel1></td></tr>\n";
  echo "<tr><td align=\"center\" colspan=\"2\"><br><input type=\"submit\" value='"._YA_CONTINUE."'>\n";
  echo "</td></form></tr>";
  echo "</table>\n";
  CloseTable();
CloseTable();
  include("footer.php");

?>