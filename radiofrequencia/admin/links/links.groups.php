<?php

# $Author: chatserv $
# $Date: 2004/12/07 22:14:36 $
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

if ( !defined('ADMIN_FILE') )
{
	die("Illegal File Access");
}
if (!stristr($_SERVER['SCRIPT_NAME'], "admin.php")) { die ("Access Denied"); }
if ($radminsuper==1) {
    adminmenu("admin.php?op=Groups", ""._UGROUPS."", "groups.gif");
}
# $Log: links.groups.php,v $
# Revision 1.3  2004/12/07 22:14:36  chatserv
# http://www.nukefixes.com/ftopicp-3479.html#3479
#
# Revision 1.2  2004/11/24 22:35:29  chatserv
# Version 2.7 Release
#
# Revision 1.1  2004/10/04 23:23:28  chatserv
# Initial CVS Addition
#

?>