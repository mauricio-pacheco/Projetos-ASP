<?php

########################################################################
# PHP-Nuke Block: Total Hits v0.1                                      #
#                                                                      #
# Copyright (c) 2001 by C. Verhoef (cverhoef@gmx.net)                  #
#                                                                      #
########################################################################
# This program is free software. You can redistribute it and/or modify #
# it under the terms of the GNU General Public License as published by #
# the Free Software Foundation; either version 2 of the License.       # 
########################################################################
#         Additional security & Abstraction layer conversion           #
#                           2003 chatserv                              #
#      http://www.nukefixes.com -- http://www.nukeresources.com        #
########################################################################

if (stristr($_SERVER['SCRIPT_NAME'], "block-Total_Hits.php")) { 
    Header("Location: ../index.php");
    die();
}

global $nukeurl, $prefix, $startdate, $db;

$row = $db->sql_fetchrow($db->sql_query("SELECT count FROM ".$prefix."_counter WHERE type='total' AND var='hits'"));
$content = "<font class=\"tiny\"><center>"._WERECEIVED."<br><b><a href=\"modules.php?name=Statistics\">$row[0]</a></b><br>"._PAGESVIEWS." $startdate</center></font>";

?>