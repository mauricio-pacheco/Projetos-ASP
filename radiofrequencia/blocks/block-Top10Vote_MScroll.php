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
/* Filename: block-Top10_VotePic.php                                            */
/* Original  Author:ViNAi                                              */
/* Tested With PHP NUKE 7.2 and MEG 2.8.0                               */
/* Made for MEG 2.8.0 by ModsCity.CoM					*/
/* http://www.modscity.com						*/
/************************************************************************/

if (eregi("block-Top10Vote_MScroll.php", $_SERVER['SCRIPT_NAME'])) {
    Header("Location: ../index.php");
    die();
}

global $user, $gallerypath, $imagepath, $prefix, $db, $bgcolor1;
	
include 'admin/modules/gallery/config.php';

//Note: Change this to match your bgcolor//
$scrollerbgcolor="$bgcolor1";

$sql= "SELECT p.pid, p.img, p.name, p.description, p.votes, p.rate, p.counter, p.submitter, c.galloc, c.visible FROM $prefix"._gallery_pictures." AS p, $prefix"._gallery_categories." AS c WHERE (c.gallid=p.gid) AND (p.votes > 0)  AND ( visible >0) ORDER BY votes DESC, rate DESC, pid ASC LIMIT 0, 10";

$result = $db->sql_query($sql);
//echo $sql . "<br><br>" .mysql_error();

$messages = "";
$i = 1;
while ($pic = $db->sql_fetchrow($result)) {

	$pic['description'] = substr($pic['description'],0,255);
	if (strlen($pic['name']) > 15 ) {
		$pic['name'] = substr($pic['name'],0,14).".";
	}


	$galloc = $pic['galloc'];
	$img = $pic['img'];
	$ext = substr($img, (strrpos($img,'.') +  1));


	if (file_exists("$gallerypath/$galloc/thumb/$img")) {
		$thumb = "<img src='$gallerypath/$galloc/thumb/$img' border='0' width='118' alt='$pic[description]'>";
	} else {
		$row = $db->sql_fetchrow($db->sql_query("SELECT thumbnail from $prefix"._gallery_media_types." where extension='$ext'"));
		$thumb = "<img src='$imagepath/$row[thumbnail]' border='0' alt='$pic[description]'>";
	}


	if ($pic['visible'] == 1) {
	    if (is_user($user)) {
		$messages .= "<center><b>.:N<u>o</u> $i:.</b><br>Votes:$pic[votes]x<br><a href='$baseurl&amp;do=showpic&amp;pid=$pic[pid]'>$thumb</a><br>$pic[name]<br>by<br>$pic[submitter]<hr width='50%'><br></center>\n";
	    } else {
		$messages .= "<center><b>.:N<u>o</u> $i:.</b><br>Votes:$pic[votes]x<br>$thumb<br>$pic[name]<br>by<br>$pic[submitter]<hr width='50%'><br></center>\n";
	    }
	} else {
		$messages .= "<center><b>.:N<u>o</u> $i:.</b><br>Votes:$pic[votes]x<br><a href='$baseurl&amp;do=showpic&amp;pid=$pic[pid]'>$thumb</a><br>$pic[name]<br>by<br>$pic[submitter]<hr width='50%'><br></center>\n";
	}
	$i++;

}
 
 if($messages== "") {
	$messages = "<br><br><br><br><br><b>None<br>Voted<br>Pictures</b>\"\n";
 }
$content = "<table width=\"100%\"><tr><td align=\"center\"><div align=\"center\">";
$content .= "<Marquee Behavior=\"Scroll\" Direction=\"Up\" Height=\"250\" ScrollAmount=\"2\" ScrollDelay=\"120\" onMouseOver=\"this.stop()\" onMouseOut=\"this.start()\">\n".$messages."</marquee></div></td></tr></table>";


?>