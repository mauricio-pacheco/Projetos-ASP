<?php

/********************************************************/
/* NSN Groups Universal                                 */
/* By: NukeScripts Network (webmaster@nukescripts.net)  */
/* http://www.nukescripts.net                           */
/* Copyright © 2000-2004 by NukeScripts Network         */
/********************************************************/

if (!eregi("admin.php", $_SERVER['PHP_SELF']) AND !eregi("admin.php", $_SERVER['SCRIPT_NAME'])) { die ("Access Denied"); }

switch($op) {
    case "NSNGroups":
    case "NSNGroupsAdd":
    case "NSNGroupsAddSave":
    case "NSNGroupsDelete":
    case "NSNGroupsDeleteConf":
    case "NSNGroupsEdit":
    case "NSNGroupsEditSave":
    case "NSNGroupsEmpty":
    case "NSNGroupsEmptyConf":
    case "NSNGroupsView":
    case "NSNGroupsUsersAdd":
    case "NSNGroupsUsersAddSave":
    case "NSNGroupsUsersDelete":
    case "NSNGroupsUsersDeleteConf":
    case "NSNGroupsUsersDeleteSave":
    case "NSNGroupsUsersEmail":
    case "NSNGroupsUsersEmailSend":
    case "NSNGroupsUsersEmailUpdate":
    case "NSNGroupsUsersEmailUpdateSave":
    case "NSNGroupsUsersExpire":
    case "NSNGroupsUsersExpireDone":
    case "NSNGroupsUsersExpireSave":
    case "NSNGroupsUsersMove":
    case "NSNGroupsUsersMoveSave":
    case "NSNGroupsUsersUpdate":
    case "NSNGroupsUsersUpdateSave":
    case "NSNGroupsUsersView":
    include("admin/modules/editgroups.php");
    break;
}
?>
