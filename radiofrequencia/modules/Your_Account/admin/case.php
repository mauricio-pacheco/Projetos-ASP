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

//if (!defined('YA_ADMIN')) { echo "CNBYA admin protection"; exit; }
if (!eregi("admin.php", $_SERVER['SCRIPT_NAME'])) { die ("Access Denied."); }
//if (!defined('CNBYA')) { echo "CNBYA protection"; exit; }

switch($op) {

    case "mod_users":
    Header("Location: modules.php?name=Your_Account&file=admin");
    break;

}

?>