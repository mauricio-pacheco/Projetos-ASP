<?php

/************************************************************************/
/* PHP-NUKE: Web Portal System                                          */
/* ===========================                                          */
/*                                                                      */
/* Copyright (c) 2002 by Francisco Burzi                                */
/* http://phpnuke.org                                                   */
/*                                                                      */
/* Note: If you need more than one banner block, just copy this file    */
/*       with another name                                              */
/*                                                                      */
/* This program is free software. You can redistribute it and/or modify */
/* it under the terms of the GNU General Public License as published by */
/* the Free Software Foundation; either version 2 of the License.       */
/************************************************************************/
/* Additional security checking code 2003 by chatserv                   */
/* http://www.nukefixes.com -- http://www.nukeresources.com             */
/************************************************************************/

if (stristr($_SERVER['SCRIPT_NAME'], "block-Advertising.php")) { 
    Header("Location: ../index.php");
    die();
}

global $prefix, $db;

$numrows = $db->sql_numrows($db->sql_query("SELECT * FROM ".$prefix."_banner WHERE type='1' AND active='1'"));

if ($numrows>1) {
    $numrows = $numrows-1;
    mt_srand((double)microtime()*1000000);
    $bannum = mt_rand(0, $numrows);
} else {
    $bannum = 0;
}

$row = $db->sql_fetchrow($db->sql_query("SELECT bid, imageurl, alttext FROM ".$prefix."_banner WHERE type='1' AND active='1' LIMIT $bannum,1"));
    $bid = intval($row['bid']);
    $imageurl = $row['imageurl'];
    $alttext = $row['alttext'];
if (!is_admin($admin)) {
    $db->sql_query("UPDATE ".$prefix."_banner SET impmade=impmade+1 WHERE bid='$bid'");
}
if($numrows>0) {
    $row2 = $db->sql_fetchrow($db->sql_query("SELECT cid, imptotal, impmade, clicks, date FROM ".$prefix."_banner WHERE bid='$bid'"));
    $cid = intval($row2['cid']);
    $imptotal = intval($row2['imptotal']);
    $impmade = intval($row2['impmade']);
    $clicks = intval($row2['clicks']);
    $date = $row2['date'];

/* Check if this impression is the last one and print the banner */

    if (($imptotal <= $impmade) AND ($imptotal != 0)) {
	$db->sql_query("UPDATE ".$prefix."_banner SET active='0' WHERE bid='$bid'");
    }
    $content = "<center><br><a href=\"banners.php?op=click&amp;bid=$bid\" target=\"_blank\"><img src=\"$imageurl\" border=\"1\" alt=\"$alttext\" title=\"$alttext\"></a><br><br></center>";
}

?>