<?php

function changemail() {
global $db, $user_prefix, $module_name, $sitekey, $user, $stop, $cookie;

	$get_id = $_GET['id'];
	$check_num = $_GET['check_num'];
	$newmail = $_GET['mail'];
	
	cookiedecode($user); 
	$userinfo = getusrinfo($user);
	
	include "header.php";
	title(_CHANGEMAILTITLE);
	opentable();
	ya_mailCheck($newmail);
	list($get_username, $tuemail) = $db -> sql_fetchrow($db -> sql_query("SELECT username, user_email FROM ".$user_prefix."_users WHERE user_id = '$get_id'"));
	cookiedecode($user); 
	getusrinfo($user); 
	$datekey = date("F Y");
	$check_num2 = substr(md5(hexdec($datekey) * hexdec($userinfo[user_password]) * hexdec($sitekey) * hexdec($newmail) * hexdec($tuemail)), 2, 10);
	if ((is_user($user)) AND (strtolower($userinfo[username]) == strtolower($cookie[1])) AND ($userinfo[user_password] == $cookie[2])) {
		if ($stop == '') {
			if ( (strtolower($userinfo[username]) == strtolower($get_username)) AND ($check_num2 == $check_num) ) {
				$result = $db->sql_query("UPDATE ".$user_prefix."_users SET user_email='$newmail' WHERE user_id='$get_id'");
				if ($result) echo ""._CHANGEMAILOK.""; else echo ""._CHANGEMAILNOT."";
			} else {
				echo ""._CHANGEMAILNOT."";
			}
		} else {
			echo "$stop";
		}
	} else echo ""._CHANGEMAILNOTUSER."";
	
	closetable();
	include "footer.php";

}


?>