<?php

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

global $admin_file;
if (!eregi("admin.php", $_SERVER['PHP_SELF'])) { die ("Access Denied"); }
$module_name = "FCKeditor";
include_once("modules/$module_name/admin/language/lang-".$currentlang.".php");

switch($op) {

    case "FCKYesDelCategory":
    case "FCKsubdelete":
    case "FCKDelCategory":
    case "FCKNoMoveCategory":
    case "FCKEditCategory":
    case "FCKSaveEditCategory":
    case "FCKAddCategory":
    case "FCKSaveCategory":
    case "FCKDisplayStory":
    case "FCKPreviewAgain":
    case "FCKPostStory":
    case "FCKEditStory":
    case "FCKRemoveStory":
    case "FCKChangeStory":
    case "FCKDeleteStory":
    case "FCKadminStory":
    case "FCKPreviewAdminStory":
    case "FCKPostAdminStory":
    case "FCKautoDelete":
    case "FCKautoEdit":
    case "FCKautoSaveEdit":
    case "FCKsubmissions":
    include("modules/$module_name/admin/index.php");
    break;

}

?>
