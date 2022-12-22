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
if (!eregi("admin.php", $_SERVER['PHP_SELF']) AND !eregi("admin.php", $_SERVER['SCRIPT_NAME'])) {
    Header("Location: ../../admin.php");
    die();
}
require_once("mainfile.php");
get_lang($module_name);
$aid = substr("$aid", 0,25);
$row = $db->sql_fetchrow($db->sql_query("SELECT title, admins FROM ".$prefix."_modules WHERE title='$module_name'"));
$row2 = $db->sql_fetchrow($db->sql_query("SELECT name, radminsuper FROM ".$prefix."_authors WHERE aid='$aid'"));
$admins = explode(",", $row['admins']);
$auth_user = 0;
for ($i=0; $i < sizeof($admins); $i++) {
    if ($row2['name'] == "$admins[$i]" AND $row['admins'] != "") {
        $auth_user = 1;	
    }
}

if ($row2['radminsuper'] == 1 || $auth_user == 1) {
include("modules/$module_name/includes/functions.php");
$dl_config = gdget_configs();
if(!isset($op)) { $op="DLMain"; }

switch ($op) {

    case "DLMain":include("modules/$module_name/admin/Main.php");break;
    case "DLConfig":include("modules/$module_name/admin/Config.php");break;
    case "DLConfigSave":include("modules/$module_name/admin/ConfigSave.php");break;
    case "Categories":include("modules/$module_name/admin/Categories.php");break;
    case "CategoryActivate":include("modules/$module_name/admin/CategoryActivate.php");break;
    case "CategoryAdd":include("modules/$module_name/admin/CategoryAdd.php");break;
    case "CategoryAddSave":include("modules/$module_name/admin/CategoryAddSave.php");break;
    case "CategoryDeactivate":include("modules/$module_name/admin/CategoryDeactivate.php");break;
    case "CategoryDelete":include("modules/$module_name/admin/CategoryDelete.php");break;
    case "CategoryDeleteSave":include("modules/$module_name/admin/CategoryDeleteSave.php");break;
    case "CategoryModify":include("modules/$module_name/admin/CategoryModify.php");break;
    case "CategoryModifySave":include("modules/$module_name/admin/CategoryModifySave.php");break;
    case "CategoryTransfer":include("modules/$module_name/admin/CategoryTransfer.php");break;
    case "DownloadActivate":include("modules/$module_name/admin/DownloadActivate.php");break;
    case "DownloadAdd":include("modules/$module_name/admin/DownloadAdd.php");break;
    case "DownloadAddSave":include("modules/$module_name/admin/DownloadAddSave.php");break;
    case "DownloadBroken":include("modules/$module_name/admin/DownloadBroken.php");break;
    case "DownloadBrokenDelete":include("modules/$module_name/admin/DownloadBrokenDelete.php");break;
    case "DownloadBrokenIgnore":include("modules/$module_name/admin/DownloadBrokenIgnore.php");break;
    case "DownloadCheck":include("modules/$module_name/admin/DownloadCheck.php");break;
    case "DownloadDeactivate":include("modules/$module_name/admin/DownloadDeactivate.php");break;
    case "DownloadDelete":include("modules/$module_name/admin/DownloadDelete.php");break;
    case "DownloadModify":include("modules/$module_name/admin/DownloadModify.php");break;
    case "DownloadModifyRequests":include("modules/$module_name/admin/DownloadModifyRequests.php");break;
    case "DownloadModifyRequestsAccept":include("modules/$module_name/admin/DownloadModifyRequestsAccept.php");break;
    case "DownloadModifyRequestsIgnore":include("modules/$module_name/admin/DownloadModifyRequestsIgnore.php");break;
    case "DownloadModifySave":include("modules/$module_name/admin/DownloadModifySave.php");break;
    case "DownloadNew":include("modules/$module_name/admin/DownloadNew.php");break;
    case "DownloadNewDelete":include("modules/$module_name/admin/DownloadNewDelete.php");break;
    case "Downloads":include("modules/$module_name/admin/Downloads.php");break;
    case "DownloadTransfer":include("modules/$module_name/admin/DownloadTransfer.php");break;
    case "DownloadValidate":include("modules/$module_name/admin/DownloadValidate.php");break;
    case "ExtensionAdd":include("modules/$module_name/admin/ExtensionAdd.php");break;
    case "ExtensionAddSave":include("modules/$module_name/admin/ExtensionAddSave.php");break;
    case "ExtensionDelete":include("modules/$module_name/admin/ExtensionDelete.php");break;
    case "ExtensionModify":include("modules/$module_name/admin/ExtensionModify.php");break;
    case "ExtensionModifySave":include("modules/$module_name/admin/ExtensionModifySave.php");break;
    case "Extensions":include("modules/$module_name/admin/Extensions.php");break;
    case "FilesizeCheck":include("modules/$module_name/admin/FilesizeCheck.php");break;
    case "FilesizeValidate":include("modules/$module_name/admin/FilesizeValidate.php");break;

}

} else {
    Header("Location: admin.php");
}

?>
