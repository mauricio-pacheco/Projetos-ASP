<?php

/********************************************************/
/* NSN Banner Ads                                       */
/* By: NukeScripts Network (webmaster@nukescripts.net)  */
/* http://www.nukescripts.net                           */
/* Copyright © 2000-2005 by NukeScripts Network         */
/********************************************************/

$modname = "Banner_Ads";
get_lang($modname);

if ($radminsuper==1) {
    adminmenu("admin.php?op=BABannerAds", _BA_ADMIN, "banners.gif");
}

?>