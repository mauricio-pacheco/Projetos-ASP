<?php

/************************************************************************/
/* PHP-NUKE: Web Portal System                                          */
/* ===========================                                          */
/*                                                                      */
/* Copyright (c) 2001 by Idefix                                         */
/* http://www.Nukedownload.com                                          */
/*                                                                      */
/* This program is free software. You can redistribute it and/or modify */
/* it under the terms of the GNU General Public License as published by */
/* the Free Software Foundation; either version 2 of the License.       */
/************************************************************************/
/************************************************************************/
/* Filename: block-Random_Pic.php                                           */
/* Original  Author:ViNAi                                              */
/* Tested With PHP NUKE 7.2 and MEG 2.8.0                               */
/* Made for MEG 2.8.0 by ModsCity					*/
/* http://www.modscity.com						*/
/************************************************************************/

if (eregi("block-Random_Pic.php", $_SERVER['SCRIPT_NAME'])) {
    Header("Location: ../index.php");
    die();
}

global $user, $gallerypath, $imagepath, $prefix, $db;
	
include 'admin/modules/gallery/config.php';
if (is_user($user)) {
	$sql= "SELECT p.pid FROM $prefix"._gallery_pictures." AS p, $prefix"._gallery_categories." AS c WHERE (c.gallid=p.gid) AND (c.visible > 0)";
} else {
	$sql= "SELECT p.pid FROM $prefix"._gallery_pictures." AS p, $prefix"._gallery_categories." AS c WHERE (c.gallid=p.gid) AND (c.visible > 1)";
}

mt_srand((double)microtime()*1000000);
$result = $db->sql_query($sql);
$total = $db->sql_numrows($result);
$p = mt_rand(0,($total - 1));


if (is_user($user)) {
	$sql= "SELECT p.pid, p.img, p.name, p.description, c.galloc FROM $prefix"._gallery_pictures." AS p, $prefix"._gallery_categories." AS c WHERE (c.gallid=p.gid) AND (c.visible > 0) LIMIT $p, 1";
} else {
	$sql= "SELECT p.pid, p.img, p.name, p.description, c.galloc FROM $prefix"._gallery_pictures." AS p, $prefix"._gallery_categories." AS c WHERE (c.gallid=p.gid) AND (c.visible > 1) LIMIT $p, 1";
}

$result = $db->sql_query($sql);
$pic = $db->sql_fetchrow($result);
$pic['description'] = substr($pic['description'],0,255);

$galloc = $pic['galloc'];
$img = $pic['img'];
$default_thumb = 0;
$ext = substr($img, (strrpos($img,'.') +  1));

if (file_exists("$gallerypath/$galloc/thumb/$img")) {
	$thumb = "$gallerypath/$galloc/thumb/$img";
} else {
	$row = $db->sql_fetchrow($db->sql_query("SELECT thumbnail from $prefix"._gallery_media_types." where extension='$ext'"));
	$thumb = "$imagepath/$row[thumbnail]";
	$default_thumb = 1;
}

if (strlen($pic[name]) > 12) {
	$pic[name] = substr($pic[name],0,10)."..";
}
if ($default_thumb) {
	$content = "<center><a href=\"$baseurl&amp;do=showpic&amp;pid=$pic[pid]\"><img src=\"$thumb\" border=\"0\" alt=\"$pic[description]\"><br><font size=\"1\">$pic[name]</font></a></center>";
} else {
	$content = "<center><a href=\"$baseurl&amp;do=showpic&amp;pid=$pic[pid]\"><img src=\"$thumb\" width=\"120\" border=\"0\" alt=\"$pic[description]\"><br><font size=\"1\">$pic[name]</font></a></center>";
}
 
?>