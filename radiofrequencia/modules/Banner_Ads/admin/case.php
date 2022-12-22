<?php

/********************************************************/
/* NSN Banner Ads                                       */
/* By: NukeScripts Network (webmaster@nukescripts.net)  */
/* http://www.nukescripts.net                           */
/* Copyright © 2000-2005 by NukeScripts Network         */
/********************************************************/

$modname = "Banner_Ads";
get_lang($modname);
if (!stristr($_SERVER['PHP_SELF'], "admin.php") && !stristr($_SERVER['SCRIPT_NAME'], "admin.php")) { die ("Access Denied"); }

switch ($op) {

    case "BABannerAds":
    case "BABanner":
    case "BABannerAdd":
    case "BABannerAddSave":
    case "BABannerDelete":
    case "BABannerDeleteConf":
    case "BABannerEdit":
    case "BABannerEditSave":
    case "BABannerMail":
    case "BABannerView":
    case "BAClient":
    case "BAClientAdd":
    case "BAClientAddSave":
    case "BAClientDelete":
    case "BAClientDeleteConf":
    case "BAClientEdit":
    case "BAClientEditSave":
    case "BAClientView":
    case "BCConfig":
    case "BCConfigSave":
    include("modules/$modname/admin/index.php");
    break;

}

?>