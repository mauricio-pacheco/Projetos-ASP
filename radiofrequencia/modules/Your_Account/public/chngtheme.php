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

if (!eregi("modules.php", $_SERVER['SCRIPT_NAME'])) {
    header("Location: ../../../index.php");
    die ();
}
if (!defined('CNBYA')) { echo "CNBYA protection"; exit; }

	cookiedecode($user); 
	getusrinfo($user); 
	if ((is_user($user)) AND (strtolower($userinfo[username]) == strtolower($cookie[1])) AND ($userinfo[user_password] == $cookie[2])) {
        include ("header.php");
        title(_THEMESELECTION);
        OpenTable();
        nav();
        CloseTable();
        echo "<br>";
        OpenTable();
        echo "<center>";
        echo "<form action=\"modules.php?name=$module_name\" method=\"post\">";
        echo "<b>"._SELECTTHEME."</b><br>";
        echo "<select name=\"theme\">";
        $handle=opendir('themes');
        while ($file = readdir($handle)) {
            if ( (!ereg("[.]",$file) AND file_exists("themes/$file/theme.php")) ) { $themelist .= "$file "; }
        }
        closedir($handle);
        $themelist = explode(" ", $themelist);
        sort($themelist);
        for ($i=0; $i < sizeof($themelist); $i++) {
            if($themelist[$i]!="") {
                echo "<option value=\"$themelist[$i]\" ";
                if((($userinfo[theme]=="") && ($themelist[$i]=="$Default_Theme")) || ($userinfo[theme]==$themelist[$i])) echo "selected";
                echo ">$themelist[$i]\n";
            }
        }
        if($userinfo[theme]=="") $userinfo[theme] = "$Default_Theme";
        echo "</select><br>";
        echo ""._THEMETEXT1."<br>";
        echo ""._THEMETEXT2."<br>";
        echo ""._THEMETEXT3."<br><br>";
        echo "<input type=\"hidden\" name=\"user_id\" value=\"$userinfo[user_id]\">";
        echo "<input type=\"hidden\" name=\"op\" value=\"savetheme\">";
        echo "<input type=\"submit\" value=\""._SAVECHANGES."\">";
        echo "</form>";
        CloseTable();
        include ("footer.php");
	} else {
        mmain($user);
	}

?>