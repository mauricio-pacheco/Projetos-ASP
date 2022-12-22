<?php

/************************************************************************/
/* PHP-NUKE: Web Portal System                                          */
/* ===========================                                          */
/*                                                                      */
/* Copyright (c) 2001 by Francisco Burzi (fbc@mandrakesoft.com)         */
/* http://phpnuke.org                                                   */
/*                                                                      */
/* This program is free software. You can redistribute it and/or modify */
/* it under the terms of the GNU General Public License as published by */
/* the Free Software Foundation; either version 2 of the License.       */
/************************************************************************/

if( !eregi('admin.php', $_SERVER['SCRIPT_NAME']) ){ die('Access Denied'); }

switch($op) {
    case "GallAdmin":
    	if ($pnconfig['Version_ID'] == "PostNuke") 
    		include("modules/$ModName/admin/modules/index.php");
    	else
    		include("admin/modules/gallery/index.php");
    break;

    case "GallInstall":
    	if ($pnconfig['Version_ID'] == "PostNuke") 
    		include("modules/$ModName/admin/modules/install.php");
    	else
    		include("admin/modules/gallery/install.php");
    break;

    case "GallUnInstall":
    	if ($pnconfig['Version_ID'] == "PostNuke") 
    		include("modules/$ModName/admin/modules/uninstall.php");
    	else
    		include("admin/modules/gallery/uninstall.php");
    break;
    
    case "GallUpdate":
    	if ($pnconfig['Version_ID'] == "PostNuke") 
    		include("modules/$ModName/admin/modules/update.php");
    	else
    		include("admin/modules/gallery/update.php");
    break;
}

?>
