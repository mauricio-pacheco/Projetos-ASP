<?php

/********************************************************/
/* NSN GR Downloads                                     */
/* By: NukeScripts Network (webmaster@nukescripts.net)  */
/* http://www.nukescripts.net                           */
/* Copyright © 2000-2004 by NukeScripts Network         */
/********************************************************/
/* Based on Journey Links Hack                          */
/* Copyright (c) 2000 by James Knickelbein              */
/* Journey Milwaukee (http://www.journeymilwaukee.com)  */
/********************************************************/

$module_name = "Downloads";
get_lang($module_name);
if (!eregi("admin.php", $_SERVER['SCRIPT_NAME']) AND !eregi("admin.php", $_SERVER['PHP_SELF'])) { die ("Access Denied"); }

switch ($op) {

    case "DLMain":
    case "DLConfig":
    case "DLConfigSave":
    case "Categories":
    case "CategoryActivate":
    case "CategoryAdd":
    case "CategoryAddSave":
    case "CategoryDeactivate":
    case "CategoryDelete":
    case "CategoryDeleteSave":
    case "CategoryModify":
    case "CategoryModifySave":
    case "CategoryTransfer":
    case "DownloadActivate":
    case "DownloadAdd":
    case "DownloadAddSave":
    case "DownloadBroken":
    case "DownloadBrokenDelete":
    case "DownloadBrokenIgnore":
    case "DownloadCheck":
    case "DownloadDeactivate":
    case "DownloadDelete":
    case "DownloadModify":
    case "DownloadModifyRequests":
    case "DownloadModifyRequestsAccept":
    case "DownloadModifyRequestsIgnore":
    case "DownloadModifySave":
    case "DownloadNew":
    case "DownloadNewDelete":
    case "Downloads":
    case "DownloadTransfer":
    case "DownloadValidate":
    case "ExtensionAdd":
    case "ExtensionAddSave":
    case "ExtensionDelete":
    case "ExtensionModify":
    case "ExtensionModifySave":
    case "Extensions":
    case "FilesizeCheck":
    case "FilesizeValidate":
    include("modules/$module_name/admin/index.php");
    break;

}

?>
