<?php

/********************************************************/
/* NukeSentinel(tm) Universal                           */
/* By: NukeScripts Network (webmaster@nukescripts.net)  */
/* http://www.nukescripts.net                           */
/* Copyright © 2000-2005 by NukeScripts Network         */
/********************************************************/
/* CLIKE, UNION, & Email elements from HackAlert        */
/* HTTPAuth element                                     */
/* By: Raven PHP Scripts                                */
/* http://www.ravenphpscripts.com                       */
/* Copyright © 2004 by Raven PHP Scripts                */
/********************************************************/
/* Scripting Blocker elements                           */
/* By: ChatServ                                         */
/* http://www.nukeresources.com                         */
/* Copyright © 2004 by Nuke Resources                   */
/********************************************************/
if (defined("SENTINEL_IS_LOADED")) $abconfig = abget_configs();
else $op = 'ABLoadError';

if (!stristr($_SERVER['PHP_SELF'], "admin.php") AND !stristr($_SERVER['SCRIPT_NAME'], "admin.php")) {
  Header("Location: ../../admin.php");
}

$sentineladmin = 1;
include("admin/modules/sentinel/functions.php");
$getAdmin = $db->sql_fetchrow($db->sql_query("SELECT * FROM ".$prefix."_authors WHERE aid='$aid'"));
if ($getAdmin['radminsuper'] == 1) {

  switch ($op) {

    case "ABAuthEdit":include("admin/modules/sentinel/ABAuthEdit.php");break;
    case "ABAuthEditSave":include("admin/modules/sentinel/ABAuthEditSave.php");break;
    case "ABAuthList":include("admin/modules/sentinel/ABAuthList.php");break;
    case "ABAuthListScan":include("admin/modules/sentinel/ABAuthListScan.php");break;
    case "ABAuthResend":include("admin/modules/sentinel/ABAuthResend.php");break;
    case "ABBlockedIP":include("admin/modules/sentinel/ABBlockedIP.php");break;
    case "ABBlockedIPAdd":include("admin/modules/sentinel/ABBlockedIPAdd.php");break;
    case "ABBlockedIPAddSave":include("admin/modules/sentinel/ABBlockedIPAddSave.php");break;
    case "ABBlockedIPClear":include("admin/modules/sentinel/ABBlockedIPClear.php");break;
    case "ABBlockedIPClearExpired":include("admin/modules/sentinel/ABBlockedIPClearExpired.php");break;
    case "ABBlockedIPClearSave":include("admin/modules/sentinel/ABBlockedIPClearSave.php");break;
    case "ABBlockedIPDelete":include("admin/modules/sentinel/ABBlockedIPDelete.php");break;
    case "ABBlockedIPDeleteSave":include("admin/modules/sentinel/ABBlockedIPDeleteSave.php");break;
    case "ABBlockedIPEdit":include("admin/modules/sentinel/ABBlockedIPEdit.php");break;
    case "ABBlockedIPEditSave":include("admin/modules/sentinel/ABBlockedIPEditSave.php");break;
    case "ABBlockedIPMenu":include("admin/modules/sentinel/ABBlockedIPMenu.php");break;
    case "ABBlockedIPView":include("admin/modules/sentinel/ABBlockedIPView.php");break;
    case "ABBlockedRange":include("admin/modules/sentinel/ABBlockedRange.php");break;
    case "ABBlockedRangeAdd":include("admin/modules/sentinel/ABBlockedRangeAdd.php");break;
    case "ABBlockedRangeAddSave":include("admin/modules/sentinel/ABBlockedRangeAddSave.php");break;
    case "ABBlockedRangeClear":include("admin/modules/sentinel/ABBlockedRangeClear.php");break;
    case "ABBlockedRangeClearExpired":include("admin/modules/sentinel/ABBlockedRangeClearExpired.php");break;
    case "ABBlockedRangeClearSave":include("admin/modules/sentinel/ABBlockedRangeClearSave.php");break;
    case "ABBlockedRangeDelete":include("admin/modules/sentinel/ABBlockedRangeDelete.php");break;
    case "ABBlockedRangeDeleteSave":include("admin/modules/sentinel/ABBlockedRangeDeleteSave.php");break;
    case "ABBlockedRangeEdit":include("admin/modules/sentinel/ABBlockedRangeEdit.php");break;
    case "ABBlockedRangeEditSave":include("admin/modules/sentinel/ABBlockedRangeEditSave.php");break;
    case "ABBlockedRangeMenu":include("admin/modules/sentinel/ABBlockedRangeMenu.php");break;
    case "ABBlockedRangeView":include("admin/modules/sentinel/ABBlockedRangeView.php");break;
    case "ABCGIAuth":include("admin/modules/sentinel/ABCGIAuth.php");break;
    case "ABCGIBuild":include("admin/modules/sentinel/ABCGIBuild.php");break;
    case "ABConfig":include("admin/modules/sentinel/ABConfig.php");break;
    case "ABConfigAdmin":include("admin/modules/sentinel/ABConfigAdmin.php");break;
    case "ABConfigAuthor":include("admin/modules/sentinel/ABConfigAuthor.php");break;
    case "ABConfigClike":include("admin/modules/sentinel/ABConfigClike.php");break;
    case "ABConfigFilter":include("admin/modules/sentinel/ABConfigFilter.php");break;
    case "ABConfigHarvester":include("admin/modules/sentinel/ABConfigHarvester.php");break;
    case "ABConfigReferer":include("admin/modules/sentinel/ABConfigReferer.php");break;
    case "ABConfigRequest":include("admin/modules/sentinel/ABConfigRequest.php");break;
    case "ABConfigSave":include("admin/modules/sentinel/ABConfigSave.php");break;
    case "ABConfigScript":include("admin/modules/sentinel/ABConfigScript.php");break;
    case "ABConfigString":include("admin/modules/sentinel/ABConfigString.php");break;
    case "ABConfigUnion":include("admin/modules/sentinel/ABConfigUnion.php");break;
    case "ABDBMaintence":include("admin/modules/sentinel/ABDBMaintence.php");break;
    case "ABDBOptimize":include("admin/modules/sentinel/ABDBOptimize.php");break;
    case "ABDBRepair":include("admin/modules/sentinel/ABDBRepair.php");break;
    case "ABDBStructure":include("admin/modules/sentinel/ABDBStructure.php");break;
    case "ABExcludedAdd":include("admin/modules/sentinel/ABExcludedAdd.php");break;
    case "ABExcludedAddSave":include("admin/modules/sentinel/ABExcludedAddSave.php");break;
    case "ABExcludedClear":include("admin/modules/sentinel/ABExcludedClear.php");break;
    case "ABExcludedClearSave":include("admin/modules/sentinel/ABExcludedClearSave.php");break;
    case "ABExcludedDelete":include("admin/modules/sentinel/ABExcludedDelete.php");break;
    case "ABExcludedDeleteSave":include("admin/modules/sentinel/ABExcludedDeleteSave.php");break;
    case "ABExcludedEdit":include("admin/modules/sentinel/ABExcludedEdit.php");break;
    case "ABExcludedEditSave":include("admin/modules/sentinel/ABExcludedEditSave.php");break;
    case "ABExcludedList":include("admin/modules/sentinel/ABExcludedList.php");break;
    case "ABExcludedMenu":include("admin/modules/sentinel/ABExcludedMenu.php");break;
    case "ABExcludedView":include("admin/modules/sentinel/ABExcludedView.php");break;
    case "ABIP2Country":if(file_exists("admin/modules/sentinel/ABIP2Country.php")) {include("admin/modules/sentinel/ABIP2Country.php");} else {Header("Location: admin.php?op=ABMain");}break;
    case "ABIP2CountryAdd":if(file_exists("admin/modules/sentinel/ABIP2CountryAdd.php")) {include("admin/modules/sentinel/ABIP2CountryAdd.php");} else {Header("Location: admin.php?op=ABMain");}break;
    case "ABIP2CountryAddSave":if(file_exists("admin/modules/sentinel/ABIP2CountryAddSave.php")) {include("admin/modules/sentinel/ABIP2CountryAddSave.php");} else {Header("Location: admin.php?op=ABMain");}break;
    case "ABIP2CountryDelete":if(file_exists("admin/modules/sentinel/ABIP2CountryDelete.php")) {include("admin/modules/sentinel/ABIP2CountryDelete.php");} else {Header("Location: admin.php?op=ABMain");}break;
    case "ABIP2CountryDeleteSave":if(file_exists("admin/modules/sentinel/ABIP2CountryDeleteSave.php")) {include("admin/modules/sentinel/ABIP2CountryDeleteSave.php");} else {Header("Location: admin.php?op=ABMain");}break;
    case "ABIP2CountryEdit":if(file_exists("admin/modules/sentinel/ABIP2CountryEdit.php")) {include("admin/modules/sentinel/ABIP2CountryEdit.php");} else {Header("Location: admin.php?op=ABMain");}break;
    case "ABIP2CountryEditSave":if(file_exists("admin/modules/sentinel/ABIP2CountryEditSave.php")) {include("admin/modules/sentinel/ABIP2CountryEditSave.php");} else {Header("Location: admin.php?op=ABMain");}break;
    case "ABIP2CountryList":if(file_exists("admin/modules/sentinel/ABIP2CountryList.php")) {include("admin/modules/sentinel/ABIP2CountryList.php");} else {Header("Location: admin.php?op=ABMain");}break;
    case "ABIP2CountryUpdateBlocked":if(file_exists("admin/modules/sentinel/ABIP2CountryUpdateBlocked.php")) {include("admin/modules/sentinel/ABIP2CountryUpdateBlocked.php");} else {Header("Location: admin.php?op=ABMain");}break;
    case "ABIP2CountryUpdateBlockedRanges":if(file_exists("admin/modules/sentinel/ABIP2CountryUpdateBlockedRanges.php")) {include("admin/modules/sentinel/ABIP2CountryUpdateBlockedRanges.php");} else {Header("Location: admin.php?op=ABMain");}break;
    case "ABIP2CountryUpdateExcludedRanges":if(file_exists("admin/modules/sentinel/ABIP2CountryUpdateExcludedRanges.php")) {include("admin/modules/sentinel/ABIP2CountryUpdateExcludedRanges.php");} else {Header("Location: admin.php?op=ABMain");}break;
    case "ABIP2CountryUpdateProtectedRanges":if(file_exists("admin/modules/sentinel/ABIP2CountryUpdateProtectedRanges.php")) {include("admin/modules/sentinel/ABIP2CountryUpdateProtectedRanges.php");} else {Header("Location: admin.php?op=ABMain");}break;
    case "ABIP2CountryUpdateReservedRanges":if(file_exists("admin/modules/sentinel/ABIP2CountryUpdateReservedRanges.php")) {include("admin/modules/sentinel/ABIP2CountryUpdateReservedRanges.php");} else {Header("Location: admin.php?op=ABMain");}break;
    case "ABIP2CountryUpdateTracked":if(file_exists("admin/modules/sentinel/ABIP2CountryUpdateTracked.php")) {include("admin/modules/sentinel/ABIP2CountryUpdateTracked.php");} else {Header("Location: admin.php?op=ABMain");}break;
    case "ABLoadError":include("admin/modules/sentinel/ABLoadError.php");break;
    case "ABMain":include("admin/modules/sentinel/ABMain.php");break;
    case "ABMainSave":include("admin/modules/sentinel/ABMainSave.php");break;
    case "ABPrintBlockedIP":include("admin/modules/sentinel/ABPrintBlockedIP.php");break;
    case "ABPrintBlockedIPView":include("admin/modules/sentinel/ABPrintBlockedIPView.php");break;
    case "ABPrintBlockedRange":include("admin/modules/sentinel/ABPrintBlockedRange.php");break;
    case "ABPrintBlockedRangeView":include("admin/modules/sentinel/ABPrintBlockedRangeView.php");break;
    case "ABPrintExcludedList":include("admin/modules/sentinel/ABPrintExcludedList.php");break;
    case "ABPrintExcludedView":include("admin/modules/sentinel/ABPrintExcludedView.php");break;
    case "ABPrintProtectedList":include("admin/modules/sentinel/ABPrintProtectedList.php");break;
    case "ABPrintProtectedView":include("admin/modules/sentinel/ABPrintProtectedView.php");break;
    case "ABPrintReserved":include("admin/modules/sentinel/ABPrintReserved.php");break;
    case "ABPrintReservedView":include("admin/modules/sentinel/ABPrintReservedView.php");break;
    case "ABPrintTracked":include("admin/modules/sentinel/ABPrintTracked.php");break;
    case "ABPrintTrackedPages":include("admin/modules/sentinel/ABPrintTrackedPages.php");break;
    case "ABPrintTrackedUsers":include("admin/modules/sentinel/ABPrintTrackedUsers.php");break;
    case "ABPrintTrackedUsersPages":include("admin/modules/sentinel/ABPrintTrackedUsersPages.php");break;
    case "ABProtectedAdd":include("admin/modules/sentinel/ABProtectedAdd.php");break;
    case "ABProtectedAddSave":include("admin/modules/sentinel/ABProtectedAddSave.php");break;
    case "ABProtectedClear":include("admin/modules/sentinel/ABProtectedClear.php");break;
    case "ABProtectedClearSave":include("admin/modules/sentinel/ABProtectedClearSave.php");break;
    case "ABProtectedDelete":include("admin/modules/sentinel/ABProtectedDelete.php");break;
    case "ABProtectedDeleteSave":include("admin/modules/sentinel/ABProtectedDeleteSave.php");break;
    case "ABProtectedEdit":include("admin/modules/sentinel/ABProtectedEdit.php");break;
    case "ABProtectedEditSave":include("admin/modules/sentinel/ABProtectedEditSave.php");break;
    case "ABProtectedList":include("admin/modules/sentinel/ABProtectedList.php");break;
    case "ABProtectedMenu":include("admin/modules/sentinel/ABProtectedMenu.php");break;
    case "ABProtectedView":include("admin/modules/sentinel/ABProtectedView.php");break;
    case "ABReservedAdd":include("admin/modules/sentinel/ABReservedAdd.php");break;
    case "ABReservedAddSave":include("admin/modules/sentinel/ABReservedAddSave.php");break;
    case "ABReservedClear":include("admin/modules/sentinel/ABReservedClear.php");break;
    case "ABReservedClearSave":include("admin/modules/sentinel/ABReservedClearSave.php");break;
    case "ABReservedDelete":include("admin/modules/sentinel/ABReservedDelete.php");break;
    case "ABReservedDeleteSave":include("admin/modules/sentinel/ABReservedDeleteSave.php");break;
    case "ABReservedEdit":include("admin/modules/sentinel/ABReservedEdit.php");break;
    case "ABReservedEditSave":include("admin/modules/sentinel/ABReservedEditSave.php");break;
    case "ABReservedList":include("admin/modules/sentinel/ABReservedList.php");break;
    case "ABReservedMenu":include("admin/modules/sentinel/ABReservedMenu.php");break;
    case "ABSearch":include("admin/modules/sentinel/ABSearch.php");break;
    case "ABSearchBlocked":include("admin/modules/sentinel/ABSearchBlocked.php");break;
    case "ABSearchBlockedRanges":include("admin/modules/sentinel/ABSearchBlockedRanges.php");break;
    case "ABSearchExcludedRanges":include("admin/modules/sentinel/ABSearchExcludedRanges.php");break;
    case "ABSearchIP2Country":if(file_exists("admin/modules/sentinel/ABSearchIP2Country.php")) {include("admin/modules/sentinel/ABSearchIP2Country.php");} else {Header("Location: admin.php?op=ABMain");}break;
    case "ABSearchProtectedRanges":include("admin/modules/sentinel/ABSearchProtectedRanges.php");break;
    case "ABSearchReservedRanges":include("admin/modules/sentinel/ABSearchReservedRanges.php");break;
    case "ABSearchTracked":include("admin/modules/sentinel/ABSearchTracked.php");break;
    case "ABSearchUsers":include("admin/modules/sentinel/ABSearchUsers.php");break;
    case "ABTracked":include("admin/modules/sentinel/ABTracked.php");break;
    case "ABTrackedAdd":include("admin/modules/sentinel/ABTrackedAdd.php");break;
    case "ABTrackedAddSave":include("admin/modules/sentinel/ABTrackedAddSave.php");break;
    case "ABTrackedClear":include("admin/modules/sentinel/ABTrackedClear.php");break;
    case "ABTrackedClearSave":include("admin/modules/sentinel/ABTrackedClearSave.php");break;
    case "ABTrackedDelete":include("admin/modules/sentinel/ABTrackedDelete.php");break;
    case "ABTrackedDeleteSave":include("admin/modules/sentinel/ABTrackedDeleteSave.php");break;
    case "ABTrackedDeleteUser":include("admin/modules/sentinel/ABTrackedDeleteUser.php");break;
    case "ABTrackedDeleteUserIP":include("admin/modules/sentinel/ABTrackedDeleteUserIP.php");break;
    case "ABTrackedMenu":include("admin/modules/sentinel/ABTrackedMenu.php");break;
    case "ABTrackedPages":include("admin/modules/sentinel/ABTrackedPages.php");break;
    case "ABTrackedUsers":include("admin/modules/sentinel/ABTrackedUsers.php");break;
    case "ABTrackedUsersIPs":include("admin/modules/sentinel/ABTrackedUsersIPs.php");break;
    case "ABTrackedUsersPages":include("admin/modules/sentinel/ABTrackedUsersPages.php");break;

  }

} else { echo "Access Denied"; }
?>