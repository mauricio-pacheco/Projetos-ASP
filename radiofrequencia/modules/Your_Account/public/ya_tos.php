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
/* TOS Pluggin sixonetonoffun http://www.netflake.com   */
/* Simple Agree to Terms mod for CNBYA                  */
/********************************************************/

if (!eregi("modules.php", $_SERVER['SCRIPT_NAME'])) {
    header("Location: ../../../index.php");
    die ();
}
if (!defined('CNBYA')) { echo "CNBYA protection"; exit; }

  include("header.php");
  title(_USERAPPLOGIN);
  $sel1 = "checked";
  $sel2 = "";

// menelaos: shows top table (differently for new users and current members)
  OpenTable();
  if ($setinfo[agreedtos] == '0') {
  echo "<img src=\"modules/$module_name/images/warning.png\" align=\"left\" width=\"40\" height=\"40\"></td><td>"._YATOSINTRO1."\n";
  } else {
  echo "<img src=\"modules/$module_name/images/warning.png\" align=\"left\" width=\"40\" height=\"40\"></td><td>"._YATOSINTRO2."\n";
  }
  CloseTable();
  echo "<br>";

// menelaos: shows bottom table (differently for new users and current members)
  OpenTable();
  echo "<table width=\"100%\" cellspacing=\"0\" cellpadding=\"5\" border=\"0\"><tr align=\"center\">";
  if ($setinfo[agreedtos] == '0') {
    echo "<form name=\"tos1\" action=\"modules.php?name=$module_name\" method=\"POST\"><td colspan=\"2\">\n";
    //if (extension_loaded("gd") AND ($ya_config['usegfxcheck'] == 2 OR $ya_config['usegfxcheck'] == 3)) {
    //	echo "<input type=\"hidden\" name=\"random_num\" value=\"$random_num\">\n";
    //}
    echo "<input type=\"hidden\" name=\"username\" value=$username>\n";
    echo "<input type=\"hidden\" name=\"user_password\" value=$user_password>\n";
    echo "<input type=\"hidden\" name=\"random_num\" value=$random_num>\n";
    echo "<input type=\"hidden\" name=\"gfx_check\" value=$gfx_check>\n";
    echo "<input type=\"hidden\" name=\"redirect\" value=$redirect>\n";
    echo "<input type=\"hidden\" name=\"mode\" value=$mode>\n";
    echo "<input type=\"hidden\" name=\"f\" value=$f>\n";
    echo "<input type=\"hidden\" name=\"t\" value=$t>\n";
    echo "<input type=\"hidden\" name=\"op\" value=\"login\">\n";
  } else {
    echo "<form name=\"tos1\" action=\"modules.php?name=$module_name&op=new_user\" method=\"POST\"><td colspan=\"2\">\n";
  }

  if($_POST['coppa_yes']== intval(1)) {
	echo "<input type=\"hidden\" name=\"coppa_yes\" value='1'>\n";
  }

  if (isset($_POST['tos_yes']) AND $ya_config['tos'] == intval(1)) {
  if ($setinfo[agreedtos] == '0') {
		echo "</td><td align=\"center\"><font color=\"#FF3333\">"._YATOS5."</font>\n";
	} else {
		echo "</td><td align=\"center\"><font color=\"#FF3333\">"._YATOS4."</font>\n";
	}
  echo "<P><input type=\"submit\" value='"._YA_GOBACK."'>\n";
  } else {
	echo "<table width=\"100%\" cellspacing=\"0\" cellpadding=\"20\" border=\"1\"><tr><td class=\"title\">";
	echo "<b>$sitename - "._YATOS1."</b>";
	echo "<P>"._YATOS2."\n";
	echo "</td></tr></table>";
	echo "</td></tr>";
	echo "<tr align=\"right\"><td width=\"100%\" valign=\"top\">\n";
	echo ""._YATOS3."<br>\n";
	echo "</td><td align=\"left\">";
	echo "<input type=\"radio\" name=\"tos_yes\" value='1' $sel2>"._YES."<br>\n";
	echo "<input type=\"radio\" name=\"tos_yes\" value='0' $sel1>"._NO."<br>\n";
	echo "<br><input type=\"submit\" value='"._YA_CONTINUE."'>\n";
  }
  echo "</td></form></tr>";
  echo "</table>";
  CloseTable();

  include("footer.php");

?>