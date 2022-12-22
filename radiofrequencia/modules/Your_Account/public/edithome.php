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
        title(_HOMECONFIG);
        OpenTable();
        nav();
        CloseTable();
        echo "<br>";
        if($userinfo[theme]=="") { $userinfo[theme] = "$Default_Theme"; }
        OpenTable();
        echo "<form action=\"modules.php?name=$module_name\" method=\"post\">";
        if ($user_news == 1) {
            echo "<b>"._NEWSINHOME."</b> "._MAX127." ";
            echo "<input type=\"text\" name=\"storynum\" size=\"4\" maxlength=\"3\" value=\"$userinfo[storynum]\">";
            echo "<br><br>";
        } else {
            echo "<input type=\"hidden\" name=\"storynum\" value=\"$storyhome\">";
        }
        if ($userinfo[ublockon]==1) { $sel = "checked"; }
        if ($broadcast_msg == 1) {
            if ($userinfo[broadcast] == 1) {
                $sel1 = "checked";
                $sel2 = "";
            } elseif ($userinfo[broadcast] == 0) {
                $sel1 = "";
                $sel2 = "checked";
            }
            echo "<b>"._MESSAGEACTIVATE."</b> <input type=\"radio\" name=\"broadcast\" value=\"1\" $sel1> "._YES." &nbsp;&nbsp;<input type=\"radio\" name=\"broadcast\" value=\"0\" $sel2>"._NO."<br><br>";
        } else {
            echo "<input type=\"hidden\" name=\"broadcast\" value=\"1\">";
        }
        echo "<input type=\"checkbox\" name=\"ublockon\" $sel>";
        echo " <b>"._ACTIVATEPERSONAL."</b>";
        echo "<br>"._CHECKTHISOPTION."";
        echo "<br>"._YOUCANUSEHTML."<br>";
        echo "<textarea cols=\"55\" rows=\"5\" name=\"ublock\">$userinfo[ublock]</textarea>";
        echo "<br><br>";
        echo "<input type=\"hidden\" name=\"username\" value=\"$userinfo[username]\">";
        echo "<input type=\"hidden\" name=\"user_id\" value=\"$userinfo[user_id]\">";
        echo "<input type=\"hidden\" name=\"op\" value=\"savehome\">";
        echo "<input type=\"submit\" value=\""._SAVECHANGES."\">";
        echo "</form>";
        CloseTable();
        include ("footer.php");
	} else {
        mmain($user);
	}

?>