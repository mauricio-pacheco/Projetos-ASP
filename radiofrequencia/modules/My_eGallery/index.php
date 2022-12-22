<?php

######################################################################
# For PHP-NUKE: Web Portal System
# ===========================
# My_eGallery 2.7.0
# Copyright (c) 2001 by ~ MarsIsHere ~ (marsishere@yahoo.fr)
# http://www.marsishere.net
#
# This modules is for image galleries
#
# This program is free software. You can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License.
######################################################################


if ( !eregi("modules.php", $_SERVER['SCRIPT_NAME']) ){
    die ("You can't access this file directly...");
}

$ModName = $name;

if(!isset($mainfile)){
	include("mainfile.php");
}

include("modules/$ModName/include-public.inc");

function underscoreTospace($name) {
	$name = str_replace("_"," ",$name);
	return $name;
}

function galleryHeader() {
	global $basepath;
	include('header.php');
	title("My eGallery");
	OpenTable();
	print navigationGall();
	CloseTable();
	print '<br>';
}

function galleryFooter() {
	global $font;
	print 	'<p align="right">'
		.'<font class="'.$font['tiny'].'">'
		.sprintf(_GALCOPYRIGHT, _GALVERSION)
		.'</font>'
		.'</p>'
	;
	include("footer.php");
}


function navigationGall() {
	global $baseurl, $galleryvar, $font, $user, $admin, $prefix, $db;

	if (is_admin($admin)) {
		$row = $db->sql_fetchrow($db->sql_query("SELECT COUNT(p.pid) AS total FROM $prefix"._gallery_pictures." AS p LEFT JOIN $prefix"._gallery_categories." AS c ON c.gallid=p.gid WHERE c.visible>=0 AND (TO_DAYS(NOW()) - TO_DAYS(p.date))<7"));
	}
	else {
		$row = $db->sql_fetchrow($db->sql_query("SELECT COUNT(p.pid) AS total FROM $prefix"._gallery_pictures." AS p LEFT JOIN $prefix"._gallery_categories." AS c ON c.gallid=p.gid WHERE c.visible>0 AND (TO_DAYS(NOW()) - TO_DAYS(p.date))<7"));
	}
	if (is_admin($admin))
		$row2 = $db->sql_fetchrow($db->sql_query("SELECT SUM(total) AS total FROM $prefix"._gallery_categories." WHERE visible>=0 AND parent=-1"));
	else
		$row2 = $db->sql_fetchrow($db->sql_query("SELECT SUM(total) AS total FROM $prefix"._gallery_categories." WHERE visible>0 AND parent=-1"));

	$out = '<p align="center">'
		.'<font class="'.$font['title'].'">[&lt;</font> '
		.'<a class="'.$font['title'].'" href="'.$baseurl.'">'._GALHOME.'</a>';

	if($galleryvar['displaytop']) {
                $out .= ' <font class="'.$font['title'].'">|</font> <a class="'.$font['title'].'" href="'.$baseurl.'&amp;do=top">'._GALTOP10.'</a>';
	}
	if($galleryvar['allowpostpics']) {
		$out .= ' <font class="'.$font['title'].'">|</font> <a class="'.$font['title'].'" href="'.$baseurl.'&amp;do=upload">'._GALPOSTMEDIA.'</a>';
	}
	$out .= '<font class="'.$font['title'].'">&gt;]</font><br>';
	$out .= '<font class="'.$font['tiny'].'">'.$row2[total].' '._GALIMAGES.'</font>';
	if($row[total] && !$do)
		$out .= ' <font class="'.$font['tiny'].'">('.$row[total].' '._GALNEWIMAGES.')</font>';
	$out .= '</p>';
	return $out;
}

function recursiveBuild($gid) {
	global $baseurl, $font, $prefix, $db;

	if ($gid>0) {
		$sql = "select gallname, parent from $prefix"._gallery_categories." WHERE gallid=$gid";
		//echo $sql;
		list($gname, $parent) = $db->sql_fetchrow($db->sql_query($sql));
	}
	else
		return "";
	if ($parent>0) 	{
		$out .= recursiveBuild($parent);
		$out .= '<font class="'.$font['title'].'"> &gt;&gt; </font><a class="'.$font['title'].'" href="'.$baseurl.'&amp;do=showgall&amp;gid='.$gid.'">'.underscoreTospace($gname).'</a>';
		return $out;
	}
	else
		return '<font class="'.$font['title'].'"> &gt;&gt; </font><a class="'.$font['title'].'" href="'.$baseurl.'&amp;do=showgall&amp;gid='.$gid.'">'.underscoreTospace($gname).'</a>';
}

function navigationTree($gid, $pid) {
	global $baseurl, $bgcolor1, $bgcolor2, $font, $prefix, $db;

	$sql = "select gallname, parent from $prefix"._gallery_categories." WHERE gallid=$gid";
        list($gallname, $parent) = $db->sql_fetchrow($db->sql_query($sql));

	//$out  = '<table width="100%" border="0" cellspacing="0" cellpadding="1" bgcolor="'.$bgcolor2.'"><tr><td>';
    	//$out .= '<table width="100%" border="0" cellspacing="0" cellpadding="8" bgcolor="'.$bgcolor1.'"><tr><td>';
	$out .= '<table width="100%" border="0" cellspacing="0" cellpadding="8"><tr><td>';

	$out .= '<a class="'.$font['title'].'" href="'.$baseurl.'">'._GALHOME.'</a>';

	$out .= recursiveBuild($parent);

	if (isset($pid) && $pid!="") {
		list($name) = $db->sql_fetchrow($db->sql_query("select name from $prefix"._gallery_pictures." WHERE pid=$pid"));
		$out .= '<font class="'.$font['title'].'"> &gt;&gt; </font><a class="'.$font['title'].'" href="'.$baseurl.'&amp;do=showgall&amp;gid='.$gid.'">'.underscoreTospace($gallname).'</a>';
		$out .=  '<font class="'.$font['tiny'].'"> &gt;&gt; '.underscoreTospace($name).'</font>';
	}
	else
		$out .= '<font class="'.$font['tiny'].'"> &gt;&gt; '.underscoreTospace($gallname).'</font>';

	//$out .= '</td></tr></table>';
	$out .= '</td></tr></table>'."\n";
	return $out;
}

function postcomment($pid, $comment, $gname, $member, $edit, $cid) {
	global $prefix, $db, $user, $galleryvar;
	galleryHeader();
	$ok = 0;
	$pid = intval($pid);
	if (!$pid) {
	    die;
	}
	$gname = trim($gname);
	$comment = trim($comment);
	if ( $gname == "" ) {
	    OpenTable();
	    echo "<center>"._NONAME."</center>";
	    CloseTable();
	    galleryFooter();
	}
	
	if ( $comment == "" ) {
	    OpenTable();
	    echo "<center>"._NOCOMMENT."</center>";
	    CloseTable();
	    galleryFooter();
	}

	if ($galleryvar['allowcomments']) {
	    if ($galleryvar['anoncomments']) {
		$ok = 1;
	    } elseif ( is_user($user) ) {
		$ok = 1;
	    }
	}
	
	if ($ok) {
	    if ( !is_user($user) ) {
		$gname = FixQuotes($gname);
		$gname = check_words($gname);
	    }
	    $comment = FixQuotes($comment);
	    $comment = check_words($comment);
	    if ($edit) {
		$db->sql_query("UPDATE $prefix"._gallery_comments." SET comment = '$comment' where pid = $pid and cid=$cid and name = '$gname'");
	    } else {
		$db->sql_query("insert into $prefix"._gallery_comments." values (NULL, '$pid', '$comment', now(), '$gname', $member)");
	    }
	    OpenTable();
	    printf ("<center>"._COMMENTOK."</center>",$pid);
	    echo "<META HTTP-EQUIV=\"refresh\" content=\"3;URL=modules.php?op=modload&name=My_eGallery&file=index&do=showpic&pid=$pid\">";
	    CloseTable();
	    galleryFooter();
	} else {
	    die;
	}
}

function indent($gid) {
	global $prefix, $db, $user, $admin;

	$tab = 0;
	list($parent) = $db->sql_fetchrow($db->sql_query("SELECT parent FROM $prefix"._gallery_categories." WHERE gallid=$gid"));
	while ($parent != -1) {
		list($parent) = $db->sql_fetchrow($db->sql_query("SELECT parent FROM $prefix"._gallery_categories." WHERE gallid=$parent"));
		$tab ++;
	}
	return $tab;
}


function convertorderbyin($orderby) {
    if ($orderby == "titleA")	$orderby = "name ASC";
    if ($orderby == "dateA")	$orderby = "date ASC, name ASC";
    if ($orderby == "hitsA")	$orderby = "counter ASC, name ASC";
    if ($orderby == "ratingA")	$orderby = "rate ASC, name ASC";
    if ($orderby == "titleD")	$orderby = "name DESC";
    if ($orderby == "dateD")	$orderby = "date DESC, name ASC";
    if ($orderby == "hitsD")	$orderby = "counter DESC, name ASC";
    if ($orderby == "ratingD")	$orderby = "rate DESC, name ASC";
    return $orderby;
}

function convertorderbyout($orderby) {
    if ($orderby == "name ASC")		$orderby = "titleA";
    if ($orderby == "date ASC, name ASC")		$orderby = "dateA";
    if ($orderby == "counter ASC, name ASC")	$orderby = "hitsA";
    if ($orderby == "rate ASC, name ASC")		$orderby = "ratingA";
    if ($orderby == "name DESC")	$orderby = "titleD";
    if ($orderby == "date DESC, name ASC")	$orderby = "dateD";
    if ($orderby == "counter DESC, name ASC")	$orderby = "hitsD";
    if ($orderby == "rate DESC, name ASC")	$orderby = "ratingD";
    return $orderby;
}


switch($do) {

        case "showgall":
                 include("modules/My_eGallery/public/displayCategory.php");
                showgall($gid, $picnum, $orderby);
                break;

        case "showpic":
        	include("modules/My_eGallery/public/displayMedia.php");
                $db->sql_query("update $prefix"._gallery_pictures." set counter=counter+1 where pid=$pid");
		showpic($pid, $orderby);
        	break;

        case "top":
        	include("modules/My_eGallery/public/displayTop.php");
		top();
        	break;

	case "New":
        	newpics();
        	break;

        case "Post":
		postcomment($pid, $comment, $gname, $member, $edit, $cid);
		header("Location: modules.php?op=modload&name=$name&file=index&do=showpic&pid=$pid");
		//print ' ';
		exit;
		break;

	case "Vote":
		include("modules/My_eGallery/public/displayMedia.php");
		rateCollector($pid, $rate);
		showpic($pid, $orderby);
		break;

	case "upload":
		include("modules/My_eGallery/public/uploadFile.php");
		include("admin/modules/gallery/fileFunctions.php");

		$userfile_name = $_FILES['userfile']['name'];
		$userfile_temp = $_FILES['userfile']['tmp_name'];
		$userfile_size = $_FILES['userfile']['size'];
		$userfile_type = $_FILES['userfile']['type'];

		//echo "<br> userfile_name = $userfile_name<br>userfile_temp = $userfile_temp <br>";
		//echo "<br> userfile_size = $userfile_size<br>userfile_type = $userfile_type<br>";

		if (isset($add) && $add=="Upload") {
			if ( $userfile_name == "") {
				galleryHeader();
				OpenTable();
				echo '<br>';
				echo '<center>'._PLSSELECTFILE.'<br><br>'._GOBACK.'</center>';
				CloseTable();
				galleryFooter();
				die;
			}
			
			//unknowed file type
			if ( $userfile_type == "") {
				galleryHeader();
				OpenTable();
				echo '<br>';
				echo '<center>'._GALTYPENOTSUPPORTED.'<br><br>'._GOBACK.'</center>';
				CloseTable();
				galleryFooter();
				die;
			}

			//Filter Un-Secure File Type (text/html file)
			$ext = substr($userfile_name, (strrpos($userfile_name,'.') +  1));
			if ( eregi("text",$userfile_type)  || eregi("bin", $ext) ) {
				galleryHeader();
				OpenTable();
				echo '<br>';
				echo "<center>"._GALTYPENOTSUPPORTED." ( $userfile_type )<br><br>"._GOBACK."</center>";
				CloseTable();
				galleryFooter();
				die;
			}

			//Filter Un-Secure File Type (compress/zip file)
			if ( eregi("compress", $userfile_type) ) {
				galleryHeader();
				OpenTable();
				echo '<br>';
				echo "<center>"._GALTYPENOTSUPPORTED." ( $userfile_type )<br><br>"._GOBACK."</center>";
				CloseTable();
				galleryFooter();
				die;
			}

			//Secure Option Can upload only Images Files//
			//but admin + user can upload all supported file//
			if ( !is_admin($admin) && !is_user($user) ) {
			    if ( !eregi("image",$userfile_type) ) {
				galleryHeader();
				OpenTable();
				echo '<br>';
				echo "<center>"._GALTYPENOTSUPPORTED." ( $userfile_type )<br><br>"._GOBACK."</center>";
				CloseTable();
				galleryFooter();
				die;
			    }
			}
	

			$result = $db->sql_query("select filetype from $prefix"._gallery_media_types." where extension='$ext'");
			if (mysql_num_rows($result)==0) {
				galleryHeader();
				OpenTable();
				echo '<br>';
				echo "<center>"._GALTYPENOTSUPPORTED." ( $userfile_type )<br><br>"._GOBACK."</center>";
				CloseTable();
				galleryFooter();
				die;
			}

			$upload_return = Add($Category, $userfile_name, $Submitter, $MediaName, $Description, $userfile_temp, $userfile_name, $userfile_size);
			//echo "public index : $upload_return<br>";
			if ($upload_return!="OK") {
				galleryHeader();
				OpenTable();
				echo '<br>';
				echo '<center>'.$upload_return.'<br><br>'._GOBACK.'</center>';
				CloseTable();
				galleryFooter();
				die;
			} else {
			    	galleryHeader();
			    	OpenTable();
				echo '<p align="center"><b>'._GALMEDIARECEIVED."</b><br>";
				echo _GALCHECKFORIT.'</p>';
				CloseTable();
				galleryFooter();
				die;
			}
		}
		else
			upload_file();
		break;

	case 'search':
		include("modules/My_eGallery/public/displayCategory.php");
		include "modules/My_eGallery/public/search.php";
		search_go($HTTP_POST_VARS);
		break;

	case 'deletecomment':
		global $admin;
		if ( is_admin($admin) ) {
		    include("modules/My_eGallery/public/displayMedia.php");
		    $sql = "DELETE from $prefix"._gallery_comments." where cid=$cid";
		    $db->sql_query($sql);
		    showpic($pid, $orderby);
		    break;
		} else {
		    echo "<!-- Try to access admin function -->";
		    die;
		}

	case 'editcomment':
		global $user;
		if ( is_user($user) ) {
		    include("modules/My_eGallery/public/displayMedia.php");
		    editcomment($cid, $pid, $orderby);
		    break;
		} else {
		    echo "<!-- Try to access user function -->";
		    die;
		}


	case "getit":
		$url = "modules/My_eGallery/gallery/".$url;
		if (!strstr($url, "..") && file_exists($url)) {
			header("Content-type: application/octet-stream");
			Header("Location: $url");
		}
		else {
			galleryHeader();
			OpenTable();
			echo '<p align="center"><b>'._GALFILENOTFOUND.'</b><br><br>'._GOBACK.'</p>';
			CloseTable();
			galleryFooter();
		}
		break;
        default:
	        include("modules/My_eGallery/public/mainGallery.php");
		viewcats();
       	 	break;
}
?>
