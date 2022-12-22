<?php

# $Author: chatserv $
# $Date: 2004/12/08 00:22:34 $
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
/*         Additional security & Abstraction layer conversion           */
/*                           2003 chatserv                              */
/*      http://www.nukefixes.com -- http://www.nukeresources.com        */
/************************************************************************/

if (!stristr($_SERVER['SCRIPT_NAME'], "modules.php")) {
    die("You can't access this file directly...");
}

require_once("mainfile.php");
$module_name = basename(dirname(__FILE__));
get_lang($module_name);
$sid = intval($sid);
$arow = $db->sql_fetchrow($db->sql_query("SELECT associated FROM ".$prefix."_stories WHERE sid='$sid'"));

if ($arow[associated] != "") {
    OpenTable();
    echo "<center><b>"._ASSOTOPIC."</b><br><br>";
    $asso_t = explode("-",$arow[associated]);
    for ($i=0; $i<sizeof($asso_t); $i++) {
	if ($asso_t[$i] != "") {
	    $atop = $db->sql_fetchrow($db->sql_query("SELECT topicimage, topictext from ".$prefix."_topics WHERE topicid='$asso_t[$i]'"));
	    echo "<a href=\"modules.php?name=$module_name&new_topic=$asso_t[$i]\"><img src=\"$tipath$atop[topicimage]\" border=\"0\" hspace=\"10\" alt=\"$atop[topictext]\" title=\"$atop[topictext]\"></a>";
	}
    }
    echo "</center>";
    CloseTable();
    echo "<br>";
}

# $Log: associates.php,v $
# Revision 1.2  2004/12/08 00:22:34  chatserv
# http://www.nukefixes.com/ftopicp-3479.html#3479
#
# Revision 1.1  2004/10/05 18:05:24  chatserv
# Initial CVS Addition
#

?>