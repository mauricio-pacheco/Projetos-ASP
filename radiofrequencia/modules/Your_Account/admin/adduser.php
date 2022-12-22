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

if (!defined('YA_ADMIN')) { echo "CNBYA admin protection"; exit; }
if (!eregi("modules.php", $_SERVER['SCRIPT_NAME'])) {
    header("Location: ../../../index.php");
    die ();
}if (!defined('CNBYA')) { echo "CNBYA protection"; exit; }
if (($radminsuper==1) OR ($radminuser==1)) {

    $pagetitle = ": "._USERADMIN." - "._ADDUSER;
    include("header.php");
    title(_USERADMIN." - "._ADDUSER);
    amain();
    echo "<br>\n";
    OpenTable();
    echo "<center><table border='0'>\n";
    echo "<form action='modules.php?name=$module_name&file=admin' method='post'>\n";
    echo "<tr><td bgcolor='$bgcolor2'>"._NICKNAME.":</td><td bgcolor='$bgcolor1'><input type='text' name='add_uname' size='30' maxlength='".$ya_config['nick_max']."'>&nbsp;<font class='tiny'>"._REQUIRED."</font></td></tr>\n";
    echo "<tr><td bgcolor='$bgcolor2'>"._UREALNAME.":</td><td bgcolor='$bgcolor1'><input type='text' name='add_name' size='30' maxlength='50'></td></tr>\n";
    echo "<tr><td bgcolor='$bgcolor2'>"._EMAIL.":</td><td bgcolor='$bgcolor1'><input type='text' name='add_email' size='30' maxlength='60'>&nbsp;<font class='tiny'>"._REQUIRED."</font></td></tr>\n";
    echo "<tr><td bgcolor='$bgcolor2'>"._RETYPEEMAIL.":</td><td bgcolor='$bgcolor1'><input type='text' name='add_email2' size='30' maxlength='60'>&nbsp;<font class='tiny'>"._REQUIRED."</font></td></tr>\n";
    echo "<tr><td bgcolor='$bgcolor2'>"._FAKEEMAIL.":</td><td bgcolor='$bgcolor1'><input type='text' name='add_femail' size='30' maxlength='60'></td></tr>\n";
    echo "<tr><td bgcolor='$bgcolor2'>"._URL.":</td><td bgcolor='$bgcolor1'><input type='text' name='add_url' size='30' maxlength='60'></td></tr>\n";

	$result = $db->sql_query("SELECT * FROM ".$user_prefix."_cnbya_field WHERE need <> '0' ORDER BY pos");
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
			echo"<font class='tiny'>"._REQUIRED."</font>";
		  	echo "</td></tr>\n";	  
	    }

    echo "<tr><td bgcolor='$bgcolor2'>"._ICQ.":</td><td bgcolor='$bgcolor1'><input type='text' name='add_user_icq' size='20' maxlength='20'></td></tr>\n";
    echo "<tr><td bgcolor='$bgcolor2'>"._AIM.":</td><td bgcolor='$bgcolor1'><input type='text' name='add_user_aim' size='20' maxlength='20'></td></tr>\n";
    echo "<tr><td bgcolor='$bgcolor2'>"._YIM.":</td><td bgcolor='$bgcolor1'><input type='text' name='add_user_yim' size='20' maxlength='20'></td></tr>\n";
    echo "<tr><td bgcolor='$bgcolor2'>"._MSNM.":</td><td bgcolor='$bgcolor1'><input type='text' name='add_user_msnm' size='20' maxlength='20'></td></tr>\n";
    echo "<tr><td bgcolor='$bgcolor2'>"._LOCATION.":</td><td bgcolor='$bgcolor1'><input type='text' name='add_user_from' size='25' maxlength='60'></td></tr>\n";
    echo "<tr><td bgcolor='$bgcolor2'>"._OCCUPATION.":</td><td bgcolor='$bgcolor1'><input type='text' name='add_user_occ' size='25' maxlength='60'></td></tr>\n";
    echo "<tr><td bgcolor='$bgcolor2'>"._INTERESTS.":</td><td bgcolor='$bgcolor1'><input type='text' name='add_user_intrest' size='25' maxlength='255'></td></tr>\n";
    echo "<tr><td bgcolor='$bgcolor2'>"._OPTION.":</td><td bgcolor='$bgcolor1'><input type='checkbox' name='add_user_viewemail' VALUE='1'> "._ALLOWUSERS."</td></tr>\n";
    echo "<tr><td bgcolor='$bgcolor2'>"._NEWSLETTER.":</td><td bgcolor='$bgcolor1'><input type='checkbox' name='add_newsletter' value='1'> "._YES."</td></tr>\n";
    if ($Version_Num > 6.9) {
        echo "<tr><td bgcolor='$bgcolor2'>"._YA_POINTS.":</td><td bgcolor='$bgcolor1'><input type='test' name='add_points' value='0'></td></tr>\n";
    }
    echo "<tr><td bgcolor='$bgcolor2' valign='top'>"._SIGNATURE.":</td><td bgcolor='$bgcolor1'><textarea name='add_user_sig' rows='6' cols='45'></textarea></td></tr>\n";
    echo "<tr><td bgcolor='$bgcolor2'>"._PASSWORD.":</td><td bgcolor='$bgcolor1'><input type='text' name='add_pass' size='12' maxlength='".$ya_config['pass_max']."'> <font class='tiny'>"._REQUIRED."</font></td></tr>\n";
    echo "<tr><td bgcolor='$bgcolor2'>"._RETYPEPASSWORD.":</td><td bgcolor='$bgcolor1'><input type='text' name='add_pass2' size='12' maxlength='".$ya_config['pass_max']."'> <font class='tiny'>"._REQUIRED."</font></td></tr>\n";
    echo "<input type='hidden' name='add_avatar' value='gallery/blank.gif'>\n";
    echo "<input type='hidden' name='op' value='addUserConf'>\n";
    if (isset($min)) { echo "<input type='hidden' name='min' value='$min'>\n"; }
    if (isset($xop)) { echo "<input type='hidden' name='xop' value='$xop'>\n"; }
    echo "<tr><td align='center' colspan='2'><input type='submit' value='"._ADDUSERBUT."'></td></tr>\n";
    echo "</form>\n";
    echo "<form action='modules.php?name=$module_name&file=admin' method='post'>\n";
    if (isset($min)) { echo "<input type='hidden' name='min' value='$min'>\n"; }
    if (isset($xop)) { echo "<input type='hidden' name='op' value='$xop'>\n"; }
    echo "<tr><td align='center' colspan='2'><input type='submit' value='"._CANCEL."'></td></tr>\n";
    echo "</form>\n";
    echo "</table>\n";
    CloseTable();
    include("footer.php");

}

?>