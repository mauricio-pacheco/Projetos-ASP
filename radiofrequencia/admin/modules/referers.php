<?php

# $Author: chatserv $
# $Date: 2004/12/07 22:20:10 $
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
/*                                                                      */
/************************************************************************/
/*         Additional security & Abstraction layer conversion           */
/*                           2003 chatserv                              */
/*      http://www.nukefixes.com -- http://www.nukeresources.com        */
/************************************************************************/

if ( !defined('ADMIN_FILE') )
{
	die("Illegal File Access");
}
if (!stristr($_SERVER['SCRIPT_NAME'], "admin.php")) { die ("Access Denied"); }
global $prefix, $db;
$aid = substr("$aid", 0,25);
$row = $db->sql_fetchrow($db->sql_query("SELECT radminsuper FROM " . $prefix . "_authors WHERE aid='$aid'"));
if ($row['radminsuper'] == 1) {

/*********************************************************/
/* Referer Functions to know who links us                */
/*********************************************************/

function hreferer() {
    global $bgcolor2, $prefix, $db;
    include ("header.php");
    GraphicAdmin();
    OpenTable();
    echo "<center><font class=\"title\"><b>" . _HTTPREFERERS . "</b></font></center>";
    CloseTable();
    echo "<br>";
    OpenTable();
    echo "<center><b>" . _WHOLINKS . "</b></center><br><br>"
	."<table border=\"0\" width=\"100%\">";
    $result = $db->sql_query("SELECT rid, url from " . $prefix . "_referer");
    while ($row = $db->sql_fetchrow($result)) {
	$rid = intval($row['rid']);
	$url = $row['url'];
	echo "<tr><td bgcolor=\"$bgcolor2\"><font class=\"content\">$rid</td>"
	    ."<td bgcolor=\"$bgcolor2\"><font class=\"content\"><a target=\"_blank\" href=\"$url\">$url</a></td></tr>";
    }
    echo "</table>"
	."<form action=\"admin.php\" method=\"post\">"
	."<input type=\"hidden\" name=\"op\" value=\"delreferer\">"
	."<center><input type=\"submit\" value=\"" . _DELETEREFERERS . "\"></center>";
    CloseTable();
    include ("footer.php");
}

function delreferer() {
    global $prefix, $db;
    $db->sql_query("delete from " . $prefix . "_referer");
    Header("Location: admin.php?op=adminMain");
}

switch($op) {

    case "hreferer":
    hreferer();
    break;

    case "delreferer":
    delreferer();
    break;

}

} else {
    echo "Access Denied";
}
# $Log: referers.php,v $
# Revision 1.3  2004/12/07 22:20:10  chatserv
# http://www.nukefixes.com/ftopicp-3479.html#3479
#
# Revision 1.2  2004/11/24 22:40:13  chatserv
# Version 2.7 Release
#
# Revision 1.1  2004/10/04 23:27:53  chatserv
# Initial CVS Addition
#
?>