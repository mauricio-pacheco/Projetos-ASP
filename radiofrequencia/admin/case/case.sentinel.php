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

if (!stristr($_SERVER['PHP_SELF'], "admin.php") AND !stristr($_SERVER['SCRIPT_NAME'], "admin.php")) {
    Header("Location: ../../admin.php");
 }

switch($op) {
    case "ABAuthEdit":
    case "ABAuthEditSave":
    case "ABAuthList":
    case "ABAuthListScan":
    case "ABAuthResend":
    case "ABBlockedIP":
    case "ABBlockedIPAdd":
    case "ABBlockedIPAddSave":
    case "ABBlockedIPClear":
    case "ABBlockedIPClearExpired":
    case "ABBlockedIPClearSave":
    case "ABBlockedIPDelete":
    case "ABBlockedIPDeleteSave":
    case "ABBlockedIPEdit":
    case "ABBlockedIPEditSave":
    case "ABBlockedIPMenu":
    case "ABBlockedIPView":
    case "ABBlockedRange":
    case "ABBlockedRangeAdd":
    case "ABBlockedRangeAddSave":
    case "ABBlockedRangeClear":
    case "ABBlockedRangeClearExpired":
    case "ABBlockedRangeClearSave":
    case "ABBlockedRangeDelete":
    case "ABBlockedRangeDeleteSave":
    case "ABBlockedRangeEdit":
    case "ABBlockedRangeEditSave":
    case "ABBlockedRangeMenu":
    case "ABBlockedRangeView":
    case "ABCGIAuth":
    case "ABCGIBuild":
    case "ABConfig":
    case "ABConfigAdmin":
    case "ABConfigAuthor":
    case "ABConfigClike":
    case "ABConfigFilter":
    case "ABConfigHarvester":
    case "ABConfigReferer":
    case "ABConfigRequest":
    case "ABConfigSave":
    case "ABConfigScript":
    case "ABConfigString":
    case "ABConfigUnion":
    case "ABDBMaintence":
    case "ABDBOptimize":
    case "ABDBRepair":
    case "ABDBStructure":
    case "ABExcludedAdd":
    case "ABExcludedAddSave":
    case "ABExcludedClear":
    case "ABExcludedClearSave":
    case "ABExcludedDelete":
    case "ABExcludedDeleteSave":
    case "ABExcludedEdit":
    case "ABExcludedEditSave":
    case "ABExcludedList":
    case "ABExcludedMenu":
    case "ABExcludedView":
    case "ABIP2Country":
    case "ABIP2CountryAdd":
    case "ABIP2CountryAddSave":
    case "ABIP2CountryDelete":
    case "ABIP2CountryDeleteSave":
    case "ABIP2CountryEdit":
    case "ABIP2CountryEditSave":
    case "ABIP2CountryList":
    case "ABIP2CountryUpdateBlocked":
    case "ABIP2CountryUpdateBlockedRanges":
    case "ABIP2CountryUpdateExcludedRanges":
    case "ABIP2CountryUpdateProtectedRanges":
    case "ABIP2CountryUpdateReservedRanges":
    case "ABIP2CountryUpdateTracked":
    case "ABLoadError":
    case "ABMain":
    case "ABMainSave":
    case "ABPrintBlockedIP":
    case "ABPrintBlockedIPView":
    case "ABPrintBlockedRange":
    case "ABPrintBlockedRangeView":
    case "ABPrintExcludedList":
    case "ABPrintExcludedView":
    case "ABPrintProtectedList":
    case "ABPrintProtectedView":
    case "ABPrintReserved":
    case "ABPrintReservedView":
    case "ABPrintTracked":
    case "ABPrintTrackedPages":
    case "ABPrintTrackedUsers":
    case "ABPrintTrackedUsersPages":
    case "ABProtectedAdd":
    case "ABProtectedAddSave":
    case "ABProtectedClear":
    case "ABProtectedClearSave":
    case "ABProtectedDelete":
    case "ABProtectedDeleteSave":
    case "ABProtectedEdit":
    case "ABProtectedEditSave":
    case "ABProtectedList":
    case "ABProtectedMenu":
    case "ABProtectedView":
    case "ABReservedAdd":
    case "ABReservedAddSave":
    case "ABReservedClear":
    case "ABReservedClearSave":
    case "ABReservedDelete":
    case "ABReservedDeleteSave":
    case "ABReservedEdit":
    case "ABReservedEditSave":
    case "ABReservedList":
    case "ABReservedMenu":
    case "ABSearch":
    case "ABSearchBlockedRanges":
    case "ABSearchExcludedRanges":
    case "ABSearchProtectedRanges":
    case "ABSearchReservedRanges":
    case "ABSearchBlocked":
    case "ABSearchIP2Country":
    case "ABSearchTracked":
    case "ABSearchUsers":
    case "ABTracked":
    case "ABTrackedAdd":
    case "ABTrackedAddSave":
    case "ABTrackedClear":
    case "ABTrackedClearSave":
    case "ABTrackedDelete":
    case "ABTrackedDeleteSave":
    case "ABTrackedDeleteUser":
    case "ABTrackedDeleteUserIP":
    case "ABTrackedMenu":
    case "ABTrackedPages":
    case "ABTrackedUsers":
    case "ABTrackedUsersIPs":
    case "ABTrackedUsersPages":
    include("admin/modules/sentinel.php");
    break;
}
?>