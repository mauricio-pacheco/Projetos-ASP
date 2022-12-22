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
}
if (!defined('CNBYA')) { echo "CNBYA protection"; exit; }
if (($radminsuper==1) OR ($radminuser==1)) {

$pagetitle = ": "._USERADMIN." - "._USERUPDATE;
include("header.php");
title(_USERADMIN." - "._USERUPDATE);
amain();
echo "<br>\n";
$result = $db->sql_query("select * from ".$user_prefix."_users where user_id='$chng_uid' or username='$chng_uid'");
if($db->sql_numrows($result) > 0) {
    $chnginfo = $db->sql_fetchrow($result);
	
	$result = $db->sql_query("SELECT * FROM ".$user_prefix."_cnbya_field");
	while ($sqlvalue = $db->sql_fetchrow($result)) {
	list($value) = $db->sql_fetchrow( $db->sql_query("SELECT value FROM ".$user_prefix."_cnbya_value WHERE fid ='$sqlvalue[fid]' AND uid = '$chnginfo[user_id]'"));
	$chnginfo[$sqlvalue[name]] = $value;
	}
	
    OpenTable();
    echo "<center><table border='0'>\n";
    echo "<form action='modules.php?name=$module_name&file=admin' method='post'>\n";
    echo "<tr><td bgcolor='$bgcolor2'>"._USERID.":</td><td><b>".$chnginfo['user_id']."</b></td></tr>\n";
    echo "<tr><td bgcolor='$bgcolor2'>"._NICKNAME.":</td><td><input type='text' name='chng_uname' value='".$chnginfo['username']."' size='20'><br><b>"._YA_CHNGRISK."</b></td></tr>\n";
    echo "<tr><td bgcolor='$bgcolor2'>"._UREALNAME.":</td><td><input type='text' name='chng_name' value='".$chnginfo['name']."' size='45' maxlength='60'></td></tr>\n";
    echo "<tr><td bgcolor='$bgcolor2'>"._URL.":</td><td><input type='text' name='chng_url' value='".$chnginfo['user_website']."' size='45' maxlength='60'></td></tr>\n";
    echo "<tr><td bgcolor='$bgcolor2'>"._EMAIL.":</td><td><input type='text' name='chng_email' value='".$chnginfo['user_email']."' size='45' maxlength='60'> <font class='tiny'>"._REQUIRED."</font></td></tr>\n";
    echo "<tr><td bgcolor='$bgcolor2'>"._FAKEEMAIL.":</td><td><input type='text' name='chng_femail' value='".$chnginfo['femail']."' size='45' maxlength='60'></td></tr>\n";
    
		$result = $db->sql_query("SELECT * FROM ".$user_prefix."_cnbya_field WHERE need <> '0' ORDER BY pos");
	    while ($sqlvalue = $db->sql_fetchrow($result)) {
	      $t = $sqlvalue[fid];
		  $value2 = explode("::", $sqlvalue[value]);
		  if (substr($sqlvalue[name],0,1)=='_') eval( "\$name_exit = $sqlvalue[name];"); else $name_exit = $sqlvalue[name];
		  if (count($value2) == 1) { 
		    echo "<tr><td bgcolor='$bgcolor2'>$name_exit</td><td bgcolor='$bgcolor3'><input type='text' name='nfield[$t]' value='".$chnginfo[$sqlvalue[name]]."' size='20' maxlength='$sqlvalue[size]'></td></tr>\n";
	      } else {
		    echo "<tr><td bgcolor='$bgcolor2'>$name_exit</td><td bgcolor='$bgcolor3'>";
			echo "<select name='nfield[$t]'>\n";
     	    for ($i = 0; $i<count($value2); $i++) {
			  if (trim($chnginfo[$sqlvalue[name]]) == trim($value2[$i])) $sel = "selected"; else $sel = "";
              echo "<option value=\"".trim($value2[$i])."\" $sel>$value2[$i]</option>\n";
		    }
			echo "</select>";
			echo "</td></tr>\n";
		  }
		}
		
	echo "<tr><td bgcolor='$bgcolor2'>"._ICQ.":</td><td><input type='text' name='chng_user_icq' value='".$chnginfo['user_icq']."' size='20' maxlength='20'></td></tr>\n";
    echo "<tr><td bgcolor='$bgcolor2'>"._AIM.":</td><td><input type='text' name='chng_user_aim' value='".$chnginfo['user_aim']."' size='20' maxlength='20'></td></tr>\n";
    echo "<tr><td bgcolor='$bgcolor2'>"._YIM.":</td><td><input type='text' name='chng_user_yim' value='".$chnginfo['user_yim']."' size='20' maxlength='20'></td></tr>\n";
    echo "<tr><td bgcolor='$bgcolor2'>"._MSNM.":</td><td><input type='text' name='chng_user_msnm' value='".$chnginfo['user_msnm']."' size='20' maxlength='20'></td></tr>\n";
    echo "<tr><td bgcolor='$bgcolor2'>"._LOCATION.":</td><td><input type='text' name='chng_user_from' value='".$chnginfo['user_from']."' size='25' maxlength='60'></td></tr>\n";
    echo "<tr><td bgcolor='$bgcolor2'>"._OCCUPATION.":</td><td><input type='text' name='chng_user_occ' value='".$chnginfo['user_occ']."' size='25' maxlength='60'></td></tr>\n";
    echo "<tr><td bgcolor='$bgcolor2'>"._INTERESTS.":</td><td><input type='text' name='chng_user_interests' value='".$chnginfo['user_interests']."' size='25' maxlength='255'></td></tr>\n";
    if ($chnginfo['user_viewemail'] ==1) { $cuv = "checked"; } else { $cuv = ""; }
    echo "<tr><td bgcolor='$bgcolor2'>"._OPTION.":</td><td><input type='checkbox' name='chng_user_viewemail' value='1' $cuv> "._ALLOWUSERS."</td></tr>\n";
    if ($chnginfo['newsletter'] == 1) { $cnl = "checked"; } else { $cnl = ""; }
    echo "<tr><td bgcolor='$bgcolor2'>"._NEWSLETTER.":</td><td><input type='checkbox' name='chng_newsletter' value='1' $cnl> "._YES."</td></tr>\n";
    if ($Version_Num > 7.0) {
        $yacontent = "";
        $subnum = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_subscriptions WHERE userid='$chng_uid'"));
        if ($subnum == 0) {
            $yacontent .= "<tr><td bgcolor='$bgcolor2'>"._SUBUSERASK.":</td><td><input type='radio' name='subscription' value='1'> "._YES."&nbsp;&nbsp;&nbsp;<input type='radio' name='subscription' value='0' checked> "._NO."</td></tr>";
            $yacontent .= "<tr><td bgcolor='$bgcolor2'>"._SUBPERIOD.":</td><td><select name='subscription_expire'>";
            $yacontent .= "<option value='0' selected>"._NONE."</option>";
            $yacontent .= "<option value='1'>1 "._YEAR."</option>";
            $yacontent .= "<option value='2'>2 "._YEARS."</option>";
            $yacontent .= "<option value='3'>3 "._YEARS."</option>";
            $yacontent .= "<option value='4'>4 "._YEARS."</option>";
            $yacontent .= "<option value='5'>5 "._YEARS."</option>";
            $yacontent .= "<option value='6'>6 "._YEARS."</option>";
            $yacontent .= "<option value='7'>7 "._YEARS."</option>";
            $yacontent .= "<option value='8'>8 "._YEARS."</option>";
            $yacontent .= "<option value='9'>9 "._YEARS."</option>";
            $yacontent .= "<option value='10'>10 "._YEARS."</option>";
            $yacontent .= "</select><input type='hidden' name='reason' value='0'></td></tr>";
        } elseif ($subnum == 1) {
            $yacontent .= "<tr><td bgcolor='$bgcolor2'>"._UNSUBUSER.":</td><td><input type='radio' name='subscription' value='0'> "._YES."&nbsp;&nbsp;&nbsp;<input type='radio' name='subscription' value='1' checked> "._NO."</td></tr>";
            $yacontent .= "<tr><td bgcolor='$bgcolor2'>"._ADDSUBPERIOD.":</td><td><select name='subscription_expire'>";
            $yacontent .= "<option value='0' selected>"._NONE."</option>";
            $yacontent .= "<option value='1'>1 "._YEAR."</option>";
            $yacontent .= "<option value='2'>2 "._YEARS."</option>";
            $yacontent .= "<option value='3'>3 "._YEARS."</option>";
            $yacontent .= "<option value='4'>4 "._YEARS."</option>";
            $yacontent .= "<option value='5'>5 "._YEARS."</option>";
            $yacontent .= "<option value='6'>6 "._YEARS."</option>";
            $yacontent .= "<option value='7'>7 "._YEARS."</option>";
            $yacontent .= "<option value='8'>8 "._YEARS."</option>";
            $yacontent .= "<option value='9'>9 "._YEARS."</option>";
            $yacontent .= "<option value='10'>10 "._YEARS."</option>";
            $yacontent .= "</select></td></tr>";
            $yacontent .= "<tr><td bgcolor='$bgcolor2'>"._ADMSUBEXPIREIN."</td><td>";
            $row = $db->sql_fetchrow($db->sql_query("SELECT * FROM ".$prefix."_subscriptions WHERE userid='$chng_uid'"));
            $diff = $row['subscription_expire']-time();
            $yearDiff = floor($diff/60/60/24/365);
            $diff -= $yearDiff*60*60*24*365;
            if ($yearDiff < 1) {
                $diff = $row['subscription_expire']-time();
            }
            $daysDiff = floor($diff/60/60/24);
            $diff -= $daysDiff*60*60*24;
            $hrsDiff = floor($diff/60/60);
            $diff -= $hrsDiff*60*60;
            $minsDiff = floor($diff/60);
            $diff -= $minsDiff*60;
            $secsDiff = $diff;
            if ($yearDiff < 1) {
                $rest = "$daysDiff "._SBDAYS.", $hrsDiff "._SBHOURS.", $minsDiff "._SBMINUTES.", $secsDiff "._SBSECONDS."";
            } elseif ($yearDiff == 1) {
                $rest = "$yearDiff "._SBYEAR.", $daysDiff "._SBDAYS.", $hrsDiff "._SBHOURS.", $minsDiff "._SBMINUTES.", $secsDiff "._SBSECONDS."";
            } elseif ($yearDiff > 1) {
                $rest = "$yearDiff "._SBYEARS.", $daysDiff "._SBDAYS.", $hrsDiff "._SBHOURS.", $minsDiff "._SBMINUTES.", $secsDiff "._SBSECONDS."";
            }
            $yacontent .= "<font color='#FF0000'>$rest</font></td></tr>";
            $yacontent .= "<tr><td bgcolor='$bgcolor2' valign='top'>"._SUBREASON."</td><td><textarea name='reason' cols='60' rows='10'></textarea></td></tr>";
        }
        echo "$yacontent";
    }
    if ($Version_Num > 6.9) {
        echo "<tr><td bgcolor='$bgcolor2'>"._YA_POINTS.":</td><td bgcolor='$bgcolor1'><input type='test' name='chng_points' value='".$chnginfo['points']."'></td></tr>\n";
    }
    echo "<tr><td bgcolor='$bgcolor2' valign='top'>"._SIGNATURE.":</td><td><textarea name='chng_user_sig' rows='6' cols='45'>".$chnginfo['user_sig']."</textarea></td></tr>\n";
    echo "<tr><td bgcolor='$bgcolor2'>"._PASSWORD.":</td><td><input type='password' name='chng_pass' size='12' maxlength='12'></td></tr>\n";
    echo "<tr><td bgcolor='$bgcolor2'>"._RETYPEPASSWD.":</td><td><input type='password' name='chng_pass2' size='12' maxlength='12'> <font class='tiny'>"._FORCHANGES."</font></td></tr>\n";
    echo "<input type='hidden' name='chng_avatar' value='".$chnginfo['user_avatar']."'>\n";
    echo "<input type='hidden' name='chng_uid' value='$chng_uid'>\n";
    echo "<input type='hidden' name='old_uname' value='".$chnginfo['username']."'>\n";
    echo "<input type='hidden' name='old_email' value='".$chnginfo['user_email']."'>\n";
    echo "<input type='hidden' name='op' value='modifyUserConf'>\n";
    if (isset($query)) { echo "<input type='hidden' name='query' value='$query'>\n"; }
    if (isset($min)) { echo "<input type='hidden' name='min' value='$min'>\n"; }
    if (isset($xop)) { echo "<input type='hidden' name='xop' value='$xop'>\n"; }
    echo "<tr><td align='center' colspan='2'><input type='submit' value='"._SAVECHANGES."'></td></tr>\n";
    echo "</form>\n";
    echo "<form action='modules.php?name=$module_name&file=admin' method='post'>\n";
    if (isset($query)) { echo "<input type='hidden' name='query' value='$query'>\n"; }
    if (isset($min)) { echo "<input type='hidden' name='min' value='$min'>\n"; }
    if (isset($xop)) { echo "<input type='hidden' name='op' value='$xop'>\n"; }
    echo "<tr><td align='center' colspan='2'><input type='submit' value='"._CANCEL."'></td></tr>\n";
    echo "</form>\n";
    echo "</table></center>\n";
    CloseTable();
} else {
    OpenTable();
    echo "<center><b>"._USERNOEXIST."</b></center>\n";
    CloseTable();
}
include("footer.php");

}

?>