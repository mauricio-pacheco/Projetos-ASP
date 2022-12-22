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

if (!eregi("admin.php", $_SERVER['SCRIPT_NAME'])) { die ("Access Denied"); } 
$module_name = "Your_Account"; 
get_lang("Your_Account"); 

// menelaos: dynamically insert the version number in the admin config panel image Copyright (c) 2004 :-)
include_once("modules/$module_name/includes/functions.php");
$ya_config	 = ya_get_configs();
$cnbyaversion = $ya_config['version'];
adminmenu("modules.php?name=Your_Account&file=admin", ""._EDITUSERS."", "users.png"); 
// adminmenu("modules.php?name=Your_Account&file=admin", ""._EDITUSERS."", "../../modules.php?name=Your_Account&op=gfxadminimage&cnbyaversion=$cnbyaversion"); 

?>