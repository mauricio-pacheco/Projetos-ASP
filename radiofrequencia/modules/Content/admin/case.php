<?php

# $Author: chatserv $
# $Date: 2004/12/07 22:52:25 $
/************************************************************************/
/* PHP-NUKE: Web Portal System                                          */
/* ===========================                                          */
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
$module_name = "Content";
include_once("modules/$module_name/admin/language/lang-".$currentlang.".php");

switch($op) {

    case "content":
    case "content_edit":
    case "content_delete":
    case "content_save":
    case "content_save_edit":
    case "content_change_status":
    case "add_category":
    case "edit_category":
    case "save_category":
    case "del_content_cat":
    include("modules/$module_name/admin/index.php");
    break;

}
# $Log: case.php,v $
# Revision 1.3  2004/12/07 22:52:25  chatserv
# http://www.nukefixes.com/ftopicp-3479.html#3479
#
# Revision 1.2  2004/11/24 23:15:58  chatserv
# Version 2.7 Release
#
# Revision 1.1  2004/10/05 18:04:47  chatserv
# Initial CVS Addition
#

?>