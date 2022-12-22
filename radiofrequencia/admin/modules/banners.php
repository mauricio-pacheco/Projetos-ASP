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
/* Banners Administration Functions                      */
/*********************************************************/

function BannersAdmin() {
    global $prefix, $db, $bgcolor2, $banners;
    include ("header.php");
    GraphicAdmin();
    OpenTable();
    echo "<center><font class=\"title\"><b>" . _BANNERSADMIN . "</b></font></center>";
    CloseTable();
    echo "<br>";
/* Banners List */
    echo "<a name=\"top\">";
    OpenTable();
    echo "<center><font class=\"option\"><b>" . _ACTIVEBANNERS . "</b></font></center><br>"
	."<table width=100% border=0><tr>"
	."<td bgcolor=\"$bgcolor2\" align=\"center\"><b>" . _CLIENTNAME . "</b></td>"
	."<td bgcolor=\"$bgcolor2\" align=\"center\"><b>" . _IMPRESSIONS . "</b></td>"
	."<td bgcolor=\"$bgcolor2\" align=\"center\"><b>" . _IMPLEFT . "</b></td>"
	."<td bgcolor=\"$bgcolor2\" align=\"center\"><b>" . _CLICKS . "</b></td>"
	."<td bgcolor=\"$bgcolor2\" align=\"center\"><b>" . _CLICKSPERCENT . "</b></td>"
	."<td bgcolor=\"$bgcolor2\" align=\"center\"><b>" . _TYPE . "</b></td>"
	."<td bgcolor=\"$bgcolor2\" align=\"center\"><b>" . _FUNCTIONS . "</b></td><tr>";
    $result = $db->sql_query("SELECT bid, cid, imptotal, impmade, clicks, imageurl, date, type, active from " . $prefix . "_banner WHERE active='1' order by type,bid");
    while ($row = $db->sql_fetchrow($result)) {
	$bid = intval($row['bid']);
	$cid = intval($row['cid']);
	$imptotal = intval($row['imptotal']);
	$impmade = intval($row['impmade']);
	$clicks = intval($row['clicks']);
	$imageurl = $row['imageurl'];
	$date = $row['date'];
	$type = $row['type'];
	$active = intval($row['active']);
        $row2 = $db->sql_fetchrow($db->sql_query("SELECT cid, name from " . $prefix . "_bannerclient where cid='$cid'"));
        $cid = intval($row2['cid']);
        $name = trim($row2['name']);
	if($impmade==0) {
	    $percent = 0;
	} else {
	    $percent = substr(100 * $clicks / $impmade, 0, 5);
	}
	if($imptotal==0) {
	    $left = _UNLIMITED;
	} else {
	    $left = $imptotal-$impmade;
	}
	if ($type == 0) {
	    $type = _NORMAL;
	} else {
	    $type = _BLOCK;
	}
	if ($active == 1) {
	    $t_active = _ACTIVE;
	    $c_active = _DEACTIVATE;
	} else {
	    $t_active = "<i>" . _INACTIVE . "</i>";
	    $c_active = _ACTIVATE;
	}
	echo "<td bgcolor=\"$bgcolor2\" align=center><a href=\"$imageurl\" target=\"new\">$name</a></td>"
	    ."<td bgcolor=\"$bgcolor2\" align=center>$impmade</td>"
	    ."<td bgcolor=\"$bgcolor2\" align=center>$left</td>"
	    ."<td bgcolor=\"$bgcolor2\" align=center>$clicks</td>"
	    ."<td bgcolor=\"$bgcolor2\" align=center>$percent%</td>"
	    ."<td bgcolor=\"$bgcolor2\" align=center>$type</td>"
	    ."<td bgcolor=\"$bgcolor2\" align=center>[ <a href=\"admin.php?op=BannerEdit&amp;bid=$bid\">" . _EDIT . "</a> | <a href=\"admin.php?op=BannerStatus&amp;bid=$bid&status=$active\">$c_active</a> | <a href=\"admin.php?op=BannerDelete&amp;bid=$bid&amp;ok=0\">" . _DELETE . "</a> ]</td><tr>";
    }
    echo "</td></tr></table><br>"
	."<center><font class=\"option\"><b>" . _INACTIVEBANNERS . "</b></font></center><br>"
	."<table width=100% border=0><tr>"
	."<td bgcolor=\"$bgcolor2\" align=\"center\"><b>" . _CLIENTNAME . "</b></td>"
	."<td bgcolor=\"$bgcolor2\" align=\"center\"><b>" . _IMPRESSIONS . "</b></td>"
	."<td bgcolor=\"$bgcolor2\" align=\"center\"><b>" . _IMPLEFT . "</b></td>"
	."<td bgcolor=\"$bgcolor2\" align=\"center\"><b>" . _CLICKS . "</b></td>"
	."<td bgcolor=\"$bgcolor2\" align=\"center\"><b>" . _CLICKSPERCENT . "</b></td>"
	."<td bgcolor=\"$bgcolor2\" align=\"center\"><b>" . _TYPE . "</b></td>"
	."<td bgcolor=\"$bgcolor2\" align=\"center\"><b>" . _FUNCTIONS . "</b></td><tr>";
    $result = $db->sql_query("SELECT bid, cid, imptotal, impmade, clicks, imageurl, date, type, active from " . $prefix . "_banner WHERE active='0' order by type,bid");
    while ($row = $db->sql_fetchrow($result)) {
	$bid = intval($row['bid']);
	$cid = intval($row['cid']);
	$imptotal = intval($row['imptotal']);
	$impmade = intval($row['impmade']);
	$clicks = intval($row['clicks']);
	$imageurl = $row['imageurl'];
	$date = $row['date'];
	$type = $row['type'];
	$active = intval($row['active']);
        $row2 = $db->sql_fetchrow($db->sql_query("SELECT cid, name from " . $prefix . "_bannerclient where cid='$cid'"));
        $cid = intval($row2['cid']);
        $name = trim($row2['name']);
	if($impmade==0) {
	    $percent = 0;
	} else {
	    $percent = substr(100 * $clicks / $impmade, 0, 5);
	}
	if($imptotal==0) {
	    $left = _UNLIMITED;
	} else {
	    $left = $imptotal-$impmade;
	}
	if ($type == 0) {
	    $type = _NORMAL;
	} else {
	    $type = _BLOCK;
	}
	if ($active == 1) {
	    $t_active = _ACTIVE;
	    $c_active = _DEACTIVATE;
	} else {
	    $t_active = "<i>" . _INACTIVE . "</i>";
	    $c_active = _ACTIVATE;
	}
	echo "<td bgcolor=\"$bgcolor2\" align=center><a href=\"$imageurl\" target=\"new\">$name</a></td>"
	    ."<td bgcolor=\"$bgcolor2\" align=center>$impmade</td>"
	    ."<td bgcolor=\"$bgcolor2\" align=center>$left</td>"
	    ."<td bgcolor=\"$bgcolor2\" align=center>$clicks</td>"
	    ."<td bgcolor=\"$bgcolor2\" align=center>$percent%</td>"
	    ."<td bgcolor=\"$bgcolor2\" align=center>$type</td>"
	    ."<td bgcolor=\"$bgcolor2\" align=center>[ <a href=\"admin.php?op=BannerEdit&amp;bid=$bid\">" . _EDIT . "</a> | <a href=\"admin.php?op=BannerStatus&amp;bid=$bid&status=$active\">$c_active</a> | <a href=\"admin.php?op=BannerDelete&amp;bid=$bid&amp;ok=0\">" . _DELETE . "</a> ]</td><tr>";
    }
    echo "</td></tr></table>";
    CloseTable();
    echo "<br>";
/* Clients List */
    OpenTable();
    echo "<center><font class=\"option\"><b>" . _ADVERTISINGCLIENTS . "</b></font></center><br>"
	."<table width=\"100%\" border=\"0\"><tr>"
	."<td bgcolor=\"$bgcolor2\" align=\"center\"><b>" . _CLIENTNAME . "</b></td>"
	."<td bgcolor=\"$bgcolor2\" align=\"center\"><b>" . _ACTIVEBANNERS2 . "</b></td>"
	."<td bgcolor=\"$bgcolor2\" align=\"center\"><b>" . _INACTIVEBANNERS . "</b></td>"
	."<td bgcolor=\"$bgcolor2\" align=\"center\"><b>" . _CONTACTNAME . "</b></td>"
	."<td bgcolor=\"$bgcolor2\" align=\"center\"><b>" . _CONTACTEMAIL . "</b></td>"
	."<td bgcolor=\"$bgcolor2\" align=\"center\"><b>" . _FUNCTIONS . "</b></td><tr>";
    $result3 = $db->sql_query("SELECT cid, name, contact, email from " . $prefix . "_bannerclient order by cid");
    while ($row3 = $db->sql_fetchrow($result3)) {
    $cid = intval($row3['cid']);
    $name = $row3['name'];
    $contact = $row3['contact'];
    $email = $row3['email'];
        $result4 = $db->sql_query("SELECT cid from " . $prefix . "_banner WHERE cid='$cid' AND active='1'");
        $numrows = $db->sql_numrows($result4);
        $row4 = $db->sql_fetchrow($result4);
        $rcid = intval($row4['cid']);
        $numrows2 = $db->sql_numrows($db->sql_query("SELECT cid from " . $prefix . "_banner WHERE cid='$cid' AND active='0'"));
	echo "<td bgcolor=\"$bgcolor2\" align=\"center\">$name</td>"
	    ."<td bgcolor=\"$bgcolor2\" align=\"center\">$numrows</td>"
	    ."<td bgcolor=\"$bgcolor2\" align=\"center\">$numrows2</td>"
	    ."<td bgcolor=\"$bgcolor2\" align=\"center\">$contact</td>"
	    ."<td bgcolor=\"$bgcolor2\" align=\"center\"><a href=\"mailto:$email\">$email</a></td>"
	    ."<td bgcolor=\"$bgcolor2\" align=\"center\" nowrap>&nbsp;[ <a href=\"admin.php?op=BannerClientEdit&amp;cid=$cid\">" . _EDIT . "</a> | <a href=\"admin.php?op=BannerClientDelete&amp;cid=$cid\">" . _DELETE . "</a> ]&nbsp;</td><tr>";
    }
    echo "</td></tr></table>";
    CloseTable();
    echo "<br>";
/* Add Banner */
    $result5 = $db->sql_query("select * from ".$prefix."_bannerclient");
    $numrows3 = $db->sql_numrows($result5);
    if($numrows3>0) {
	OpenTable();
	echo "<font class=\"option\"><b>" . _ADDNEWBANNER . "</b></font></center><br><br>"
	    ."<form action=\"admin.php?op=BannersAdd\" method=\"post\">"
	    ."" . _CLIENTNAME . ": "
	    ."<select name=\"cid\">";
    $result6 = $db->sql_query("SELECT cid, name from " . $prefix . "_bannerclient ORDER BY name");
    while ($row6 = $db->sql_fetchrow($result6)) {
	$cid = intval($row6['cid']);
	$name = $row6['name'];
	    echo "<option value=\"$cid\">$name</option>";
	}
	echo "</select><br><br>"
    	    ."" . _PURCHASEDIMPRESSIONS . ": <input type=\"text\" name=\"imptotal\" size=\"12\" maxlength=\"11\"> 0 = " . _UNLIMITED . "<br><br>"
	    ."" . _IMAGEURL . ": <input type=\"text\" name=\"imageurl\" size=\"50\" maxlength=\"100\"><br><br>"
	    ."" . _CLICKURL . ": <input type=\"text\" name=\"clickurl\" size=\"50\" maxlength=\"200\"><br><br>"
	    ."" . _ALTTEXT . ": <input type=\"text\" name=\"alttext\" size=\"50\" maxlength=\"255\"><br><br>"
	    ."" . _TYPE . ": <select name=\"type\">"
	    ."<option name=\"type\" value=\"0\">" . _NORMAL . "</option>"
	    ."<option name=\"type\" value=\"1\">" . _BLOCK . "</option>"
	    ."</select><br><br>"
	    ."" . _ACTIVATE . ": <input type=\"radio\" name=\"active\" value=\"1\">" . _YES . "&nbsp;&nbsp;<input type=\"radio\" name=\"active\" value=\"0\">" . _NO . "<br><br>"
	    ."<input type=\"hidden\" name=\"op\" value=\"BannersAdd\">"
	    ."<input type=\"submit\" value=\"" . _ADDBANNER . "\">"
	    ."</form>";
	CloseTable();
	echo "<br>";
    }
/* Add Client */
    OpenTable();
    echo"<font class=\"option\"><b>" . _ADDCLIENT . "</b></center><br><br>
	<form action=\"admin.php?op=BannerAddClient\" method=\"post\">
	" . _CLIENTNAME . ": <input type=\"text\" name=\"name\" size=\"30\" maxlength=\"60\"><br><br>
	" . _CONTACTNAME . ": <input type=\"text\" name=\"contact\" size=\"30\" maxlength=\"60\"><br><br>
	" . _CONTACTEMAIL . ": <input type=\"text\" name=\"email\" size=\"30\" maxlength=\"60\"><br><br>
	" . _CLIENTLOGIN . ": <input type=\"text\" name=\"login\" size=\"12\" maxlength=\"10\"><br><br>
	" . _CLIENTPASSWD . ": <input type=\"text\" name=\"passwd\" size=\"12\" maxlength=\"10\"><br><br>
	" . _EXTRAINFO . ":<br><textarea name=\"extrainfo\" cols=\"60\" rows=\"10\"></textarea><br><br>
	<input type=\"hidden\" name=\"op\" value=\"BannerAddClient\">
	<input type=\"submit\" value=\"" . _ADDCLIENT2 . "\">
	</form>";
    CloseTable();
    include ("footer.php");
}

function BannerStatus($bid, $status) {
    global $prefix, $db;
    if ($status == 1) {
	$active = 0;
    } else {
	$active = 1;
    }
    $bid = intval($bid);
    $db->sql_query("update " . $prefix . "_banner set active='$active' WHERE bid='$bid'");
    Header("Location: admin.php?op=BannersAdmin");
}

function BannersAdd($name, $cid, $imptotal, $imageurl, $clickurl, $alttext, $type, $active) {
    global $prefix, $db;
    $alttext = ereg_replace("\"", "", $alttext);
    $alttext = ereg_replace("'", "", $alttext);
    $cid = intval($cid);
    $imptotal = intval($imptotal);
    $active = intval($active);
    $db->sql_query("insert into " . $prefix . "_banner values (NULL, '$cid', '$imptotal', '1', '0', '$imageurl', '$clickurl', '$alttext', now(), '00-00-0000 00:00:00', '$type', '$active')");
    Header("Location: admin.php?op=BannersAdmin#top");
}

function BannerAddClient($name, $contact, $email, $login, $passwd, $extrainfo) {
    global $prefix, $db;
    $db->sql_query("insert into " . $prefix . "_bannerclient values (NULL, '$name', '$contact', '$email', '$login', '$passwd', '$extrainfo')");
    Header("Location: admin.php?op=BannersAdmin#top");
}

function BannerDelete($bid, $ok=0) {
    global $prefix, $db;
    $bid = intval($bid);
    if ($ok==1) {
        $db->sql_query("delete from " . $prefix . "_banner where bid='$bid'");
	Header("Location: admin.php?op=BannersAdmin#top");
    } else {
        include("header.php");
	GraphicAdmin();
	OpenTable();
	echo "<center><font class=\"title\"><b>" . _BANNERSADMIN . "</b></font></center>";
	CloseTable();
	echo "<br>";
	$row = $db->sql_fetchrow($db->sql_query("SELECT cid, imptotal, impmade, clicks, imageurl, clickurl from " . $prefix . "_banner where bid='$bid'"));
	$cid = intval($row['cid']);
	$imptotal = intval($row['imptotal']);
	$impmade = intval($row['impmade']);
	$clicks = intval($row['clicks']);
	$imageurl = $row['imageurl'];
	$clickurl = $row['clickurl'];
	OpenTable();
	echo "<center><b>" . _DELETEBANNER . "</b><br><br>"
	    ."<a href=\"$clickurl\"><img src=\"$imageurl\" border=\"1\" alt=\"\"></a><br>"
	    ."<a href=\"$clickurl\">$clickurl</a><br><br>"
	    ."<table width=\"100%\" border=\"0\"><tr>"
	    ."<td bgcolor=\"$bgcolor2\" align=\"center\"><b>" . _ID . "<b></td>"
	    ."<td bgcolor=\"$bgcolor2\" align=\"center\"><b>" . _IMPRESSIONS . "<b></td>"
	    ."<td bgcolor=\"$bgcolor2\" align=\"center\"><b>" . _IMPLEFT . "<b></td>"
	    ."<td bgcolor=\"$bgcolor2\" align=\"center\"><b>" . _CLICKS . "<b></td>"
	    ."<td bgcolor=\"$bgcolor2\" align=\"center\"><b>" . _CLICKSPERCENT . "<b></td>"
	    ."<td bgcolor=\"$bgcolor2\" align=\"center\"><b>" . _CLIENTNAME . "<b></td><tr>";
	$row2 = $db->sql_fetchrow($db->sql_query("SELECT cid, name from " . $prefix . "_bannerclient where cid='$cid'"));
	$cid = intval($row2['cid']);
	$name = $row2['name'];
	$percent = substr(100 * $clicks / $impmade, 0, 5);
	if($imptotal==0) {
	    $left = _UNLIMITED;
	} else {
	    $left = $imptotal-$impmade;
	}
	echo "<td bgcolor=\"$bgcolor2\" align=\"center\">$bid</td>"
	    ."<td bgcolor=\"$bgcolor2\" align=\"center\">$impmade</td>"
	    ."<td bgcolor=\"$bgcolor2\" align=\"center\">$left</td>"
	    ."<td bgcolor=\"$bgcolor2\" align=\"center\">$clicks</td>"
	    ."<td bgcolor=\"$bgcolor2\" align=\"center\">$percent%</td>"
	    ."<td bgcolor=\"$bgcolor2\" align=\"center\">$name</td><tr>";
    }
    echo "</td></tr></table><br>"
	."" . _SURETODELBANNER . "<br><br>"
	."[ <a href=\"admin.php?op=BannersAdmin#top\">" . _NO . "</a> | <a href=\"admin.php?op=BannerDelete&amp;bid=$bid&amp;ok=1\">" . _YES . "</a> ]</center><br><br>";
    CloseTable();
    include("footer.php");
}

function BannerEdit($bid) {
    global $prefix, $db;
    include("header.php");
    GraphicAdmin();
    OpenTable();
    echo "<center><font class=\"title\"><b>" . _BANNERSADMIN . "</b></font></center>";
    CloseTable();
    echo "<br>";
	$bid = intval($bid);
	$row = $db->sql_fetchrow($db->sql_query("SELECT cid, imptotal, impmade, clicks, imageurl, clickurl, alttext, type, active from " . $prefix . "_banner where bid='$bid'"));
	$cid = intval($row['cid']);
	$imptotal = intval($row['imptotal']);
	$impmade = intval($row['impmade']);
	$clicks = intval($row['clicks']);
	$imageurl = $row['imageurl'];
	$clickurl = $row['clickurl'];
	$alttext = $row['alttext'];
	$type = $row['type'];
	$active = intval($row['active']);
    OpenTable();
    echo"<center><b>" . _EDITBANNER . "</b><br><br>"
	."<img src=\"$imageurl\" border=\"1\" alt=\"\"></center><br><br>"
	."<form action=\"admin.php?op=BannerChange\" method=\"post\">"
	."" . _CLIENTNAME . ": "
	."<select name=\"cid\">";
	$row2 = $db->sql_fetchrow($db->sql_query("SELECT cid, name from " . $prefix . "_bannerclient where cid='$cid'"));
	$cid = intval($row2['cid']);
	$name = $row2['name'];
    echo "<option value=\"$cid\" selected>$name</option>";
	$result3 = $db->sql_query("SELECT cid, name from " . $prefix . "_bannerclient");
	while ($row3 = $db->sql_fetchrow($result3)) {
	$ccid = intval($row3['cid']);
	$name = $row3['name'];
	if($cid!=$ccid) {
	    echo "<option value=\"$ccid\">$name</option>";
	}
    }
    echo "</select><br><br>";
    if($imptotal==0) {
        $impressions = _UNLIMITED;
    } else {
        $impressions = $imptotal;
    }
    if ($type == 0) {
	$sel1 = "selected";
	$sel2 = "";
    } else {
	$sel1 = "";
	$sel2 = "selected";
    }
    if ($active == 1) {
	$check1 = "checked";
	$check2 = "";
    } else {
	$check1 = "";
	$check2 = "checked";
    }
    echo "" . _ADDIMPRESSIONS . ": <input type=\"text\" name=\"impadded\" size=\"12\" maxlength=\"11\"> " . _PURCHASED . ": <b>$impressions</b> " . _MADE . ": <b>$impmade</b><br><br>"
	."" . _IMAGEURL . ": <input type=\"text\" name=\"imageurl\" size=\"50\" maxlength=\"100\" value=\"$imageurl\"><br><br>"
	."" . _CLICKURL . ": <input type=\"text\" name=\"clickurl\" size=\"50\" maxlength=\"200\" value=\"$clickurl\"><br><br>"
	."" . _ALTTEXT . ": <input type=\"text\" name=\"alttext\" size=\"50\" maxlength=\"255\" value=\"$alttext\"><br><br>"
	."" . _TYPE . ": <select name=\"type\">"
	."<option name=\"type\" value=\"0\" $sel1>" . _NORMAL . "</option>"
	."<option name=\"type\" value=\"1\" $sel2>" . _BLOCK . "</option>"
	."</select><br><br>"
	."" . _ACTIVATE . ": <input type=\"radio\" name=\"active\" value=\"1\" $check1>" . _YES . "&nbsp;&nbsp;<input type=\"radio\" name=\"active\" value=\"0\" $check2>" . _NO . "<br><br>"
	."<input type=\"hidden\" name=\"bid\" value=\"$bid\">"
	."<input type=\"hidden\" name=\"imptotal\" value=\"$imptotal\">"
	."<input type=\"hidden\" name=\"op\" value=\"BannerChange\">"
	."<input type=\"submit\" value=\"" . _SAVECHANGES . "\">"
	."</form>";
    CloseTable();
    include("footer.php");
}

function BannerChange($bid, $cid, $imptotal, $impadded, $imageurl, $clickurl, $alttext, $type, $active) {
    global $prefix, $db;
    $imp = $imptotal+$impadded;
    $alttext = ereg_replace("\"", "", $alttext);
    $alttext = ereg_replace("'", "", $alttext);
    $cid = intval($cid);
    $imp = intval($imp);
    $active = intval($active);
    $bid = intval($bid);
    $db->sql_query("update " . $prefix . "_banner set cid='$cid', imptotal='$imp', imageurl='$imageurl', clickurl='$clickurl', alttext='$alttext', type='$type', active='$active' where bid='$bid'");
    Header("Location: admin.php?op=BannersAdmin#top");
}

function BannerClientDelete($cid, $ok=0) {
    global $prefix, $db;
    $cid = intval($cid);
    if ($ok==1) {
	$db->sql_query("delete from " . $prefix . "_banner where cid='$cid'");
	$db->sql_query("delete from " . $prefix . "_bannerclient where cid='$cid'");
	Header("Location: admin.php?op=BannersAdmin#top");
    } else {
	include("header.php");
	GraphicAdmin();
	OpenTable();
	echo "<center><font class=\"title\"><b>" . _BANNERSADMIN . "</b></font></center>";
	CloseTable();
	echo "<br>";
	$row = $db->sql_fetchrow($db->sql_query("SELECT cid, name from " . $prefix . "_bannerclient where cid='$cid'"));
	$cid = intval($row['cid']);
	$name = $row['name'];
	OpenTable();
	echo "<center><b>" . _DELETECLIENT . ": $name</b><br><br>
	    " . _SURETODELCLIENT . "<br><br>";
	$result2 = $db->sql_query("SELECT imageurl, clickurl from " . $prefix . "_banner where cid='$cid'");
	$numrows = $db->sql_numrows($result2);
	if($numrows==0) {
	    echo "" . _CLIENTWITHOUTBANNERS . "<br><br>";
	} else {
	    echo "<b>" . _WARNING . "!!!</b><br>
		" . _DELCLIENTHASBANNERS . ":<br><br>";
	}
	while ($row2 = $db->sql_fetchrow($result2)) {
	$imageurl = $row2['imageurl'];
	$clickurl = $row2['clickurl'];
	    echo "<a href=\"$clickurl\"><img src=\"$imageurl\" border=\"1\" alt=\"\"></a><br>
		<a href=\"$clickurl\">$clickurl</a><br><br>";
	}
    }
    echo "" . _SURETODELCLIENT . "<br><br>
	[ <a href=\"admin.php?op=BannersAdmin#top\">" . _NO . "</a> | <a href=\"admin.php?op=BannerClientDelete&amp;cid=$cid&amp;ok=1\">" . _YES . "</a> ]</center><br><br></center>";
    CloseTable();
    include("footer.php");
}

function BannerClientEdit($cid) {
    global $prefix, $db;
    include("header.php");
    GraphicAdmin();
    OpenTable();
    echo "<center><font class=\"title\"><b>" . _BANNERSADMIN . "</b></font></center>";
    CloseTable();
    echo "<br>";
    $cid = intval($cid);
    $row = $db->sql_fetchrow($db->sql_query("SELECT name, contact, email, login, passwd, extrainfo from " . $prefix . "_bannerclient where cid='$cid'"));
    $name = $row['name'];
    $contact = $row['contact'];
    $email = $row['email'];
    $login = $row['login'];
    $passwd = $row['passwd'];
    $extrainfo = $row['extrainfo'];
    OpenTable();
    echo "<center><font class=\"option\"><b>" . _EDITCLIENT . "</b></font></center><br><br>"
	."<form action=\"admin.php?op=BannerClientChange\" method=\"post\">"
	."" . _CLIENTNAME . ": <input type=\"text\" name=\"name\" value=\"$name\" size=\"30\" maxlength=\"60\"><br><br>"
	."" . _CONTACTNAME . ": <input type=\"text\" name=\"contact\" value=\"$contact\" size=\"30\" maxlength=\"60\"><br><br>"
	."" . _CONTACTEMAIL . ": <input type=\"text\" name=\"email\" size=30 maxlength=\"60\" value=\"$email\"><br><br>"
	."" . _CLIENTLOGIN . ": <input type=\"text\" name=\"login\" size=12 maxlength=\"10\" value=\"$login\"><br><br>"
	."" . _CLIENTPASSWD . ": <input type=\"text\" name=\"passwd\" size=12 maxlength=\"10\" value=\"$passwd\"><br><br>"
	."" . _EXTRAINFO . "<br><textarea name=\"extrainfo\" cols=\"60\" rows=\"10\">$extrainfo</textarea><br><br>"
	."<input type=\"hidden\" name=\"cid\" value=\"$cid\">"
	."<input type=\"hidden\" name=\"op\" value=\"BannerClientChange\">"
	."<input type=\"submit\" value=\"" . _SAVECHANGES . "\">"
	."</form>";
    CloseTable();
    include("footer.php");
}

function BannerClientChange($cid, $name, $contact, $email, $extrainfo, $login, $passwd) {
    global $prefix, $db;
    $cid = intval($cid);
    $db->sql_query("update ".$prefix."_bannerclient set name='$name', contact='$contact', email='$email', login='$login', passwd='$passwd', extrainfo='$extrainfo' where cid='$cid'");
    Header("Location: admin.php?op=BannersAdmin#top");
}

switch($op) {

    case "BannersAdmin":
    BannersAdmin();
    break;

    case "BannersAdd":
    BannersAdd($name, $cid, $imptotal, $imageurl, $clickurl, $alttext, $type, $active);
    break;

    case "BannerAddClient":
    BannerAddClient($name, $contact, $email, $login, $passwd, $extrainfo);
    break;

    case "BannerDelete":
    BannerDelete($bid, $ok);
    break;

    case "BannerEdit":
    BannerEdit($bid);
    break;
		
    case "BannerChange":
    BannerChange($bid, $cid, $imptotal, $impadded, $imageurl, $clickurl, $alttext, $type, $active);
    break;

    case "BannerClientDelete":
    BannerClientDelete($cid, $ok);
    break;

    case "BannerClientEdit":
    BannerClientEdit($cid);
    break;

    case "BannerClientChange":
    BannerClientChange($cid, $name, $contact, $email, $extrainfo, $login, $passwd);
    break;

    case "BannerStatus":
    BannerStatus($bid, $status);
    break;

}

} else {
    echo "Access Denied";
}
# $Log: banners.php,v $
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