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

require_once("../../modules/Your_Account/includes/constants.php");
if (!defined('CNBYA')) { echo "CNBYA protection"; exit; }
$module_name		= basename(dirname(__FILE__));
$mod_name		= "CNB Your Account";
$author_email	= "";
$author_homepage	= "http://dev.phpnuke.org.br";
$author_name		= "<a href=\"$author_homepage\">Comunidade PHP Nuke Brasil</a>";
$license		= "Modifications - Copyright &copy; 2000-2004 Comunidade PHP Nuke Brasil";
$download_location	= "";
$module_version	= "4.4.0 b2";
$release_date	= "-- Nov 2004";
$module_description	= "";
$mod_cost		= "";

function show_copyright() {
    global $mod_cost, $forum, $mod_name, $module_name, $release_date, $author_name, $author_email, $author_homepage, $license, $download_location, $module_version, $module_description;
    if ($mod_name == "") { $mod_name = eregi_replace("_", " ", $module_name); }
    echo "<html>\n";
    echo "<head><title>$mod_name: Copyright Information</title></head>\n";
    echo "<body bgcolor='#FFFFFF' link='#000000' alink='#000000' vlink='#000000'>\n";
    echo "<table align='center' border='0' cellpadding='0' cellspacing='0' width='100%'>\n<tr>\n";
    echo "<td width='100%' align='center'><font size='2' face='Arial, Helvetica'><b>Module Copyright &copy; Information</b><br>";
    echo "$mod_name module for <a href='http://phpnuke.org' target='new'>PHP-Nuke</a><br>[<a href='javascript:void(0)' onClick=javascript:self.close()>Close Window</a>]</font></td>\n";
    echo "</tr>\n</table>\n<hr>\n";
    echo "<font size='2' face='Arial, Helvetica'>";
    echo "<img src='images/arrow.png' border='0'>&nbsp;<b>Module's Name:</b> $mod_name<br>\n";
    if ($module_version != "") { echo "<img src='images/arrow.png' border='0'>&nbsp;<b>Module's Version:</b> $module_version<br>\n"; }
    if ($release_date != "") { echo "<img src='images/arrow.png' border='0'>&nbsp;<b>Release Date:</b> $release_date<br>\n"; }
    if ($mod_cost != "") { echo "<img src='images/arrow.png' border='0'>&nbsp;<b>Module's Cost:</b> $mod_cost<br>\n"; }
    if ($license != "") { echo "<img src='images/arrow.png' border='0'>&nbsp;<b>License:</b> $license<br>\n"; }
    if ($author_name != "") { echo "<img src='images/arrow.png' border='0'>&nbsp;<b>Author's Name:</b> $author_name<br>\n"; }
    if ($author_email != "") { echo "<img src='images/arrow.png' border='0'>&nbsp;<b>Author's Email:</b> $author_email<br>\n"; }
    if ($module_description != "") { echo "<img src='images/arrow.png' border='0'>&nbsp;<b>Module's Description:</b> $module_description<br>\n"; }
    if ($download_location != "") { echo "<img src='images/arrow.png' border='0'>&nbsp;<b>Module's Download:</b> <a href='$download_location' target='new'>Download</a><br>\n"; }
    echo "<hr>\n";
    echo "</font>\n";
    echo "</body>\n";
    echo "</html>";
}

show_copyright();

?>