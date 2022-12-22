<?php
#-----------------------------------------------------------------------#
# PHP i-Stats: Web Traffic Analysis System                              #
# =========================================                             #
#                                                                       #
# Copyright (c) 2004 by Sam Tang                                        #
# http://www.samphp.com/                                                #
#                                                                       #
# This program is free software. You can redistribute it and/or modify  #
# it under the terms of the GNU General Public License as published by  #
# the Free Software Foundation; either version 2 of the License.        #
#-----------------------------------------------------------------------#
# Description: start page                                               #
# Last Update: 19 Dec 2004 00:58                                        #
#-----------------------------------------------------------------------#

require_once('global.php');

if(isset($_POST['username'])){
	if($cfg['username'] == $_POST['username'] or $cfg['password'] == $_POST['password']){
		$hostname = parse_url($_SERVER['REQUEST_URI']);
		setcookie("username", $_POST['username'], time()+3600, "/", $hostname['host']);
		setcookie("password", md5($_POST['password']), time()+3600, "/", $hostname['host']);
		header("Location: index.php");
		exit();
	}else{
		require_once(INCLUDEPATH . 'auth.php');
		exit();
	}
}

if(!$cfg['public'] && !check_login()){
	require_once(INCLUDEPATH . 'auth.php');
	exit();
}elseif(check_login()){
	setcookie("username", $_COOKIE['username'], time()+1800);
	setcookie("password", $_COOKIE['password'], time+1800);
}


require_once(LANGPATH . $cfg['langFile']);
require_once(INCLUDEPATH . 'header.php');

if(!isset($_GET["action"])){
	$action = 1;
}else{
	$action = intval($_GET["action"]);
	if($action == 0){
		$action = 1;
	}
}

switch($action){
	case 1:
		include "./summary.php";
		break;
	case 2:
		include "./by_day.php";
		break;
	case 3:
		include "./by_week.php";
		break;
	case 4:
		include "./by_mth.php";
		break;
	case 5:
		include "./by_country.php";
		break;
	case 6:
		include "./ref_url.php";
		break;
	case 7:
		include "./ref_domain.php";
		break;
	case 8:
		include "./ref_engine.php";
		break;
	case 9:
		include "./ref_keyword.php";
		break;
	case 10:
		include "./sys_browser.php";
		break;
	case 11:
		include "./sys_os.php";
		break;
	case 12:
		include "./sys_screen.php";
		break;
	case 13:
		include "./sys_color.php";
		break;
	case 14:
		include "./by_hour.php";
		break;
	case 15:
		include "./by_page.php";
		break;
	case 16:
		include "./sys_hostname.php";
		break;
	case 17:
		include "./by_country.php";
		break;
}

require_once(INCLUDEPATH . 'footer.php');

// close mysql connection
$db->dbClose();
?>