<?php

/********************************************************/
/* Hacker Beware center block        (SQL Programing)   */
/* By: Stephen2417 (Orignal Code) &    xfsunolesphp     */
/* http://stephen2417.com          http://xfsunoles.com */
/* Copyright © 2004 by Stephen2417 & xfsunolesphp       */
/********************************************************/

if (stristr($_SERVER['PHP_SELF'], "block-Hacker_Beware2.php") OR stristr($_SERVER['SCRIPT_NAME'], "block-Hacker_Beware2.php")) {
    Header("Location: ../index.php");
    die();
}

global $db, $prefix, $ab_config;
$total_ips = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_nsnst_blocked_ips" ));
if(!$total_ips) { $total_ips = 0; }
$content  = "<center><img src=\"images/sentinel/Sentinel_Medium.png\" alt=\"You have been warned!\" title=\"You have been warned!\"><br />We have caught $total_ips shameful hackers.</center>";
$content .= "<hr><center><a href=\"http://www.nukescripts.net\">"._AB_NUKESENTINEL." ".$ab_config['version_number']."</a></center>\n";

?>