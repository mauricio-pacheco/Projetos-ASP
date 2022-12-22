<?php

/********************************************************/
/* NSN Banner Ads                                       */
/* By: NukeScripts Network (webmaster@nukescripts.net)  */
/* http://www.nukescripts.net                           */
/* Copyright © 2000-2005 by NukeScripts Network         */
/********************************************************/

function cookierecode($client) {
    global $cookie2, $prefix, $db;
    $client = base64_decode($client);
    $cookie2 = explode(":", $client);
    $result = $db->sql_query("select passwd from ".$prefix."_nsnba_clients where login='$cookie2[1]'");
    list($pass) = $db->sql_fetchrow($result);
    if ($cookie2[2] == $pass && $pass != "") {
	return $cookie2;
    } else {
	unset($client);
	unset($cookie2);
    }
}

function is_client($client) {
    global $prefix, $db;
    if(!is_array($client)) {
	$client = base64_decode($client);
	$client = explode(":", $client);
        $cid = "$client[0]";
	$pwd = "$client[2]";
    } else {
        $cid = "$client[0]";
	$pwd = "$client[2]";
    }
    if ($cid != "" AND $pwd != "") {
	$result = $db->sql_query("select passwd from ".$prefix."_nsnba_clients where cid='$cid'");
	list($pass) = $db->sql_fetchrow($result);
	if($pass == $pwd && $pass != "") {
	    return 1;
	}
    }
    return 0;
}

function getcntinfo($client) {
    global $clientinfo, $prefix, $db;
    $client2 = base64_decode($client);
    $client3 = explode(":", $client2);
    $result = $db->sql_query("select cid, name, email, login, passwd from ".$prefix."_nsnba_clients where login='$client3[1]' and passwd='$client3[2]'");
    if ($db->sql_numrows($result) == 1) {
    	$clientinfo = $db->sql_fetchrow($result);
    }
    return $clientinfo;
}

?>