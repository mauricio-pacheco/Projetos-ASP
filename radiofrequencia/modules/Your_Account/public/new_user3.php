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

    mt_srand ((double)microtime()*1000000);
    $maxran = 1000000;
    $random_num = mt_rand(0, $maxran);
    include("header.php");
    title(_USERREGLOGIN);
    OpenTable();
    echo "<table align='center' cellpadding='3' cellspacing='3' border='0'>\n";
    echo "<tr><td align='center' bgcolor='$bgcolor1' colspan='2'><b>"._REGNEWUSER."</b></td></tr>\n";
    echo "<form action='modules.php?name=$module_name' method='post'>\n";
    echo "<tr><td bgcolor='$bgcolor2'>"._NICKNAME.":<br>"._REQUIRED."</td><td bgcolor='$bgcolor1'><input type='text' name='ya_username' size='15' maxlength='".$ya_config['nick_max']."'>&nbsp;<font class='tiny'>"._REQUIRED."</font><br><font class='tiny'>("._YA_NICKLENGTH.")</font></td></tr>\n";
    echo "<tr><td bgcolor='$bgcolor2'>"._UREALNAME.":<br>"._REQUIRED."</td><td bgcolor='$bgcolor1'><input type='text' name='ya_realname' size='40' maxlength='60'></td></tr>\n";
    echo "<tr><td bgcolor='$bgcolor2'>"._EMAIL.":<br>"._REQUIRED."</td><td bgcolor='$bgcolor1'><input type='text' name='ya_user_email' size='40' maxlength='255'>&nbsp;<font class='tiny'>"._REQUIRED."</font></td></tr>\n";

    // menelaos: added configurable doublecheck email routine
    if ($ya_config['doublecheckemail']==1) {
	echo "<tr><td bgcolor='$bgcolor2'>"._RETYPEEMAIL.":</td><td bgcolor='$bgcolor1'><input type='text' name='ya_user_email2' size='40' maxlength='255'></td></tr>\n";
    } else {
	echo "<input type='hidden' name='ya_user_email2' value='ya_user_email'>\n";
    }

	$result = $db->sql_query("SELECT * FROM ".$user_prefix."_cnbya_field WHERE (need = '2') OR (need = '3') ORDER BY pos");
	    while ($sqlvalue = $db->sql_fetchrow($result)) {
	      $t = $sqlvalue[fid];
		  $value2 = explode("::", $sqlvalue[value]);
		  if (substr($sqlvalue[name],0,1)=='_') eval( "\$name_exit = $sqlvalue[name];"); else $name_exit = $sqlvalue[name];
		  if (count($value2) == 1) { 
			echo "<tr><td bgcolor='$bgcolor2'>$name_exit</td><td bgcolor='$bgcolor3'>";
			echo "<input type='text' name='nfield[$t]' size='20' maxlength='$sqlvalue[size]'>\n";
			} else {
			echo "<tr><td bgcolor='$bgcolor2'>$name_exit</td><td bgcolor='$bgcolor3'>";
			echo "<select name='nfield[$t]'>\n";
				for ($i = 0; $i<count($value2); $i++) {
				echo "<option value=\"".trim($value2[$i])."\">".trim($value2[$i])."</option>\n";
				}
		  	echo "</select>";
		  }
			if (($sqlvalue[need]) > 1) echo"&nbsp;<font class='tiny'>"._REQUIRED."</font>";
		  	echo "</td></tr>\n";	  
	    }
		
    echo "<tr><td bgcolor='$bgcolor2'>"._PASSWORD.":</td><td bgcolor='$bgcolor1'><input type='password' name='user_password' size='10' maxlength='".$ya_config['pass_max']."'><br><font class='tiny'>("._BLANKFORAUTO.")</font><br><font class='tiny'>("._YA_PASSLENGTH.")</font></td></tr>\n";
    echo "<tr><td bgcolor='$bgcolor2'>"._RETYPEPASSWORD.":</td><td bgcolor='$bgcolor1'><input type='password' name='user_password2' size='10' maxlength='".$ya_config['pass_max']."'><br><font class='tiny'>("._BLANKFORAUTO.")</font><br><font class='tiny'>("._YA_PASSLENGTH.")</font></td></tr>\n";
    echo "<tr><td bgcolor='$bgcolor2'>"._UFAKEMAIL.":<br>"._OPTIONAL."</td><td bgcolor='$bgcolor1'><input type='text' name='femail' size='40' maxlength='255'><br>"._EMAILPUBLIC."</td></tr>\n";
    echo "<tr><td bgcolor='$bgcolor2'>"._YOURHOMEPAGE.":<br>"._OPTIONAL."</td><td bgcolor='$bgcolor1'><input type='text' name='user_website' size='40' maxlength='255'></td></tr>\n";
    echo "<tr><td bgcolor='$bgcolor2'>"._YICQ.":<br>"._OPTIONAL."</td><td bgcolor='$bgcolor1'><input type='text' name='user_icq' size='30' maxlength='100'></td></tr>\n";
    echo "<tr><td bgcolor='$bgcolor2'>"._YAIM.":<br>"._OPTIONAL."</td><td bgcolor='$bgcolor1'><input type='text' name='user_aim' size='30' maxlength='100'></td></tr>\n";
    echo "<tr><td bgcolor='$bgcolor2'>"._YYIM.":<br>"._OPTIONAL."</td><td bgcolor='$bgcolor1'><input type='text' name='user_yim' size='30' maxlength='100'></td></tr>\n";
    echo "<tr><td bgcolor='$bgcolor2'>"._YMSNM.":<br>"._OPTIONAL."</td><td bgcolor='$bgcolor1'><input type='text' name='user_msnm' size='30' maxlength='100'></td></tr>\n";
    echo "<tr><td bgcolor='$bgcolor2'>"._YLOCATION.":<br>"._OPTIONAL."</td><td bgcolor='$bgcolor1'><input type='text' name='user_from' size='30' maxlength='100'></td></tr>\n";
    echo "<tr><td bgcolor='$bgcolor2'>"._YOCCUPATION.":<br>"._OPTIONAL."</td><td bgcolor='$bgcolor1'><input type='text' name='user_occ' size='30' maxlength='100'></td></tr>\n";
    echo "<tr><td bgcolor='$bgcolor2'>"._YINTERESTS.":<br>"._OPTIONAL."</td><td bgcolor='$bgcolor1'><input type='text' name='user_interests' size='30' maxlength='100'></td></tr>\n";
    echo "<tr><td bgcolor='$bgcolor2'>"._RECEIVENEWSLETTER."</td><td bgcolor='$bgcolor1'><select name='newsletter'><option value='1' selected>"._YES."</option><option value='0'>"._NO."</option></select></td></tr>\n";
    echo "<tr><td bgcolor='$bgcolor2'>"._ALWAYSSHOWEMAIL.":</td><td bgcolor='$bgcolor1'><select name='user_viewemail'><option value='1' selected>"._YES."</option><option value='0'>"._NO."</option></select></td></tr>\n";
    echo "<tr><td bgcolor='$bgcolor2'>"._HIDEONLINE.":</td><td bgcolor='$bgcolor1'><select name='user_allow_viewonline'><option value='1'>"._YES."</option><option value='0' selected>"._NO."</option></select></td></tr>\n";
    echo "<tr><td bgcolor='$bgcolor2'>"._FORUMSTIME."</td><td bgcolor='$bgcolor1'><select name='user_timezone'>";
    $utz = date("Z");
    $utz = round($utz/3600);
    for ($i=-12; $i<13; $i++) {
        if ($i == 0) {
            $dummy = "GMT";
        } else {
            if (!ereg("-", $i)) { $i = "+$i"; }
            $dummy = "GMT $i "._HOURS."";
        }
        if ($utz == $i) {
            echo "<option name=\"user_timezone\" value=\"$i\" selected>$dummy</option>";
        } else {
            echo "<option name=\"user_timezone\" value=\"$i\">$dummy</option>";
        }
    }
    echo "</select></td></tr>\n";
    echo "<tr><td bgcolor='$bgcolor2'><b>"._FORUMSDATE.":</b><br>"._FORUMSDATEMSG."</b></td><td bgcolor='$bgcolor1'><input type='text' name='user_dateformat' value='Y-m-d, H:i:s' size='15' maxlength='14'></td></tr>\n";
    echo "<tr><td bgcolor='$bgcolor2'><b>"._SIGNATURE.":</b><br>"._OPTIONAL."<br>"._NOHTML."</td><td bgcolor='$bgcolor1'><textarea wrap='virtual' cols='50' rows='5' name='user_sig'></textarea><br>"._255CHARMAX."</td></tr>\n";
    echo "<tr><td bgcolor='$bgcolor2'><b>"._EXTRAINFO.":</b><br>"._OPTIONAL."<br>"._NOHTML."</td><td bgcolor='$bgcolor1'><textarea wrap='virtual' cols='50' rows='5' name='bio'></textarea><br>"._CANKNOWABOUT."</td></tr>\n";
    if (extension_loaded("gd") AND ($ya_config['usegfxcheck'] == 1 OR $ya_config['usegfxcheck'] == 3)) {
        echo "<tr><td bgcolor='$bgcolor2'>"._YA_SECURITYCODE.":</td><td bgcolor='$bgcolor1'><img src='modules.php?name=$module_name&op=gfx&random_num=$random_num' border='0' height='20' width='80' alt='"._YA_SECURITYCODE."' title='"._YA_SECURITYCODE."'></td></tr>\n";
        echo "<tr><td bgcolor='$bgcolor2'>"._YA_TYPESECCODE.":</td><td bgcolor='$bgcolor1'><input type='text' name='gfx_check' size='10' maxlength='8'></td></tr>\n";
        echo "<input type='hidden' name='random_num' value='$random_num'>\n";
    }
    echo "<input type='hidden' name='op' value='new_confirm'>\n";
    echo "<tr><td align='right' bgcolor='$bgcolor1' colspan='2'><input type='submit' value='"._YA_CONTINUE."'></td></tr>\n";
    echo "</form></table>\n";
    echo "<br>\n";
    echo ""._COOKIEWARNING."<br>\n";
    echo ""._ASREGUSER."<br>\n";
    echo "<ul>\n";
    echo "<li>"._ASREG1."\n";
    echo "<li>"._ASREG2."\n";
    echo "<li>"._ASREG3."\n";
    echo "<li>"._ASREG4."\n";
    echo "<li>"._ASREG5."\n";
    $handle=opendir('themes');
    while ($file = readdir($handle)) {
        if ((!ereg("[.]",$file) AND file_exists("themes/$file/theme.php"))) { $thmcount++; }
    }
    closedir($handle);
    if ($thmcount > 1) { echo "<li>"._ASREG6."\n"; }
    $sql = "SELECT custom_title FROM ".$prefix."_modules WHERE active='1' AND view='1' AND inmenu='1'";
    $result = $db->sql_query($sql);
    while ($row = $db->sql_fetchrow($result)) {
        $custom_title = $row[custom_title];
        if ($custom_title != "") { echo "<li>"._ACCESSTO." $custom_title\n"; }
    }
    $sql = "SELECT title FROM ".$prefix."_blocks WHERE active='1' AND view='1'";
    $result = $db->sql_query($sql);
    while ($row = $db->sql_fetchrow($result)) {
        $b_title = $row[title];
        if ($b_title != "") { echo "<li>"._ACCESSTO." $b_title\n"; }
    }
    if (is_active("Journal")) { echo "<li>"._CREATEJOURNAL."\n"; }
    if ($my_headlines == 1) { echo "<li>"._READHEADLINES."\n"; }
    echo "<li>"._ASREG7."\n";
    echo "</ul>\n";
    echo _REGISTERNOW."<br>\n";
    echo _WEDONTGIVE."<br><br>\n";
    CloseTable();
    include("footer.php");

?>