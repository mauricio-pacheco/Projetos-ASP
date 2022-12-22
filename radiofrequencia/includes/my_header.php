<?php

# $Author: chatserv $
# $Date: 2004/12/07 22:25:22 $
/************************************************************************/
/* PHP-NUKE: Web Portal System                                          */
/* ===========================                                          */
/*                                                                      */
/* Copyright (c) 2004 by Francisco Burzi                                */
/* http://phpnuke.org                                                   */
/*                                                                      */
/* This program is free software. You can redistribute it and/or modify */
/* it under the terms of the GNU General Public License as published by */
/* the Free Software Foundation; either version 2 of the License.       */
/************************************************************************/

if (stristr($_SERVER['SCRIPT_NAME'], "my_header.php")) {
    Header("Location: ../index.php");
    die();
}
include("ipban.php");

/* 
   This file is to customize whatever stuff you need to include in your site 
   when the header loads. This can be used for third party banners, custom
   javascript, popup windows, etc. With this file you don't need to edit 
   system code each time you upgrade to a new version. Just remember, in case
   you add code here to not overwrite this file when updating!
   Whatever you put here will be between <head> and </head> tags.
*/
# $Log: my_header.php,v $
# Revision 1.2  2004/12/07 22:25:22  chatserv
# http://www.nukefixes.com/ftopicp-3479.html#3479
#
# Revision 1.1  2004/10/05 02:27:50  chatserv
# Initial CVS Addition
#

?>