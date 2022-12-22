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

    //$pagetitle = ": "._USERADMIN." - "._ACCTDENY;
    //include("header.php");
    //amain();
    //echo "<br>\n";		echo "tes44te";
    //OpenTable();
    $db->sql_query("DELETE FROM ".$user_prefix."_cnbya_field WHERE fid='$fid'");
    $db->sql_query("DELETE FROM ".$user_prefix."_cnbya_value WHERE fid='$fid'");
    $db->sql_query("DELETE FROM ".$user_prefix."_cnbya_value_temp WHERE fid='$fid'");
    //CloseTable();
    //include("footer.php");
    Header("Location:modules.php?name=$module_name&file=admin&op=addField");

}

?>