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

if (eregi("functions.php", $_SERVER['SCRIPT_NAME'])) {
    header("Location: ../../../index.php");
    die ();
}

/*************************************************************************************/
// function Show_CNBYA_menu(){ [added by menelaos dot hetnet dot nl]
/*************************************************************************************/
function Show_CNBYA_menu(){
global $stop, $module_name, $redirect, $mode, $t, $f, $ya_config;
OpenTable();
if ($stop) {
echo "<center><font class=\"title\"><b>"._LOGININCOR."</b></font></center>\n";
} else {
echo "<center><font class=\"title\"><b>"._USERREGLOGIN."</b></font></center>\n";
}
CloseTable();
echo "<br>";
OpenTable();
echo "<table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\"><tr><td align=\"left\"><font class=\"content\">\n";
echo "[ <a href=\"modules.php?name=$module_name\">"._LOGIN."</a> \n";
echo "| <a href=\"modules.php?name=$module_name&op=new_user\">"._REGNEWUSER."</a> ]\n";
echo "</td><td align=\"right\"><font class=\"content\">\n";
echo "[ <font class=\"content\"><a href=\"modules.php?name=$module_name&op=pass_lost\">"._PASSWORDLOST."</a> \n";
echo "| <a href=\"modules.php?name=$module_name&op=ShowCookiesRedirect\">"._YA_COOKIEDELALL."</a> ]</font>\n";
echo "</td></tr></table>\n";
CloseTable();
echo "<br>";
}

function ya_userCheck($username) {
    global $stop, $user_prefix, $db, $ya_config;
    // Need to find a way to include extended caracters
    //if ((!$username) || ($username=="") || (ereg("[^À-ÿa-zA-Z0-9_-]",$username))) $stop = "<center>"._ERRORINVNICK."</center><br>";
    if ((!$username) || ($username=="") || (ereg("[^a-zA-Z0-9_-]",$username))) $stop = "<center>"._ERRORINVNICK."</center><br>";
    if (strlen($username) > $ya_config['nick_max']) $stop = "<center>"._YA_NICKLENGTH."</center>";
    if (strlen($username) < $ya_config['nick_min']) $stop = "<center>"._YA_NICKLENGTH."</center>";
    if ($ya_config['bad_nick'] > "") {
        $BadNickList = explode("\r\n",$ya_config['bad_nick']);
        for ($i=0; $i < count($BadNickList); $i++) {
            if (eregi($BadNickList[$i], $username)) $stop = "<center>"._NAMERESTRICTED."</center><br>";
        }
    }
    if (strrpos($username,' ') > 0) $stop = "<center>"._NICKNOSPACES."</center>";
    if ($db->sql_numrows($db->sql_query("SELECT username FROM ".$user_prefix."_users WHERE username='$username'")) > 0) $stop = "<center>"._NICKTAKEN."</center><br>";
    if ($db->sql_numrows($db->sql_query("SELECT username FROM ".$user_prefix."_users_temp WHERE username='$username'")) > 0) $stop = "<center>"._NICKTAKEN."</center><br>";
    return($stop);
}

function ya_mail($email, $subject, $message, $from) {
global $ya_config, $adminmail;
	if ($ya_config['servermail'] == 0) {
		if (trim($from) == '') $from  = "From: $adminmail\r\n" . "Reply-To: $adminmail\r\n" . "Return-Path: $adminmail\r\n";
		mail("$email", "$subject", "$message", "$from");
	}
}

function ya_mailCheck($user_email) {
    global $stop, $user_prefix, $db, $ya_config;
    $user_email = strtolower($user_email);
    if ((!$user_email) || ($user_email=="") || (!eregi("^[_\.0-9a-z-]+@([0-9a-z][0-9a-z-]+\.)+[a-z]{2,6}$",$user_email))) $stop = "<center>"._ERRORINVEMAIL."</center><br>";
    if ($ya_config['bad_mail'] > "") {
        $BadMailList = explode("\r\n",$ya_config['bad_mail']);
        for ($i=0; $i < count($BadMailList); $i++) {
            if (eregi($BadMailList[$i], $user_email)) $stop = "<center>"._MAILBLOCKED." <b>".$BadMailList[$i]."</b></center><br>";
        }
    }
    if (strrpos($user_email,' ') > 0) $stop = "<center>"._ERROREMAILSPACES."</center><br>";
    if ($db->sql_numrows($db->sql_query("SELECT user_email FROM ".$user_prefix."_users WHERE user_email='$user_email'")) > 0) $stop = "<center>"._EMAILREGISTERED."</center><br>";
    if ($db->sql_numrows($db->sql_query("SELECT user_email FROM ".$user_prefix."_users WHERE user_email='".md5($user_email)."'")) > 0) $stop = "<center>"._EMAILNOTUSABLE."</center><br>";
    if ($db->sql_numrows($db->sql_query("SELECT user_email FROM ".$user_prefix."_users_temp WHERE user_email='$user_email'")) > 0) $stop = "<center>"._EMAILREGISTERED."</center><br>";
    return($stop);
}

function ya_passCheck($user_pass1, $user_pass2) {
    global $stop, $ya_config;
    if (strlen($user_pass1) > $ya_config['pass_max']) $stop = "<center>"._YA_PASSLENGTH."</center><br>";
    if (strlen($user_pass1) < $ya_config['pass_min']) $stop = "<center>"._YA_PASSLENGTH."</center><br>";
    if ($user_pass1 != $user_pass2) $stop = "<center>"._PASSWDNOMATCH."</center><br>";
    return($stop);
}

function ya_fixtext($ya_fixtext) {
    if ($ya_fixtext == "") { return $ya_fixtext; }
    $ya_fixtext = stripslashes($ya_fixtext);
    $ya_fixtext = ereg_replace("\'","&acute;",$ya_fixtext);
    $ya_fixtext = ereg_replace("\"","&quot;",$ya_fixtext);
    $ya_fixtext = strip_tags($ya_fixtext);
    if (!get_magic_quotes_gpc()) { $ya_fixtext = addslashes($ya_fixtext); }; $ya_fixtext = addslashes($ya_fixtext);
    return $ya_fixtext;
}

// function improved by Peter
function ya_save_config($config_name, $config_value, $config_param=""){
	global $prefix, $db;
	if (!get_magic_quotes_gpc()) { $config_value = addslashes($config_value); }
	if($config_param == 'html') {
		$config_name = check_html($config_name, 'nohtml');
		$config_value = check_html($config_value, 'html');
		$db -> sql_query("UPDATE ".$prefix."_cnbya_config SET config_value='$config_value' WHERE config_name='$config_name'");
	}
	if($config_param == 'nohtml') {
		$config_name = check_html($config_name, 'nohtml');
		$config_value = ya_fixtext(check_html($config_value, 'nohtml'));
		$db -> sql_query("UPDATE ".$prefix."_cnbya_config SET config_value='$config_value' WHERE config_name='$config_name'");
	} else {
		$config_name=check_html($config_name, 'nohtml');
		$config_value = intval($config_value);
		$db -> sql_query("UPDATE ".$prefix."_cnbya_config SET config_value='$config_value' WHERE config_name='$config_name'");
	}
}

function ya_get_configs(){
    global $prefix, $db;
    $configresult = $db->sql_query("SELECT config_name, config_value FROM ".$prefix."_cnbya_config");
    while (list($config_name, $config_value) = $db->sql_fetchrow($configresult)) {
		if (!get_magic_quotes_gpc()) { $config_value = stripslashes($config_value); }
        $config[$config_name] = $config_value;
    }
    return $config;
}

function yacookie($setuid, $setusername, $setpass, $setstorynum, $setumode, $setuorder, $setthold, $setnoscore, $setublockon, $settheme, $setcommentmax) {
    global $ya_config, $db, $prefix;
	
    $ip = $_SERVER["REMOTE_ADDR"];
    $result = $db->sql_query("SELECT time FROM ".$prefix."_session WHERE uname='$setusername'");
    $ctime = time();
    if ($setusername!="") {
    	$uname = substr("$setusername", 0,25);
	    if ($row = $db->sql_fetchrow($result)) {
			$db->sql_query("UPDATE ".$prefix."_session SET uname='$setusername', time='$ctime', host_addr='$ip', guest='$guest' WHERE uname='$uname'");
	    } else {
			$db->sql_query("INSERT INTO ".$prefix."_session (uname, time, host_addr, guest) VALUES ('$uname', '$ctime', '$ip', '$guest')");
	    }
	}
	
	$info = base64_encode("$setuid:$setusername:$setpass:$setstorynum:$setumode:$setuorder:$setthold:$setnoscore:$setublockon:$settheme:$setcommentmax");
    if ($ya_config[cookietimelife] != '-') {
	  if (trim($ya_config[cookiepath]) != '') setcookie("user","$info",time()+"$ya_config[cookietimelife]","$ya_config[cookiepath]" );
	  else setcookie("user","$info",time()+"$ya_config[cookietimelife]");
	}
	else {
	  setcookie("user","$info");
	};
}

function YA_CoolSize($size) {
    $mb = 1024*1024;
    if ( $size > $mb ) {
        $mysize = sprintf ("%01.2f",$size/$mb) . " MB";
    } elseif ( $size >= 1024 ) {
        $mysize = sprintf ("%01.2f",$size/1024) . " Kb";
    } else {
        $mysize = $size . " bytes";
    }
    return $mysize;
}

function YA_MakePass() {
    $makepass = "";
    $strs = "abc2def3ghj4kmn5opq6rst7uvw8xyz9";
    for ($x=0; $x < 8; $x++) {
        mt_srand ((double) microtime() * 1000000);
        $str[$x] = substr($strs, mt_rand(0, strlen($strs)-1), 1);
        $makepass = $makepass.$str[$x];
    }
    return($makepass);
}

function amain() {
    global $ya_config, $module_name, $db, $user_prefix, $bgcolor2, $bgcolor1, $textcolor1, $find, $what, $match, $query;
    $cnbyaversion = $ya_config['version'];

	if (!($ya_config['version'] == '4.4.0 b2')) {
		OpenTable();
		echo "<tr bgcolor='$bgcolor1'>\n";
		echo "<td align='center' colspan='4'><center>"._YA_UPDATEYOUTABLE." 4.4.0 b2"._YA_UPDATEYOUTABLE1." $ya_config[version] </center></td>\n";
		echo "</tr>\n";
		CloseTable();
		echo "<br>\n";
	}

    OpenTable();
    $act = $db->sql_numrows($db->sql_query("SELECT * FROM ".$user_prefix."_users WHERE user_level>'0' AND user_id>'1'"));
    $sus = $db->sql_numrows($db->sql_query("SELECT * FROM ".$user_prefix."_users WHERE user_level='0' AND user_id>'1'"));
    $del = $db->sql_numrows($db->sql_query("SELECT * FROM ".$user_prefix."_users WHERE user_level='-1' AND user_id>'1'"));
    $nor = $db->sql_numrows($db->sql_query("SELECT * FROM ".$user_prefix."_users WHERE user_id>'1'"));
    $pen = $db->sql_numrows($db->sql_query("SELECT * FROM ".$user_prefix."_users_temp"));

    echo "<table align='center' cellpadding='2' cellspacing='2' border='0' width='100%'>\n";

    echo "<tr bgcolor='$bgcolor1'>\n";
    echo "<td align='center' colspan='4'><a href='admin.php'>"._YA_ADMINISTRATION."</a></td>\n";    
    echo "</tr>\n";
    echo "<tr bgcolor='$bgcolor1'>\n";
    echo "<td align='center' width='33%'><a href='modules.php?name=$module_name&file=admin&op=addUser'>"._ADDUSER."</a></td>\n";
    echo "<td align='center' width='33%'><a href='modules.php?name=$module_name&file=admin&op=UsersConfig'>"._USERSCONFIG."</a></td>\n";
    echo "<td align='right'><a href='modules.php?name=$module_name&file=admin&op=listnormal&query=1'>"._ACTIVEUSERS.":</a>";
    echo "<td align='left'>($act)</td>\n";
    echo "</tr>\n";
    echo "<tr bgcolor='$bgcolor1'>";
    echo "<td align='center' width='33%'><a href='modules.php?name=$module_name&file=admin&op=addField'>"._YA_ADDFIELD."</a></td>\n";
    echo "<td align='center' width='33%'><a href='modules.php?name=$module_name&file=admin&op=CookieConfig'>"._COOKIECONFIG."</a></td>\n";
    echo "<td align='right'><a href='modules.php?name=$module_name&file=admin&op=listnormal&query=a'>"._NORMALUSERS.":</a>";
    echo "<td align='left'>($nor)</td>\n";
    echo "</tr>\n";
    echo "<tr bgcolor='$bgcolor1'>\n";
    echo "<td align='center' width='33%'><a href='modules.php?name=$module_name&file=admin&op=searchUser'>"._SEARCHUSERS."</a></td>\n";
    echo "<td align='center' width='33%'>&nbsp;</td>\n";
    echo "<td align='right'><a href='modules.php?name=$module_name&file=admin&op=listnormal&query=-1'>"._DELETEUSERS.":</a>";
    echo "<td align='left'>($del)</td>\n";
    echo "</tr>\n";
    echo "<tr bgcolor='$bgcolor1'>\n";
    echo "<td align='center' width='33%'>&nbsp;</td>\n";
    echo "<td align='center' width='33%'>&nbsp;</td>\n";
    echo "<td align='right'><a href='modules.php?name=$module_name&file=admin&op=listnormal&query=0'>"._SUSPENDUSERS.":</a>";
    echo "<td align='left'>($sus)</td>\n";
    echo "</tr>\n";
    echo "<tr bgcolor='$bgcolor1'>\n";
//  echo "<td align='center' width='33%'><a href='modules.php?name=$module_name&file=admin&op=autoSuspend'>"._YA_CHKAUTOSUS."</a></td>";
    echo "<td align='center' width='33%'><a href='modules.php?name=$module_name&file=admin&op=credits'>"._CREDITS."</a></td>\n";
    echo "<td align='center' width='33%'>[CNB Your Account $cnbyaversion]</td>\n";
    echo "<td align='right'><a href='modules.php?name=$module_name&file=admin&op=listpending'>"._WAITINGUSERS.":</a>";
    echo "<td align='left'>($pen)</td>\n";
    echo "</tr>\n";

    echo "</table>\n";
    CloseTable();
}

function asearch() {
    global $module_name, $bgcolor2, $bgcolor1, $textcolor1, $find, $what, $match, $query;
    OpenTable();
    echo "<table align='center' cellpadding='2' cellspacing='2' border='0' bgcolor='$bgcolor1'>\n";
    echo "<form method='post' action='modules.php?name=$module_name&file=admin'>\n";
    echo "<input type='hidden' name='op' value='listresults'>\n";
    echo "<tr>\n";
    echo "<td align='center'><b>"._YA_FIND.":</b></td>\n";
    echo "<td align='center'><b>"._YA_BY.":</b></td>\n";
    echo "<td align='center'><b>"._YA_MATCH.":</b></td>\n";
    echo "<td align='center'><b>"._YA_QUERY.":</b></td>\n";
    echo "</tr>\n<tr>\n";
    if ($find == "tempUser") { $sel1 = ""; $sel2 = " selected"; } else { $sel1 = " selected"; $sel2 = ""; }
    echo "<td align='center'><select name='find'>\n";
    echo "<option value='findUser'$sel1>"._YA_REGLUSER."</option>\n";
    echo "<option value='tempUser'$sel2>"._YA_TEMPUSER."</option>\n";
    echo "</select></td>\n";
    if ($what == "user_email") {
        $sel1 = ""; $sel2 = ""; $sel3 = ""; $sel4 = " selected";
    } elseif ($what == "user_id") {
        $sel1 = ""; $sel2 = ""; $sel3 = " selected"; $sel4 = "";
    } elseif ($what == "name") {
        $sel1 = ""; $sel2 = " selected"; $sel3 = ""; $sel4 = "";
    } else {
        $sel1 = " selected"; $sel2 = ""; $sel3 = ""; $sel4 = "";
    }
    echo "<td align='center'><select name='what'>\n";
    echo "<option value='username' $sel1>"._USERNAME."</option>\n";
    echo "<option value='name' $sel2>"._UREALNAME."</option>\n";
    echo "<option value='user_id' $sel3>"._USERID."</option>\n";
    echo "<option value='user_email' $sel4>"._EMAIL."</option>\n";
    echo "</select></td>\n";
    if ($match == "equal") { $sel1 = ""; $sel2 = " selected"; } else { $sel1 = " selected"; $sel2 = ""; }
    echo "<td align='center'><select name='match'>\n";
    echo "<option value='like' $sel1>"._YA_LIKE."</option>\n";
    echo "<option value='equal' $sel2>"._YA_EQUAL."</option>\n";
    echo "</select></td>\n";
    echo "<td align='center'><input type='text' name='query' value='$query' size='30' maxlength='60'></td>\n";
    echo "<td align='center'><input type='submit' value='"._YA_SEARCH."'></td>\n";
    echo "</tr>\n";
    echo "</form>\n";
    echo "</table>\n";
    CloseTable();
}

function mmain($user) {
    global $stop, $module_name, $redirect, $mode, $t, $f, $ya_config;
    if(!is_user($user)) {
        include("header.php");
        mt_srand ((double)microtime()*1000000);
        $maxran = 10000000;
        $random_num = mt_rand(0, $maxran);
        Show_CNBYA_menu();
        OpenTable();
        echo "<table border=\"0\"><form action=\"modules.php?name=$module_name\" method=\"post\">\n";
        echo "<tr><td>"._NICKNAME.":</td><td><input type=\"text\" name=\"username\" size=\"15\" maxlength=\"25\"></td></tr>\n";
        echo "<tr><td>"._PASSWORD.":</td><td><input type=\"password\" name=\"user_password\" size=\"15\" maxlength=\"20\" AutoComplete=\"off\"></td></tr>\n";
        if (extension_loaded("gd") AND ($ya_config['usegfxcheck'] == 2 OR $ya_config['usegfxcheck'] == 3)) {
            echo "<tr><td>"._YA_SECURITYCODE.":</td><td><img src='modules.php?name=$module_name&op=gfx&random_num=$random_num' border='0' alt='"._YA_SECURITYCODE."' title='"._YA_SECURITYCODE."'></td></tr>\n";
            echo "<tr><td>"._YA_TYPESECCODE.":</td><td><input type=\"text\" name=\"gfx_check\" size=\"10\" maxlength=\"8\" AutoComplete=\"off\"></td></tr>\n";
            echo "<input type=\"hidden\" name=\"random_num\" value=\"$random_num\">\n";
        }
        echo "<input type=\"hidden\" name=\"redirect\" value=$redirect>\n";
        echo "<input type=\"hidden\" name=\"mode\" value=$mode>\n";
        echo "<input type=\"hidden\" name=\"f\" value=$f>\n";
        echo "<input type=\"hidden\" name=\"t\" value=$t>\n";
        echo "<input type=\"hidden\" name=\"op\" value=\"login\">\n";
        echo "<tr><td colspan='2'><input type=\"submit\" value=\""._LOGIN."\">";
        if ($ya_config['useactivate'] == 0) { echo "<br>("._BESUREACT.")\n"; }
        echo "</td></tr></form></table><br>\n\n";
        CloseTable();
        include("footer.php");
    } elseif (is_user($user)) {
        global $cookie;
        cookiedecode($user);
        Header("Location: modules.php?name=$module_name&op=userinfo&username=$cookie[1]");
    }
}

function yapagenums($op, $totalselected, $perpage, $max, $find, $what, $match, $query) {
    global $module_name;
    $pagesint = ($totalselected / $perpage);
    $pageremainder = ($totalselected % $perpage);
    if ($pageremainder != 0) {
        $pages = ceil($pagesint);
        if ($totalselected < $perpage) { $pageremainder = 0; }
    } else {
        $pages = $pagesint;
    }
    if ($pages != 1 && $pages != 0) {
        $counter = 1;
        $currentpage = ($max / $perpage);
        echo "<table align='center' border='0' cellpadding='2' cellspacing='2'>\n";
        echo "<tr><form action='modules.php?name=$module_name&file=admin' method='post'>\n";
        echo "<input type='hidden' name='op' value='$op'>\n";
        if ($what > "")	{ echo "<input type='hidden' name='what' value='$what'>\n"; }
        if ($find > "")	{ echo "<input type='hidden' name='find' value='$find'>\n"; }
        if ($match > "")	{ echo "<input type='hidden' name='match' value='$match'>\n"; }
        if ($query > "")	{ echo "<input type='hidden' name='query' value='$query'>\n"; }
        echo "<td align='center'><b>"._YA_SELECTPAGE.": </b><select name='min'>\n";
        while ($counter <= $pages ) {
            $cpage = $counter;
            $mintemp = ($perpage * $counter) - $perpage;
            echo "<option value='$mintemp'>$counter</option>\n";
            $counter++;
        }
        echo "</select><b> "._YA_OF." $pages "._YA_PAGES."</b> <input type='submit' value='"._YA_GO."'></td>\n</form>\n</tr>\n";
        echo "</table>\n";
    }
}

function disabled() {
    include("header.php");
    OpenTable();
    echo "<font class='option'>"._ACTDISABLED."</font>";
    CloseTable();
    include("footer.php");
}

function notuser() {
    include("header.php");
    OpenTable();
    echo "<font class='option'>"._MUSTBEUSER."</font>";
    CloseTable();
    include("footer.php");
}

?>