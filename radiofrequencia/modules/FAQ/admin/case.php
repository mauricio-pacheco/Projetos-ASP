<?php

# $Author: chatserv $
# $Date: 2004/12/09 23:03:48 $
/************************************************************************/
/* PHP-NUKE: Advanced Content Management System                         */
/* ============================================                         */
/*                                                                      */
/* Copyright (c) 2002 by Francisco Burzi                                */
/* http://phpnuke.org                                                   */
/*                                                                      */
/* This program is free software. You can redistribute it and/or modify */
/* it under the terms of the GNU General Public License as published by */
/* the Free Software Foundation; either version 2 of the License.       */
/************************************************************************/

if ( !defined('ADMIN_FILE') )
{
	die("Illegal File Access");
}
if (!stristr($_SERVER['SCRIPT_NAME'], "admin.php")) { die ("Access Denied"); }
$module_name = "FAQ";
include_once("modules/$module_name/admin/language/lang-".$currentlang.".php");

switch($op) {

    case "FaqCatSave":
    case "FaqCatGoSave":
    case "FaqCatAdd":
    case "FaqCatGoAdd":
    case "FaqCatEdit":
    case "FaqCatGoEdit":
    case "FaqCatDel":
    case "FaqCatGoDel":
    case "FaqAdmin":
    case "FaqCatGo":
    include ("modules/$module_name/admin/index.php");
    break;

}

# $Log: case.php,v $
# Revision 1.3  2004/12/09 23:03:48  chatserv
# http://www.nukefixes.com/ftopicp-3479.html#3479
#
# Revision 1.2  2004/11/24 23:19:55  chatserv
# Version 2.7 Release
#
# Revision 1.1  2004/10/05 18:04:50  chatserv
# Initial CVS Addition
#

?>
