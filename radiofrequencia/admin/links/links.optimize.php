<?php

# $Author: chatserv $
# $Date: 2004/12/07 22:14:36 $
if ( !defined('ADMIN_FILE') )
{
	die("Illegal File Access");
}
if (!stristr($_SERVER['SCRIPT_NAME'], "admin.php")) { die ("Access Denied"); }
if ($radminsuper==1) {
    adminmenu("admin.php?op=optimize", ""._OPTIMIZE_DB."", "optimize.gif");
}
# $Log: links.optimize.php,v $
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