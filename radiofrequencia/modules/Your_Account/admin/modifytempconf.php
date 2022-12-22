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

    $stop = "";

    if ($chng_uname != $old_uname) { ya_userCheck($chng_uname); }
    if ($chng_email != $old_email) { ya_mailCheck($chng_email); }
    if ($stop == "") {
        $time = time();
//      $db->sql_query("UPDATE ".$user_prefix."_users_temp SET username='$chng_uname', realname='$chng_realname',  user_email='$chng_email', user_regdate='$chng_regdate', time='$time' WHERE user_id='$chng_uid'");
        $db->sql_query("UPDATE ".$user_prefix."_users_temp SET username='$chng_uname', realname='$chng_realname',  user_email='$chng_email' WHERE user_id='$chng_uid'");

        if (count($nfield) > 0) {
         foreach ($nfield as $key => $var) { 
		 $nfield[$key] = ya_fixtext($nfield[$key]);
 	      if (($db->sql_numrows($db->sql_query("SELECT * FROM ".$user_prefix."_cnbya_value_temp WHERE fid='$key' AND uid = '$chng_uid'"))) == 0) {
		  
		    $sql = "INSERT INTO ".$user_prefix."_cnbya_value_temp (uid, fid, value) VALUES ('$chng_uid', '$key','$nfield[$key]')";
		    $db->sql_query($sql);				
	      }
	      else {
    	    $db->sql_query("UPDATE ".$user_prefix."_cnbya_value_temp SET value='$nfield[$key]' WHERE fid='$key' AND uid = '$chng_uid'");
		  } 
		 }
                }

        $pagetitle = ": "._USERADMIN." - "._ACCTMODIFY;
        include("header.php");
        amain();
        echo "<br>\n";
        OpenTable();
        echo "<center><table align='center' border='0' cellpadding='2' cellspacing='2'>\n";
        echo "<form action='modules.php?name=$module_name&file=admin' method='post'>\n";
        if (isset($query)) { echo "<input type='hidden' name='query' value='$query'>\n"; }
        if (isset($min))   { echo "<input type='hidden' name='min' value='$min'>\n"; }
        if (isset($xop))   { echo "<input type='hidden' name='op' value='$xop'>\n"; }
        echo "<tr><td align='center'><b>"._ACCTMODIFY."</b></td></tr>\n";
        echo "<tr><td align='center'><input type='submit' value='"._RETURN2."'></td></tr>\n";
        echo "</form>\n";
        echo "</table></center>\n";
        CloseTable();
        include("footer.php");
    } else {
        $pagetitle = ": "._USERADMIN;
        include("header.php");
        title(_USERADMIN);
        amain();
        echo "<br>\n";
        OpenTable();
        echo "<b>$stop</b>\n";
        CloseTable();
        include("footer.php");
        return;
    }

}

?>